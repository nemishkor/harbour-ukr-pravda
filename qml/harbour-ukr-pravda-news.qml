import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    initialPage: Qt.resolvedUrl(settings.language === 0 ? "pages/WelcomePage.qml" : "pages/ListPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    bottomMargin: dock.visible ? dock.height : 0

    Menu {
        id: dock
        visible: settings.language !== 0
    }

}
