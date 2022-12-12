#ifndef ARTICLESLISTMODEL_H
#define ARTICLESLISTMODEL_H

#include <QAbstractListModel>

#include "article.h"

class ArticlesListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount NOTIFY countChanged)
public:
    enum ArticleRoles {
        TitleRole = Qt::DisplayRole,
        IdRole = Qt::UserRole + 1,
        CreatedRole,
        LinkRole,
        ImagePreviewLinkRole,
        SubtitleRole,
        TextRole,
        ResourceRole
    };
    explicit ArticlesListModel(QObject *parent = nullptr);

    void add(const Article &item);
    Q_INVOKABLE void clear();
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<Article> items;

signals:
    void countChanged();
};

#endif // ARTICLESLISTMODEL_H
