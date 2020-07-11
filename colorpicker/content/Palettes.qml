import QtQuick 2.0
import QtQuick.Controls 2.4

Grid {
    id: grid
    rows: 5
    columnSpacing: 0
    rowSpacing: 0

    property color paletts_color : "transparent"

    ButtonGroup {
        id: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "red"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "#b20093" // red purple
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "purple"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "#1b3d9f" // blue purple
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "blue"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "blue"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "#02afae" // blue green
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "green"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {

        ButtonGroup.group: group
    }

    Palette {
        ButtonGroup.group: group
        target_color: "#56c222" // yellow green
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
    }
    Palette {
        ButtonGroup.group: group
        target_color: "yellow"
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
    Palette {
        ButtonGroup.group: group
        target_color: "#fea200" // yellow orange
        onCheckedChanged: {
            if(checked) {
                paletts_color = target_color
            }
        }
    }
}
