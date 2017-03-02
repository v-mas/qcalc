import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Button {
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 32
    Layout.minimumWidth: 32

    property int calcValue
    signal buttonPress(int value)


    onClicked: {
        console.log("clicked "+calcValue)
        buttonPress(calcValue)
    }
}
