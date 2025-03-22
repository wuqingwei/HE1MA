import QtQuick  2.15
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

    Component {
        id: lightDelegate
        ItemDelegate {
            id: delegate
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 0
            background: null
            highlighted: ListView.isCurrentItem
            hoverEnabled: true
            implicitWidth: rightDelegate.width * 0.9
            onClicked : ListView.view.currentIndex = index

            contentItem: ColumnLayout {
                spacing: 40
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                RowLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        text: title
                        font.pixelSize: 16
                        color: "#fefefe"
                    }

                    Item { Layout.fillWidth: true }

                    RowLayout {
                        spacing: 3
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            text: qsTr("Auto Control")
                            font.pixelSize: 14
                            color: "#9a9a9a"
                            font.capitalization: Font.AllUppercase
                        }
                        Text {
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            text: isOn ? qsTr("ON") : qsTr("OFF")
                            font.pixelSize: 14
                            color: isOn ? "#fefefe" : Style.tropicalTeal
                            font.bold: Font.Bold
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }

                PrefsSlider {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: parent.width
                    palette.light: isOn ? "#b0b0b0" : Style.tropicalTeal
                    palette.window: isOn ? "#b0b0b0" : Style.tropicalTeal
                    palette.midlight: "#b0b0b0"
                    palette.dark: isOn ? "#b0b0b0" : Style.tropicalTeal
                    value: percentage
                    stripVisible: false
                }
            }
        }
    }

    ListModel {
        id: cctvModel
        ListElement {
            title: "Backyard"
            count: 5
        }
        ListElement {
            title: "Bedroom"
            count: 2
        }
        ListElement {
            title: "Kidsroom"
            count: 1
        }
        ListElement {
            title: "Outside"
            count: 5
        }
        ListElement {
            title: "Poolview"
            count: 1
        }
        ListElement {
            title: "Backyard"
            count: 0
        }
    }

    ListModel {
        id: lightPlaceModel
        ListElement {
            title: "Main lights"
            isOn: false
            percentage: 35
        }
        ListElement {
            title: "Ambient lighting"
            isOn: true
            percentage: 15
        }
    }

    Component {
        id: cctvDelegate
        ItemDelegate {
            id: delegate
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 0
            background: null
            highlighted: ListView.isCurrentItem
            hoverEnabled: true
            implicitWidth: leftTileArea.width * 0.8
            onClicked : ListView.view.currentIndex = index

            contentItem: RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                ColumnLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        text: title
                        font.pixelSize: 18
                        color: highlighted ? Style.tropicalTeal : "#fefefe"
                    }

                    RowLayout {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: count
                            font.pixelSize: 12
                            color: "#fefefe"
                        }

                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: {
                                if(count == 0) {
                                    return qsTr("All lights are switched off")
                                }else if(count == 1) {
                                    return qsTr("light is on")
                                }
                                return qsTr("lights is on")
                            }
                            font.pixelSize: 12
                            color: Style.alphaColor("#fefefe",0.5)
                        }
                    }
                }

                Image {
                    visible: highlighted
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    source: "qrc:/icons/caret-right-svgrepo-com.svg"
                    sourceSize: Qt.size(22,22)
                }
            }
        }
    }

    contentItem: ColumnLayout {
        spacing: 0
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height - 1
            RowLayout {
                spacing: 0
                anchors.fill: parent

                Page {
                    id: leftTileArea
                    padding: 0
                    Layout.preferredWidth: root.width * 0.3
                    Layout.fillHeight: true
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#3c3c3c"
                    }

                    header: Item {
                        width: parent.width * 0.8
                        height: 50
                        ColumnLayout {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: (parent.width * 0.2) / 2
                            Rectangle {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                width: titleLabel.implicitWidth * 0.9
                                height: 4
                                color: Style.tropicalTeal
                            }

                            Text {
                                id: titleLabel
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#fefefe"
                                text: "Lighting Control"
                                font.pointSize: 14
                                font.capitalization: Font.AllUppercase
                            }
                        }
                    }

                    ListView {
                        anchors.topMargin: 5
                        anchors.bottomMargin: 20
                        anchors.fill: parent
                        clip: true
                        spacing: 20
                        currentIndex: 1
                        highlightFollowsCurrentItem: true
                        model: cctvModel
                        delegate: cctvDelegate
                    }
                }

                Page {
                    id: rightDelegate
                    padding: 0
                    Layout.preferredWidth: root.width * 0.7
                    Layout.fillHeight: true
                    clip: true
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#494949"
                    }

                    header: Item {
                        width: parent.width
                        height: 50
                        RowLayout {
                            width: parent.width * 0.9
                            anchors.centerIn: parent
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                color: "#fefefe"
                                text: title
                                font.pointSize: 14
                                font.capitalization: Font.AllUppercase
                            }

                            RowLayout {
                                spacing: 3
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                Text {
                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                    color: Style.alphaColor("#fefefe",0.8)
                                    text: qsTr("Total of")
                                    font.pointSize: 14
                                    font.capitalization: Font.AllUppercase
                                }
                                Text {
                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                    color: "#fefefe"
                                    text: qsTr("%0 light sources").arg(5)
                                    font.pointSize: 14
                                    font.capitalization: Font.AllUppercase
                                }
                            }
                        }
                    }

                    ListView {
                        anchors.topMargin: 5
                        anchors.bottomMargin: 20
                        anchors.fill: parent
                        clip: true
                        spacing: 50
                        currentIndex: 1
                        highlightFollowsCurrentItem: true
                        model: lightPlaceModel
                        delegate: lightDelegate
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
