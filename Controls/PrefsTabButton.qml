import QtQuick 2.15
// import QtQuick.Controls.Basic 2.15
import QtQuick.Controls 2.12

TabButton {
    id: control
    palette.windowText: "#FFFFFF"
    font.capitalization: Font.AllUppercase
    font.pixelSize: 8
    icon.color: "#FFFFFF"
    icon.width: 24
    icon.height: 24
    display: AbstractButton.TextUnderIcon
    background: Rectangle {
        anchors.fill: parent
        color:  parent.checked ? "#01ba9a" : "#00000000"

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width / 2
            y: my - height / 2
            height: width
            radius: width / 2
            color: Qt.lighter("#29BEB6")
        }
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
