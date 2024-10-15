import QtQuick 2.15

Item {
    property string fontColor:"#d9dbdb"

    Connections{
        target: audioController
        function onVolumeLevelChanged(){
            visibleTimer.stop()
            volumeIcon.visible= false
            visibleTimer.start()
        }

    }
    Timer{
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: volumeIcon.visible=true
    }

    width: 126* (parent.width/1280)

    Rectangle{
        id: decrementButton
        anchors{
            right: volumeIcon.left
            rightMargin: 15
            top: parent.top
            bottom: parent.bottom
        }
        width: height/2
        color: "black"
        Text {
            id: decrementText
            text: "<"
            color: fontColor
            anchors.centerIn: parent
            font.pixelSize: 12
        }

        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementVolume(-1)
        }
    }



    Image {
        id: volumeIcon
        height: parent.height*.5
        fillMode: Image.PreserveAspectFit
        anchors{
            right: incrementButton.left
            rightMargin:  15
            verticalCenter: parent.verticalCenter
        }
        source:{
            if(audioController.volumeLevel<=1)
                return "qrc:/ui/assets/mute1.png"
            else if(audioController.volumeLevel<=50)
                return "qrc:/ui/assets/lowVol.jpg"
            else
                return "qrc:/ui/assets/HighVol.png"
        }

    }
    Text {
        id: volumeTextLabel
        visible: !volumeIcon.visible
        anchors{
            centerIn: volumeIcon

        }
        color: fontColor
        font.pixelSize: 24
        text: audioController.volumeLevel
    }
    Rectangle{
        id: incrementButton
        anchors{
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: height/2
        color: "black"
        Text {
            id: incrementText
            text: ">"
            color: fontColor
            anchors.centerIn: parent
            font.pixelSize: 12
        }
        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementVolume(1)
        }
    }

}
