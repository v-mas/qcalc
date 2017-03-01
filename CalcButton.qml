import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Button {
    text: "1"
    property int calcValue
    onClicked: root.buttonPress(calcValue)

    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 32
    Layout.minimumWidth: 32
}
