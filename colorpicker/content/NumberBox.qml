//  Edit box (with caption), editing a number value
import QtQuick
import QtQuick.Controls

Row {
    property alias  caption: captionBox.text
    property alias  value: inputBox.text
    property alias  min: numValidator.bottom
    property alias  max: numValidator.top
    property alias  decimals: numValidator.decimals
    property real fontPx: 11
    property real captionWidth: 15

    width: 80
    height: 15
    spacing: 4
    PanelBorder {
        id: captionBoarder
        height: parent.height
        width: captionWidth
        color: "transparent"
        TextInput {
            id: captionBox
            anchors.fill: parent
            font.pixelSize: fontPx; font.bold: true
            maximumLength: 3
            focus: false
            readOnly: true
            selectByMouse: true
            horizontalAlignment: TextInput.AlignLeft
            color: _activePalette.dark
        }
    }
    PanelBorder {
        id: textBorder
        height: parent.height
        width: parent.width - captionWidth - parent.spacing 
        color: "transparent"
        TextInput {
            id: inputBox
            anchors.fill: parent
            font.pixelSize: fontPx
            maximumLength: 10
            focus: false
            readOnly: true
            selectByMouse: true
            validator: DoubleValidator {
                id: numValidator
                bottom: 0; top: 1; decimals: 2
                notation: DoubleValidator.StandardNotation
            }
            horizontalAlignment: TextInput.AlignHCenter
            color: _activePalette.dark
        }
    }
}
