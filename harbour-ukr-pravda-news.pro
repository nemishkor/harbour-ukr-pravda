# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-ukr-pravda-news

CONFIG += sailfishapp

SOURCES += src/harbour-ukr-pravda-news.cpp \
    src/article.cpp \
    src/articleslistmodel.cpp \
    src/models/resource.cpp \
    src/news.cpp \
    src/newsloader.cpp \
    src/settings.cpp \
    src/viewmodels/resourceslistmodel.cpp

DISTFILES += qml/harbour-ukr-pravda-news.qml \
    qml/*.qml \
    qml/components/*.qml \
    qml/cover/*.qml \
    qml/pages/*.qml \
    rpm/harbour-ukr-pravda-news.changes \
    rpm/harbour-ukr-pravda-news.changes.run.in \
    rpm/harbour-ukr-pravda-news.spec \
    rpm/harbour-ukr-pravda-news.yaml \
    translations/*.ts \
    harbour-ukr-pravda-news.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-ukr-pravda-news-de.ts

HEADERS += \
    src/article.h \
    src/articleslistmodel.h \
    src/models/resource.h \
    src/news.h \
    src/newsloader.h \
    src/settings.h \
    src/viewmodels/resourceslistmodel.h
