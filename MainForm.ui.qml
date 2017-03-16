import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Item {
    id: root
    width: 480
    height: 800
    Layout.minimumWidth: 240
    Layout.minimumHeight: 400
    property alias displayer: displayer

    property alias btnShare: btnShare
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

    readonly property int bMinHeight: 32
    readonly property int bMinWidth: 32
    readonly property int defaultMargin: 10

    signal calcButtonPress(string value)

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

        CalcButton {
            id: button1
            text: "1"
            calcValue: "1"
        }

        CalcButton {
            id: button2
            text: "2"
            calcValue: "2"
        }

        CalcButton {
            id: button3
            text: "3"
            calcValue: "3"
        }

        CalcButton {
            id: multiply
            text: "x"
            calcValue: "x"
        }

        CalcButton {
            id: button4
            text: "4"
            calcValue: "4"
        }

        CalcButton {
            id: button5
            text: "5"
            calcValue: "5"
        }

        CalcButton {
            id: button6
            text: "6"
            calcValue: "6"
        }

        CalcButton {
            id: minus
            text: "-"
            calcValue: "-"
        }

        CalcButton {
            id: button7
            text: "7"
            calcValue: "7"
        }

        CalcButton {
            id: button8
            text: "8"
            calcValue: "8"
        }

        CalcButton {
            id: button9
            text: "9"
            calcValue: "9"
        }

        CalcButton {
            id: add
            text: "+"
            calcValue: "+"
        }

        CalcButton {
            enabled: false
        }

        CalcButton {
            id: button0
            text: "0"
            calcValue: "0"
        }

        Button {
            id: btnShare
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 32
            Layout.minimumWidth: 32
            text: "♥"
        }

        CalcButton {
            id: equals
            text: "="
            calcValue: "="
        }
    }
}
