import QtQuick 2.0
import Sailfish.Silica 1.0

ListItem {
    id: root

    property string imagePreviewLink
    property string title
    property bool isImportant
    property string subtitle
    property string created
    property var labels
    property bool isLast
    property string resource

    property int imagePreviewHeight: Math.round(width * 14 / 25)
    property int resourceIndicatorWidth: 27

    contentHeight: column.height + separator.height + Theme.paddingMedium * 2
    onClicked: {
        news.mode = 1
        pageStack.replace(Qt.resolvedUrl("../pages/ArticlePage.qml"), { index: index }, PageStackAction.Immediate)
    }

    Column {
        id: column

        y: Theme.paddingMedium
        spacing: Theme.paddingSmall
        width: parent.width

        Image {
            id: imagePreview
            clip: true
            fillMode: Image.PreserveAspectCrop
            visible: root.imagePreviewLink !== "" && imagePreview.status !== Image.Loading
            width: parent.width
            height: root.imagePreviewHeight
            source: root.imagePreviewLink

            Rectangle {
                visible: root.highlighted
                anchors.fill: parent
                color: root.highlightedColor
            }
        }

        Item {
            width: parent.width
            height: root.imagePreviewHeight
            visible: imagePreview.status === Image.Loading

            BusyIndicator {
                id: imagePreviewLoaderIndicator
                y: parent.height / 2 - height / 2
                running: parent.visible
                size: BusyIndicatorSize.Medium
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ProgressBar {
                id: progressBar
                anchors {
                    top: imagePreviewLoaderIndicator.bottom
                    topMargin: Theme.paddingSmall
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.8
                value: imagePreview.progress
            }
        }

        Label {
            x: Theme.horizontalPageMargin + root.resourceIndicatorWidth + Theme.paddingMedium
            width: parent.width - 2 * Theme.horizontalPageMargin - root.resourceIndicatorWidth - Theme.paddingMedium
            color: root.highlighted ? Theme.highlightColor : Theme.primaryColor
            wrapMode: "WordWrap"
            text: root.title
            font.bold: root.isImportant

            GlassItem {
                id: resourceIndicator
                anchors {
                    right: parent.left
                    rightMargin: Theme.paddingMedium
                    top: parent.top
                    bottom: parent.bottom
                }
                width: root.resourceIndicatorWidth
                falloffRadius: 0.295
                radius: 0.115
                ratio: 0.0
                cache: false
                color: {
                    if(root.resource === "pravda")
                        return "#7e0019"
                    if(root.resource === "epravda")
                        return "#4a5d32"
                    if(root.resource === "life_pravda")
                        return "#f4f5f7"
                    if(root.resource === "eurointegration")
                        return "#0f5499"
                    if(root.resource === "istpravda")
                        return "#f9f2ef"
                    if(root.resource === "tabloid_pravda")
                        return "#4e3cca"
                    return "#f4f5f7"
                }
                opacity: root.highlighted ? 0.5 : 1.0
            }
        }

        Label {
            visible: root.subtitle !== ""
            x: Theme.horizontalPageMargin
            width: parent.width - 2 * Theme.horizontalPageMargin
            color: root.highlighted ? Theme.highlightColor : Theme.primaryColor
            wrapMode: "WordWrap"
            text: root.subtitle
        }

        Row {
            x: Theme.horizontalPageMargin
            width: parent.width - 2 * Theme.horizontalPageMargin
            height: Theme.fontSizeMedium + Theme.paddingSmall * 2
            spacing: Theme.paddingMedium

            Label {
                color: root.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                text: root.created
            }

            Repeater {
                width: parent.width
                height: Theme.fontSizeMedium
                model: root.labels
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
        visible: !isLast
        anchors {
            top: column.bottom
            topMargin: Theme.paddingMedium
        }

        width: parent.width
        color: Theme.primaryColor
        horizontalAlignment: Qt.AlignHCenter
    }
}
