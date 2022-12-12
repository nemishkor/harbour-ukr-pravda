#include "newsloader.h"

NewsLoader::NewsLoader(ArticlesListModel *articlesListModel, QObject *parent) :
    QObject(parent),
    articlesListModel(articlesListModel)
{
    dateTimeFormat = QLocale::system().dateTimeFormat(QLocale::ShortFormat);
    networkManager = new QNetworkAccessManager(this);
    listReply = nullptr;
}

void NewsLoader::loadList()
{
    if(listReply != nullptr){
        listReply->abort();
    }
    QNetworkRequest request(QUrl("http://104.248.143.138/api/articles"));
    listReply = networkManager->get(request);
    connect(listReply, &QNetworkReply::finished, this, &NewsLoader::listReplyFinished);
}

void NewsLoader::listReplyFinished()
{
    QJsonDocument json = QJsonDocument::fromJson(listReply->readAll());
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
        QDateTime createdDate = QDateTime::fromMSecsSinceEpoch((qint64)apiArticle["created"].toInt() * 1000, Qt::UTC);
        article.setCreated(createdDate.toLocalTime().toString(dateTimeFormat));
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
