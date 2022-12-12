#include <QtQuick>
#include <sailfishapp.h>

#include "articleslistmodel.h"
#include "newsloader.h"

int main(int argc, char *argv[])
{
    // SailfishApp::main() will display "qml/harbour-ukr-pravda-news.qml", if you need more
    // control over initialization, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //   - SailfishApp::pathToMainQml() to get a QUrl to the main QML file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    // Set up QML engine.
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    QQmlContext *context = view.data()->rootContext();

    ArticlesListModel articlesListModel;
    NewsLoader *newsLoader = new NewsLoader(&articlesListModel);

    context->setContextProperty("newsLoader", newsLoader);
    context->setContextProperty("articlesListModel", &articlesListModel);

    view->setSource(SailfishApp::pathTo("qml/harbour-ukr-pravda-news.qml"));
    view->show();
    return app->exec();
}
