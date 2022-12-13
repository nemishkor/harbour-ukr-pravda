import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    onStatusChanged: {
        if (status === PageStatus.Active){
            newsLoader.loadList()
        }
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            busy: newsLoader.loading
            MenuItem {
                text: qsTr("Refresh")
                enabled: !newsLoader.loading
                onClicked: {
                    articlesListModel.clear()
                    newsLoader.loadList()
                }
            }
        }

        BusyIndicator {
            running: true
            size: BusyIndicatorSize.Large
            anchors.centerIn: parent
            visible: newsLoader.loading
        }

        Label {
            anchors.centerIn: parent
            text: newsLoader.error
            visible: newsLoader.error !== ""
            color: Theme.errorColor
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeLarge
            width: parent.width - 2 * Theme.horizontalPageMargin
            wrapMode: Text.WordWrap
        }

        SilicaListView {
            id: listView
            model: articlesListModel
            anchors.fill: parent
            visible: !newsLoader.loading

            header: PageHeader {
                title: qsTr("Articles")
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

//    SilicaListView {

//    }
}
