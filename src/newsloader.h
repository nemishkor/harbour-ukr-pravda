#ifndef NEWSLOADER_H
#define NEWSLOADER_H

#include <QNetworkReply>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>

#include "articleslistmodel.h"

class NewsLoader : public QObject
{
    Q_OBJECT
public:
    explicit NewsLoader(ArticlesListModel *articlesListModel, QObject *parent = nullptr);
    Q_INVOKABLE void loadList();

private:
    QString dateTimeFormat;
    QNetworkAccessManager *networkManager;
    QNetworkReply *listReply;
    ArticlesListModel *articlesListModel;
    int page = 1;
    int total = -1;

signals:
private slots:
    void listReplyFinished();

};

#endif // NEWSLOADER_H
