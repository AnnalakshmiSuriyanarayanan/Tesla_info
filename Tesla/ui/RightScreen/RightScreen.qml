import QtQuick 2.15
import QtLocation 5.11
import QtPositioning 5.0


Rectangle{
    id: rightScreen
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    color: "orange"
    width: parent.width*2/3

    Map{
        anchors.fill: parent
        zoomLevel: 14
        plugin: Plugin{
            name: "osm"
        }
        activeMapType: supportedMapTypes[1]
    }

    Image{
        id: lock
        width: parent.width/36
        height: parent.height/25
        x: 20
        y: 5
        source:systemHandler.carLocked?"qrc:/ui/assets/padlock.png":"qrc:/ui/assets/unlock1.png"
        MouseArea{
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
        }
    }

    Text{
        id: timedisplay
        anchors{
            left: lock.right
            bottom: lock.bottom
            leftMargin: 40
        }
        font.bold: true
        font.pixelSize: 14
        color: "black"
        text: systemHandler.currentTime
    }
    Text{
        id: dizTemp
        anchors{
            left: timedisplay.right
            bottom: timedisplay.bottom
            leftMargin: 40
        }
        font.bold: true
        font.pixelSize: 14
        color: "black"
        text: systemHandler.outdoorTemp+"°F"
    }
    Text{
        id: userName
        anchors{
            left: dizTemp.right
            bottom: dizTemp.bottom
            leftMargin: 40
        }
        font.bold: true
        font.pixelSize: 14
        color: "black"
        text: systemHandler.userName
    }
    NavigationSearchBox{
        id: navSearchBox
        width: parent.width*1/3
        height: parent.height*1/12
        anchors{
            left: lock.left
            top: lock.bottom
            topMargin: 15
        }
    }
}
