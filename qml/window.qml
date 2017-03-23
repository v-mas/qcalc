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
                id: menuClear
                visible: pageNum == 1
                text: qsTr("&Clear")
                onTriggered: mainContainer.item.cleanCalc()
            }
            MenuSeparator {
                visible: menuClear.visible
            }
            MenuItem {
                visible: pageNum != 0
                text: qsTr("&Login")
                onTriggered: {
                    console.log("logged out")
                    pageNum = 0
                }
            }

            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit()
            }
        }
    }

    readonly property var pageUrls: ["LoginPage.qml", "MainPage.qml"]
    property int pageNum

    onPageNumChanged: {
        console.log("change page to: [" + pageNum + "] " + pageUrls[pageNum])
    }

    Component.onCompleted: {
        pageNum = 1
    }

    Loader {
        id: mainContainer
        anchors.fill: parent
        source: pageUrls[pageNum]
    }

    Connections { // LoginPage.qml
        enabled: pageNum == 0
        target: mainContainer.item
        ignoreUnknownSignals: true
        onLoggedIn: {
            console.log("logged in !!")
            pageNum = 1
        }
    }

    Connections { // MainPage.qml
        enabled: pageNum == 1
        target: mainContainer.item
        ignoreUnknownSignals: true
        onPropagateCalcResult: {
            messageDialog.show("" + calcResult)
        }
    }

    Connections {
        enabled: pageNum != 0
        target: messageReceiver
        onMessageReceived: {
            console.log("message received")
            console.log(message)
            messageDialog.show("message received: " + message)
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption
            messageDialog.open()
        }
    }
}
