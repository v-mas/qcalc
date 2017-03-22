import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 360
    height: 520
    minimumWidth: 240
    minimumHeight: 400
    title: qsTr("QCalc")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Clear")
                onTriggered: mainContainer.item.cleanCalc()
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr("&Logout")
                onTriggered: {
                    console.log("logged out");
                    pageUrl = "LoginPage.qml"
                }
            }

            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    property string pageUrl: ""
    onPageUrlChanged: {
        console.log("changing page to: "+pageUrl)
    }

    Component.onCompleted: {
        pageUrl = "LoginPage.qml"
    }

    Loader {
        id: mainContainer
        anchors.fill: parent
        source: pageUrl
    }

    Connections { // LoginPage.qml
        target: mainContainer.item
        ignoreUnknownSignals: true
        onLoggedIn: {
            console.log("logged in !!")
            pageUrl = "MainPage.qml"
        }

    }

    Connections { // MainPage.qml
        target: mainContainer.item
        ignoreUnknownSignals: true
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
