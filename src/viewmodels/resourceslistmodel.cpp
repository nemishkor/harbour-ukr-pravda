#include "resourceslistmodel.h"

ResourcesListModel::ResourcesListModel(QObject *parent) : QAbstractListModel(parent)
{

}

int ResourcesListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return items.count();
}

void ResourcesListModel::replace(const QList<const Resource *> &newItems)
{
    beginRemoveRows(QModelIndex(), 0, rowCount() - 1);
    items.clear();
    endRemoveRows();
    beginInsertRows(QModelIndex(), rowCount(), newItems.count() - 1);
    QList<const Resource*>::const_iterator resIt = newItems.constBegin();
    while (resIt != newItems.constEnd()) {
        items << QPair<const Resource*, bool>(*resIt, true);
        ++resIt;
    }
    endInsertRows();
}

QVariant ResourcesListModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= items.count())
        return QVariant();

    const QPair<const Resource*, bool> &pair = items.at(index.row());
    const Resource *item = pair.first;
    if (role == NameRole)
        return item->getName();
    if (role == CheckStateRole)
        return pair.second;

    return QVariant();
}

bool ResourcesListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < 0 || index.row() >= items.count())
        return false;

    QPair<const Resource*, bool> &pair = items[index.row()];
    if(role == CheckStateRole){
        pair.second = value.toBool();
        emit dataChanged(index, index, QVector<int>{role});
        return true;
    }

    return false;
}

Qt::ItemFlags ResourcesListModel::flags(const QModelIndex &index) const
{
    Q_UNUSED(index);
    return Qt::ItemIsUserCheckable;
}

QStringList ResourcesListModel::getEnabledIdResources()
{
    QStringList enabledIdResources;
    QList<QPair<const Resource*, bool>>::const_iterator it = items.constBegin();
    while(it != items.constEnd()){
        if((*it).second){
            enabledIdResources.append((*it).first->getId());
        }
        ++it;
    }

    return enabledIdResources;
}

void ResourcesListModel::setEnabledStatuses(const QStringList enabledList)
{
    if(enabledList.count() == 0){
        return;
    }
    for(int i = 0; i < items.count(); i++){
        items[i].second = enabledList.contains(items.at(i).first->getId());
        emit dataChanged(createIndex(i, 0), createIndex(i, 0), QVector<int>{CheckStateRole});
    }
}

QHash<int, QByteArray> ResourcesListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[CheckStateRole] = "enabled";
    return roles;
}
