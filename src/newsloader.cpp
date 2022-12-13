#include "newsloader.h"

NewsLoader::NewsLoader(ArticlesListModel *articlesListModel, QObject *parent) :
    QObject(parent),
    articlesListModel(articlesListModel)
{
    dateFormat = QLocale::system().dateFormat(QLocale::ShortFormat);
    timeFormat = QLocale::system().timeFormat(QLocale::ShortFormat);
    networkManager = new QNetworkAccessManager(this);
    listReply = nullptr;
}

void NewsLoader::loadList()
{
    if(listReply != nullptr){
        listReply->abort();
        listReply->deleteLater();
    }
    error.clear();
    emit errorChanged();
    QNetworkRequest request(QUrl("http://104.248.143.138/api/articles"));
    listReply = networkManager->get(request);
    emit loadingChanged();
    connect(listReply, &QNetworkReply::finished, this, &NewsLoader::listReplyFinished);
}

bool NewsLoader::isLoading()
{
    return listReply && listReply->isRunning();
}

QString &NewsLoader::getError()
{
    return error;
}

void NewsLoader::listReplyFinished()
{
    QJsonDocument json = QJsonDocument::fromJson(listReply->readAll());
    if(listReply->error() != QNetworkReply::NoError){
        error = listReply->errorString();
        if(listReply->error() == QNetworkReply::UnknownNetworkError){
            error.append(". ").append(tr("Check your Internet connection"));
        }
        emit errorChanged();
        listReply->deleteLater();
        emit loadingChanged();
        return;
    }
    listReply->deleteLater();
    emit loadingChanged();
    QJsonObject root = json.object();
    page = root["page"].toInt();
    total = root["total"].toInt();
    QJsonArray items = root["items"].toArray();
    QJsonArray::const_iterator i;
    QJsonObject apiArticle;
    for (i = items.constBegin(); i != items.constEnd(); i++){
        apiArticle = (*i).toObject();
        Article article;
        article.setId(apiArticle["id"].toInt());
        QDateTime createdDate = QDateTime::fromMSecsSinceEpoch((qint64)apiArticle["created"].toInt() * 1000, Qt::UTC).toLocalTime();
        article.setCreated(createdDate.toString(timeFormat));
        qDebug() << "createdDate.toString(dateFormat)" << createdDate.toString(dateFormat);
        article.setCreatedDate(createdDate.toString(dateFormat));
        article.setLink(apiArticle["link"].toString());
        if(apiArticle["imagePreviewLink"].isString()){
            article.setImagePreviewLink(apiArticle["imagePreviewLink"].toString());
        }
        article.setTitle(apiArticle["title"].toString());
        if(apiArticle["subtitle"].isString()){
            article.setSubtitle(apiArticle["subtitle"].toString());
        }
        article.setText(apiArticle["text"].toString());
        article.setResource(apiArticle["resource"].toString());
        articlesListModel->add(article);
    }
}
