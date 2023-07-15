import QtQuick 2.0
import Sailfish.Silica 1.0

BasePage {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader {
                id: header
                title: qsTr("Settings")
            }

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

            SectionHeader { text: "Resources" }

            ListView {
                model: resourcesListModel
                width: parent.width
                height: contentHeight
                delegate: TextSwitch {
                    text: name
                    checked: model.enabled
                    onCheckedChanged: {
                        if(model.enabled !== checked){
                            model.enabled = checked;
                        }
                    }
                }
            }

        }

    }

}

