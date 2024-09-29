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
    background: Rectangle {
        anchors.fill: parent
        color: Style.tropicalTeal
    }
    contentItem: ColumnLayout {
        spacing: 0
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.66
            ColumnLayout {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 20

                Rectangle {
                    width: 100
                    height: 4
                    color: Style.alphaColor("#000000",0.5)
                }

                Text {
                    color: "#fefefe"
                    text: "Temperature Inside Now"
                    font.pointSize: 14
                    font.capitalization: Font.AllUppercase
                }
            }

            RowLayout {
                id: rightTopLayout
                spacing: 40
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.rightMargin: 20

                Rectangle {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    height: 28
                    width: 28
                    color: Style.alphaColor("#000000",0.5)
                    scale: sensorArea.pressed ? 1.1 : 1
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/icons/plus-large-svgrepo-com.svg"
                        sourceSize: Qt.size(18,18)
                    }
                    MouseArea {
                        id: sensorArea
                        anchors.fill: parent
                        onClicked: {}
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Rectangle {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        width: 100
                        height: 4
                        color: Style.alphaColor("#000000",0.5)
                    }

                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        color: "#fefefe"
                        text: "Next Scheduled Event"
                        font.pointSize: 14
                        font.capitalization: Font.AllUppercase
                    }
                }

                Item {Layout.preferredWidth: 1}

                Rectangle {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    height: 28
                    width: 28
                    color: Style.alphaColor("#000000",0.5)
                    scale: sensorArea2.pressed ? 1.1 : 1

                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/icons/plus-large-svgrepo-com.svg"
                        sourceSize: Qt.size(18,18)
                    }

                    MouseArea {
                        id: sensorArea2
                        anchors.fill: parent
                        onClicked: {}
                    }
                }
            }


            ColumnLayout {
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: rightTopLayout.implicitHeight
                anchors.left: rightTopLayout.left
                anchors.leftMargin: 68

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    color: Style.alphaColor("#000000",0.5)
                    text: "today"
                    font.pointSize: 24
                    font.capitalization: Font.AllUppercase
                }

                RowLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        color: "#fefefe"
                        text: "7:30"
                        font.pointSize: 48
                        font.capitalization: Font.AllUppercase
                    }
                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        color: Style.alphaColor("#000000",0.5)
                        text: "PM"
                        font.pointSize: 48
                        font.capitalization: Font.AllUppercase
                    }
                }

                Item { Layout.preferredHeight: 1 }

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    color: "#fefefe"
                    text: "Full system check"
                    font.pointSize: 18
                }
            }

            ColumnLayout {
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: rightTopLayout.implicitHeight
                anchors.left: parent.left
                anchors.leftMargin: 40

                RowLayout {
                    id: tempLayout
                    spacing: 0
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                    Rectangle {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        width: 68
                        height: 68
                        radius: height / 2
                        color: Style.alphaColor("#000000",0.5)
                        TouchIcon {
                            anchors.centerIn: parent
                            icon.source: "qrc:/icons/fa-solid--fan.svg"
                            iconWidth: 42
                            iconHeight: 42
                            colorImage: true
                            iconColor: "#00eac1"
                        }
                    }

                    Item { Layout.preferredWidth: 50 }

                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        color: "#fefefe"
                        text: "21"
                        font.pointSize: 92
                        font.capitalization: Font.AllUppercase
                    }

                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        color: Style.alphaColor("#000000",0.5)
                        text: "°C"
                        font.pointSize: 92
                        font.capitalization: Font.AllUppercase
                    }

                    Item { Layout.preferredWidth: 50 }

                    Rectangle {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        width: 42
                        height: 42
                        radius: height / 2
                        color: Style.alphaColor("#000000",0.5)

                        TouchIcon {
                            anchors.centerIn: parent
                            icon.source: "qrc:/icons/settings2-svgrepo-com.svg"
                            iconWidth: 18
                            iconHeight: 18
                            colorImage: true
                            iconColor: "#00eac1"
                        }
                    }
                }

                Item { Layout.preferredWidth: 30 }

                Slider {
                    palette.midlight: Style.alphaColor("#000000",0.5)
                    palette.dark: "#fefefe"
                    from: 0
                    to: 100
                    value: 40
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: tempLayout.implicitWidth * 0.8
                    height: 4
                    handle: null
                }
            }
        }

        Pane {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.33
            padding: 0
            background: Rectangle {
                anchors.fill: parent
            }

            ListView {
                id: personInOutView
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                orientation: ListView.Horizontal
                width: parent.width * 0.8
                height: parent.height
                spacing: 20
                clip: true

                model: ListModel {
                    ListElement {
                        name: "Fusil"
                        profile: "qrc:/displyDP/2.png"
                        isIn: true
                        time: ""
                    }
                    ListElement {
                        name: "Jessica"
                        profile: "qrc:/displyDP/2.png"
                        isIn: false
                        time: ""
                    }
                    ListElement {
                        name: "David"
                        profile: "qrc:/displyDP/2.png"
                        isIn: true
                        time: "2 min"
                    }
                    ListElement {
                        name: "Emily"
                        profile: "qrc:/displyDP/2.png"
                        isIn: false
                        time: "5 min"
                    }
                    ListElement {
                        name: "jimmy"
                        profile: "qrc:/displyDP/2.png"
                        isIn: true
                        time: "10 min"
                    }
                }

                delegate: ItemDelegate {
                    anchors.verticalCenter: parent.verticalCenter
                    background: null
                    contentItem: RowLayout {
                        spacing: 10

                        Image {
                            source: profile
                            sourceSize: Qt.size(42,42)
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        }

                        ColumnLayout {
                            spacing: 1
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            Text {
                                visible: text
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#393939"
                                text: name
                                font.capitalization: Font.Capitalize
                                font.pointSize: 12
                            }
                            Text {
                                visible: text
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#4eefd3"
                                text: isIn ? "IN" : "OUT"
                                font.pointSize: 14
                                font.bold: Font.Bold
                                font.capitalization: Font.AllUppercase
                            }
                            Text {
                                visible: text
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: Style.alphaColor("#000000",0.5)
                                text: time
                                font.pointSize: 12
                            }
                        }
                    }
                }
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                height: 28
                width: 28
                color: "#4eefd3"
                scale: addUser.pressed ? 1.1 : 1

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/icons/plus-large-svgrepo-com.svg"
                    sourceSize: Qt.size(18,18)
                }

                MouseArea {
                    id: addUser
                    anchors.fill: parent
                    onClicked: {}
                }
            }
        }
    }
}
