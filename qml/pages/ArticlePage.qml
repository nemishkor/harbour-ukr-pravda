import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property int index;

    allowedOrientations: Orientation.All

    ListView {
        id: articlesListView
        anchors.fill: parent
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        model: articlesListModel

        Component.onCompleted: {
            articlesListView.positionViewAtIndex(index, ListView.SnapPosition)
        }

        delegate: SilicaFlickable {
            contentHeight: col.height
            width: ListView.view.width
            height: ListView.view.height

            PullDownMenu {
                MenuItem {
                    text: qsTr("Open full page")
                    onClicked: Qt.openUrlExternally(articlesListModel.dataByIndex(index, "link"));
                }
            }

            Column {
                id: col
                width: parent.width

                Rectangle {
                    width: parent.width
                    height: Theme.paddingLarge
                    color: "transparent"
                }

                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: model.title
                    wrapMode: Text.WordWrap
                    font.pixelSize: Theme.fontSizeLarge
                }

                Rectangle {
                    width: parent.width
                    height: Theme.paddingMedium
                    color: "transparent"
                }

                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: model.created + " " + model.createdDate
                    font.pixelSize: Theme.fontSizeSmall
                }
                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: model.subtitle
                    wrapMode: Text.WordWrap
                }
                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: model.text
                    wrapMode: Text.WordWrap
                }
            }
        }
    }

}
