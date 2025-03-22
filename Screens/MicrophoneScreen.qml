import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import Style 1.0

import "../Controls"
import "../Components"

Page {
    padding: 0
    anchors.fill: parent

    ListModel {
        id: listmodel
        ListElement {
            title: "Light"
            subtitle: "Turn Off in Hallway"
            image: "qrc:/applianceslist/desk-lamp-svgrepo-com.svg"
        }
        ListElement {
            title: "Door"
            subtitle: "Lock All"
            image: "qrc:/applianceslist/door-lock-svgrepo-com.svg"
        }
    }

    background: Rectangle {
        anchors.fill: parent
        color: "#333333"
    }

    header: Item {
        width: parent.width
        height: parent.height * 0.2

        Rectangle {
            anchors.centerIn: parent
            color: Style.tropicalTeal
            width: 70
            height: 70
            radius: height /2
            TouchIcon {
                anchors.centerIn: parent
                iconWidth: 36
                iconHeight: 36
                icon.source: "qrc:/icons/ph--microphone-fill.svg"
                colorImage: true
                iconColor: "#fefefe"
            }
        }
    }
    contentItem: Item {
        clip: true
        width: parent.width
        RowLayout {
            spacing: 0
            clip: true
            anchors.fill: parent
            Item {
                clip: true
                Layout.fillWidth: true
                Layout.fillHeight: true
                Text {
                    clip: true
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    color: "#fefefe"
                    text: "Please confirm"
                    font.pointSize: 16
                }

                Rectangle {
                    clip: true
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.right: parent.right
                    width: 1
                    color: Style.alphaColor("#fefefe",0.5)
                    height: appliancesList.contentHeight
                }
            }
            Item {
                clip: true
                Layout.fillWidth: true
                Layout.fillHeight: true

                ListView {
                    id: appliancesList
                    width: parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    model: listmodel
                    clip: true
                    delegate: ItemDelegate {
                        background: null
                        contentItem: ColumnLayout {
                            RowLayout {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                TouchIcon {
                                    id: iconButton
                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                    iconWidth: 18
                                    iconHeight: 18
                                    icon.source: image
                                    colorImage: true
                                    iconColor: "#fefefe"
                                }
                                Text {
                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                    color: "#fefefe"
                                    text: title
                                    font.pointSize: 16
                                }
                            }
                            Text {
                                Layout.leftMargin: iconButton.implicitWidth + 5
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#fefefe"
                                text: subtitle
                                font.pointSize: 16
                            }
                        }
                    }
                }
            }
        }
    }

    footer: Item {
        width: parent.width
        height: parent.height * 0.2
        RowLayout {
            spacing: 70
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            RowLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                PrefsLabelButton {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("Confirm")
                    font.pixelSize: 20
                    font.capitalization: Font.AllUppercase
                    color: Style.tropicalTeal
                    onClicked: Style.microphoneActive = false
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    color: Style.alphaColor("#fefefe",0.5)
                    text: "9"
                    font.pointSize: 20
                    font.capitalization: Font.AllUppercase
                }
            }

            PrefsLabelButton {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Cancel")
                font.pixelSize: 20
                font.capitalization: Font.AllUppercase
                color: "#fefefe"
                onClicked: Style.microphoneActive = false
            }
        }
    }
}
