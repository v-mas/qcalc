import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import "qml_widgets"

Rectangle {
    id: root
    width: 480
    height: 800
    color: "#fff"
    property alias displayer: displayer

    property alias btnShare: btnShare
    property alias btnClean: btnClean

    property alias btnAAddition: add
    property alias btnASubtraction: minus
    property alias btnAMultiplication: multiply
    property alias btnAResult: equals

    property alias btn0: button0
    property alias btn1: button1
    property alias btn2: button2
    property alias btn3: button3
    property alias btn4: button4
    property alias btn5: button5
    property alias btn6: button6
    property alias btn7: button7
    property alias btn8: button8
    property alias btn9: button9

    property alias root: root

    readonly property int defaultMargin: 10

    TextArea {
        id: displayer
        anchors.top: parent.top
        anchors.topMargin: 55
        anchors.right: parent.right
        anchors.rightMargin: defaultMargin
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: defaultMargin
        anchors.left: parent.left
        anchors.leftMargin: defaultMargin
        background: Rectangle {
            color: "#eee"
        }
    }

    GridLayout {
        id: gridLayout
        anchors.top: displayer.bottom
        anchors.topMargin: defaultMargin
        anchors.right: parent.right
        anchors.rightMargin: defaultMargin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: defaultMargin
        anchors.left: parent.left
        anchors.leftMargin: defaultMargin
        columnSpacing: 10
        rowSpacing: 10
        columns: 4

        DigitButton {
            id: button1
            digit: 1
        }

        DigitButton {
            id: button2
            digit: 2
        }

        DigitButton {
            id: button3
            digit: 3
        }

        ActionButton {
            id: multiply
            action: "x"
        }

        DigitButton {
            id: button4
            digit: 4
        }

        DigitButton {
            id: button5
            digit: 5
        }

        DigitButton {
            id: button6
            digit: 6
        }

        ActionButton {
            id: minus
            action: "-"
        }

        DigitButton {
            id: button7
            digit: 7
        }

        DigitButton {
            id: button8
            digit: 8
        }

        DigitButton {
            id: button9
            digit: 9
        }

        ActionButton {
            id: add
            action: "+"
        }

        ShareButton {
            id: btnShare
        }

        DigitButton {
            id: button0
            digit: 0
        }

        CalcButton {
            id: btnClean
            text: "C"
        }

        ActionButton {
            id: equals
            action: "="
        }
    }
}
