import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 480
    height: 800
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onButtonPress: buttonPress(value)
        button2.onButtonPress: buttonPress(value)
        button3.onButtonPress: buttonPress(value)
        button4.onButtonPress: buttonPress(value)
        button5.onButtonPress: buttonPress(value)
        button6.onButtonPress: buttonPress(value)
        button7.onButtonPress: buttonPress(value)
        button8.onButtonPress: buttonPress(value)
        button9.onButtonPress: buttonPress(value)
        button0.onButtonPress: buttonPress(value)

        onButtonPress: {
            messageDialog.show("clicked "+value)
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
