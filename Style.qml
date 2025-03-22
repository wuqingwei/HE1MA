pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property color charcoalWhisper: "#2d2f2f"
    readonly property color sandyDune: "#cec9b2"
    readonly property color tropicalTeal: "#04ebc3"
    readonly property color emeraldDepths: "#1a9c84"
    readonly property color mintedBreeze: "#0bb598"
    readonly property color aquaBliss: "#5ff0d3"
    readonly property color steelGray: "#494949"
    readonly property color verdantTide: "#17a494"
    readonly property color cyanDream: "#30f0d4"
    readonly property color mossyStone: "#7c745c"

    property color profileBackgroundColor: "#00000000"
    property string profilePicture: "qrc:/displyDP/2.png" //"qrc:/icons/profile2.webp"

    property string hemaFontFamily: fontLoader.name
    property bool lockActive: false
    property bool notificationActive: false
    property bool microphoneActive: false

    property FontLoader fontLoader: FontLoader {
        id: loader
        source: "qrc:/fonts/xperia/Xperia.ttf" // Adjust the font source as needed
    }

    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }
}
