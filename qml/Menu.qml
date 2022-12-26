import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: dock

    anchors {
        left: parent.left
        right: parent.right
        top: parent.bottom
    }

    color: "transparent"
    width: parent.width
    height: Theme.itemSizeMedium

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
