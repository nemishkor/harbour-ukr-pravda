import QtQuick 2.0
import Sailfish.Silica 1.0

DockedPanel {
    id: dock
    dock: Dock.Bottom
    clip: true
    open: true
    width: parent.width
    height: Theme.itemSizeMedium

    Row {
        width: dock.width
        height: Theme.itemSizeMedium

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
            }
            delegate: Rectangle {
                height: dockButtons.height
                width: parent.width / buttons.count
                color: news.mode === model.mode ? Theme.secondaryHighlightColor : Theme.highlightDimmerColor

                Behavior on color {
                    ColorAnimation { duration: 200 }
                }

                Image {
                    anchors.centerIn: parent
                    source: "image://theme/" + model.icon + "?" + (listMouseArea.pressed ? Theme.highlightColor : Theme.primaryColor)
                }

                MouseArea {
                    id: listMouseArea
                    anchors.fill: parent
                    onClicked: {
                        news.mode = model.mode
                        pageStack.animatorReplace(Qt.resolvedUrl(model.page), {}, PageStackAction.Immediate)
                    }
                }
            }
        }
    }

}
