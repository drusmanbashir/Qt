import QtQuick 2.0

Rectangle {
    property int size: 12
    property alias content: boxText.text
    property alias fontSize: boxText.font.pointSize


    width: parent.width
    height: boxText.paintedHeight+20


    z: 5
    Text {
        id: boxText
        anchors.margins: 5

        z: 1
        font.pointSize: size
        wrapMode: Text.WordWrap
        anchors.fill: parent
}
}
