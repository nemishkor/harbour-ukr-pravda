#include "resource.h"

Resource::Resource(const QString &id, const QString &name, const QString &darkOnLightTextColor, const QString &lightOnDarkTextColor) :
    id(id),
    name(name),
    darkOnLightTextColor(darkOnLightTextColor),
    lightOnDarkTextColor(lightOnDarkTextColor)
{
}

const QString &Resource::getId() const
{
    return id;
}

void Resource::setId(const QString &newId)
{
    id = newId;
}

const QString &Resource::getName() const
{
    return name;
}

void Resource::setName(const QString &newName)
{
    name = newName;
}
