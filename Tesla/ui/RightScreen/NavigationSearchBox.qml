import QtQuick 2.15

Rectangle{
    id: naviSearchBox
    radius: 5
    color: "#f0f0f0"

    Image{
        id: searchimg
        source: "qrc:/ui/assets/searchimg.png"
        anchors{
            left: parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }
        height: parent.height*0.75
        fillMode: Image.PreserveAspectFit
    }

    Text{
        id: holdtext
        visible: iptext.text===""
        color: "#373737"
        text: "Navigate"
        anchors{
            verticalCenter: parent.verticalCenter
            left: searchimg.right
            leftMargin: 20
        }

    }
    TextInput{
        id: iptext
        clip: true

        anchors{
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchimg.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
    }
}
