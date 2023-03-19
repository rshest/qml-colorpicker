import QtQuick
import QtQuick.Controls

Grid {
    id: grid

    property color paletts_color : "transparent"
    property real button_width : 30
    property real button_height : 32

    rows: 5
    columns: 9
    spacing: 0
    padding: 0

    // row 0
    SinglePalette {
        target_color: "black"
        width: button_width
        height: button_height
        onCheckedChanged: () =>{
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#705958"
        width: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "red"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#c90002"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#9d0000"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#b20093" // red purple
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#c978b8"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#8d0073"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#750161"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }

    // row 1
    SinglePalette {
        target_color: "gray"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#8366b4"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "purple"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#51127c"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#400061"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#5361b5"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#1b3d9f"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#152c81"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#061967"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }

    // row 2
    SinglePalette {
        target_color: "darkgray"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#5188ca"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "blue"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#004d90"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#003d75"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#02afae"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#008c8a"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#017071"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#36c590"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }

    // row 3
    SinglePalette {
        target_color: "lightgray"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#56c222"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "green"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#018944"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#006f35"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#fcf471"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "yellow"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#cdc101"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#a39700"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }

    // row 4
    SinglePalette {
        target_color: "white"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#fdc667"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#fea200"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#cb8001"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#a66400"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#ffa566"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#ff7c00"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#cf6402"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    SinglePalette {
        target_color: "#a54b00"
        implicitWidth: button_width
        height: button_height
        onCheckedChanged: () => {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
}
