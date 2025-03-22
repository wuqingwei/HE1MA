import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import Style 1.0

import "../Controls"
import "../Components"

Pane {
    padding: 0
    anchors.fill: parent
    background: Rectangle {
        anchors.fill: parent
        color: Style.lockActive ? "#494949" : Style.charcoalWhisper
    }
    contentItem: ColumnLayout {
        width: parent.width
        spacing: 30
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 56
            font.bold: Font.Bold
            font.family: Style.hemaFontFamily
            font.capitalization: Font.AllUppercase
            font.letterSpacing: 2
            text: qsTr("HE1MA")
            color: "#FFFFFF"
        }

        Item {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.bottomMargin: 50
            Layout.rightMargin: 80

            Item {
                anchors.centerIn: parent
                Image {
                    anchors.centerIn: parent
                    source: Style.profilePicture
                    width: 120
                    height: 120
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask
                    }
                }

                Rectangle {
                    id: mask
                    anchors.centerIn: parent
                    width: 120
                    height: 120
                    radius: height / 2
                    visible: false
                }
            }

            Rectangle {
                width: 120
                height: 120
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 80
                color: Style.tropicalTeal
                radius: height / 2

                TouchIcon {
                    anchors.centerIn: parent
                    icon.source: "qrc:/icons/bxs--lock.svg"
                    iconWidth: 28
                    iconHeight: 28
                    colorImage: true
                    iconColor: "#494949"
                    onClicked: Style.lockActive = false
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: 16
                font.family: "Arial"
                font.capitalization: Font.AllUppercase
                font.letterSpacing: 1
                text: qsTr("Tab the key icon on your phone")
                color: Style.alphaColor("#FFFFFF",0.5)
            }
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: 16
                font.family: "Arial"
                font.capitalization: Font.AllUppercase
                font.letterSpacing: 1
                text: qsTr("To unlock console")
                color: Style.alphaColor("#FFFFFF",0.8)
            }
        }
    }
}
