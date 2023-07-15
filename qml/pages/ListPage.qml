import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"

BasePage {
    id: page

    onStatusChanged: {
        if (status === PageStatus.Activating && articlesListModel.count === 0){
            newsLoader.refreshList()
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
                onClicked: newsLoader.refreshList()
            }
        }

        BusyIndicator {
            running: true
            size: BusyIndicatorSize.Large
            anchors.centerIn: parent
            visible: newsLoader.loading && articlesListModel.count === 0
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
            textFormat: Text.PlainText
        }

        SilicaListView {
            id: listView
            model: articlesListModel
            anchors.fill: parent
            visible: articlesListModel.count > 0 && newsLoader.error === ""

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
                resource: model.resource
            }

            onAtYEndChanged: {
                if (articlesListModel.count > 0 && listView.atYEnd) {
                    newsLoader.loadNextPageList()
                }
            }

            VerticalScrollDecorator {}
        }

        ArticlesLoader { }

    }

}
