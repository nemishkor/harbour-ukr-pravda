import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"

Page {
    id: page

    allowedOrientations: Orientation.All

    onStatusChanged: {
        if (status === PageStatus.Active){
            articlesListModel.clear()
            newsLoader.loadList()
            news.mode = 0
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
                title: qsTr("Ukrainska pravda")
                description: qsTr("news")
            }

            section {
                property: 'createdDate'

                delegate: SectionHeader {
                    text: section
                    height: Theme.itemSizeExtraSmall
                }
            }

            delegate: ArticleListItem {
                imagePreviewLink: model.imagePreviewLink
                title: model.title
                isImportant: model.isImportant
                subtitle: model.subtitle
                created: model.created
                labels: model.labels
                isLast: (index + 1) === listView.count
                resource: model.resource
            }

            VerticalScrollDecorator {}
        }

    }

}
