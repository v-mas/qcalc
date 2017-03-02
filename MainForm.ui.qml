import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Item {
    id: root
    width: 480
    height: 800
    Layout.minimumWidth: 480
    Layout.minimumHeight: 800
    property alias displayer: displayer

    property alias button0: button0
    property alias button9: button9
    property alias button8: button8
    property alias button7: button7
    property alias button6: button6
    property alias button5: button5
    property alias button4: button4
    property alias button3: button3
    property alias button2: button2
    property alias button1: button1
    property alias root: root

    property int bMinHeight: 32
    property int bMinWidth: 32

    signal calcButtonPress(int value)

    TextArea {
        id: displayer
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 401
        anchors.top: parent.top
        anchors.topMargin: 55
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
    }

    GridLayout {
        id: gridLayout
        y: 490
        height: 292
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 18
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 13
        columnSpacing: 10
        rowSpacing: 10
        columns: 4

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
            id: multiply
            text: "X"
        }

        CalcButton {
            id: button4
            text: "4"
            calcValue: 4
        }

        CalcButton {
            id: button5
            text: "5"
            calcValue: 5
        }

        CalcButton {
            id: button6
            text: "6"
            calcValue: 6
        }

        CalcButton {
            id: minus
            text: "-"
        }

        CalcButton {
            id: button7
            text: "7"
            calcValue: 7
        }

        CalcButton {
            id: button8
            text: "8"
            calcValue: 8
        }

        CalcButton {
            id: button9
            text: "9"
            calcValue: 9
        }

        CalcButton {
            id: add
            text: "+"
        }

        CalcButton {
            id: emptyButton1
        }

        CalcButton {
            id: button0
            text: "0"
            calcValue: 0
        }

        CalcButton {
            id: emptyButton2
        }

        CalcButton {
            id: equals
            text: "="
        }
    }
}
