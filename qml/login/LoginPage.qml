import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    signal loggedIn

    Button {
        anchors.centerIn: parent
        width: parent.width * 0.5
        text: qsTr("Login")
        onClicked: {
            console.log("logging in...")
            loggedIn()
        }
    }
}
