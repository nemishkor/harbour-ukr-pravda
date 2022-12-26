import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    PageHeader {
        id: header
        title: qsTr("Settings")
    }

    SilicaFlickable {
        anchors {
            top: header.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            ComboBox {
                label: qsTr("Language")
                currentIndex: {
                    return {1: 0, 2: 2, 3: 1}[settings.language]
                }

                menu: ContextMenu {
                    MenuItem { text: "УКР"; onClicked: settings.language = 1 }
                    MenuItem { text: "ENG"; onClicked: settings.language = 3 }
                    MenuItem { text: "РУС"; onClicked: settings.language = 2 }
                }
            }

        }
    }

}

