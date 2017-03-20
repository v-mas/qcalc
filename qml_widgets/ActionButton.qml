import QtQuick 2.5

CalcButton {
    property string action
    text: action
    signal actionClicked(string action)

    onClicked: actionClicked(action)
}
