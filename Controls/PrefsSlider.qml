import QtQuick 2.15
import QtQuick.Controls 2.12
import Style 1.0
import QtQuick.Layouts 1.12

Slider {
    id: control
    property bool stripVisible: true
    property alias strip: strip
    palette.light: isOn ? "#b0b0b0" : Style.tropicalTeal
    palette.window: isOn ? "#b0b0b0" : Style.tropicalTeal
    palette.midlight: "#b0b0b0"
    palette.dark: isOn ? "#b0b0b0" : Style.tropicalTeal
    from: 0
    to: 100
    height: 4

    Rectangle {
        id: strip
        visible: stripVisible
        x: (control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2))
        y: (control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))) - 25
        implicitWidth: 1
        implicitHeight: 20
        color: "#b0b0b0"
    }

    handle: Rectangle {
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
        implicitWidth: 24
        implicitHeight: 24
        radius: width / 2
        color: control.pressed ? control.palette.light : control.palette.window
        border.width: 3
        border.color: "#494949"
    }
    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : 4
        implicitHeight: control.horizontal ? 4 : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight
        radius: 3
        color: control.palette.midlight
        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            y: control.horizontal ? 0 : control.visualPosition * parent.height
            width: control.horizontal ? control.position * parent.width : 4
            height: control.horizontal ? 4 : control.position * parent.height

            radius: 3
            color: control.palette.dark
        }
    }
}
