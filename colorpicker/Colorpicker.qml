//  A toy QML colorpicker control, by Ruslan Shestopalyuk
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "content"

Rectangle {
    id: colorPicker

    property bool _debugLayout: false // if you want to debug layout, set to true
    property bool _layoutAcceptance: false // this will be set to true after loading automatically

    property color colorValue: "transparent"
    property bool enableAlphaChannel: true
    property bool enableDetails: true
    property real colorHandleRadius: 0
    property bool paletteMode: false
    property bool enablePaletteMode: false
    property string switchToColorPickerString: qsTr("Palette...")
    property string switchToPalleteString: qsTr("Color Picker...")

    property color _changingColorValue: paletteMode ?
                                   _rgb(paletts.paletts_color, alphaSlider.value) :
                                   _hsla(hueSlider.value, sbPicker.saturation,
                                    sbPicker.brightness, alphaSlider.value)

    on_ChangingColorValueChanged: {
        colorValue = _changingColorValue
    }
    onEnableDetailsChanged: {
        layout()
    }
    onEnablePaletteModeChanged: {
        layout()
    }
    onEnableAlphaChannelChanged: {
        layout()
    }
    onPaletteModeChanged: {
        layout()
    }

    Component.onCompleted: {
        _sizeConfig.initialize(width, height)
        _layoutAcceptance = true
        layout()
    }

    signal colorChanged(changedColor: color)
    color: "transparent"

    clip: true

    Text {
        id: paletteSwitch
        textFormat: Text.StyledText
        text: paletteMode ?
                  "<a href=\".\">" + switchToColorPickerString + "</a>" :
                  "<a href=\".\">" + switchToPalleteString + "</a>"
        visible: enablePaletteMode
        onLinkActivated: {
            paletteMode = !paletteMode
        }
        anchors.right: parent.right
        anchors.rightMargin: colorHandleRadius
    }

    RowLayout {
        id: picker
        anchors.top: enablePaletteMode ? paletteSwitch.bottom : parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        SwipeView {
            id: swipe
            clip: true
            interactive: false
            currentIndex: paletteMode ? 1 : 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: width
            Layout.maximumWidth: width
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            SBPicker {
                id: sbPicker
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                hueColor: {
                    var v = 1.0-hueSlider.value
                    console.debug("v:"+v)

                    if(0.0 <= v && v < 0.16) {
                        return Qt.rgba(1.0, 0.0, v/0.16, 1.0)
                    } else if(0.16 <= v && v < 0.33) {
                        return Qt.rgba(1.0 - (v-0.16)/0.17, 0.0, 1.0, 1.0)
                    } else if(0.33 <= v && v < 0.5) {
                        return Qt.rgba(0.0, ((v-0.33)/0.17), 1.0, 1.0)
                    } else if(0.5 <= v && v < 0.76) {
                        return Qt.rgba(0.0, 1.0, 1.0 - (v-0.5)/0.26, 1.0)
                    } else if(0.76 <= v && v < 0.85) {
                        return Qt.rgba((v-0.76)/0.09, 1.0, 0.0, 1.0)
                    } else if(0.85 <= v && v <= 1.0) {
                        return Qt.rgba(1.0, 1.0 - (v-0.85)/0.15, 0.0, 1.0)
                    } else {
                        console.log("hue value is outside of expected boundaries of [0, 1]")
                        return "red"
                    }
                }
            }

            Item {
                id: palettsHolder
                anchors.top: parent.top
                anchors.bottom: parent.bottom
//                anchors.left: sbPicker.right
                Paletts {
                    id: paletts
                    anchors.leftMargin: 8
                    anchors.topMargin: 8
                    anchors.bottomMargin: 8
                    anchors.fill:parent
                }
            }
        }

        // hue picking slider
        Item {
            id: huePicker
            visible: !paletteMode
            height: parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: width
            Layout.maximumWidth: width
            Layout.preferredHeight: parent.height
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.topMargin: colorHandleRadius
            Layout.bottomMargin: colorHandleRadius
            Layout.rightMargin: enableAlphaChannel ? 0 : colorHandleRadius

            Rectangle {
                anchors.fill: parent
                id: colorBar
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
            ColorSlider {
                id: hueSlider; anchors.fill: parent
            }
        }

        // alpha (transparency) picking slider
        Item {
            id: alphaPicker
            visible: enableAlphaChannel
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: width
            Layout.maximumWidth: width
            Layout.preferredHeight: parent.height
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.topMargin: colorHandleRadius
            Layout.bottomMargin: colorHandleRadius
            Layout.rightMargin: enableDetails ? 0 : colorHandleRadius

            Checkerboard { cellSide: 4 }
            //  alpha intensity gradient background
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#FF000000" }
                    GradientStop { position: 1.0; color: "#00000000" }
                }
            }
            ColorSlider {
                id: alphaSlider; anchors.fill: parent
            }
        }

        // details column
        Column {
            id: detailColumn
            height: parent.height
            visible: enableDetails
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: width
            Layout.maximumWidth: width
            Layout.preferredHeight: parent.height
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.topMargin: colorHandleRadius
            //Layout.bottomMargin: colorHandleRadius
            Layout.rightMargin: colorHandleRadius

            // current color/alpha display rectangle
            PanelBorder {
                id: panelBorder
                width: parent.width
                visible: enableAlphaChannel
                Checkerboard { cellSide: 5 }
                Rectangle {
                    width: parent.width; height: parent.height
                    border.width: 1; border.color: "black"
                    color: colorPicker.colorValue
                }
            }

            // "#XXXXXXXX" color value box
            PanelBorder {
                id: colorEditBox
                width: parent.width
                height: 15
                color: "transparent"
                TextInput {
                    id: colorText
                    anchors.fill: parent
                    font.pixelSize: 11
                    maximumLength: 9
                    focus: false
                    readOnly: true
                    text: _fullColorString(colorPicker.colorValue, alphaSlider.value)
                    selectByMouse: true
                    horizontalAlignment: TextInput.AlignHCenter
                    color: _activePalette.dark
                }
            }

            // H, S, B color values boxes
            Column {
                visible: !paletteMode
                width: parent.width
                NumberBox { id: hsbH; caption: "H:"; value: hueSlider.value.toFixed(2) }
                NumberBox { id: hsbS; caption: "S:"; value: sbPicker.saturation.toFixed(2) }
                NumberBox { id: hsbB; caption: "B:"; value: sbPicker.brightness.toFixed(2) }
            }

            // R, G, B color values boxes
            Column {
                width: parent.width
                NumberBox {
                    id: rgbR
                    caption: "R:"
                    value: _getChannelStr(colorPicker.colorValue, 0)
                    min: 0; max: 255
                    fontPx: numberBoxFontPixelSize
                }
                NumberBox {
                    id: rgbG
                    caption: "G:"
                    value: _getChannelStr(colorPicker.colorValue, 1)
                    min: 0; max: 255
                    fontPx: numberBoxFontPixelSize
                }
                NumberBox {
                    id: rgbB
                    caption: "B:"
                    value: _getChannelStr(colorPicker.colorValue, 2)
                    min: 0; max: 255
                    fontPx: numberBoxFontPixelSize
                }
            }

            // alpha value box
            NumberBox {
                id: alphaChannel
                visible: enableAlphaChannel
                caption: "A:"; value: Math.ceil(alphaSlider.value*255)
                min: 0; max: 255
            }
        }
    }

    //  creates color value from hue, saturation, brightness, alpha
    function _hsla(h, s, b, a) {
        var lightness = (2 - s)*b
        var satHSL = s*b/((lightness <= 1) ? lightness : 2 - lightness)
        lightness /= 2

        var c = Qt.hsla(h, satHSL, lightness, a)

        colorChanged(c)

        return c
    }

    // create rgb value
    function _rgb(rgb, a) {

        var c = Qt.rgba(rgb.r, rgb.g, rgb.b, a)

        colorChanged(c)

        return c
    }

    //  creates a full color string from color value and alpha[0..1], e.g. "#FF00FF00"
    function _fullColorString(clr, a) {
        return "#" + ((Math.ceil(a*255) + 256).toString(16).substr(1, 2) + clr.toString().substr(1, 6)).toUpperCase()
    }

    //  extracts integer color channel value [0..255] from color value
    function _getChannelStr(clr, channelIdx) {
        return parseInt(clr.toString().substr(channelIdx*2 + 1, 2), 16)
    }

    // set color from outside
    function setColor(color) {

        // color object
        var c = Qt.tint(color, "transparent")

        console.debug('set_color is called with:'+c)

        // set alpha
        alphaSlider.setValue(c.a)

        // set rgb. Now it's insufficient to update hue related component.
        colorPicker.colorValue = c
    }

    SizeConfigrator {
        id: _sizeConfig
    }

    SystemPalette {
        id: _activePalette
        colorGroup: SystemPalette.Active
    }

    function layout() {
        if(!_layoutAcceptance) {
            return
        }

        colorHandleRadius = _sizeConfig.getSizeValue("colorPicker.colorHandleRadius")
        paletteSwitch.height = _sizeConfig.getSizeValue('paletteSwitch.height')
        picker.height = colorPicker.height - (enablePaletteMode ? paletteSwitch.height : 0)
        picker.spacing = _sizeConfig.getSizeValue('picker.spacing')
        huePicker.width = _sizeConfig.getSizeValue('huePicker.width')
        alphaPicker.width = _sizeConfig.getSizeValue('alphaPicker.width')
        detailColumn.width = _sizeConfig.getSizeValue('detailColumn.width')
        detailColumn.spacing = _sizeConfig.getSizeValue('detailColumn.spacing')
        panelBorder.height = _sizeConfig.getSizeValue('panelBorder.height')
        swipe.width = colorPicker.width - (!paletteMode ? huePicker.width + picker.spacing: 0) - (enableAlphaChannel ? alphaPicker.width + picker.spacing: 0) - (enableDetails ? detailColumn.width : 0)
        sbPicker.width = swipe.width
        paletts.button_width = (paletts.width - 2.0 * colorHandleRadius) / 9.0
        paletts.button_height = paletts.height / 5.0
        paletteSwitch.font.pixelSize = _sizeConfig.getFontValue('paletteSwitch.font.pixelSize')
        colorEditBox.height = _sizeConfig.getFontValue('colorEditBox.height')
        colorText.font.pixelSize = _sizeConfig.getFontValue('colorText.font.pixelSize')

        // NumberBox related
        {
            var px = _sizeConfig.getFontValue('NumberBox.font.pixelSize')
            var caption_width = _sizeConfig.getSizeValue('NumberBox.captionBoarder.width')
            var nbox_width = _sizeConfig.getSizeValue('NumberBox.width')
            var nbox_height = _sizeConfig.getSizeValue('NumberBox.height')

            hsbH.fontPx = px
            hsbH.width = nbox_width
            hsbH.height = nbox_height
            hsbH.captionWidth = caption_width

            hsbS.fontPx = px
            hsbS.width = nbox_width
            hsbS.height = nbox_height
            hsbS.captionWidth = caption_width

            hsbB.fontPx = px
            hsbB.width = nbox_width
            hsbB.height = nbox_height
            hsbB.captionWidth = caption_width

            rgbR.fontPx = px
            rgbR.width = nbox_width
            rgbR.height = nbox_height
            rgbR.captionWidth = caption_width

            rgbG.fontPx = px
            rgbG.width = nbox_width
            rgbG.height = nbox_height
            rgbG.captionWidth = caption_width

            rgbB.fontPx = px
            rgbB.width = nbox_width
            rgbB.height = nbox_height
            rgbB.captionWidth = caption_width

            alphaChannel.fontPx = px
            alphaChannel.width = nbox_width
            alphaChannel.height = nbox_height
            alphaChannel.captionWidth = caption_width
        }

        if(_debugLayout) {
            _dump_layout()
        }
    }

    function layoutWithGuess() {
        _sizeConfig.guess()
        layout()
    }
    function layoutDefault() {
        _sizeConfig.initialize()
        layout()
    }

    function setDpm(_d) {
        _sizeConfig.setDpm(_d)
    }
    function setRefFontPixelSize(_d) {
        _sizeConfig.setRefFontPixelSize(_d)
    }
    function setFontCalculationWithDPM(_b) {
        _sizeConfig.fontCalculationWithDPM = _b
    }
    function setSizeValue(tag, _v) {
        _sizeConfig.setSizeValue(tag, _v)
    }
    function getSizeValue(tag) {
        return _sizeConfig.getSizeValue(tag)
    }

    function _dump_layout() {
        console.debug('>>> layout information:')
        console.debug('colorHandleRadius:'+colorHandleRadius)
        console.debug('colorPicker.width/height/implicitWidth/implicitHeight='+colorPicker.width+','+colorPicker.height+','+colorPicker.implicitWidth+','+colorPicker.implicitHeight)
        console.debug('picker.width/height/implicitWidth/implicitHeight='+picker.width+','+picker.height+','+picker.implicitWidth+','+picker.implicitHeight)
        console.debug('huePicker.width/height/implicitWidth/implicitHeight='+huePicker.width+','+huePicker.height+','+huePicker.implicitWidth+','+huePicker.implicitHeight)
        console.debug('alphaPicker.width/height/implicitWidth/implicitHeight='+alphaPicker.width+','+alphaPicker.height+','+alphaPicker.implicitWidth+','+alphaPicker.implicitHeight)
        console.debug('detailColumn.width/height/implicitWidth/implicitHeight='+detailColumn.width+','+detailColumn.height+','+detailColumn.implicitWidth+','+detailColumn.implicitHeight)
        console.debug('swipe.width/height/implicitWidth/implicitHeight='+swipe.width+','+swipe.height+','+swipe.implicitWidth+','+swipe.implicitHeight)
        console.debug('sbPicker.width/height/implicitWidth/implicitHeight='+sbPicker.width+','+sbPicker.height+','+sbPicker.implicitWidth+','+sbPicker.implicitHeight)
        console.debug('paletts.width/height/implicitWidth/implicitHeight='+paletts.width+','+paletts.height+','+paletts.implicitWidth+','+paletts.implicitHeight)
    }
}
