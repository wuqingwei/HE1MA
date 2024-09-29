import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Style
import Qt5Compat.GraphicalEffects

Button {
    id: control
    property string setIcon : ""
    property bool isGlow: false
    property real iconWidth: 24
    property real iconHeight: 24
    property color iconColor: "#FFFFFF"
    property bool colorImage: false
    property color backgroundColor: "transparent"
    scale: 1

    contentItem: Image {
        id: image
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        source: control.icon.source
        sourceSize: Qt.size(control.iconWidth,control.iconHeight)
        scale: control.pressed ? 0.9 : control.scale
        Behavior on scale { NumberAnimation { duration: 200; } }
    }

    ColorOverlay {
        anchors.fill: image
        source: image
        color: control.iconColor
        visible: colorImage
    }

    background: Rectangle {
        anchors.fill: parent
        radius: width
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
        radius: width
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
            to: control.width * 1.2
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
