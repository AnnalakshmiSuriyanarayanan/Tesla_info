import QtQuick 2.15


Rectangle{
    id: bottomBar
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height/12

    Image{
        id: img2
        width: 100
        height: 100
        x: 20
        y: -30
        source: "qrc:/ui/assets/car1.png"
        fillMode: Image.PreserveAspectFit

    }
    HVACComponent{
        id: driverHVACControl
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: img2.right
            leftMargin: 150
        }
        hvacController: driverHVACHandler
    }
    HVACComponent{
        id: passengerHVACControl
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: volumeControl.left
            rightMargin: 150
        }
        hvacController: passengerHVACHandler
    }

    VolumeControlComponent{
        id: volumeControl
        anchors{
            right: parent.right
            rightMargin: 30
            top: parent.top
            bottom: parent.bottom
        }
    }
}

