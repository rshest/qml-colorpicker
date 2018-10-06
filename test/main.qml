import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1

Window {
    id: window
    visible: true
    width: 400
    height: 350
    title: qsTr("Hello Colorpicker")

    ColumnLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 1
        Label {
            font.bold: true
            text: "Colorpicker properties:"
        }
        CheckBox {
            id: colorDialogAlpha
            text: "Show alpha channel"
            checked: true
            onClicked : {
                my_picker.enableAlphaChannel = checked
            }
        }
        CheckBox {
            id: colorDialogDetail
            text: "Show details"
            checked: true
            onClicked : {
                my_picker.enableDetails = checked
            }
        }
        Row {
            spacing: 10
            Button {
                width: 40
                height: 20
                background: Rectangle {
                    color: my_picker.colorValue
                }
            }
            Label {
                text: "Defined Color"
            }
        }
    }

    Colorpicker {
        id: my_picker
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        onColorChanged: {
            // test signal handler
            console.debug("handle signal:"+changedColor)
        }
    }
}
