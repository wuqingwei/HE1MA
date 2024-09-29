import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Style

import "../Controls"
import "../Components"

Pane {
    id: root
    padding: 0
    anchors.fill: parent
    background: Rectangle {
        anchors.fill: parent
        color: Style.charcoalWhisper
    }
    contentItem: Item {
        anchors.fill: parent
        RowLayout {
            spacing: 0
            anchors.fill: parent

            Pane {
                id: leftPage
                padding: 0
                Layout.preferredWidth: root.width * 0.3
                Layout.fillHeight: true
                background: Rectangle {
                    anchors.fill: parent
                    color: "#3c3c3c"
                }

                ColumnLayout {
                    spacing: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30

                    PrefsLabelButton {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        visible: Style.notificationActive
                        text: qsTr("Help")
                        font.pixelSize: 16
                        font.capitalization: Font.AllUppercase
                        color: "#fefefe"
                    }

                    PrefsLabelButton {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        visible: Style.notificationActive
                        text: qsTr("Settings")
                        font.pixelSize: 16
                        font.capitalization: Font.AllUppercase
                        color: "#fefefe"
                    }
                }
            }

            Page {
                padding: 0
                Layout.preferredWidth: root.width * 0.7
                Layout.fillHeight: true
                clip: true
                background: Rectangle {
                    anchors.fill: parent
                    color: "#494949"
                }
                contentItem: ColumnLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.margins: 20
                    clip: true
                    spacing: 20

                    Text {
                        Layout.alignment: Qt.AlignLeft
                        color: "#8b8b8b"
                        text: "Past Notifications"
                        font.pointSize: 16
                        font.bold: Font.DemiBold
                        font.capitalization: Font.AllUppercase
                    }

                    ListView {
                        Layout.fillWidth: true
                        height: Math.min(contentHeight * count, 300)
                        model: 15
                        clip: true
                        spacing: 20
                        ScrollIndicator.vertical: ScrollIndicator {
                            id:scrollIndicator
                            implicitWidth: 10
                            palette.mid: Style.alphaColor("#000000",0.3)
                            contentItem : Rectangle{
                                visible: parent.active || parent.position > 0
                                width: parent.width / 2
                                height: parent.height /2
                                radius: 12
                                color: "grey"
                            }
                        }
                        delegate: ColumnLayout {
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#fefefe"
                                text: "Overall temperature has been automatcially raisen to 23°C"
                                font.pointSize: 14
                                font.family: "Arial"
                            }
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#8b8b8b"
                                text: "2:15pm 20 May 2024"
                                font.capitalization: Font.AllUppercase
                                font.pointSize: 12
                            }
                        }
                    }

                    Item { Layout.preferredHeight: 60 }
                }

                footer: Item {
                    width: parent.width
                    height: 60
                    TouchIcon {
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        colorImage: true
                        iconColor: "Gray"
                        icon.source: "qrc:/icons/mingcute--menu-fill.svg"
                        onClicked: Style.notificationActive = false
                    }
                }
            }
        }
    }
}
