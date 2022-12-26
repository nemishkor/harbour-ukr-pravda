#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{
    const QString settingsPath =
        QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation)
        + "/" + QCoreApplication::applicationName() + ".conf";
    settings = new QSettings(settingsPath, QSettings::NativeFormat);
    languageKey = "language";
    language = settings->value(languageKey, QVariant(0)).toInt();
    if(language != 0 && language != 1 && language != 2 && language != 3){
        setLanguage(defaultLanguage);
    }
}

int Settings::getLanguage() const
{
    return language;
}

void Settings::setLanguage(int newLanguage)
{
    if(newLanguage != 1 && newLanguage != 2 && newLanguage != 3){
        newLanguage = defaultLanguage;
    }
    language = newLanguage;
    settings->setValue(languageKey, newLanguage);
    emit languageChanged();
}
