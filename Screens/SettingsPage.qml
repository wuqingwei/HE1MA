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
    contentItem: ColumnLayout {
        spacing: 0
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height - 1
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#01ba9a"
        }
    }
}
