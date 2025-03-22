import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Style 1.0
// import Qt5Compat.GraphicalEffects 1.15
import QtGraphicalEffects 1.15

Button {
    id: control
    property string setIcon : ""
    property bool isGlow: false
    property color backgroundColor: "transparent"
    implicitHeight: isGlow ? 50 : 44
    implicitWidth: isGlow ? 50 : 44
    property real iconWidth: 24
    property real iconHeight: 24
    property color iconColor: "#FFFFFF"
    property bool colorImage: false
    property real radius: height /2

    Image{
        id: image
        anchors.centerIn: parent
        source: setIcon
        sourceSize: Qt.size(control.iconWidth,control.iconHeight)
        scale: control.pressed ? 0.9 : 1.0
        Behavior on scale { NumberAnimation { duration: 200; } }
        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: control.iconColor
            visible: colorImage
        }
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        Layout.fillWidth: true
        radius: control.radius
        color: control.backgroundColor
        border.width: 0
        border.color: "transparent"
        visible: false
        Behavior on color {
            ColorAnimation {
                duration: 200;
                easing.type: Easing.Linear;
            }
        }

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width / 2
            y: my - height / 2
            height: width
            radius: width / 2
            color: isGlow ? Qt.lighter("#29BEB6") : Qt.lighter("#B8FF01")
        }
    }

    Rectangle {
        id: mask
        radius: control.radius
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: background
        source: background
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }

    ParallelAnimation {
        id: anim
        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0
            to: control.width * 1.5
            duration: 200
        }
        NumberAnimation {
            target: indicator;
            property: 'opacity'
            from: 0.9
            to: 0
            duration: 200
        }
    }

    onPressed: {
        indicator.mx = mouseArea.mouseX
        indicator.my = mouseArea.mouseY
        anim.restart();
    }
}
