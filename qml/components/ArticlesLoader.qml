import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    width: Theme.itemSizeMedium
    height: width
    anchors {
        bottom: parent.bottom
        bottomMargin: Theme.paddingMedium
        horizontalCenter: parent.horizontalCenter
    }
    radius: width
    color: Theme.highlightDimmerColor
    visible: newsLoader.loading && articlesListModel.count > 0

    BusyIndicator {
        running: true
        size: BusyIndicatorSize.Medium
        anchors.centerIn: parent
    }
}
