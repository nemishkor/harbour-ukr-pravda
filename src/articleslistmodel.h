#ifndef ARTICLESLISTMODEL_H
#define ARTICLESLISTMODEL_H

#include <QAbstractListModel>
#include <QDebug>

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
        CreatedDateRole,
        LinkRole,
        ImagePreviewLinkRole,
        SubtitleRole,
        TextRole,
        ResourceRole,
        LabelsRole,
        IsImportantRole,
    };
    explicit ArticlesListModel(QObject *parent = nullptr);

    void add(Article *item);
    Q_INVOKABLE void clear();
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QVariant dataByIndex(int index, QString role);
    Q_INVOKABLE Article* getByIndex(int);

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<Article*> items;
    QHash<int, QByteArray> roles;

signals:
    void countChanged();
};

#endif // ARTICLESLISTMODEL_H
