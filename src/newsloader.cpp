#include "newsloader.h"

NewsLoader::NewsLoader(Settings *settings, ArticlesListModel *articlesListModel, QObject *parent) :
    QObject(parent),
    settings(settings),
    articlesListModel(articlesListModel)
{
    dateFormat = QLocale::system().dateFormat(QLocale::ShortFormat);
    timeFormat = QLocale::system().timeFormat(QLocale::ShortFormat);
    networkManager = new QNetworkAccessManager(this);
    apiBaseUrl = "http://104.248.143.138";
}

void NewsLoader::refreshList()
{
    page = 1;
    articlesListModel->clear();
    loadList();
}

void NewsLoader::loadList()
{
    if(listReply){
        qDebug() << "abort old request";
        listReply->abort();
        listReply->deleteLater();
    }
    error.clear();
    emit errorChanged();
    QUrl url(apiBaseUrl + "/api/articles");
    QUrlQuery query;
    query.addQueryItem("language", QString::number(settings->getLanguage()));
    query.addQueryItem("page", QString::number(page));
    url.setQuery(query);
    qDebug() << "request to" << url.toString();
    listReply = networkManager->get(QNetworkRequest(url));
    emit loadingChanged();
    connect(listReply, &QNetworkReply::finished, this, &NewsLoader::listReplyFinished);
    connect(listReply, &QNetworkReply::sslErrors, this, &NewsLoader::listReplySslErrors);
}

void NewsLoader::loadNextPageList()
{
    page++;
    loadList();
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
    qDebug() << "request to" << listReply->url().toString() << "finished";
    QByteArray body = listReply->readAll();
    int code = listReply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
    if(listReply->error() != QNetworkReply::NoError){
        qDebug() << "request to" << listReply->url().toString() << "failed with error" << listReply->errorString();
        qDebug() << "http response code" << code;
        qDebug() << "http response body:" << body;
        error = listReply->errorString();
        if(listReply->error() == QNetworkReply::UnknownNetworkError){
            error.append(". ").append(tr("Check your Internet connection"));
        }
        emit errorChanged();
        listReply->deleteLater();
        emit loadingChanged();
        return;
    }
    QJsonDocument json = QJsonDocument::fromJson(body);
    listReply->deleteLater();
    emit loadingChanged();
    QJsonObject root = json.object();
    page = root["page"].toInt();
    total = root["total"].toInt();
    QJsonArray items = root["items"].toArray();
    QJsonArray::const_iterator i, iLabels;
    QJsonArray labels;
    QJsonObject apiArticle;
    for (i = items.constBegin(); i != items.constEnd(); i++){
        apiArticle = (*i).toObject();
        Article *article = new Article();
        article->setId(apiArticle["id"].toInt());
        QDateTime createdDate = QDateTime::fromMSecsSinceEpoch((qint64)apiArticle["created"].toInt() * 1000, Qt::UTC).toLocalTime();
        article->setCreated(createdDate.toString(timeFormat));
        article->setCreatedDate(createdDate.toString(dateFormat));
        article->setLink(apiArticle["link"].toString());
        if(apiArticle["imagePreviewLink"].isString()){
            article->setImagePreviewLink(apiArticle["imagePreviewLink"].toString());
        }
        article->setTitle(apiArticle["title"].toString());
        if(apiArticle["subtitle"].isString()){
            article->setSubtitle(apiArticle["subtitle"].toString());
        }
        article->setText(apiArticle["text"].toString());
        article->setResource(apiArticle["resource"].toString());
        if(apiArticle["isImportant"].isBool()){
            article->setIsImportant(apiArticle["isImportant"].toBool());
        }
        labels = apiArticle["labels"].toArray();
        for (iLabels = labels.constBegin(); iLabels != labels.constEnd(); iLabels++){
            article->addLabel((*iLabels).toString());
        }
        articlesListModel->add(article);
    }
}

void NewsLoader::listReplySslErrors(const QList<QSslError> &errors)
{
    qWarning() << errors.count() << "SSL error(s)";
    for(QSslError error : errors){
        qWarning() << "sslError:" << error.errorString();
    }
    listReply->ignoreSslErrors(errors);
}
