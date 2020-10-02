import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: item
    property color paletts_color : "transparent"

    Grid {
        id: grid
        rows: 5
        columnSpacing: 0
        rowSpacing: 0
        anchors.centerIn: parent

        ButtonGroup {
            id: group
        }

        // row 0
        Palette {
            ButtonGroup.group: group
            target_color: "black"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#705958"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            target_color: "red"
            ButtonGroup.group: group
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#c90002"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#9d0000"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#b20093" // red purple
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#c978b8"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#8d0073"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#750161"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }

        // row 1
        Palette {
            ButtonGroup.group: group
            target_color: "gray"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#8366b4"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "purple"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#51127c"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#400061"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#5361b5"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#1b3d9f"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#152c81"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#061967"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }

        // row 2
        Palette {
            ButtonGroup.group: group
            target_color: "darkgray"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#5188ca"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "blue"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#004d90"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#003d75"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#02afae"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#008c8a"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#017071"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#36c590"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }

        // row 3
        Palette {
            ButtonGroup.group: group
            target_color: "lightgray"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#56c222"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "green"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#018944"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#006f35"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#fcf471"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "yellow"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#cdc101"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#a39700"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }

        // row 4
        Palette {
            ButtonGroup.group: group
            target_color: "white"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#fdc667"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#fea200"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#cb8001"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#a66400"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#ffa566"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#ff7c00"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#cf6402"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
        Palette {
            ButtonGroup.group: group
            target_color: "#a54b00"
            onCheckedChanged: {
                if(checked) {
                    item.paletts_color = target_color
                }
            }
        }
    }
}
