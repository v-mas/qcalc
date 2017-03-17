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
                text: qsTr("Clear")
                onTriggered: mainPage.cleanCalc()
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainPage{
        id: mainPage
        onPropagateCalcResult: {
            messageDialog.show(""+calcResult)
        }
    }

    Connections {
        target: messageReceiver
        onMessageReceived: {
            console.log("message received")
            console.log(message)
            messageDialog.show("message received: "+message)
        }
    }

    MessageDialog{
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

}
