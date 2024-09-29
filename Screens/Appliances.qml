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
        color: Style.charcoalWhisper
    }
    Component {
        id: appliancesDelegate
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
                    ColumnLayout {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: title
                            font.pixelSize: 16
                            color: "#fefefe"
                        }

                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: modelName
                            font.pixelSize: 10
                            color: "#9a9a9a"
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: qsTr("Health Status:")
                                font.pixelSize: 10
                                color: "#fefefe"
                                font.capitalization: Font.AllUppercase
                            }
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: healthStatus ? qsTr("No Error") : qsTr("Error")
                                font.pixelSize: 10
                                color: "#9a9a9a"
                            }
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: qsTr("Current Status:")
                                font.pixelSize: 10
                                color: "#fefefe"
                                font.capitalization: Font.AllUppercase
                            }
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: currentStatus ? qsTr("Washing Cycle, Program 6") : qsTr("Idle")
                                font.pixelSize: 10
                                color: "#9a9a9a"
                            }
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Rectangle {
                        Layout.alignment: Qt.AlignRight | Qt.AlignTop
                        width: 70
                        height: 30
                        color: Style.alphaColor("#000000",0.3)

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 1
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: qsTr("Estimated Time")
                                font.pixelSize: 6
                                color: "#9a9a9a"
                                font.capitalization: Font.AllUppercase
                            }
                            Text {
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                text: qsTr("--H --MIN")
                                font.pixelSize: 10
                                color: "#fefefe"
                                font.bold: Font.Bold
                                font.capitalization: Font.AllUppercase
                            }
                        }
                    }
                }

                PrefsSlider {
                    id: slider
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: parent.width
                    palette.light: isOn ? "#b0b0b0" : Style.tropicalTeal
                    palette.window: isOn ? "#b0b0b0" : Style.tropicalTeal
                    palette.midlight: "#b0b0b0"
                    palette.dark: isOn ? "#b0b0b0" : Style.tropicalTeal
                    value: percentage
                    handle: null

                    RowLayout {
                        anchors.top: parent.strip.top
                        anchors.left: parent.strip.right
                        anchors.leftMargin: 3
                        spacing: 0

                        Text {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: slider.value.toFixed(0) > 0 ? slider.value.toFixed(0) : qsTr("Idle")
                            font.pixelSize: 10
                            color: "#fefefe"
                            font.bold: Font.Bold
                        }

                        Text {
                            visible: slider.value.toFixed(0) > 0
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                            text: qsTr("% completed")
                            font.pixelSize: 10
                            color: "#b0b0b0"
                            font.bold: Font.Bold
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: appliancesModel
        ListElement {
            title: "Washing Machine"
            isOn: false
            modelName: "Hoover Dynamic DYN83774"
            healthStatus: true
            currentStatus: true
            percentage: 80
            timeInMinutes: 15
        }
        ListElement {
            title: "Tumble Dryer"
            modelName: "Bosch WTE8766"
            isOn: true
            healthStatus: true
            currentStatus: false
            percentage: 0
            timeInMinutes: 0
        }
    }

    ListModel {
        id: cctvModel
        ListElement {
            title: "Air Conditioning"
            count: 5
        }
        ListElement {
            title: "CCTV"
            count: 6
        }
        ListElement {
            title: "Cleaning"
            count: 2
        }
        ListElement {
            title: "kitchen"
            count: 5
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
                                    return qsTr("All appliances are off")
                                }else if(count == 1) {
                                    return qsTr("appliance in operation")
                                }
                                return qsTr("appliances in operation")
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
                                text: "Appliances"
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
                        currentIndex: 2
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
                                    text: qsTr("%0 appliances").arg(3)
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
                        spacing: 20
                        currentIndex: 1
                        highlightFollowsCurrentItem: true
                        model: appliancesModel
                        delegate: appliancesDelegate
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
