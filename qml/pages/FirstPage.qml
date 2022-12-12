import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: articlesListModel
        anchors.fill: parent

        header: PageHeader {
            title: qsTr("Articles")
        }

        PullDownMenu {
            MenuItem {
                text: "Refresh"
                onClicked: {
                    articlesListModel.clear()
                    newsLoader.loadList()
                }
            }
        }

        delegate: ListItem {
            id: delegate
            contentHeight: column.height + separator.height + Theme.paddingMedium * 2

            Column {
                id: column
                y: Theme.paddingMedium
                spacing: Theme.paddingSmall
                width: parent.width

                Label {
                    x: Theme.horizontalPageMargin
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                    wrapMode: "WordWrap"
                    text: model.title
                }

                Label {
                    visible: model.subtitle !== ""
                    x: Theme.horizontalPageMargin
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                    wrapMode: "WordWrap"
                    text: model.subtitle
                }

                Label {
                    x: Theme.horizontalPageMargin
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                    text: model.created
                }
            }

            Separator {
                id: separator
                visible: (index + 1) < listView.count
                anchors {
                    top: column.bottom
                    topMargin: Theme.paddingMedium
                }

                width: parent.width
                color: Theme.primaryColor
                horizontalAlignment: Qt.AlignHCenter
            }
        }

        VerticalScrollDecorator {}
    }
}
