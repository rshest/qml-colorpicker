import QtQuick

Item {
    visible: false

    property real ratio:1.0
    property real ratioFont:1.0
    property real currentDpm: 0.0
    property real currentFontPixelSize: 0.0
    property bool fontCalculationWithDPM: false

    QtObject {
        //
        // This item holds private variables
        //
        id: internal

        property real refDpm: 3.645956202882199
        property real refFontPixelSize: 14

        property string defaultSizes: '' +
            '{' +
            '   "colorPicker" : {' +
//            '     "width": 382,' +
//            '     "height": 194,' +
            '     "colorHandleRadius": 8' +
            '   },' +
            '   "paletteSwitch" : {' +
            '     "height": 16,' +
            '   "font" : {' +
            '       "pixelSize": 14' +
            '     }' +
            '   },' +
            '   "picker" : {' +
            '     "spacing": 8' +
            '   },' +
            '   "sbPicker" : {' +
            '     "width": 200' +
            '   },' +
            '   "huePicker" : {' +
            '     "width": 15' +
            '   },' +
            '   "alphaPicker" : {' +
            '     "width": 15' +
            '   },' +
            '   "detailColumn" : {' +
            '     "width": 73,' +
            '     "spacing": 3' +
            '   },' +
            '   "panelBorder" : {' +
            '     "height": 30' +
            '   },' +
            '   "colorEditBox" : {' +
            '     "height" : 15' +
            '   },' +
            '   "colorText" : {' +
            '     "font" : {' +
            '       "pixelSize": 11' +
            '     }' +
            '   },' +
            '   "NumberBox" : {' +
            '     "width" : 70,' +
            '     "height" : 15,' +
            '     "font" : {' +
            '       "pixelSize": 11' +
            '     },' +
            '     "captionBoarder" : {' +
            '       "width": 15' +
            '     }' +
            '   }' +
            '}'

        function load_default() {
            if(_debugLayout) {
                console.debug('load_default() is reading:'+defaultSizes)
            }
            sizes_json = JSON.parse(defaultSizes);
        }

        property var sizes_json: null
    }

    // utility method
    function _getValue(tag) {
        var str_list = tag.split('.')
        var tmp_json = internal.sizes_json
        for (var i = 0; i < str_list.length; i++) {
            if(i == str_list.length - 1) {
                return tmp_json[str_list[i]]
            } else {
                tmp_json = tmp_json[str_list[i]]
            }
        }
        console.log('error. unexpected tag:'+tag)
        return 0
    }

    function getSizeValue(tag) {
        if(_debugLayout) {
            console.debug('getSizeValue() is called. tag:'+tag)
        }
        var v = _getValue(tag)
        var vc = v * ratio

        if(_debugLayout) {
            console.debug('getSizeValue() returns : '+v+' * '+ratio+' = '+vc)
        }
        return vc
    }

    function getFontValue(tag) {
        if(_debugLayout) {
            console.debug('getFontValue() is called. tag:'+tag)
        }
        var v = _getValue(tag)
        var vc = v * ratioFont
        if(_debugLayout) {
            console.debug('getFontValue() returns : '+v+' * '+ratioFont+' = '+vc)
        }
        return vc
    }

    // utility method
    function setSizeValue(tag, value) {
        if(_debugLayout) {
            console.debug('setValue() is called. tag:'+tag)
        }
        var str_list = tag.split('.')
        var tmp_json = internal.sizes_json
        for (var i = 0; i < str_list.length; i++) {
            if(i == str_list.length - 1) {
                if(_debugLayout) {
                    console.debug('setValue() overrides from '+tmp_json[str_list[i]]+' to '+ value)
                }
                tmp_json[str_list[i]] = value
                return
            } else {
                tmp_json = tmp_json[str_list[i]]
            }
        }
        console.log('error. unexpected tag:'+tag)
        return 0
    }

    function setDpm(_d) {
        currentDpm = _d
        _calculate()
    }
    function setRefFontPixelSize(_d) {
        currentFontPixelSize = _d
        _calculate()
    }

    function guess(_w, _h) {
        currentDpm = window.Screen.pixelDensity
        currentFontPixelSize = window.font.pixelSize
        _calculate()
    }

    function _calculate() {
        ratio = currentDpm / internal.refDpm

        if(fontCalculationWithDPM) {
            ratioFont = ratio
        } else {
            ratioFont = currentFontPixelSize / internal.refFontPixelSize
        }

        if(_debugLayout) {
            console.debug("primary screen:"+window.Screen.name)
            console.debug("dpm:" + currentDpm +" fontPixelSize:" + currentFontPixelSize +
                          " ratio:" + ratio + " ratioFont:" + ratioFont)
        }
    }

    function initialize(_w, _h) {
        internal.load_default()
        guess(_w, _h)
    }
}
