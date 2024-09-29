import QtQuick 2.15
import QtQuick.Controls

import "../Controls"

TabBar {
    width: parent.width
    height: 70
    spacing: 0
    currentIndex: 0
    background: null
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/fa--dashboard.svg"
        text: qsTr("Dashboard")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/fa-solid--fan.svg"
        text: qsTr("Air Conditioning")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/lamp-svgrepo-com.svg"
        text: qsTr("Lighting")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/refrigerator-free-4-svgrepo-com.svg"
        text: qsTr("Appliances")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/maki--communications-tower.svg"
        text: qsTr("Communications")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/wpf--security-checked.svg"
        text: qsTr("Security")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/mdi--cctv.svg"
        text: qsTr("CCTV")
    }
    PrefsTabButton {
        implicitHeight: parent.height
        icon.source: "qrc:/icons/material-symbols--settings.svg"
        text: qsTr("Settings")
    }
}
