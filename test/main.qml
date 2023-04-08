import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 350
    title: qsTr("Hello Colorpicker")

    property color captured_color: "transparent"

    property int fontPixelSize: 10
    property int itemHeight: 28
    property int buttonHeight: 26

    Flickable {
        id: flickable
        clip: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right:parent.right
        height: 150
        contentHeight: panel.implicitHeight

        ScrollBar.vertical: ScrollBar { }

        Flow {
            id: panel
            anchors.fill: parent
            padding: 5
            spacing: 5

            CheckBox {
                id: colorDialogAlpha
                text: "Show alpha channel"
                font.pixelSize: fontPixelSize
                checked: true
                height: itemHeight
                onClicked : {
                    my_picker.enableAlphaChannel = checked
                }
                background: Rectangle {
                    anchors.fill: parent
                    border.width: 1
                    border.color: "Gray"
                    color: "transparent"
                }
            }
            CheckBox {
                id: colorDialogDetail
                text: "Show details"
                font.pixelSize: fontPixelSize
                checked: true
                height: itemHeight
                onClicked : {
                    my_picker.enableDetails = checked
                }
                background: Rectangle {
                    anchors.fill: parent
                    border.width: 1
                    border.color: "Gray"
                    color: "transparent"
                }
            }

            CheckBox {
                id: paletteMode
                text: "Palette Mode"
                font.pixelSize: fontPixelSize
                checked: my_picker.paletteMode
                height: itemHeight
                onClicked : {
                    my_picker.paletteMode = checked
                }
                background: Rectangle {
                    anchors.fill: parent
                    border.width: 1
                    border.color: "Gray"
                }
            }

            CheckBox {
                id: paletteModeDefault
                text: "Enable Palette Mode"
                font.pixelSize: fontPixelSize
                checked: my_picker.enablePaletteMode
                height: itemHeight
                onClicked : {
                    my_picker.enablePaletteMode = checked
                }
                background: Rectangle {
                    anchors.fill: parent
                    border.width: 1
                    border.color: "Gray"
                    color: "transparent"
                }
            }

            Rectangle {
                border.width: 1
                border.color: "Gray"
                color: "transparent"
                width: capture_color.implicitWidth
                height: capture_color.implicitHeight
                Row {
                    id: capture_color
                    height: itemHeight
                    spacing: 5
                    rightPadding: 5
                    leftPadding: 5
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle {
                        width: 40
                        height: 15
                        color: my_picker.colorValue
                        border.color: activePalette.highlight
                        border.width: 1
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Button {
                        height: buttonHeight
                        text: "Get"
                        font.pixelSize: fontPixelSize
                        onClicked: {
                            captured_color = my_picker.colorValue
                        }
                    }
                }
            }

            Rectangle {
                border.width: 1
                border.color: "Gray"
                color: "transparent"
                width: captured.implicitWidth
                height: captured.implicitHeight
                Row {
                    id: captured
                    height: itemHeight
                    spacing: 5
                    rightPadding: 5
                    leftPadding: 5
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle {
                        width: 40
                        height: 15
                        color: captured_color
                        border.color: activePalette.highlight
                        border.width: 1
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Button {
                        height: buttonHeight
                        text: "Set"
                        font.pixelSize: fontPixelSize
                        onClicked: {
                            my_picker.setColor(captured_color)
                        }
                    }
                }
            }

            Rectangle {
                border.width: 1
                border.color: "Gray"
                width: tests.implicitWidth
                height: tests.implicitHeight
                color: "transparent"
                Row {
                    id: tests
                    height: itemHeight
                    spacing: 5
                    rightPadding: 5
                    leftPadding: 5
                    Button {
                        height: buttonHeight
                        text: "Layout"
                        font.pixelSize: fontPixelSize
                        onClicked: {
                            my_picker.setFontCalculationWithDPM(false)
                            my_picker.layoutDefault()
                        }
                    }
                    Button {
                        height: buttonHeight
                        text: "Test1"
                        font.pixelSize: fontPixelSize
                        onClicked: {
                            my_picker.setDpm(0.7 * window.Screen.pixelDensity)
                            my_picker.layout()
                        }
                    }
                    Button {
                        height: buttonHeight
                        text: "Test2"
                        font.pixelSize: fontPixelSize
                        onClicked: {
                            my_picker.setFontCalculationWithDPM(true)
                            my_picker.setDpm(0.7 * window.Screen.pixelDensity)

                            console.debug('colorPicker.colorHandleRadius: from ' +  my_picker.getSizeValue("colorPicker.colorHandleRadius"))
                            my_picker.setSizeValue("colorPicker.colorHandleRadius", 22)
                            console.debug('colorPicker.colorHandleRadius: to ' +  my_picker.getSizeValue("colorPicker.colorHandleRadius"))

                            console.debug('colorPicker.colorHandleRadius: from ' +  my_picker.getSizeValue("colorPicker.colorHandleRadius"))
                            my_picker.setSizeValue("colorPicker.colorHandleRadius", 20)
                            console.debug('colorPicker.colorHandleRadius: to ' +  my_picker.getSizeValue("colorPicker.colorHandleRadius"))

                            my_picker.layout()
                            my_picker.setFontCalculationWithDPM(false)
                        }
                    }
                }
            }
        }

        SystemPalette {
            id: activePalette
            colorGroup: SystemPalette.Active
        }
    }

    Colorpicker {
        id: my_picker
        anchors.top: flickable.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left

        onColorChanged: (changedColor) => {
            // test signal handler
            console.debug("handle signal:"+changedColor)
        }
    }
}
