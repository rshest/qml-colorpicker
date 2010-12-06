//  A toy QML colorpicker control, by Ruslan Shestopalyuk
import Qt 4.7
import "content"
import "content/ColorUtils.js" as ColorUtils

Rectangle {
    id: colorPicker
    property color colorValue: ColorUtils.hsba(hueSlider.value, sbPicker.saturation,
                                               sbPicker.brightness, alphaSlider.value)
    width: 300; height: 200
    color: "#3C3C3C"
    Row {
        anchors.fill: parent
        spacing: 3

        // saturation/brightness picker box
        SBPicker {
            id: sbPicker
            hueColor : hueSlider.value
            width: parent.height; height: parent.height
        }

        // hue picking slider
        Item {
            width: 12; height: parent.height
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 1.0;  color: "#FF0000" }
                    GradientStop { position: 0.85; color: "#FFFF00" }
                    GradientStop { position: 0.76; color: "#00FF00" }
                    GradientStop { position: 0.5;  color: "#00FFFF" }
                    GradientStop { position: 0.33; color: "#0000FF" }
                    GradientStop { position: 0.16; color: "#FF00FF" }
                    GradientStop { position: 0.0;  color: "#FF0000" }
                }
            }
            ColorSlider { id: hueSlider; anchors.fill: parent }
        }

        // alpha (transparency) picking slider
        Item {
            id: alphaPicker
            width: 12; height: parent.height
            Checkerboard { cellSide: 4 }
            //  alpha intensity gradient background
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#FF000000" }
                    GradientStop { position: 1.0; color: "#00000000" }
                }
            }
            ColorSlider { id: alphaSlider; anchors.fill: parent }
        }

        // details column
        Column {
            anchors.left: alphaPicker.right; anchors.right: parent.right
            anchors.leftMargin: 4; anchors.rightMargin: 3
            height: parent.height
            spacing: 4

            // current color/alpha display rectangle
            Rectangle {
                width: parent.width; height: 30
                Checkerboard { cellSide: 5 }
                Rectangle {
                    width: parent.width; height: 30
                    border.width: 1; border.color: "black"
                    color: colorPicker.colorValue
                }
            }

            // "#XXXXXXXX" color value box
            PanelBorder {
                id: colorEditBox
                height: 15; width: parent.width
                TextInput {
                    anchors.fill: parent
                    color: "#AAAAAA"
                    selectionColor: "#FF7777AA"
                    font.pixelSize: 11
                    maximumLength: 9
                    focus: true
                    text: ColorUtils.fullColorString(colorPicker.colorValue, alphaSlider.value)
                    selectByMouse: true
                }
            }

            // H, S, B color values boxes
            Column {
                width: parent.width
                NumberBox { caption: "H:"; value: hueSlider.value.toFixed(2) }
                NumberBox { caption: "S:"; value: sbPicker.saturation.toFixed(2) }
                NumberBox { caption: "B:"; value: sbPicker.brightness.toFixed(2) }
            }

            // filler rectangle
            Rectangle {
                width: parent.width; height: 5
                color: "transparent"
            }

            // R, G, B color values boxes
            Column {
                width: parent.width
                NumberBox {
                    caption: "R:"
                    value: ColorUtils.getChannelStr(colorPicker.colorValue, 0)
                    min: 0; max: 255
                }
                NumberBox {
                    caption: "G:"
                    value: ColorUtils.getChannelStr(colorPicker.colorValue, 1)
                    min: 0; max: 255
                }
                NumberBox {
                    caption: "B:"
                    value: ColorUtils.getChannelStr(colorPicker.colorValue, 2)
                    min: 0; max: 255
                }
            }

            // alpha value box
            NumberBox {
                caption: "A:"; value: Math.ceil(alphaSlider.value*255)
                min: 0; max: 255
            }
        }
    }
}
