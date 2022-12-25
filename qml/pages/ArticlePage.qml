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
        highlightRangeMode: ListView.StrictlyEnforceRange

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
                Rectangle {
                    width: parent.width
                    height: Theme.paddingLarge + Theme.itemSizeMedium
                    color: "transparent"
                }
            }
        }
    }

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
//            visible: false
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
