#include <QtQuick>
#include <sailfishapp.h>

#include "articleslistmodel.h"
#include "news.h"
#include "newsloader.h"

static QMutex mutex; // global variable

void msgHandler(QtMsgType type, const QMessageLogContext & context, const QString & msg)
{
    mutex.lock();

    QDateTime dateTime(QDateTime::currentDateTime());

    QString timeStr(dateTime.toString("dd-MM-yyyy HH:mm:ss:zzz"));
    QString contextString(QString("(%1, %2)").arg(context.file).arg(context.line));

    QFile outFile("file.log");
    outFile.open(QIODevice::WriteOnly | QIODevice::Append);

    QTextStream stream(&outFile);
    stream << timeStr << " " << contextString << ": " << msg << endl;

    mutex.unlock();
}

int main(int argc, char *argv[])
{
    // qInstallMessageHandler(msgHandler);

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

    Article article;
    ArticlesListModel list(&article);
    News news(&article, &list);
    NewsLoader newsLoader(&list);

    QQmlContext *context = view.data()->rootContext();
    context->setContextProperty("articlesListModel", &list);
    context->setContextProperty("newsLoader", &newsLoader);
    context->setContextProperty("article", &article);
    context->setContextProperty("news", &news);

    qDebug() << "Start";

    view->setSource(SailfishApp::pathTo("qml/harbour-ukr-pravda-news.qml"));
    view->show();
    return app->exec();
}
