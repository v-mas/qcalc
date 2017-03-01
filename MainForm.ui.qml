import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: item1
    width: 480
    height: 800
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias button5: button5
    property alias button4: button4
    property alias button6: button6
    property alias button7: button7
    property alias button8: button8
    property alias button9: button9
    property alias button0: button0

    property int bMinHeight: 32
    property int bMinWidth: 32

    GridLayout {
        id: gridLayout
        columnSpacing: 10
        rowSpacing: 10
        columns: 3
        anchors.top: parent.verticalCenter
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        Button {
            id: button1
            text: "1"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button2
            text: "2"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button3
            text: "3"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button4
            text: "4"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button5
            text: "5"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button6
            text: "6"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button7
            text: "7"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button8
            text: "8"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button9
            text: "9"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }

        Button {
            id: button0
            text: "0"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: bMinHeight
            Layout.minimumWidth: bMinWidth
        }
    }
}
