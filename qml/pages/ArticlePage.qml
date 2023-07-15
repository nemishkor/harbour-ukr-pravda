import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Share 1.0
import "../components"

BasePage {
    id: page

    property int index;

    ShareAction {
        id: shareAction
        title: qsTrId("Share link")
        mimeType: "text/x-url"
    }

    ListView {
        id: articlesListView
        anchors.fill: parent
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        model: articlesListModel
        highlightRangeMode: ListView.StrictlyEnforceRange

        Component.onCompleted: {
            articlesListView.positionViewAtIndex(index, ListView.SnapPosition)
        }

        onAtXEndChanged: {
            if (articlesListView.atXEnd) {
                newsLoader.loadNextPageList()
            }
        }

        delegate: SilicaFlickable {
            contentHeight: col.height
            width: ListView.view.width
            height: ListView.view.height

            PullDownMenu {
                MenuItem {
                    text: qsTr("Share")
                    onClicked: {
                        shareAction.resources = [
                            {
                                "type": "text/x-url",
                                "linkTitle": model.title,
                                "status": model.link,
                            }
                        ]
                        shareAction.trigger()
                    }
                }
                MenuItem {
                    text: qsTr("Open full page")
                    onClicked: Qt.openUrlExternally(model.link);
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
                    textFormat: Text.PlainText
                }

                Rectangle {
                    width: parent.width
                    height: Theme.paddingMedium
                    color: "transparent"
                }

                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin - 27 - Theme.paddingMedium
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin + 27 + Theme.paddingMedium
                    }
                    font.pixelSize: Theme.fontSizeSmall
                    text: {
                        if(model.resource === "pravda")
                            return qsTr("Ukrainska pravda")
                        if(model.resource === "epravda")
                            return qsTr("Economic")
                        if(model.resource === "life_pravda")
                            return qsTr("Life")
                        if(model.resource === "eurointegration")
                            return qsTr("Eurointegration")
                        if(model.resource === "istpravda")
                            return qsTr("History")
                        if(model.resource === "tabloid_pravda")
                            return qsTr("Tabloid")
                        return ""
                    }
                    textFormat: Text.PlainText

                    color: {
                        if(Theme.colorScheme === Theme.DarkOnLight){
                            if(model.resource === "pravda")
                                return "#7e0019"
                            if(model.resource === "epravda")
                                return "#4a5d32"
                            if(model.resource === "life_pravda")
                                return "#5f6a82"
                            if(model.resource === "eurointegration")
                                return "#0f5499"
                            if(model.resource === "istpravda")
                                return "#7b6c66"
                            if(model.resource === "tabloid_pravda")
                                return "#4e3cca"
                            return "#f4f5f7"
                        }

                        if(model.resource === "pravda")
                            return "#ec2f54"
                        if(model.resource === "epravda")
                            return "#9bcc5e"
                        if(model.resource === "life_pravda")
                            return "#f4f5f7"
                        if(model.resource === "eurointegration")
                            return "#3c9cfd"
                        if(model.resource === "istpravda")
                            return "#f9f2ef"
                        if(model.resource === "tabloid_pravda")
                            return "#a165f9"
                        return "#2d2d2d"
                    }

                    GlassItem {
                        id: button
                        anchors {
                            right: parent.left
                            rightMargin: Theme.paddingMedium
                            top: parent.top
                            bottom: parent.bottom
                        }

                        width: 27
                        falloffRadius: 0.295
                        radius: 0.115
                        ratio: 0.0
                        cache: false
                        color: {
                            if(model.resource === "pravda")
                                return "#7e0019"
                            if(model.resource === "epravda")
                                return "#4a5d32"
                            if(model.resource === "life_pravda")
                                return "#f4f5f7"
                            if(model.resource === "eurointegration")
                                return "#0f5499"
                            if(model.resource === "istpravda")
                                return "#f9f2ef"
                            if(model.resource === "tabloid_pravda")
                                return "#4e3cca"
                            return "#f4f5f7"
                        }
                    }
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
                    textFormat: Text.PlainText
                }
                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: model.subtitle
                    wrapMode: Text.WordWrap
                    textFormat: Text.PlainText
                }
                Label {
                    width: parent.width - 2 * Theme.horizontalPageMargin
                    anchors {
                        left: parent.left
                        leftMargin: Theme.horizontalPageMargin
                    }
                    text: '
                <html>
                    <head><style>
                        a { color: ' + Theme.highlightColor + '; }
                        p + p { margin-top: ' + Theme.paddingMedium + 'px }
                    </style></head>
                    <body>
                        ' + model.text + '
                    </body>
                </html>
            '
                    wrapMode: Text.WordWrap
                    textFormat: Text.RichText
                    onLinkActivated: Qt.openUrlExternally(link)
                }
                Rectangle {
                    width: parent.width
                    height: Theme.paddingLarge + Theme.itemSizeMedium
                    color: "transparent"
                }
            }
        }
    }

    ArticlesLoader { }

    Rectangle {
        id: slider

        color: "transparent"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: Theme.itemSizeMedium

        Rectangle {
            id: sliderBackground

            anchors.fill: parent
            color: Theme.colorScheme === Theme.DarkOnLight ? Theme.lightPrimaryColor : Theme.darkPrimaryColor
        }

        OpacityRampEffect {
            id: effect

            slope: 2.0
            offset: 0.25
            sourceItem: sliderBackground
            direction: OpacityRamp.BottomToTop
        }

        Item {
            id: sliderContainer

            x: Theme.horizontalPageMargin
            anchors { top: parent.top; bottom: parent.bottom }
            width: parent.width - 2 * Theme.horizontalPageMargin


            GlassItem {
                width: parent.width
                anchors.verticalCenter: sliderContainer.verticalCenter
                y: parent.height / 2 - Theme.itemSizeExtraSmall / 2
                height: Theme.itemSizeExtraSmall
                dimmed: true
                radius: Theme.colorScheme === Theme.DarkOnLight ? 0.06 : 0.05
                falloffRadius: Theme.colorScheme === Theme.DarkOnLight ? 0.09 : 0.05
                ratio: 0.0
                color: Theme.primaryColor
            }

            GlassItem {
                id: sliderPoint

                property real step: (parent.width - 4 * Theme.paddingMedium) / articlesListModel.count

                x: 0
                width: Theme.itemSizeMedium
                height: Theme.itemSizeMedium
                radius: 0.17
                falloffRadius: 0.17
                anchors.verticalCenter: sliderContainer.verticalCenter
                color: sliderDrag.pressed ? Theme.highlightColor : Theme.primaryColor
                backgroundColor: Theme.colorScheme === Theme.DarkOnLight ? palette.highlightDimmerColor : "transparent"

                function updatePosition(){
                    x = step * (articlesListView.currentIndex) - Theme.itemSizeMedium / 2 + 2 * Theme.paddingMedium
                }

                Connections {
                    target: articlesListView
                    onCurrentIndexChanged: {
                        if(sliderDrag.pressed)
                            return
                        sliderPoint.updatePosition()
                    }
                }

                NumberAnimation on x {
                    duration: 100
                }

                MouseArea {
                    id: sliderDrag
                    anchors.fill: parent
                    drag {
                        target: parent
                        axis: Drag.XAxis
                        minimumX: - Theme.itemSizeMedium / 2 + 2 * Theme.paddingMedium
                        maximumX: sliderContainer.width - Theme.itemSizeMedium / 2 - 2 * Theme.paddingMedium
                    }
                    onMouseXChanged: {
                        var index = Math.round(sliderPoint.x / sliderPoint.step)
                        if(index !== articlesListView.currentIndex){
                            articlesListView.positionViewAtIndex(index, ListView.SnapPosition)
                        }
                    }
                }

            }

        }

    }

}
