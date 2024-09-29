import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Style

import "../Controls"
import "../Components"

Pane {
    padding: 0
    anchors.fill: parent
    property int newVal: 90
    background: Rectangle {
        anchors.fill: parent
        color: Style.charcoalWhisper
    }
    contentItem: ColumnLayout {
        spacing: 0
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height - 1

            ColumnLayout {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 20

                Rectangle {
                    width: 100
                    height: 4
                    color: "#08d7b2"
                }

                Text {
                    color: "#fefefe"
                    text: "Adjust the temperature"
                    font.pointSize: 14
                    font.capitalization: Font.AllUppercase
                }
            }

            Item {
                anchors.right: progressIndicator.left
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                ColumnLayout {
                    anchors.centerIn: parent
                    Text {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        color: "#01ba9a"
                        text: "Current"
                        font.pointSize: 24
                        font.capitalization: Font.AllUppercase
                    }

                    RowLayout {
                        spacing: 2
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#fefefe"
                            text: "21"
                            font.pointSize: 64
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#908990"
                            text: "°"
                            font.pointSize: 64
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }
            }

            Item {
                anchors.left: progressIndicator.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                ColumnLayout {
                    id: rightTempLabel
                    anchors.centerIn: parent
                    Text {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        color: "#FFFF00"
                        text: "Desired"
                        font.pointSize: 24
                        font.capitalization: Font.AllUppercase
                    }

                    RowLayout {
                        spacing: 2
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#908990"
                            text: "+"
                            font.pointSize: 64
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#fefefe"
                            text: "3"
                            font.pointSize: 64
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            color: "#908990"
                            text: "°"
                            font.pointSize: 64
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }

                ColumnLayout {
                    anchors.top: rightTempLabel.bottom
                    anchors.topMargin: 10
                    anchors.horizontalCenter: rightTempLabel.horizontalCenter

                    Rectangle {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        width: 100
                        height: 2
                        color: "#fefefe"
                    }

                    RowLayout {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            color: "#908990"
                            text: "In"
                            font.pointSize: 14
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            color: "#fefefe"
                            text: "15 Min"
                            font.pointSize: 14
                            font.capitalization: Font.AllUppercase
                        }
                    }

                    Item { Layout.preferredHeight: 1 }

                    RowLayout {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            color: "#908990"
                            text: "Potentially"
                            font.pointSize: 14
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            color: "#fefefe"
                            text: "4%"
                            font.pointSize: 14
                            font.capitalization: Font.AllUppercase
                        }
                    }
                    RowLayout {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            color: "#908990"
                            text: "More Expensive"
                            font.pointSize: 14
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }
            }

            CircularSlider {
                id: progressIndicator
                anchors.centerIn: parent
                hideProgress: true
                hideTrack: true
                value: newVal
                onValueChanged: newVal = value
                width: 260
                height: 260
                minValue: 0
                maxValue: 130

                handle: Rectangle {
                    id: handleItem
                    transform: Translate {
                        x: (progressIndicator.handleWidth - width) / 2
                        y: (progressIndicator.handleHeight - height) / 2
                    }
                    width: 40
                    height: 40
                    radius: width / 2
                    antialiasing: true
                    color: "#908990"

                    border.color: "#fefefe"
                    border.width: 5
                }

                PrefsIconButton {
                    anchors.centerIn: parent
                    width: 100
                    height: 100
                    backgroundColor: "#fefefe"
                    isGlow: true
                    implicitHeight: 100
                    implicitWidth: 100
                    text: "OK"
                    font.pointSize: 32
                    font.bold: Font.Bold
                    font.capitalization: Font.AllUppercase
                }

                Repeater {
                    model: 72
                    Rectangle {
                        id: indicator
                        width: 5
                        height: indicator.angle > progressIndicator.angle ? 10 : 20
                        color: indicator.angle > progressIndicator.angle ? "#494949" : index > 45 ? "#FFFF00" : "#01ba9a"
                        readonly property real angle: index * 5
                        transform: [
                            Translate {
                                x: progressIndicator.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: progressIndicator.width / 2
                                origin.y: progressIndicator.height / 2
                                angle: indicator.angle
                            }
                        ]
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#01ba9a"
        }
    }
}
