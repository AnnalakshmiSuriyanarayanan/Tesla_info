import QtQuick 2.15

Rectangle{
    id: leftScreen
    anchors{
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
    }
    color:"white"
    width: parent.width*2/3

    Image{
        id: img1
        x: 20
        y: 180
        width: 400
        height: 400
        source: "qrc:/ui/assets/car2.png"
        fillMode: Image.PreserveAspectFit
    }
}
