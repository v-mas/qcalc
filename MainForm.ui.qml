import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: root
    width: 480
    height: 800

    property int bMinHeight: 32
    property int bMinWidth: 32

    signal buttonPress(int value)

    GridLayout {
        id: gridLayout
        columnSpacing: 10
        rowSpacing: 10
        columns: 3
        anchors.top: parent.verticalCenter
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        CalcButton {
            id: button1
            text: "1"
            calcValue: 1
        }

        CalcButton {
            id: button2
            text: "2"
            calcValue: 2
        }

        CalcButton {
            id: button3
            text: "3"
            calcValue: 3
        }

        CalcButton {
            id: button4
            text: "4"
            calcValue: 4
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
