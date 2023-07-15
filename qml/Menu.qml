import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: dock
    width: orientation === Orientation.Portrait ? parent.width : parent.height
    height: Theme.itemSizeMedium
    anchors {
        left: orientation === Orientation.Portrait ? parent.left : parent.left
        right: orientation === Orientation.Portrait ? parent.right : parent.right
        top: orientation === Orientation.Portrait ? undefined : undefined
        bottom: orientation === Orientation.Portrait ? parent.bottom : parent.bottom
    }
    color: "transparent"

    PanelBackground {
        position: Dock.Bottom
        anchors.fill: dock
    }

    Row {
        anchors.fill: parent

        Repeater {
            id: dockButtons

            model: ListModel {
                id: buttons
                ListElement {
                    mode: 0
                    icon: "icon-m-menu"
                    page: "pages/ListPage.qml"
                }
                ListElement {
                    mode: 1
                    icon: "icon-m-document"
                    page: "pages/ArticlePage.qml"
                }
                ListElement {
                    mode: 3
                    icon: "icon-m-developer-mode"
                    page: "pages/SettingsPage.qml"
                }
                ListElement {
                    mode: 4
                    icon: "icon-m-presence"
                    page: "pages/AboutPage.qml"
                }
            }
            delegate: Rectangle {

                property bool isCurrentMode: news.mode === model.mode

                height: parent.height
                width: dock.width / buttons.count
                color: isCurrentMode ? Theme.secondaryHighlightColor : (listMouseArea.pressed ? Theme.highlightDimmerColor : "transparent")

                Behavior on color {
                    ColorAnimation { duration: 200 }
                }

                Image {
                    anchors.centerIn: parent
                    source: "image://theme/" + model.icon + "?" + (!isCurrentMode && listMouseArea.pressed ? Theme.highlightColor : Theme.primaryColor)
                    transform: Rotation { origin.x: 50; origin.y: 50; angle: orientation === Orientation.Portrait ? 0 : 90 }
                }

                MouseArea {
                    id: listMouseArea
                    anchors.fill: parent
                    onClicked: {
                        if(isCurrentMode)
                            return
                        news.mode = model.mode
                        pageStack.animatorReplace(Qt.resolvedUrl(model.page), {}, PageStackAction.Immediate)
                    }
                }
            }
        }
    }

}
