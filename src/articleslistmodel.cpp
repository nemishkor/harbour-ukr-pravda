#include "articleslistmodel.h"

ArticlesListModel::ArticlesListModel(QObject *parent) :
    QAbstractListModel(parent)
{
    roles = roleNames();
}

void ArticlesListModel::add(Article *item)
{
    item->setParent(this);
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    items << item;
    endInsertRows();
    emit countChanged();
}

void ArticlesListModel::clear()
{
    beginRemoveRows(QModelIndex(), 0, rowCount() - 1);
    for(Article *article : items){
        delete article;
    }
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

    Article *item = items[index.row()];
    if (role == IdRole)
        return item->getId();
    if (role == TitleRole)
        return item->getTitle();
    if(role == SubtitleRole)
        return item->getSubtitle();
    if(role == CreatedRole)
        return item->getCreated();
    if(role == CreatedDateRole)
        return item->getCreatedDate();
    if(role == LinkRole)
        return item->getLink();
    if(role == ImagePreviewLinkRole)
        return item->getImagePreviewLink();
    if(role == TextRole)
        return item->getText();
    if(role == ResourceRole)
        return item->getResource();
    if(role == LabelsRole)
        return item->getLabels();
    if(role == IsImportantRole)
        return item->getIsImportant();

    return QVariant();
}

QVariant ArticlesListModel::dataByIndex(int index, QString role)
{
    return data(createIndex(index, 0), roles.key(role.toUtf8()));
}

Article *ArticlesListModel::getByIndex(int index)
{
    if (index < 0 || index >= items.count())
        return nullptr;

    return items.at(index);
}

QHash<int, QByteArray> ArticlesListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[TitleRole] = "title";
    roles[SubtitleRole] = "subtitle";
    roles[CreatedRole] = "created";
    roles[CreatedDateRole] = "createdDate";
    roles[LinkRole] = "link";
    roles[ImagePreviewLinkRole] = "imagePreviewLink";
    roles[TextRole] = "text";
    roles[ResourceRole] = "resource";
    roles[LabelsRole] = "labels";
    roles[IsImportantRole] = "isImportant";
    return roles;
}
