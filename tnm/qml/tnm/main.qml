import QtQuick 2.0

Rectangle {
    id: page
    width: 360
    height: 360
    color: "#333333"
    MouseArea {
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 1
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    state: "Normal"

    Text {
        id: tnmLung
        x: 70
        y: 23
        width: 206
        height: 289
        text: qsTr("Text")
        visible: false
        font.pixelSize: 12
    }

    Image {
        id: icon
        x: 10
        y: 10
        source: "states.png"
    }
    }


 Rectangle {
     id: myButton
     x: 92
     y: 42
     width : 159
     height : 34

     Text {
         id: labelButt
         anchors.centerIn: parent
         text: "Lung"


     }
     MouseArea{
         id: buttonMouseArea
         anchors.rightMargin: -9
         anchors.bottomMargin: 106
         anchors.leftMargin: 0
         anchors.topMargin: 0
         anchors.fill: parent

     }
}
states: [
    State {
        name: "lung"
    }
]
}
