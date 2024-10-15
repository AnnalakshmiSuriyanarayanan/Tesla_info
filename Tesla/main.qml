import QtQuick 2.15
import QtQuick.Window 2.15
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"
Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")

    LeftScreen{
        id: leftScreen
    }

    RightScreen{
        id: rightScreen
    }

    BottamBar{
        id: bottomBar
    }
}
