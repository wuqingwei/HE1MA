import QtQuick
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Hema 1.0
import "Controls"
import "Components"
import "Screens"

/*
Display:
    Size -7″
    Display Format -800×480.
    Brightness -300nit.
    Active Area – 154.1mm (W) ×85.9mm (H)
    Colour – 24-bit color 8R8G8B.
    Backlight – LED.
*/

ApplicationWindow {
    id: root
    width: 800
    height: 480
    minimumWidth: 800
    minimumHeight: 480
    visible: true
    title: qsTr("HE1MA")
    color: {
        if(Style.lockActive) {
            return "#494949"
        } else if(Style.microphoneActive) {
            return "#333333"
        }
        return Style.charcoalWhisper
    }

    header: Item {
        id: headerLayout
        width: parent.width
        height: 50
        RowLayout {
            spacing: 0
            anchors.fill: parent
            Item {
                Layout.preferredWidth: parent.width * 0.3
                Layout.preferredHeight: parent.height

                RowLayout {
                    spacing: 10
                    anchors.centerIn: parent

                    Label{
                        id: currentTime
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        text: Qt.formatDateTime(new Date(), "h:mmAP")
                        font.pixelSize: 16
                        font.bold: Font.Bold
                        color: Style.lockActive || Style.microphoneActive ? "#9a9a9a" : "#fefefe"
                        Timer {
                            interval: 500
                            running: true
                            repeat: true
                            onTriggered:{
                                currentTime.text = Qt.formatDateTime(new Date(), "h:mmAP")
                            }
                        }
                    }

                    Label{
                        id: currentDate
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        text: Qt.formatDateTime(new Date(), "dd MMM yyyy")
                        font.pixelSize: 16
                        font.capitalization: Font.AllUppercase
                        color: Style.lockActive || Style.microphoneActive ? "#9a9a9a" : "#fefefe"

                        Timer {
                            interval: 50000
                            running: true
                            repeat: true
                            onTriggered:{
                                currentDate.text = Qt.formatDateTime(new Date(), "dd MMM yyyy")
                            }
                        }
                    }
                }
            }

            Rectangle {
                visible: !Style.microphoneActive
                Layout.preferredWidth: parent.width * 0.7
                Layout.preferredHeight: parent.height
                color: "#494949"

                DragHandler {
                    property real lastHorizontalVelocity
                    property real lastVerticalVelocity

                    target: null
                    xAxis.enabled: true
                    yAxis.enabled: true

                    onCentroidChanged: {
                        // Handle horizontal swipes
                        if (centroid.position.x !== 0 || centroid.velocity.x !== 0) {
                            lastHorizontalVelocity = centroid.velocity.x
                        } else {
                            if (Math.abs(lastHorizontalVelocity) < 0.4)
                                lastHorizontalVelocity = 0; // Reset if below threshold
                            else if (lastHorizontalVelocity < 0) {
                                console.log("Swipe from right to left")
                            } else {
                                console.log("Swipe from left to right")
                            }
                        }

                        // Handle vertical swipes
                        if (centroid.position.y !== 0 || centroid.velocity.y !== 0) {
                            lastVerticalVelocity = centroid.velocity.y
                        } else {
                            if (Math.abs(lastVerticalVelocity) < 0.4)
                                lastVerticalVelocity = 0; // Reset if below threshold
                            else if (lastVerticalVelocity < 0) {
                                console.log("Swipe from bottom to top")
                            } else {
                                if(!Style.lockActive) {
                                    console.log("Swipe from top to bottom")
                                    Style.notificationActive = true
                                }
                            }
                        }
                    }
                }

                Label {
                    visible: Style.notificationActive
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Notification and alert center")
                    font.pixelSize: 16
                    font.bold: Font.DemiBold
                    font.capitalization: Font.AllUppercase
                    color: "#fefefe"
                }

                RowLayout {
                    visible: !Style.notificationActive
                    spacing: 10
                    Layout.maximumWidth: parent.width * 0.6
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter

                    TouchIcon {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        icon.source: "qrc:/icons/warning.svg"
                        iconWidth: 18
                        iconHeight: 18
                        colorImage: true
                        iconColor: Style.lockActive ? "#9a9a9a" : "#fefefe"
                        onClicked: {
                            if(!Style.lockActive) {
                                Style.notificationActive = true
                            }
                        }
                    }

                    Label{
                        property int newAlert: 1
                        Layout.maximumWidth: parent.width * 0.6
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        text: qsTr("You have got %0 new alert").arg(newAlert)
                        font.pixelSize: 14
                        color: "#9a9a9a"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(!Style.lockActive) {
                                    Style.notificationActive = true
                                }
                            }
                        }
                    }
                }

                TouchIcon {
                    visible: !Style.notificationActive
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    iconWidth: 22
                    iconHeight: 22
                    icon.source: "qrc:/icons/ph--microphone-fill.svg"
                    colorImage: true
                    iconColor: Style.lockActive ? "#9a9a9a" : "#fefefe"
                    onClicked: Style.microphoneActive = !Style.microphoneActive
                }

                PrefsLabelButton {
                    visible: Style.notificationActive
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: qsTr("Clear")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 16
                    color: Style.tropicalTeal
                }
            }
        }
    }

    contentData: Loader {
        visible: !Style.lockActive && !Style.notificationActive && !Style.microphoneActive
        anchors.fill: parent
        sourceComponent: currentPage(footerArea.currentIndex)
    }

    Loader {
        z: 999
        visible: Style.lockActive || Style.notificationActive || Style.microphoneActive
        anchors.fill: parent
        sourceComponent: {
            if(Style.lockActive) {
                return lockScreen
            }else if(Style.notificationActive) {
                return notificationScreen
            }else if(Style.microphoneActive) {
                return microphoneScreen
            }
        }
    }

    footer: Footer {
        id: footerArea
        visible: !Style.lockActive && !Style.notificationActive && !Style.microphoneActive
    }

    Component {
        id: dashbaord
        Dashboard {}
    }

    Component {
        id: airConditioning
        AirConditioning{}
    }

    Component {
        id: lighting
        Lighting {}
    }

    Component {
        id: security
        Security {}
    }

    Component {
        id: settingsPage
        SettingsPage {}
    }

    Component {
        id: communications
        Communications {}
    }
    Component {
        id: cctv
        CCTV {}
    }

    Component {
        id: appliances
        Appliances {}
    }

    Component {
        id: lockScreen
        LockScreen {}
    }

    Component {
        id: notificationScreen
        NotificationScreen {}
    }

    Component {
        id: microphoneScreen
        MicrophoneScreen {}
    }

    function currentPage(index) {
        switch(index) {
        case PageEnum.DASHBOARD:
            return dashbaord;
        case PageEnum.AIR_CONDITIONING:
            return airConditioning
        case PageEnum.LIGHTING:
            return lighting
        case PageEnum.APPLIANCES:
            return appliances
        case PageEnum.COMMUNICATIONS:
            return communications
        case PageEnum.SECURITY:
            return security
        case PageEnum.CCTV:
            return cctv
        case PageEnum.SETTINGSPAGE:
            return settingsPage
        default :
            return dashbaord
        }
    }
}
