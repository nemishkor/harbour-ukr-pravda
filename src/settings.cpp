#include "settings.h"

Settings::Settings(ResourcesListModel* resources, QObject *parent) :
    QObject(parent),
    resourcesListModel(resources)
{
    resourcesPerLanguage[UKRAINIAN] = QList<const Resource*>{
            new Resource("pravda", "Ukrainska pravda", "#7e0019", "#ec2f54"),
            new Resource("epravda", "Economic", "#4a5d32", "#9bcc5e"),
            new Resource("life_pravda", "Life", "#5f6a82", "#f4f5f7"),
            new Resource("eurointegration", "Eurointegration", "#0f5499", "#3c9cfd"),
            new Resource("istpravda", "History", "#7b6c66", "#f9f2ef"),
            new Resource("tabloid_pravda", "Tabloid", "#4e3cca", "#a165f9")
    };
    resourcesPerLanguage[RUSSIAN] = QList<const Resource*>{
            new Resource("pravda", "Ukrainska pravda", "#7e0019", "#ec2f54"),
            new Resource("epravda", "Economic", "#4a5d32", "#9bcc5e"),
            new Resource("eurointegration", "Eurointegration", "#0f5499", "#3c9cfd"),
    };
    resourcesPerLanguage[ENGLISH] = QList<const Resource*>{
            new Resource("pravda", "Ukrainska pravda", "#7e0019", "#ec2f54"),
            new Resource("eurointegration", "Eurointegration", "#0f5499", "#3c9cfd"),
    };

    languageKey = "language";
    resourcesKey = "resources";

    const QString settingsPath =
        QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation)
        + "/" + QCoreApplication::applicationName() + ".conf";
    settings = new QSettings(settingsPath, QSettings::NativeFormat);

    setLanguage(settings->value(languageKey, QVariant(0)).toInt());
    QVariant enabledResources = settings->value(resourcesKey);
    if (!enabledResources.isNull()) {
        resourcesListModel->setEnabledStatuses(enabledResources.toStringList());
    }

    connect(resourcesListModel, &QAbstractItemModel::dataChanged, this, &Settings::saveResources);
    connect(resourcesListModel, &QAbstractItemModel::rowsInserted, this, &Settings::saveResources);
    connect(resourcesListModel, &QAbstractItemModel::rowsRemoved, this, &Settings::saveResources);
}

int Settings::getLanguage() const
{
    return language;
}

void Settings::setLanguage(int newLanguage)
{
    if(newLanguage != 0 && newLanguage != 1 && newLanguage != 2 && newLanguage != 3){
        newLanguage = defaultLanguage;
    }
    if(language != newLanguage){
        settings->setValue(languageKey, newLanguage);
        language = newLanguage;
        emit languageChanged();
    }
    updateResourceListModel();
}

QStringList Settings::getResources()
{
    return resourcesListModel->getEnabledIdResources();
}

void Settings::updateResourceListModel()
{
    QMap<Settings::Languages, QList<const Resource*>>::const_iterator it = resourcesPerLanguage.constBegin();
    while (it != resourcesPerLanguage.constEnd()) {
        if(it.key() == language){
            resourcesListModel->replace(*it);
            return;
        }
        ++it;
    }
}

void Settings::saveResources()
{
    QStringList enabledResources = getResources();
    if(enabledResources.count() > 0){
        settings->setValue(resourcesKey, enabledResources);
    }
}
