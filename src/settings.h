#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int language READ getLanguage WRITE setLanguage NOTIFY languageChanged)
public:
    explicit Settings(QObject *parent = nullptr);

    int getLanguage() const;
    void setLanguage(int newLanguage);

private:
    QSettings *settings;
    QString languageKey;
    int language = 0;
    int defaultLanguage = 1;

signals:
    void languageChanged();

};

#endif // SETTINGS_H
