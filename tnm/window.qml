import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "qml"

Rectangle{
    id: rectangle1
    visible: true

Rectangle {
    id: menu
    z: 1
    width: parent.width  ;
    height: 75



    Component {

        id: appDelegate
        Rectangle {
            width: genericText.width + 10; height: parent.height
            id: wrapper
            color: PathView.isCurrentItem ? "yellow" : "white"
            Text {
                id: genericText
                height: parent.height
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
//                anchors.topMargin: wrapper.top
                color: wrapper.PathView.isCurrentItem ? "red" : "black"
                text: name
            }

            MouseArea {
              //  width:parent.width; height: parent.height
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    var List = mWindow.printi(name)
                    t.content = List[1]
                    node.content = List[2]
                    mets.content = List[3]
                    view.currentIndex = index


            }

        }
    }
}



    PathView {
        id: view
        width: 2500
        height: parent.height
        anchors.rightMargin: 18
        anchors.bottomMargin: 0
        anchors.leftMargin: -18
        anchors.topMargin: 0
        anchors.fill: parent
//        anchors.bottom: parent.bottom
//        anchors.top: parent.top
//        preferredHighlightBegin: .1
//        preferredHighlightEnd: .6

        highlightRangeMode: PathView.StrictlyEnforceRange
//        anchors.rightMargin: 0
//        anchors.bottomMargin: 0
//        anchors.leftMargin: 2
//        anchors.topMargin: -71

        z: 1
        highlight: Component {
            Rectangle {
                color: "yellow"
                visible: PathView.onPath

            }
        }

        focus: true
        model: regionsModel
        delegate: appDelegate

        path: Path {

            startX: 0; startY: view.height *.5
            PathLine { x: menu.width; y: view.height * .5 }
        }


        }
}




Flickable {
    id: flick
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -100
 //   boundsBehavior: StopAtBounds
  anchors.top: menu.bottom
  width: parent. width
  height: parent. height
    contentWidth: parent.width
    contentHeight: container.height // this is calculated on amount of text
    PinchArea {
        width: Math.max(flick.contentWidth, flick.width)
        height: Math.max(flick.height, flick.height)
        pinch.minimumScale: 0.5
        pinch.maximumScale: 3

        property real initialWidth
        property real initialHeight
        x: 0
        y: 0
        //![0]
        onPinchStarted: {
            initialWidth = flick.contentWidth
            initialHeight = flick.contentHeight
            flick.interactive = false
        }
        onPinchUpdated: {
            t.fontSize = t.size*pinch.scale
            node.fontSize = node.size * pinch.scale
            mets.fontSize = mets.size * pinch.scale

        }

        onPinchFinished: {
            flick.returnToBounds()
            flick.interactive = true
        }




Rectangle {
    id: container
    MouseArea {
        anchors.fill: parent
        onDoubleClicked: {

                t.fontSize = 12
                node.fontSize = t.size
                mets.fontSize = t.size
            }


        }


  anchors.top: flick.top
    width: parent.width
    height: t.height + node.height + mets.height

    StageBox {
        id: t
        anchors.top: container.top
 color: "#6acbd3"
        }

    StageBox {
        id: node
        anchors.top: t.bottom
            color: "#1fd77b"
        }
StageBox {
    id: mets
    anchors.top: node.bottom
    color: "blue"
    }
}
ListModel {
    id: regionsModel
    ListElement {
        name: "Stomach"
    }
    ListElement {
        name: "Lung"
    }
    ListElement {
        name: "Colorectal"
    }
    ListElement {
        name: "Pancreas"
    }
    ListElement {
        name: "Urinary Bladder"
    }

}

    }
}


}
