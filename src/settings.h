#ifndef SETTINGS_H
#define SETTINGS_H

#include <QDebug>
#include <QMap>
#include <QObject>
#include <QSettings>
#include <QCoreApplication>
#include <QStandardPaths>
#include "src/viewmodels/resourceslistmodel.h"

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int language READ getLanguage WRITE setLanguage NOTIFY languageChanged)
public:
    enum Languages {
        UKRAINIAN = 1,
        RUSSIAN = 2,
        ENGLISH = 3,
    };
    explicit Settings(ResourcesListModel* resources, QObject *parent = nullptr);

    int getLanguage() const;
    void setLanguage(int newLanguage);
    QStringList getResources();

private:
    QSettings *settings;
    QString languageKey;
    int language = 0;
    int defaultLanguage = 1;
    QMap<Languages, QList<const Resource*>> resourcesPerLanguage;
    ResourcesListModel* resourcesListModel;
    QString resourcesKey;
    void updateResourceListModel();

signals:
    void languageChanged();

private slots:
    void saveResources();

};

#endif // SETTINGS_H
