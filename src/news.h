#ifndef NEWS_H
#define NEWS_H

#include "article.h"
#include "articleslistmodel.h"

#include <QObject>

class News : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int mode READ getMode WRITE setMode NOTIFY modeChanged)
public:
    explicit News(Article *article, ArticlesListModel *list, QObject *parent = nullptr);

    int getMode();
    void setMode(int);

private:
    Article *article;
    ArticlesListModel *list;
    // 0 - list
    // 1 - single article
    // 2 - other?
    int mode = 0;

signals:
    void modeChanged();

};

#endif // NEWS_H
