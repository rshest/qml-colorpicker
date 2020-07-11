import QtQuick 2.4
import QtQuick.Controls 2.4

CheckBox {
    id: control
    text: ""
    transformOrigin: Item.Center
    property string target_color : "#21be2b"
    property string border_color : "darkgray"
    property string selected_border_color : "white"
    padding: 0
    width: 25

    indicator: Rectangle {
        implicitWidth: 25
        implicitHeight: 25
        anchors.margins: 0

        x: control.leftPadding
        y: parent.height / 2 - height / 2
        width: 25
        radius: 3
        border.color: (checked ? selected_border_color : border_color)
        border.width: 5

        Rectangle {
            width: 17
            height: 17
            x: 4
            y: 4
            radius: 2
            scale: 1.3
            border.width: 0
            color: target_color
            visible: true
        }
    }
}
