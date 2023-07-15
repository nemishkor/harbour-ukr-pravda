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
    property string resource

    property int imagePreviewWidth: isPortrait ? root.width : Math.round(root.width * 0.25)
    property int imagePreviewHeight: Math.round(imagePreviewWidth * 14 / 25)
    property int resourceIndicatorWidth: 27

    contentHeight: container.height + Theme.paddingLarge
    onClicked: {
        news.mode = 1
        pageStack.replace(Qt.resolvedUrl("../pages/ArticlePage.qml"), { index: index }, PageStackAction.Immediate)
    }

    Row {
        id: container

        x: isPortrait ? 0 : Theme.horizontalPageMargin
        width: parent.width - (isPortrait ? 0 : 2 * Theme.horizontalPageMargin)
        height: Math.max(column.height, imagePreviewLandscape.visible ? imagePreviewLandscape.height : 0)
        spacing: Theme.paddingMedium

        Image {
            id: imagePreviewLandscape
            clip: true
            fillMode: Image.PreserveAspectCrop
            visible: !isPortrait && root.imagePreviewLink !== "" && imagePreview.status !== Image.Loading
            width: root.imagePreviewWidth
            height: root.imagePreviewHeight
            source: root.imagePreviewLink

            Rectangle {
                visible: root.highlighted
                anchors.fill: parent
                color: root.highlightedColor
            }
        }

        Column {
            id: column

            spacing: Theme.paddingSmall
            width: imagePreviewLandscape.visible ? (parent.width - root.imagePreviewWidth - Theme.paddingMedium) : parent.width

            Image {
                id: imagePreview
                clip: true
                fillMode: Image.PreserveAspectCrop
                visible: isPortrait && root.imagePreviewLink !== "" && imagePreview.status !== Image.Loading
                width: root.imagePreviewWidth
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
                x: isPortrait ? Theme.horizontalPageMargin : 0
                width: isPortrait ? (parent.width - 2 * Theme.horizontalPageMargin) : parent.width
                color: root.highlighted ? Theme.highlightColor : Theme.primaryColor
                wrapMode: "WordWrap"
                text: root.title
                font.bold: root.isImportant
                textFormat: Text.PlainText
                rightPadding: createdLabel.width + Theme.paddingSmall
                leftPadding: root.resourceIndicatorWidth + Theme.paddingSmall

                GlassItem {
                    id: resourceIndicator
                    anchors {
                        left: parent.left
                        leftMargin: -10
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

                Label {
                    id: createdLabel
                    anchors {
                        right: parent.right
                        top: parent.top
                        topMargin: Theme.paddingSmall
                    }
                    color: root.highlighted ? Theme.secondaryHighlightColor : Theme.primaryColor
                    text: root.created
                    font.pixelSize: Theme.fontSizeExtraSmall
                    textFormat: Text.PlainText
                }
            }

            Label {
                visible: root.subtitle !== ""
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * Theme.horizontalPageMargin
                color: root.highlighted ? Theme.highlightColor : Theme.primaryColor
                wrapMode: "WordWrap"
                text: root.subtitle
                textFormat: Text.PlainText
            }

            Row {
                visible: root.labels.length > 0
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * Theme.horizontalPageMargin
                height: Theme.fontSizeMedium + Theme.paddingSmall * 2
                spacing: Theme.paddingMedium

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

    }

}
