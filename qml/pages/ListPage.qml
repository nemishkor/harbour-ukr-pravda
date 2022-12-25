import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    onStatusChanged: {
        if (status === PageStatus.Active){
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

            delegate: ListItem {
                id: delegate
                contentHeight: column.height + separator.height + Theme.paddingMedium * 2
                onClicked: {
                    news.mode = 1
                    if(index > 0){
                        pageStack.replace(Qt.resolvedUrl("ArticlePage.qml"), { index: index - 1 }, PageStackAction.Immediate)
                        pageStack.push(Qt.resolvedUrl("ArticlePage.qml"), { index: index }, PageStackAction.Immediate)
                    } else {
                        pageStack.animatorReplace(Qt.resolvedUrl("ArticlePage.qml"), { index: index }, PageStackAction.Immediate)
                    }
                }

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
                        font.bold: model.isImportant
                    }

                    Label {
                        visible: model.subtitle !== ""
                        x: Theme.horizontalPageMargin
                        width: parent.width - 2 * Theme.horizontalPageMargin
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                        wrapMode: "WordWrap"
                        text: model.subtitle
                    }

                    Row {
                        x: Theme.horizontalPageMargin
                        width: parent.width - 2 * Theme.horizontalPageMargin
                        height: Theme.fontSizeMedium + Theme.paddingSmall * 2
                        spacing: Theme.paddingMedium

                        Label {
                            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                            text: model.created
                        }

                        Repeater {
                            width: parent.width
                            height: Theme.fontSizeMedium
                            model: labels
                            delegate: Label {
                                text: modelData
                                padding: Theme.paddingSmall
                                font.pixelSize: Theme.fontSizeExtraSmall

                                Rectangle {
                                    z: -1
                                    color: Theme.secondaryHighlightColor
                                    height: parent.height
                                    width: parent.width
                                    radius: Theme.fontSizeTiny / 2
                                }
                            }
                        }
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

}
