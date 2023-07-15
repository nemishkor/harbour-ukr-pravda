#ifndef RESOURCESLISTMODEL_H
#define RESOURCESLISTMODEL_H

#include <QAbstractListModel>
#include <QPair>
#include <QHash>
#include <QList>
#include "../models/resource.h"

class ResourcesListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ResourceRoles {
        NameRole = Qt::DisplayRole,
        CheckStateRole = Qt::CheckStateRole,
    };
    explicit ResourcesListModel(QObject *parent = nullptr);
    void replace(const QList<const Resource*> &);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
    QStringList getEnabledIdResources();
    void setEnabledStatuses(const QStringList);

protected:
    QHash<int, QByteArray> roleNames() const override;
private:
    QList<QPair<const Resource*, bool>> items;
};

#endif // RESOURCESLISTMODEL_H
