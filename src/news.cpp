#include "news.h"

News::News(Article *article, ArticlesListModel *list, QObject *parent) :
    QObject(parent),
    article(article),
    list(list)
{

}

int News::getMode()
{
    return mode;
}

void News::setMode(int newMode)
{
    mode = newMode;
    emit modeChanged();
}
