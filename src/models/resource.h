#ifndef RESOURCE_H
#define RESOURCE_H

#include <QString>

class Resource
{
public:
    Resource(const QString &id, const QString &name, const QString &darkOnLightTextColor, const QString &lightOnDarkTextColor);

    const QString &getId() const;
    void setId(const QString &newId);

    const QString &getName() const;
    void setName(const QString &newName);

private:
    QString id;
    QString name;
    QString darkOnLightTextColor;
    QString lightOnDarkTextColor;
};

#endif // RESOURCE_H
