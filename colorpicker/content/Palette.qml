import QtQuick 2.4
import QtQuick.Controls 2.4

CheckBox {
     id: control
     text: ""
     property string target_color : "#21be2b"
     property string border_color1 : "white"
     property string border_color2 : "darkgray"

     indicator: Rectangle {
         implicitWidth: 26
         implicitHeight: 26

         x: control.leftPadding
         y: parent.height / 2 - height / 2
         radius: 3
         border.color: (checked ? border_color1 : border_color2)
         border.width: 5

         Rectangle {
             width: 18
             height: 18
             x: 4
             y: 4
             radius: 2
             color: target_color
             visible: true
         }
     }
}
