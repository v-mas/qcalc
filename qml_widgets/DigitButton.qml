import QtQuick 2.5

CalcButton {
    property int digit
    text: digit
    signal digitClicked(int value)

    onClicked: digitClicked(digit)
}
