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
        color: Style.charcoalWhisper
    }
    QtObject {
        id: d
        property string image: "qrc:/cctv/1.jpg"
        property string title: "Backyard"
    }

    ListModel {
        id: cctvModel
        ListElement {
            title: "Backyard"
            image: "qrc:/cctv/1.jpg"
        }
        ListElement {
            title: "Bedroom"
            image: "qrc:/cctv/2.jpg"
        }
        ListElement {
            title: "Kidsroom"
            image: "qrc:/cctv/3.jpg"
        }
        ListElement {
            title: "Outside"
            image: "qrc:/cctv/5.jpg"
        }
        ListElement {
            title: "Poolview"
            image: "qrc:/cctv/6.jpg"
        }
        ListElement {
            title: "Backyard"
            image: "qrc:/cctv/7.jpg"
        }
        ListElement {
            title: "Backyard"
            image: "qrc:/cctv/8.jpg"
        }
    }

    Component {
        id: cctvDelegate
        Control {
            id: delegate
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 0
            implicitWidth: leftTileArea.width * 0.8
            implicitHeight: leftTileArea.width * 0.6
            contentItem: Item {
                Image {
                    anchors.centerIn: parent
                    source: image
                    sourceSize.width: delegate.width
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: 30
                        color: Style.alphaColor(Style.tropicalTeal,0.4)

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: title
                            font.pixelSize: 12
                            color: "#fefefe"
                        }
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    d.image = image
                    d.title = title
                }
            }
        }
    }

    contentItem: ColumnLayout {
        spacing: 0
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height - 1
            clip: true
            RowLayout {
                spacing: 0
                anchors.fill: parent
                clip: true

                Pane {
                    id: leftTileArea
                    padding: 0
                    Layout.preferredWidth: root.width * 0.3
                    Layout.fillHeight: true
                    clip: true
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#3c3c3c"
                    }

                    ListView {
                        anchors.fill: parent
                        spacing: 5
                        clip: true
                        model: cctvModel
                        delegate: cctvDelegate
                    }
                }

                Pane {
                    id: cameraView
                    padding: 0
                    Layout.preferredWidth: root.width * 0.7
                    Layout.fillHeight: true
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#494949"
                    }
                    ColumnLayout {
                        spacing: 10
                        anchors.fill: parent
                        RowLayout {
                            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                            spacing: 10
                            RowLayout {
                                spacing: 0
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                TouchIcon {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    icon.source: "qrc:/cctv/menugrid.svg"
                                    iconWidth: 18
                                    iconHeight: 18
                                    colorImage: true
                                    iconColor: Style.tropicalTeal
                                    onClicked: {}
                                }
                                Text {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    color: "#fefefe"
                                    text: "Cycle Cams"
                                    font.pointSize: 12
                                    font.capitalization: Font.AllUppercase
                                }
                            }
                            RowLayout {
                                spacing: 0
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                TouchIcon {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    icon.source: "qrc:/cctv/light.svg"
                                    iconWidth: 18
                                    iconHeight: 18
                                    colorImage: true
                                    iconColor: Style.tropicalTeal
                                    onClicked: {}
                                }
                                Text {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    color: "#fefefe"
                                    text: "Take Snapshot"
                                    font.pointSize: 12
                                    font.capitalization: Font.AllUppercase
                                }
                            }
                            RowLayout {
                                spacing: 0
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                TouchIcon {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    icon.source: "qrc:/cctv/cloudSync.svg"
                                    iconWidth: 18
                                    iconHeight: 18
                                    colorImage: true
                                    iconColor: Style.tropicalTeal
                                    onClicked: {}
                                }
                                Text {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    color: "#fefefe"
                                    text: "Enable cloud sync"
                                    font.pointSize: 12
                                    font.capitalization: Font.AllUppercase
                                }
                            }
                        }
                        Image {
                            clip: true
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                            source: d.image
                            sourceSize: Qt.size( parent.width * 0.9,cameraView.height * 0.8)
                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: parent.width
                                height: 60
                                color: Style.alphaColor("#000000",0.4)

                                ColumnLayout {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                        text: d.title
                                        font.pixelSize: 14
                                        color: Style.tropicalTeal
                                        font.capitalization: Font.AllUppercase
                                    }

                                    Text {
                                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                        text: title
                                        font.pixelSize: 12
                                        color: "#fefefe"
                                    }
                                }

                                RowLayout {
                                    spacing: 10
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    Button {
                                        id: unlockButton
                                        palette.dark: "#04957c"
                                        highlighted: true
                                        implicitHeight: 30
                                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                        text: qsTr("Unlock door")
                                        icon.source: "qrc:/icons/bxs--lock.svg"
                                        icon.color: "#fefefe"
                                        icon.width: 14
                                        icon.height: 14
                                        font.pixelSize: 12
                                        font.bold: Font.Normal
                                        font.capitalization: Font.AllUppercase
                                    }

                                    Button {
                                        palette.dark: "#dd5b43"
                                        implicitHeight: 30
                                        highlighted: true
                                        implicitWidth: unlockButton.implicitWidth
                                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                        text: qsTr("Intercom")
                                        icon.source: "qrc:/icons/maki--communications-tower.svg"
                                        icon.color: "#fefefe"
                                        font.pixelSize: 12
                                        font.bold: Font.Normal
                                        icon.width: 14
                                        icon.height: 14
                                        font.capitalization: Font.AllUppercase
                                    }
                                }
                            }
                        }
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
