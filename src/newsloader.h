#ifndef NEWSLOADER_H
#define NEWSLOADER_H

#include <QDebug>
#include <QNetworkConfiguration>
#include <QNetworkReply>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>
#include <QPointer>

#include "articleslistmodel.h"

class NewsLoader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool loading READ isLoading NOTIFY loadingChanged)
    Q_PROPERTY(QString error READ getError NOTIFY errorChanged)
public:
    explicit NewsLoader(ArticlesListModel *articlesListModel, QObject *parent = nullptr);
    Q_INVOKABLE void loadList();
    bool isLoading();
    QString &getError();

private:
    QString dateFormat;
    QString timeFormat;
    QNetworkAccessManager *networkManager;
    QPointer<QNetworkReply> listReply;
    ArticlesListModel *articlesListModel;
    int page = 1;
    int total = -1;
    QString error;
    QString apiBaseUrl;

signals:
    void loadingChanged();
    void errorChanged();

private slots:
    void listReplyFinished();
    void listReplySslErrors(const QList<QSslError> &errors);

};

#endif // NEWSLOADER_H
