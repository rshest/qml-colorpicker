// Checkerboard-filled rectangle
import Qt 4.7

Grid {
    property int cellSide: width/2 - 1
    property color oddColor: "gray"
    property color evenColor: "white"

    id: root
    anchors.fill: parent
    rows: height/cellSide; columns: width/cellSide
    clip: true
    Repeater {
        model: root.columns*root.rows
        Rectangle {
            width: root.cellSide; height: root.cellSide
            color: (index%2 == 0) ? root.oddColor : root.evenColor;
        }
    }
}

