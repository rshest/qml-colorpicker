import QtQuick
import QtQuick.Controls

RadioButton {
    id: control
    text: ""
    transformOrigin: Item.Center
    property color target_color : "#21be2b"
    property color border_color : palette.light
    property color selected_border_color : palette.dark
    padding: 0

    indicator: Rectangle {
        anchors.fill: control
        radius: 6
        color: checked ? selected_border_color : border_color
        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            scale: 0.7
            color: target_color
        }
    }
}
