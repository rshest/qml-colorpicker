import QtQuick 2.4
import QtQuick.Controls 2.4

CheckBox {
    id: control
    text: ""
    transformOrigin: Item.Center
    property color target_color : "#21be2b"
    property color border_color : "darkgray"
    property color selected_border_color : "white"
    padding: 0
    width: 32
    height: 32

    indicator: Rectangle {
        implicitWidth: 25
        implicitHeight: 25
        anchors.margins: 0

        x: control.leftPadding
        y: 0
        width: 32
        height: 32
        radius: 3
        border.color: (checked ? selected_border_color : border_color)
        border.width: 5

        Rectangle {
            width: 20
            height: 20
            x: 6
            y: 6
            radius: 2
            scale: 1.3
            border.width: 0
            color: target_color
            visible: true
        }
    }
}
