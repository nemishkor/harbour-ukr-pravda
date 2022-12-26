import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        width: parent.width

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            Item {
                height: Theme.itemSizeMedium
                width: parent.width
            }

            Label {
                width: parent.width - 2 * Theme.horizontalPageMargin
                text: qsTr("Please, select the language of the articles")
                font.pixelSize: Theme.fontSizeLarge
                color: Theme.highlightColor
                wrapMode: Text.WordWrap
                anchors {
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Item {
                height: Theme.paddingLarge
                width: parent.width
            }

            Repeater {
                model: ListModel {
                    ListElement {
                        languageCode: 1
                        languageName: "УКР"
                        iconSrc: 'data:image/svg+xml;utf8,<svg aria-label="Українська правда" x="0px" y="0px" viewBox="0 0 308 42" fill="#fff" xml:space="preserve" class="brand-svg">
            <path class="cls-1" d="M21.483,13.8a13.258,13.258,0,0,0,.495-2.076q0.059-.6.06-0.794A1.979,1.979,0,0,0,21.8,9.857a1.523,1.523,0,0,0-.574-0.543,1.629,1.629,0,0,0-.634-0.194Q20.3,9.1,20.177,9.1h-0.4V8.246h5.938V9.1a3.551,3.551,0,0,0-2,1.32,7.371,7.371,0,0,0-.772,1.746L18.434,26.989q-0.474,1.476-.93,2.755a10.3,10.3,0,0,1-1.068,2.212,5.185,5.185,0,0,1-1.425,1.474,3.374,3.374,0,0,1-1.92.542,3.888,3.888,0,0,1-1.761-.406A4.583,4.583,0,0,1,9.924,32.48a5.025,5.025,0,0,1-.93-1.591,5.487,5.487,0,0,1-.336-1.921,3.177,3.177,0,0,1,.811-2.309,2.469,2.469,0,0,1,1.8-.834,2.243,2.243,0,0,1,1.642.756,2.865,2.865,0,0,1,.733,2.077,2.662,2.662,0,0,1-.356,1.474,3.02,3.02,0,0,1-.673.775,2.227,2.227,0,0,1-.456.272c-0.172.077-.337,0.155-0.495,0.232a2.48,2.48,0,0,0-.416.252,0.4,0.4,0,0,0-.178.329,1.03,1.03,0,0,0,.495.737,2.446,2.446,0,0,0,1.524.39,3.716,3.716,0,0,0,.712-0.077,2.031,2.031,0,0,0,.812-0.389,4.379,4.379,0,0,0,.851-0.892,5.963,5.963,0,0,0,.792-1.63L8.736,9.1H6.994V8.246h8.591V9.1h-2.1l5.186,14.628Zm11.44,6.132a4.96,4.96,0,0,0,1.128-.117,1.581,1.581,0,0,0,.871-0.582,3.486,3.486,0,0,0,.594-1.358,12.17,12.17,0,0,0,.257-2.444,30.4,30.4,0,0,1,.316-3.706,8.029,8.029,0,0,1,.673-2.308,2.406,2.406,0,0,1,1.128-1.165,4.232,4.232,0,0,1,1.723-.309,3.314,3.314,0,0,1,1.544.33,2.921,2.921,0,0,1,1.01.834,3.582,3.582,0,0,1,.554,1.086,3.744,3.744,0,0,1,.178,1.087,3.864,3.864,0,0,1-.633,2.193,2.054,2.054,0,0,1-1.821.95,1.922,1.922,0,0,1-1.722-.8,2.861,2.861,0,0,1-.535-1.611V11.662a1.25,1.25,0,0,1,.04-0.311c0.053-.18.106-0.343,0.159-0.485a1.518,1.518,0,0,0,.079-0.524,2.815,2.815,0,0,0-.039-0.466,0.3,0.3,0,0,0-.356-0.232,0.869,0.869,0,0,0-.792.621,5.55,5.55,0,0,0-.4,1.533,17.377,17.377,0,0,0-.138,1.9q-0.02.99-.06,1.727a13.5,13.5,0,0,1-.356,2.969,3.033,3.033,0,0,1-1.069,1.571L35.3,20.12a7.155,7.155,0,0,1,1.406.194,5.2,5.2,0,0,1,1.8.815,5.785,5.785,0,0,1,1.643,1.843,7.593,7.593,0,0,1,.891,3.318q0.079,1.048.079,2.154T41.2,30.461a4.957,4.957,0,0,0,.336,1.514,0.877,0.877,0,0,0,.852.6,1.032,1.032,0,0,0,.712-0.349l0.356,0.582a3.823,3.823,0,0,1-1.385.835,9.042,9.042,0,0,1-1.188.329,4.122,4.122,0,0,1-.792,0,3.953,3.953,0,0,1-1.7-.446,2.523,2.523,0,0,1-1.01-1.2,8.484,8.484,0,0,1-.574-2.27q-0.2-1.436-.356-3.647c-0.053-.725-0.119-1.422-0.2-2.1a7.158,7.158,0,0,0-.436-1.8,2.883,2.883,0,0,0-.93-1.261,2.79,2.79,0,0,0-1.722-.467h-1.7V32.809h2.336v0.854H24.887V32.809h2.3V9.1h-2.3V8.246h8.907V9.1H31.458V19.927h1.465ZM46.5,9.1H44.166V8.246h8.749a12.456,12.456,0,0,1,4.038.564,6.852,6.852,0,0,1,2.593,1.513,5.261,5.261,0,0,1,1.366,2.231,9.04,9.04,0,0,1,.4,2.677q0,4.074-2.137,5.82T52.756,22.8H50.776V32.809h2.613v0.854H44.166V32.809H46.5V9.1Zm5.661,12.844a12.48,12.48,0,0,0,1.762-.116,2.331,2.331,0,0,0,1.365-.681,3.854,3.854,0,0,0,.871-1.688,12.155,12.155,0,0,0,.317-3.142V13.563a15.279,15.279,0,0,0-.1-1.823,2.979,2.979,0,0,0-.514-1.4,2.718,2.718,0,0,0-1.227-.912,5.989,5.989,0,0,0-2.2-.33H50.776V21.945h1.386Zm18.684,4.307h-5.78L64.632,27.92a3.69,3.69,0,0,0-.1.427c-0.04.208-.126,0.711-0.257,1.513a5.1,5.1,0,0,0-.1.777,2.229,2.229,0,0,0,.1.775,1.528,1.528,0,0,0,.87,1.068,7.5,7.5,0,0,0,1.624.329v0.854H60.475V32.809a2.29,2.29,0,0,0,1.287-.407,2.839,2.839,0,0,0,.811-0.97,6.4,6.4,0,0,0,.515-1.358q0.2-.756.436-1.61L68.867,7.937h1.821L77.1,32.809h1.663v0.854H70.372V32.809h2.256ZM68,14.843L65.225,25.4h5.5ZM78.486,3.94a1.822,1.822,0,0,1,.3-1.125,1.886,1.886,0,0,1,.653-0.564,2.152,2.152,0,0,1,.693-0.213C80.353,2.013,80.492,2,80.545,2c0.079,0,.224.013,0.435,0.039a2.15,2.15,0,0,1,.673.213,1.719,1.719,0,0,1,.633.564,1.921,1.921,0,0,1,.278,1.125,2.046,2.046,0,0,1-.5,1.435,1.959,1.959,0,0,1-1.523.544A1.989,1.989,0,0,1,79,5.356,2.018,2.018,0,0,1,78.486,3.94ZM79.317,9.1V8.246h8.947V9.1H85.928V32.809h2.335v0.854H79.317V32.809h2.335V9.1H79.317Zm5.7-5.161a1.826,1.826,0,0,1,.3-1.125,1.883,1.883,0,0,1,.654-0.564,2.15,2.15,0,0,1,.692-0.213C86.885,2.013,87.023,2,87.076,2s0.191,0.013.416,0.039a2.154,2.154,0,0,1,.692.213,1.891,1.891,0,0,1,.654.564,1.827,1.827,0,0,1,.3,1.125,2,2,0,0,1-.514,1.435,2.028,2.028,0,0,1-1.544.544,1.988,1.988,0,0,1-1.544-.562A2.019,2.019,0,0,1,85.018,3.94ZM99.586,8.246V9.1h-1.94V19.81H104.1V9.1h-1.94V8.246h8.511V9.1h-2.3V32.809h2.3v0.854h-8.511V32.809h1.94V20.665H97.646V32.809h1.94v0.854H91.075V32.809h2.3V9.1h-2.3V8.246h8.511Zm27.274,8.188a12.7,12.7,0,0,0-2.038-5.627,4.206,4.206,0,0,0-3.385-2.018,2.954,2.954,0,0,0-2.474,1.086,6.616,6.616,0,0,0-1.208,2.581,14.654,14.654,0,0,0-.395,3.027q-0.04,1.533-.04,2.426l-0.039,5.316a25.615,25.615,0,0,0,.376,4.85,11.227,11.227,0,0,0,.97,3.026,3.9,3.9,0,0,0,1.326,1.572,2.76,2.76,0,0,0,1.445.447,3.708,3.708,0,0,0,1.643-.447,5.561,5.561,0,0,0,1.722-1.436,9.37,9.37,0,0,0,1.464-2.6,15.062,15.062,0,0,0,.871-3.977h0.99l-0.238,9h-0.99a1.475,1.475,0,0,0-.554-0.8,1.309,1.309,0,0,0-.633-0.174,1.833,1.833,0,0,0-.871.232q-0.437.233-.911,0.465a6.563,6.563,0,0,1-.89.389,4.225,4.225,0,0,1-1.406.193,6.469,6.469,0,0,1-3.859-1.2,10.442,10.442,0,0,1-2.85-3.124,15.841,15.841,0,0,1-1.782-4.268,18.389,18.389,0,0,1-.614-4.676,16.634,16.634,0,0,1,.634-4.481,15.742,15.742,0,0,1,1.781-4.114A10.317,10.317,0,0,1,117.7,9.1a6.187,6.187,0,0,1,3.662-1.163,6.123,6.123,0,0,1,1.979.309q0.91,0.312,1.663.622a3.364,3.364,0,0,0,.336.116,1.227,1.227,0,0,0,.337.039,1.261,1.261,0,0,0,.515-0.156,0.883,0.883,0,0,0,.435-0.622h1.029v8.188H126.86Zm10.372,2.716a10.611,10.611,0,0,1,3.306.485,7.285,7.285,0,0,1,2.553,1.416,6.323,6.323,0,0,1,1.662,2.309,7.91,7.91,0,0,1,.594,3.164,8.072,8.072,0,0,1-.752,3.8,5.814,5.814,0,0,1-1.9,2.154,6.283,6.283,0,0,1-2.494.97,16.088,16.088,0,0,1-2.494.213h-8.234V32.809h2.336V9.1h-2.336V8.246h8.907V9.1h-2.3V19.151h1.148Zm-0.158,13.658a4.561,4.561,0,0,0,1.524-.233,2.348,2.348,0,0,0,1.089-.8,3.651,3.651,0,0,0,.633-1.493,11.7,11.7,0,0,0,.2-2.367V24.893a13.987,13.987,0,0,0-.139-2.076,4.4,4.4,0,0,0-.5-1.532,2.408,2.408,0,0,0-.989-0.95A3.617,3.617,0,0,0,137.232,20h-1.148V32.809h0.99Zm17.695-12.882a4.966,4.966,0,0,0,1.128-.117,1.584,1.584,0,0,0,.871-0.582,3.5,3.5,0,0,0,.594-1.358,12.151,12.151,0,0,0,.257-2.444,30.333,30.333,0,0,1,.316-3.706,7.954,7.954,0,0,1,.675-2.308,2.386,2.386,0,0,1,1.128-1.165,4.226,4.226,0,0,1,1.722-.309,3.31,3.31,0,0,1,1.543.33,2.91,2.91,0,0,1,1.009.834,3.579,3.579,0,0,1,.555,1.086,3.731,3.731,0,0,1,.179,1.087,3.858,3.858,0,0,1-.636,2.193,2.055,2.055,0,0,1-1.82.95,1.924,1.924,0,0,1-1.722-.8,2.865,2.865,0,0,1-.535-1.611V11.662a1.273,1.273,0,0,1,.039-0.311c0.055-.18.107-0.343,0.159-0.485a1.484,1.484,0,0,0,.08-0.524,2.814,2.814,0,0,0-.039-0.466,0.3,0.3,0,0,0-.358-0.232,0.87,0.87,0,0,0-.791.621,5.623,5.623,0,0,0-.4,1.533,17.66,17.66,0,0,0-.137,1.9c-0.013.66-.034,1.236-0.06,1.727a13.458,13.458,0,0,1-.355,2.969,3.042,3.042,0,0,1-1.07,1.571l0.04,0.154a7.162,7.162,0,0,1,1.406.194,5.194,5.194,0,0,1,1.8.815,5.8,5.8,0,0,1,1.644,1.843,7.59,7.59,0,0,1,.889,3.318c0.052,0.7.081,1.417,0.081,2.154s0.026,1.409.078,2.017a4.962,4.962,0,0,0,.337,1.514,0.877,0.877,0,0,0,.85.6,1.034,1.034,0,0,0,.714-0.349l0.355,0.582a3.834,3.834,0,0,1-1.385.835,8.94,8.94,0,0,1-1.188.329,4.115,4.115,0,0,1-.791,0,3.959,3.959,0,0,1-1.7-.446,2.536,2.536,0,0,1-1.009-1.2,8.489,8.489,0,0,1-.574-2.27q-0.2-1.436-.357-3.647c-0.052-.725-0.117-1.422-0.2-2.1a6.987,6.987,0,0,0-.436-1.8,2.872,2.872,0,0,0-.93-1.261,2.787,2.787,0,0,0-1.722-.467h-1.7V32.809h2.336v0.854h-8.907V32.809h2.3V9.1h-2.3V8.246h8.907V9.1H153.3V19.927h1.465Zm19.4,6.325h-5.779l-0.436,1.669a3.643,3.643,0,0,0-.1.427c-0.039.208-.124,0.711-0.257,1.513a5.142,5.142,0,0,0-.1.777,2.2,2.2,0,0,0,.1.775,1.526,1.526,0,0,0,.872,1.068,7.477,7.477,0,0,0,1.622.329v0.854h-6.294V32.809a2.283,2.283,0,0,0,1.286-.407,2.819,2.819,0,0,0,.812-0.97,6.453,6.453,0,0,0,.515-1.358q0.2-.756.435-1.61l5.344-20.527h1.822l6.413,24.872h1.662v0.854h-8.392V32.809h2.256Zm-2.85-11.408L168.545,25.4h5.5ZM197.64,32.809h1.939v0.854h-8.55V32.809h2.335V9.1h-2.335V8.246h19.714V9.1h-2.336V32.809h2.336v0.854h-8.551V32.809h1.94V9.1H197.64V32.809ZM215.018,9.1h-2.336V8.246h8.749a12.46,12.46,0,0,1,4.038.564,6.843,6.843,0,0,1,2.592,1.513,5.261,5.261,0,0,1,1.367,2.231,9.043,9.043,0,0,1,.4,2.677q0,4.074-2.138,5.82T221.273,22.8h-1.98V32.809h2.613v0.854h-9.224V32.809h2.336V9.1Zm5.661,12.844a12.468,12.468,0,0,0,1.761-.116,2.332,2.332,0,0,0,1.366-.681,3.866,3.866,0,0,0,.871-1.688,12.166,12.166,0,0,0,.316-3.142V13.563a15.423,15.423,0,0,0-.1-1.823,2.988,2.988,0,0,0-.515-1.4,2.711,2.711,0,0,0-1.227-.912,5.99,5.99,0,0,0-2.2-.33h-1.662V21.945h1.386Zm18.685,4.307h-5.779l-0.436,1.669a3.643,3.643,0,0,0-.1.427c-0.039.208-.124,0.711-0.257,1.513a5.142,5.142,0,0,0-.1.777,2.223,2.223,0,0,0,.1.775,1.528,1.528,0,0,0,.872,1.068,7.477,7.477,0,0,0,1.622.329v0.854h-6.294V32.809a2.283,2.283,0,0,0,1.286-.407,2.819,2.819,0,0,0,.812-0.97,6.453,6.453,0,0,0,.515-1.358q0.2-.756.435-1.61l5.344-20.527h1.822l6.413,24.872h1.662v0.854h-8.392V32.809h2.257Zm-2.85-11.408L233.743,25.4h5.5Zm19.318-6.6a13.8,13.8,0,0,1,3.741.428,6.976,6.976,0,0,1,2.4,1.144,3.948,3.948,0,0,1,1.286,1.708,5.808,5.808,0,0,1,.376,2.076,4.847,4.847,0,0,1-1.564,3.9,10.187,10.187,0,0,1-4.294,2l0.039,0.194a11.589,11.589,0,0,1,3.405,1.435,7.281,7.281,0,0,1,1.92,1.785,5.147,5.147,0,0,1,.851,1.863,8.118,8.118,0,0,1,.2,1.669,7.435,7.435,0,0,1-.594,3.045,6.414,6.414,0,0,1-1.664,2.27,7.186,7.186,0,0,1-2.592,1.416,10.951,10.951,0,0,1-3.345.485H247V32.809h2.3V9.1H247V8.246h8.828Zm-0.278,10.788c0.1,0,.337-0.021.693-0.059a2.73,2.73,0,0,0,1.129-.426,3.285,3.285,0,0,0,1.049-1.126,4.224,4.224,0,0,0,.455-2.154v-2.6c0-.181-0.014-0.466-0.04-0.854a3.156,3.156,0,0,0-.336-1.183,2.961,2.961,0,0,0-.931-1.068,3.043,3.043,0,0,0-1.82-.466h-2.177v9.934h1.978Zm-0.2,13.774a4.723,4.723,0,0,0,2.216-.426,2.964,2.964,0,0,0,1.188-1.107,3.953,3.953,0,0,0,.495-1.571,16.776,16.776,0,0,0,.1-1.824V25.2a16.229,16.229,0,0,0-.1-1.67,5.892,5.892,0,0,0-.455-1.746,3.351,3.351,0,0,0-1.089-1.358,3.3,3.3,0,0,0-2-.543h-2.136V32.809h1.781Zm27.59-24.562V9.1h-2.3V32.809h2.929L283.858,41h-1.109a12.845,12.845,0,0,0-1.108-4.055A6.929,6.929,0,0,0,280,34.749a4.06,4.06,0,0,0-1.762-.913,7.79,7.79,0,0,0-1.464-.174h-5.741a7.085,7.085,0,0,0-1.5.174,3.024,3.024,0,0,0-1.5.913,6.9,6.9,0,0,0-1.307,2.193A17.4,17.4,0,0,0,265.767,41h-1.109l0.317-8.188h2.454a14.915,14.915,0,0,0,1.248-3.064,17.951,17.951,0,0,0,.573-4.347l0.356-10.089c0.026-.931.054-1.8,0.079-2.6a7.817,7.817,0,0,0-.158-2.037,2.047,2.047,0,0,0-.811-1.261,2.859,2.859,0,0,0-1.881-.311V8.246h16.112Zm-6.571.854h-3.009a11.145,11.145,0,0,0-1.246.058,1.1,1.1,0,0,0-.792.467,3.261,3.261,0,0,0-.456,1.338,23.205,23.205,0,0,0-.237,2.678L270.16,25.4c-0.053,1.036-.124,1.934-0.218,2.7a13.984,13.984,0,0,1-.376,2.018,11.384,11.384,0,0,1-.513,1.513c-0.186.426-.371,0.822-0.555,1.183h7.878V9.1Zm16.705,17.151H287.3l-0.436,1.669a3.867,3.867,0,0,0-.1.427c-0.038.208-.124,0.711-0.256,1.513a5.145,5.145,0,0,0-.1.777,2.224,2.224,0,0,0,.1.775,1.525,1.525,0,0,0,.871,1.068,7.49,7.49,0,0,0,1.622.329v0.854h-6.294V32.809A2.283,2.283,0,0,0,284,32.4a2.819,2.819,0,0,0,.812-0.97,6.345,6.345,0,0,0,.515-1.358q0.2-.756.436-1.61L291.1,7.937h1.822l6.414,24.872H301v0.854h-8.392V32.809h2.256Zm-2.85-11.408L287.46,25.4h5.5Z"></path>
         </svg>'
                    }
                    ListElement {
                        languageCode: 3
                        languageName: "ENG"
                        iconSrc: 'data:image/svg+xml;utf8,<svg x="0px" y="0px" viewBox="0 0 308 42" fill="#fff" xml:space="preserve" shape-rendering="geometricPrecision" class="brand-svg">
                <path class="cls-1" d="M18.393,7.3v0.9h-2.5V27.371c0,1.906.1,3.411,0.9,4.515a3.8,3.8,0,0,0,3.2,1.505,4.256,4.256,0,0,0,3.7-2.107c1.3-1.806,1.2-3.612,1.2-5.719V13.525c0-2.408-.1-5.117-2.5-5.518V7.3h5.7v0.9c-1.2,0-2.3.8-2.3,5.318V26.167a10.731,10.731,0,0,1-.9,4.916,6.407,6.407,0,0,1-6.2,3.813,6.844,6.844,0,0,1-6.3-3.411,11.609,11.609,0,0,1-1-5.92V8.207H9V7.3h9.394Zm21.585,0v0.9h-2.4V21.251l5.8-7.726a6.23,6.23,0,0,0,1.5-3.612,1.764,1.764,0,0,0-.6-1.4,2.865,2.865,0,0,0-1.6-.3V7.3h7.695v0.9a4.62,4.62,0,0,0-2.7,1.4,30.854,30.854,0,0,0-3.6,4.615l-1.9,2.609,6.5,16.756h1.8v0.9H41.677v-0.9h2.2l-4.8-12.542-1.5,2.007V33.692h2.4v0.9H30.685v-0.9h2.4V8.207h-2.4V7.3h9.294Zm21.885,0c1.6,0,4.4.1,6.2,1.706a6.041,6.041,0,0,1,1.8,4.615,6.284,6.284,0,0,1-1.6,4.515,8.352,8.352,0,0,1-4.6,2.007v0.4a7.7,7.7,0,0,1,4.4,2.207,7.967,7.967,0,0,1,1.3,4.415l0.2,3.211c0.1,1.3.2,2.91,1.4,2.91a1.591,1.591,0,0,0,.8-0.3l0.3,0.8a4.6,4.6,0,0,1-3.1,1,3.29,3.29,0,0,1-2.7-.9c-0.2-.2-1-1.1-1.2-4.113l-0.4-4.214c-0.1-1.2-.1-3.01-1-4.013a3.056,3.056,0,0,0-2.3-.9h-2.5V33.491h2.4v0.9H51.97v-0.9h2.4V8.207h-2.4V7.3h9.893Zm-1,12.542a3.911,3.911,0,0,0,3-1,6.57,6.57,0,0,0,1-3.612V12.823c0-1.1,0-2.709-1.2-3.712a4.679,4.679,0,0,0-2.6-.8h-2.1V19.946h1.9v-0.1Zm15.19,6.722-0.5,1.806a17.787,17.787,0,0,0-.5,2.91,2.121,2.121,0,0,0,1,1.906,10.411,10.411,0,0,0,1.7.4v0.9h-6.6v-0.9a2.469,2.469,0,0,0,2.2-1.605,18.732,18.732,0,0,0,1-3.11L79.951,7h1.9l6.7,26.589h1.7v0.9H81.45v-0.9h2.5l-1.9-7.023h-6Zm3-12.14-2.9,11.338h5.8ZM99.337,7.3v0.9h-2.4V33.592h2.4v0.9H89.944v-0.9h2.4V8.207h-2.4V7.3h9.394Zm8.894,0,9.594,17.86V13.726c0-1-.1-3.311-0.7-4.214a2.462,2.462,0,0,0-1.9-1.2v-1h5.7v0.9a1.723,1.723,0,0,0-1.7,1.1,11.957,11.957,0,0,0-.6,4.214V34.8h-0.7L105.433,11.619V28.274c0,2.408.2,3.512,0.6,4.214a1.75,1.75,0,0,0,1.7,1.1v0.9h-5.8v-0.9a2.837,2.837,0,0,0,1.9-1.2,12.03,12.03,0,0,0,.7-4.214V12.321c0-2.007-.1-2.91-0.5-3.411a2.262,2.262,0,0,0-1.8-.7V7.3h6Zm26.582,4.816a11.926,11.926,0,0,0-1.8-2.91,3.821,3.821,0,0,0-2.8-1.2c-1.7,0-3.5,1-3.5,3.913a4.539,4.539,0,0,0,2.9,4.415l3.8,2.107a7.635,7.635,0,0,1,3.6,3.712,8.629,8.629,0,0,1,1,4.114,9.82,9.82,0,0,1-2,6.522,5.39,5.39,0,0,1-4.8,2.207,6.5,6.5,0,0,1-2.9-.6,5.433,5.433,0,0,0-2.1-.7,1.306,1.306,0,0,0-1.3,1h-1.2V25.063h0.9a17.746,17.746,0,0,0,1.2,4.415,9.089,9.089,0,0,0,3.1,4.013,3.547,3.547,0,0,0,2.4.7c2.7,0,4.1-1.906,4.1-4.716,0-3.411-2.1-4.615-3.5-5.418l-3.4-1.906a8.132,8.132,0,0,1-3.1-3.01,8.181,8.181,0,0,1-1-4.314,8.593,8.593,0,0,1,2-5.92,5.414,5.414,0,0,1,4.1-1.706,6.015,6.015,0,0,1,2.4.5,4.754,4.754,0,0,0,1.4.6,1.411,1.411,0,0,0,1.2-.8h1.3V15.03h-0.9C135.613,14.227,135.113,12.822,134.813,12.12ZM149.9,7.3v0.9h-2.4V21.251l5.8-7.726a6.227,6.227,0,0,0,1.5-3.612,1.765,1.765,0,0,0-.6-1.4,2.865,2.865,0,0,0-1.6-.3V7.3H160.3v0.9a4.123,4.123,0,0,0-2.6,1.4,30.877,30.877,0,0,0-3.6,4.615l-1.9,2.609,6.5,16.756h1.8v0.9H151.7v-0.9h2.2l-5-12.542-1.5,1.906V33.592h2.4v0.9h-9.294v-0.9h2.4V8.207h-2.4V7.3H149.9Zm13.79,19.264-0.5,1.806a17.779,17.779,0,0,0-.5,2.91,2.122,2.122,0,0,0,1,1.906,10.429,10.429,0,0,0,1.7.4v0.9h-6.5v-0.9a2.468,2.468,0,0,0,2.2-1.605,18.619,18.619,0,0,0,1-3.11L167.691,7h1.9l6.7,26.589h1.7v0.9H169.19v-0.9h2.4l-1.9-7.023h-6Zm3.1-12.14-2.9,11.237h5.8ZM196.571,7.3a11.719,11.719,0,0,1,4.5.7c1.8,0.7,4.3,2.408,4.3,7.224,0,1.906-.4,5.117-3.5,6.622a13.456,13.456,0,0,1-5.4,1h-2.1V33.592h2.7v0.9h-9.593v-0.9h2.4V8.207h-2.4V7.3h9.094Zm-0.8,14.649a5.221,5.221,0,0,0,2.9-.6c1.7-1.2,1.6-3.712,1.6-5.418v-2.91c0-1.706-.2-3.712-1.7-4.415a8.671,8.671,0,0,0-2.5-.4h-1.7V21.953h1.4ZM217.257,7.3c1.6,0,4.4.1,6.195,1.706a6.04,6.04,0,0,1,1.8,4.615,6.284,6.284,0,0,1-1.6,4.515,8.351,8.351,0,0,1-4.6,2.007v0.4a7.7,7.7,0,0,1,4.4,2.207,7.955,7.955,0,0,1,1.3,4.415l0.2,3.211c0.1,1.3.2,2.91,1.4,2.91a1.593,1.593,0,0,0,.8-0.3l0.3,0.8a4.6,4.6,0,0,1-3.1,1,3.288,3.288,0,0,1-2.7-.9c-0.2-.2-1-1.1-1.2-4.113l-0.4-4.214c-0.1-1.2-.1-3.01-1-4.013a3.054,3.054,0,0,0-2.3-.9h-2.5V33.491h2.4v0.9h-9.294v-0.9h2.4V8.207h-2.4V7.3h9.894Zm-1,12.542a3.91,3.91,0,0,0,3-1,6.567,6.567,0,0,0,1-3.612V12.823c0-1.1,0-2.709-1.2-3.712a4.676,4.676,0,0,0-2.6-.8h-2.1V19.946h1.9v-0.1Zm15.09,6.722-0.5,1.806a17.769,17.769,0,0,0-.5,2.91,2.12,2.12,0,0,0,1,1.906,10.4,10.4,0,0,0,1.7.4v0.9h-6.6v-0.9a2.47,2.47,0,0,0,2.2-1.605,18.805,18.805,0,0,0,1-3.11L235.344,7h1.9l6.695,26.589h1.7v0.9h-8.794v-0.9h2.4l-1.9-7.023h-6Zm3.1-12.14-2.9,11.338h5.8ZM251.133,7.3v0.9h-2.2l5,19.264,3.3-14.247a11.15,11.15,0,0,0,.2-1.906,4.327,4.327,0,0,0-.7-2.508,2.2,2.2,0,0,0-1.8-.6V7.3h6.2v0.9a2.411,2.411,0,0,0-1.5.8c-0.5.7-.8,1.706-1.4,4.314l-5,21.472h-1.9l-6.9-26.589h-2.2V7.3h8.894Zm21.186,0c2.9,0,5.1,2.007,6.5,4.114a16.487,16.487,0,0,1,2.2,9.231c0,4.214-.7,8.729-4,11.739a7.069,7.069,0,0,1-5.1,2.107h-9.893v-0.9h2.4V8.207h-2.4V7.3h10.293Zm-3.5,26.288h1.5c1.5,0,2.8-.1,4-1.605,1.5-1.906,1.6-5.418,1.6-8.428V16.936c0-2.609-.1-4.716-1.1-6.421a4.015,4.015,0,0,0-4.1-2.207h-1.9V33.592Zm15.889-7.023-0.5,1.806a17.779,17.779,0,0,0-.5,2.91,2.122,2.122,0,0,0,1,1.906,10.429,10.429,0,0,0,1.7.4v0.9h-6.595v-0.9a2.468,2.468,0,0,0,2.2-1.605,18.717,18.717,0,0,0,1-3.11L288.708,7h1.9l6.7,26.589H299v0.9h-8.794v-0.9h2.4l-1.9-7.023h-6Zm3.1-12.14-2.9,11.338h5.8Z"></path>
          </svg>'
                    }
                    ListElement {
                        languageCode: 2
                        languageName: "РУС"
                        iconSrc: 'data:image/svg+xml;utf8,<svg x="0px" y="0px" viewBox="0 0 308 42" fill="#fff" xml:space="preserve" class="brand-svg">
            <path class="cls-1" d="M42.2,32.6l0.3,0.6c-1,0.9-2.3,1.1-3.2,1.1c-1,0-1.6-0.4-1.9-0.7c-0.8-0.8-1.1-2.1-1.3-3.2
    c-0.1-0.9-0.2-1.9-0.4-4.5c-0.1-1.1-0.2-2.6-0.8-3.5c-0.7-1-1.6-1.1-2.3-1.1H31v11.8h2.3v0.8h-8.6v-0.8h2.2V9.9h-1.8
    c-0.6,0.2-1.3,0.5-1.7,1c0,0-0.5,0.6-1,2L18,27.5c-0.3,1.2-1.5,4.2-2.1,5.2c-0.8,1.2-1.8,1.7-3,1.7c-0.9,0-2.2-0.3-3.2-1.6
    c-0.6-0.8-1.1-1.9-1.1-3.3c0-2,1.3-3.1,2.5-3.1c1.3,0,2.3,1.1,2.3,2.7c0,1.5-0.8,2.3-1.6,2.7c-0.3,0.2-0.9,0.3-0.9,0.8
    c0,0.3,0.2,0.5,0.4,0.6c0.5,0.4,1,0.4,1.5,0.4s1.1,0,1.8-0.7c0.5-0.5,1-1.5,1.3-2.3L8.7,9.9H7V9h8.3v0.8h-2l5,14.4l2.7-9.8
    c0.2-0.6,0.5-2.1,0.5-2.7c0-1.9-1.5-1.9-1.8-1.9h-0.4V9h5.3h0.4h8.2v0.8H31v10.7h1.4c1,0,2.4-0.1,2.7-2.9c0.4-4.2,0-1.9,0.2-4.5
    c0.4-4.4,2.6-4.4,3.2-4.4c0.8,0,1.9,0.2,2.7,1.1c0.5,0.6,0.8,1.4,0.8,2.1c0,0.8-0.2,1.6-0.7,2.3c-0.5,0.6-0.9,0.8-1.7,0.8
    c-1.6,0-2.2-1.7-2.2-2.7c0-0.9,0.3-1.1,0.3-1.6c0-0.2-0.2-0.4-0.5-0.4c-1.3,0-1.3,3.7-1.3,5.7c-0.1,2.6-0.4,3.7-1.4,4.5l0,0.2
    c2.2,0.3,3.7,1,4.7,2.8c0.8,1.5,0.8,3,0.9,4.2c0.1,1.1,0.2,3.2,0.3,4c0.1,0.6,0.2,1.3,1,1.3C41.8,33,42,32.9,42.2,32.6z M49.7,23.4
    v9.9h2.5v0.8h-8.9v-0.8h2.3V9.9h-2.3V9h8.4c1.3,0,2.8,0.1,4.1,0.6c1.6,0.6,4,2.3,4,6.7c0,1.8-0.4,4.7-3.2,6.1
    c-1.7,0.8-4.1,0.9-5,0.9H49.7z M49.7,22.5H51c0.7,0,1.9,0,2.7-0.6c1.6-1.1,1.5-3.4,1.5-5v-2.7c0-1.6-0.2-3.4-1.6-4.1
    C53.1,10,52,9.9,51.3,9.9h-1.6V22.5z M85.3,9h8.3v0.8h-2.3v23.4h2.3v0.8h-8.3v-0.8h1.9V14.3L81,31.7v1.6h1.9v0.8h-8h-0.3h-7.8v-0.8
    h2.2l-1.7-6.5h-5.6l-0.4,1.6c-0.2,0.6-0.5,2.3-0.5,2.7c0,0.9,0.5,1.5,1,1.8c0.2,0.1,0.6,0.2,1.6,0.3v0.8h-6.1v-0.8
    c1.2-0.1,1.8-0.8,2.1-1.5c0.4-0.9,0.6-1.9,0.9-2.8l5.2-20.2H67l6.2,24.5h1.3h0.3h2V9.9h-2.3V9h8.3v0.8H81v19l6.2-17.3V9.9h-1.9V9z
     M67.1,25.9l-2.6-10.4l-2.7,10.4H67.1z M106.1,9.9h1.9v10.5h-6.2V9.9h1.9V9h-8.2v0.8h2.2v23.4h-2.2v0.8h8.2v-0.8h-1.9v-12h6.2v12
    h-1.9v0.8h8.2v-0.8h-2.2V9.9h2.2V9h-8.2V9.9z M128.9,30.2c-1.3,2.7-3.1,3.4-4.1,3.4c-1,0-2.1-0.8-2.8-2.2c-0.9-1.6-1.2-4-1.2-7.5
    v-5.2c0-2.6,0.1-4.9,0.8-6.5c0.8-1.8,2.1-2.5,3.2-2.5c2.2,0,3.4,2.2,3.9,3.2c0.4,0.9,1,2.4,1.3,4.4h0.8V9h-1c-0.2,0.6-0.7,0.8-1,0.8
    c-0.3,0-0.7-0.2-1.5-0.5c-0.8-0.3-1.8-0.6-2.8-0.6c-1.7,0-3.7,0.8-5.4,2.9c-1.6,2.1-3.1,5.9-3.1,9.9c0,3.8,1,6.2,2,8.1
    c1.6,2.8,3.6,4.6,6.8,4.6c1.1,0,1.8-0.3,2.2-0.6c0.6-0.3,1.1-0.7,1.7-0.7c0.4,0,0.8,0.2,1.1,1h1l0.2-8.9h-1
    C130,27.3,129.6,28.7,128.9,30.2z M174.7,9h9.2v0.8h-2.3v23.4h2.3v0.8h-8.6v-0.8h2.3V21.4h-2.3c-1.9,0-2.5,1.2-2.7,2.1
    c-0.4,1.5-0.3,3.4-0.6,6.3c-0.3,2.4-0.8,3.3-1.2,3.7c-0.7,0.8-1.8,0.8-2.5,0.8c-0.6,0-1.1-0.1-1.7-0.3h-7.9v-0.8h2.2l-1.7-6.5h-5.6
    l-0.4,1.6c-0.2,0.6-0.5,2.3-0.5,2.7c0,0.9,0.5,1.5,1,1.8c0.2,0.1,0.6,0.2,1.6,0.3v0.8h-6c-0.6,0.2-1.3,0.3-1.8,0.3
    c-1,0-1.6-0.4-1.9-0.7c-0.8-0.8-1.1-2.1-1.3-3.2c-0.1-0.9-0.2-1.9-0.4-4.5c-0.1-1.1-0.2-2.6-0.8-3.5c-0.7-1-1.6-1.1-2.3-1.1h-1.6
    v11.8h2.3v0.8h-8.6v-0.8h2.2V9.9h-2.2V9h8.6v0.8h-2.3v10.7h1.4c1,0,2.4-0.1,2.7-2.9c0.4-4.2,0-1.9,0.2-4.5c0.4-4.4,2.6-4.4,3.2-4.4
    c0.8,0,1.9,0.2,2.7,1.1c0.5,0.6,0.8,1.4,0.8,2.1c0,0.8-0.2,1.6-0.7,2.3c-0.5,0.6-0.9,0.8-1.7,0.8c-1.6,0-2.2-1.7-2.2-2.7
    c0-0.9,0.3-1.1,0.3-1.6c0-0.2-0.2-0.4-0.5-0.4c-1.3,0-1.3,3.7-1.3,5.7c-0.1,2.6-0.4,3.7-1.4,4.5l0,0.2c2.2,0.3,3.7,1,4.7,2.8
    c0.8,1.5,0.8,3,0.9,4.2c0.1,1.1,0.2,3.2,0.3,4c0.1,0.6,0.2,1.3,1,1.3c0.3,0,0.5-0.1,0.7-0.3l0.1,0.2c0.4-0.3,0.7-0.7,0.9-1.1
    c0.4-0.9,0.6-1.9,0.9-2.8l5.2-20.2h1.8l6.2,24.5h0.1l0.4-0.6c0.5,0.3,0.7,0.3,0.9,0.3c0.4,0,1-0.2,1.1-1.5c0.1-1,0.2-2,0.3-4.2
    c0.1-1.5,0.3-3.1,1.5-4.4c1.1-1.1,2.8-1.6,3.9-1.8v-0.3c-0.4,0-2.9-0.3-4.4-1.8c-1.3-1.3-1.5-3.1-1.5-4.2c0-2.4,1-3.6,1.6-4.2
    C170.6,9.1,173.2,9,174.7,9z M158.9,25.9l-2.6-10.4l-2.7,10.4H158.9z M175.6,9.9c-1.3,0-2.2,0.5-2.7,1c-0.8,0.8-0.9,2.1-0.9,3.2v2.2
    c0,1.1,0,2.1,0.6,3c0.8,1.2,1.8,1.3,3.1,1.3h1.8V9.9H175.6z M194.7,9.9h2.3v23.4h-2.3v0.8h8.3v-0.8h-1.9V9.9h6.3v23.4h-1.9v0.8h8.3
    v-0.8h-2.3V9.9h2.3V9h-19V9.9z M222,23.4v9.9h2.5v0.8h-8.9v-0.8h2.3V9.9h-2.3V9h8.4c1.3,0,2.8,0.1,4.1,0.6c1.6,0.6,4,2.3,4,6.7
    c0,1.8-0.4,4.7-3.2,6.1c-1.7,0.8-4.1,0.9-5,0.9H222z M222,22.5h1.3c0.7,0,1.9,0,2.7-0.6c1.6-1.1,1.5-3.4,1.5-5v-2.7
    c0-1.6-0.2-3.4-1.6-4.1c-0.5-0.2-1.6-0.3-2.3-0.3H222V22.5z M261.9,22.8c1.3,1.3,1.6,2.4,1.6,4.2c0,1.7-0.3,3.1-1.5,4.5
    c-1.9,2.2-4.6,2.6-6.4,2.6h-8.4h-0.3h-7.8v-0.8h2.2l-1.7-6.5H234l-0.4,1.6c-0.2,0.6-0.5,2.3-0.5,2.7c0,0.9,0.5,1.5,1,1.8
    c0.2,0.1,0.6,0.2,1.6,0.3v0.8h-6.1v-0.8c1.2-0.1,1.8-0.8,2.1-1.5c0.4-0.9,0.6-1.9,0.9-2.8l5.2-20.2h1.8l6.2,24.5h1.3h0.3h2V9.9h-2.2
    V9h8.5c3.7,0,5.2,1,5.8,1.5c0.8,0.6,1.7,1.8,1.7,3.8c0,2-0.9,3.3-1.7,4c-1,0.9-2.3,1.4-4,1.8v0.2C259.6,20.9,260.9,21.7,261.9,22.8z
     M239.4,25.9l-2.6-10.4l-2.7,10.4H239.4z M253.3,19.6h1.9c0.8,0,1.7-0.1,2.4-1.1c0.7-0.9,0.8-1.8,0.8-2.6v-2.6
    c0-0.9-0.1-2.3-1.1-3.1c-0.6-0.5-1.2-0.5-1.9-0.5h-2.1V19.6z M258.8,25.7c0-1.4,0-2.4-0.6-3.6c-0.4-0.7-1.1-1.6-2.9-1.6h-2.1v12.7
    h1.7c2.3,0,2.9-0.9,3.3-1.6c0.5-1,0.6-2.2,0.6-3.3V25.7z M299.4,33.2v0.8h-8.1v-0.8h2.2l-1.7-6.5h-5.6l-0.4,1.6
    c-0.2,0.6-0.5,2.3-0.5,2.7c0,0.9,0.5,1.5,1,1.8c0.2,0.1,0.6,0.2,1.6,0.3v0.8h-5.6l0.2,7.2h-1.1c-0.3-1.9-1.3-5-2.6-6.2
    c-1.1-1-2.4-1-3.1-1h-5.5c-1.1,0-2.2-0.1-3.4,1.6c-1.1,1.5-1.5,4.2-1.7,5.6H264l0.3-8.1h2.4c0.8-1.3,1.2-2.6,1.5-4.2
    c0.1-0.8,0.3-2.2,0.3-3.1l0.3-9.9c0.1-3.2,0.2-4.7-0.5-5.4c-0.4-0.5-1.4-0.8-2.2-0.7V9h15.6v0.8h-2.2v23.4h2.4
    c1.2-0.1,1.8-0.8,2.1-1.5c0.4-0.9,0.6-1.9,0.9-2.8l5.2-20.2h1.8l6.2,24.5H299.4z M275.3,9.9h-2.9c-0.7,0-1.4,0-2,0.6
    c-0.6,0.7-0.6,2.2-0.6,3.9l-0.5,11.6c-0.2,4.1-0.8,5.9-1.6,7.3h7.6V9.9z M291.7,25.9L289,15.5l-2.7,10.4H291.7z"></path>
          </svg>'
                    }
                }


                delegate: Rectangle {
                    color: "#7e0019"
                    width: parent.width
                    height: Theme.paddingLarge * 3 + image.height + button.height

                    Image {
                        id: image
                        anchors {
                            top: parent.top
                            topMargin: Theme.paddingLarge
                            horizontalCenter: parent.horizontalCenter
                        }
                        source: model.iconSrc
                        width: page.isPortrait ? (page.width * 0.6) : (page.height * 0.8)
                        height: width * 4 / 16
                    }


                    Label {
                        id: button
                        anchors {
                            top: image.bottom
                            topMargin: Theme.paddingLarge
                            horizontalCenter: parent.horizontalCenter
                        }
                        text: model.languageName
                        padding: Theme.paddingLarge
                        color: mouseArea.pressed ? Theme.highlightColor : Theme.primaryColor

                        Rectangle {
                            z: -1
                            color: mouseArea.pressed ? Theme.highlightDimmerColor : Theme.overlayBackgroundColor
                            radius: Theme.paddingSmall
                            anchors {
                                top: button.top
                                bottom: button.bottom
                                horizontalCenter: parent.horizontalCenter
                            }
                            width: Theme.itemSizeHuge

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                onClicked: {
                                    settings.language = languageCode
                                    pageStack.replace(Qt.resolvedUrl("ListPage.qml"), { }, PageStackAction.Animated)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
