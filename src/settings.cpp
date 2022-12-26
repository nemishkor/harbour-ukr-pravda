#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{
    settings = new QSettings("org.nemishkor", "ukr-pravda-news", this);
    languageKey = "language";
    if(settings->contains(languageKey)) {
        language = settings->value(languageKey).toInt();
    }
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
    settings->sync();
    emit languageChanged();
}
