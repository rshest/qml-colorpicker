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

    GridLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        columnSpacing: 1
        rowSpacing: 1
        rows: 4
        flow: GridLayout.TopToBottom

        Label {
            font.bold: true
            text: "Colorpicker properties:"
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter
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
            Layout.topMargin: 10
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
        CheckBox {
            id: paletteMode
            text: "Palette Mode"
            checked: my_picker.paletteMode
            onClicked : {
                my_picker.paletteMode = checked
            }
        }
        CheckBox {
            id: paletteModeDefault
            text: "Enable Palette Mode"
            checked: my_picker.enablePaletteMode
            onClicked : {
                my_picker.enablePaletteMode = checked
            }
        }
        Button {
            text:"alfa reset"
            onClicked: {
                my_picker.visible = ! my_picker.visible
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
