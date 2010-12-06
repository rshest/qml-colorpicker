//  Edit box (with caption), editing a number value
import Qt 4.7

Row {
    property alias  caption: captionBox.text
    property alias  value: inputBox.text
    property alias  min: numValidator.bottom
    property alias  max: numValidator.top
    property alias  decimals: numValidator.decimals

    width: 80;
    height: 15
    spacing: 4
    anchors.margins: 2
    Text {
        id: captionBox
        width: 18; height: parent.height
        color: "#AAAAAA"
        font.pixelSize: 11; font.bold: true
        horizontalAlignment: Text.AlignRight; verticalAlignment: Text.AlignBottom
        anchors.bottomMargin: 3
    }
    PanelBorder {
        height: parent.height
        anchors.leftMargin: 4;
        anchors.left: captionBox.right; anchors.right: parent.right
        TextInput {
            id: inputBox
            anchors.leftMargin: 4; anchors.topMargin: 1; anchors.fill: parent
            color: "#AAAAAA"; selectionColor: "#FF7777AA"
            font.pixelSize: 11            
            maximumLength: 10
            focus: true
            selectByMouse: true
            validator: DoubleValidator {
                id: numValidator
                bottom: 0; top: 1; decimals: 2
                notation: DoubleValidator.StandardNotation
            }
        }
    }
}


