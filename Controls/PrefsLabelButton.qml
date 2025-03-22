import QtQuick 2.15
import QtQuick.Controls 2.15

Control {
    id: control

    property var text
    property color color
    signal clicked()

    padding: 6
    horizontalPadding: padding + 2
    spacing: 6
    scale: mouseArea.pressed ? 1.1 : 1.0
    background: null
    font.underline: mouseArea.containsMouse

    contentItem: Text {
        font: control.font
        text: control.text
        color: control.color
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {control.clicked()}
    }
}
