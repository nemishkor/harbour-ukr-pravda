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
                title: qsTr("About & Support")
            }

            Label {
                text: qsTr("Journalists fight on their own frontline. Support Ukrainska pravda!")
                textFormat: Text.PlainText
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeLarge
                wrapMode: Text.WordWrap
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
            }

            Label {
                text: qsTr("No one in Ukraine knows the days of the week from Monday anymore, everyone is counting the days since the beginning of the war. And everyone who considers oneself a Ukrainian - in their own land or abroad, endeavors to bring the time of our victory closer.")
                textFormat: Text.PlainText
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
            }

            ButtonLayout {
                Button {
                    text: qsTr("Support")
                    onClicked: {
                        if(settings.language === 1){
                            Qt.openUrlExternally("https://club.pravda.com.ua/")
                        } else if (settings.language === 2){
                            Qt.openUrlExternally("https://www.pravda.com.ua/eng/supportus/")
                        } else {
                            Qt.openUrlExternally("https://www.pravda.com.ua/eng/supportus/")
                        }
                    }
                }
            }

            Item {
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
                height: Theme.paddingLarge
            }

            GlassItem {
                height: Theme.paddingLarge
                width: parent.width
                falloffRadius: 0.17
                radius: 0
                color: Theme.highlightColor
                cache: false
            }

            Item {
                width: parent.width
                height: Theme.paddingLarge
            }

            Rectangle {
                color: Theme.lightPrimaryColor
                width: parent.width
                height: width * 60 / 171

                Image {
                    anchors.centerIn: parent
                    // 120x48
                    source: 'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="body_1" width="600" height="240">

<g transform="matrix(3.529412 0 0 3.529412 12.3529415 -0)">
    <path d="M17.3679 25.5943C 17.3679 25.5943 7.00067 14.5694 12.2846 10.9687C 15.3279 8.8953 17.3121 11.5484 17.3121 11.5484C 17.3121 11.5484 19.2964 8.88415 22.3397 10.9687C 27.6236 14.5805 17.3567 25.5943 17.3567 25.5943L17.3567 25.5943L17.3679 25.5943zM17.2676 13.5884C 17.0669 13.2986 16.4984 12.6966 16.2085 12.4737C 15.9187 12.2507 14.7371 11.3255 13.1876 12.3733C 12.7194 12.6966 12.4964 13.0645 12.4407 13.6219C 12.4295 13.7222 12.4184 13.8337 12.4184 13.934C 12.4184 16.3642 15.0603 20.3215 17.3456 23.0527C 19.5974 20.3327 22.1948 16.3976 22.1948 13.9674C 22.1948 13.856 22.1948 13.7445 22.1836 13.633C 22.1167 13.0645 21.8938 12.6855 21.4256 12.3622C 19.8761 11.3143 19.0289 11.9609 18.5049 12.3622C 17.8138 12.9084 17.5017 13.2763 17.2676 13.5661" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M34.1338 0.713867L0.691162 0.713867L0.691162 34.1565L34.1338 34.1565L34.1338 0.713867z" stroke="#000000" stroke-width="1.25" fill="none" />
    <path d="M161.651 0.679688L33.9778 0.679688L33.9778 34.1L161.651 34.1L161.651 0.679688z" stroke="#000000" stroke-width="1.21" fill="none" />
    <path d="M107.585 34.1338L34.0334 34.1338L34.0334 67.3869L107.585 67.3869L107.585 34.1338z" stroke="#000000" stroke-width="1.12" fill="none" />
    <path d="M52.6165 20.0213L55.0244 20.0213L55.0244 22.5407C 55.0244 24.9708 52.8617 25.8403 51.0112 25.8403C 49.1607 25.8403 46.9758 24.9708 46.9758 22.5407L46.9758 22.5407L46.9758 12.6862C 46.9758 10.2338 49.1385 9.36426 51.0112 9.36426C 52.884 9.36426 55.0244 10.2338 55.0244 12.6862L55.0244 12.6862L55.0244 15.2056L52.6165 15.2056L52.6165 12.6862C 52.6165 11.7721 51.747 11.4377 51.0112 11.4377C 50.2755 11.4377 49.3837 11.7498 49.3837 12.6862L49.3837 12.6862L49.3837 22.5407C 49.3837 23.4547 50.2755 23.7892 51.0112 23.7892C 51.747 23.7892 52.6165 23.4547 52.6165 22.5407L52.6165 22.5407L52.6165 20.0213z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M58.6472 12.6862C 58.6472 10.2338 60.8098 9.36426 62.6826 9.36426C 64.5554 9.36426 66.6957 10.2338 66.6957 12.6862L66.6957 12.6862L66.6957 22.5407C 66.6957 24.9708 64.5331 25.8403 62.6826 25.8403C 60.8321 25.8403 58.6472 24.9708 58.6472 22.5407L58.6472 22.5407L58.6472 12.6862zM64.2879 12.6862C 64.2879 11.7721 63.4184 11.4377 62.6826 11.4377C 61.9469 11.4377 61.0551 11.7498 61.0551 12.6862L61.0551 12.6862L61.0551 22.5407C 61.0551 23.4547 61.9469 23.7892 62.6826 23.7892C 63.4184 23.7892 64.2879 23.4547 64.2879 22.5407L64.2879 22.5407L64.2879 12.6862z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M79.4374 25.5951L79.4374 14.6928L76.2269 21.0692L73.0387 14.6928L73.0387 25.5951L70.6309 25.5951L70.6309 9.63184L72.8381 9.63184L76.2269 16.4541L79.6381 9.63184L81.8007 9.63184L81.8007 25.5951L79.4374 25.5951z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M93.0038 25.5951L85.9363 25.5951L85.9363 9.63184L93.0038 9.63184L93.0038 11.7053L88.3442 11.7053L88.3442 16.3204L92.2012 16.3204L92.2012 18.3938L88.3442 18.3938L88.3442 23.4994L93.0038 23.4994L93.0038 25.5951z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M102.546 25.5951L102.546 9.63184L106.961 9.63184C 108.989 9.63184 110.483 10.8804 110.483 12.7754L110.483 12.7754L110.483 14.7374C 110.483 15.6961 109.993 16.5433 109.123 17.2568C 110.372 17.881 110.951 18.7505 110.951 20.0213L110.951 20.0213L110.951 21.9833C 110.951 23.923 109.681 25.5951 107.295 25.5951L107.295 25.5951L102.546 25.5951zM108.075 13.0207C 108.075 12.3518 107.741 11.683 106.76 11.683L106.76 11.683L104.954 11.683L104.954 16.3204L106.76 16.3204C 107.741 16.3204 108.075 15.6292 108.075 14.9827L108.075 14.9827L108.075 13.0207zM108.544 19.999C 108.544 19.1518 108.031 18.3938 106.871 18.3938L106.871 18.3938L104.954 18.3938L104.954 23.544L106.871 23.544C 108.053 23.544 108.544 22.8082 108.544 21.961L108.544 21.961L108.544 19.999z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M121.352 25.5951L120.594 22.1394L116.826 22.1394L116.091 25.5951L113.794 25.5951L113.794 25.1938L117.517 9.63184L119.925 9.63184L123.649 25.1938L123.649 25.5951L121.352 25.5951zM118.699 13.4889L117.295 20.0436L120.126 20.0436L118.699 13.4889z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M132.366 20.0213L134.774 20.0213L134.774 22.5407C 134.774 24.9708 132.611 25.8403 130.761 25.8403C 128.91 25.8403 126.725 24.9708 126.725 22.5407L126.725 22.5407L126.725 12.6862C 126.725 10.2338 128.888 9.36426 130.761 9.36426C 132.634 9.36426 134.774 10.2338 134.774 12.6862L134.774 12.6862L134.774 15.2056L132.366 15.2056L132.366 12.6862C 132.366 11.7721 131.496 11.4377 130.761 11.4377C 130.025 11.4377 129.133 11.7498 129.133 12.6862L129.133 12.6862L129.133 22.5407C 129.133 23.4547 130.025 23.7892 130.761 23.7892C 131.496 23.7892 132.366 23.4547 132.366 22.5407L132.366 22.5407L132.366 20.0213z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M144.929 25.5951L141.83 18.862L140.983 20.2889L140.983 25.5951L138.575 25.5951L138.575 9.63184L140.983 9.63184L140.983 15.9636L144.729 9.63184L147.114 9.63184L147.114 10.0331L143.123 16.6771L147.293 25.1938L147.293 25.5951L144.929 25.5951z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M53.7868 59.015L53.0288 55.5593L49.2609 55.5593L48.5252 59.015L46.2288 59.015L46.2288 58.6137L49.952 43.0518L52.3599 43.0518L56.0832 58.6137L56.0832 59.015L53.7868 59.015zM51.1337 46.9088L49.7291 53.4636L52.5606 53.4636L51.1337 46.9088z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M59.55 59.015L59.55 43.0518L61.9579 43.0518L61.9579 56.9193L66.6176 56.9193L66.6176 59.015L59.55 59.015z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M72.4591 43.0518L70.0513 43.0518L70.0513 59.015L72.4591 59.015L72.4591 43.0518z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M81.9123 59.015L79.705 59.015L75.8926 43.4531L75.8926 43.0518L78.0998 43.0518L80.7975 54.9573L83.5398 43.0518L85.747 43.0518L85.747 43.4531L81.9123 59.015z" stroke="none" fill="#000000" fill-rule="nonzero" />
    <path d="M96.2814 59.015L89.2139 59.015L89.2139 43.0518L96.2814 43.0518L96.2814 45.1252L91.6217 45.1252L91.6217 49.7403L95.4788 49.7403L95.4788 51.8137L91.6217 51.8137L91.6217 56.9193L96.2814 56.9193L96.2814 59.015z" stroke="none" fill="#000000" fill-rule="nonzero" />
</g>
</svg>'
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                }
            }

            Label {
                text: qsTr("“Come Back Alive” is a Foundation providing competent assistance to the military. Since 2014, our key goal has been to make the Defense Forces more efficient, save the lives of the military and systematically counter the enemy. Since the beginning of the full-scale invasion in February 2022, we have multiplied our military assistance and supported the defenders of Ukraine, who have changed their everyday lives and joined the line of defense.")
                textFormat: Text.PlainText
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
            }

            Label {
                text: qsTr("The Foundation purchases equipment that helps saving the lives of the military, including thermal imaging optics, quadcopters, cars, security, and intelligence systems.")
                textFormat: Text.PlainText
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
            }

            Label {
                text: qsTr("“Come Back Alive” is the first charity organization in Ukraine that received a license for the purchase and import of military and dual purpose goods. In particular, the team of the organization purchased and transferred to the units of the Defense Forces a complex of the Bayraktar TB2 attack UAV, consisting of three drones, a ground station, guided ammunition and other equipment, and 11 special armored vehicles.")
                textFormat: Text.PlainText
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: parent.width - 2 * Theme.horizontalPageMargin
                x: Theme.horizontalPageMargin
            }

            ButtonLayout {
                Button {
                    text: qsTr("About the fund")
                    onClicked: {
                        if(settings.language === 1){
                            Qt.openUrlExternally("https://savelife.in.ua/about-foundation/")
                        } else {
                            Qt.openUrlExternally("https://savelife.in.ua/en/about-foundation-en/")
                        }
                    }
                }
                Button {
                    text: qsTr("Donate")
                    onClicked: {
                        if(settings.language === 1){
                            Qt.openUrlExternally("https://savelife.in.ua/donate/")
                        } else {
                            Qt.openUrlExternally("https://savelife.in.ua/en/donate-en/")
                        }
                    }
                }
                Button {
                    text: qsTr("Materials")
                    onClicked: {
                        if(settings.language === 1){
                            Qt.openUrlExternally("https://savelife.in.ua/materials/")
                        } else {
                            Qt.openUrlExternally("https://savelife.in.ua/en/materials/")
                        }
                    }
                }
            }

            GlassItem {
                height: Theme.paddingLarge
                width: parent.width
                falloffRadius: 0.17
                radius: 0
                color: Theme.highlightColor
                cache: false
            }

            ButtonLayout {
                Button {
                    text: qsTr("Github")
                    onClicked: Qt.openUrlExternally("https://github.com/nemishkor/harbour-up-news")
                }
            }

        }

    }

}
