import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    id: app
    initialPage: Qt.resolvedUrl(settings.language === 0 ? "pages/WelcomePage.qml" : "pages/ListPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    Menu {
        id: dock
        visible: settings.language !== 0
    }
}
