#include "articleslistmodel.h"

ArticlesListModel::ArticlesListModel(QObject *parent) : QAbstractListModel(parent)
{

}

void ArticlesListModel::add(const Article &item)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    items << item;
    endInsertRows();
    emit countChanged();
}

void ArticlesListModel::clear()
{
    beginRemoveRows(QModelIndex(), 0, rowCount() - 1);
    items.clear();
    endRemoveRows();
    emit countChanged();
}

int ArticlesListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return items.count();
}

QVariant ArticlesListModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= items.count())
        return QVariant();

    const Article &item = items[index.row()];
    if (role == IdRole)
        return item.getId();
    if (role == TitleRole)
        return item.getTitle();
    if(role == SubtitleRole)
        return item.getSubtitle();
    if(role == CreatedRole)
        return item.getCreated();
    if(role == LinkRole)
        return item.getLink();
    if(role == ImagePreviewLinkRole)
        return item.getImagePreviewLink();
    if(role == TextRole)
        return item.getText();
    if(role == ResourceRole)
        return item.getResource();

    return QVariant();
}

QHash<int, QByteArray> ArticlesListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[TitleRole] = "title";
    roles[SubtitleRole] = "subtitle";
    roles[CreatedRole] = "created";
    roles[LinkRole] = "link";
    roles[ImagePreviewLinkRole] = "imagePreviewLink";
    roles[TextRole] = "text";
    roles[ResourceRole] = "resource";
    return roles;
}
