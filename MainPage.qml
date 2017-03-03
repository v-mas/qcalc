import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "."

MainForm {
    anchors.fill: parent
    signal calculationResult(string calcResult)
    property double result
    property var enteredDigits: []
    property var enteredOperators: []

    onCalcButtonPress: {
        switch (value) {
        case "+":
        case "-":
        case "x":
        case "=":
            enteredOperators.push(value)
            break
        default:
            var digit = parseFloat(value)
            enteredDigits.push(digit)
        }
        console.log("operators: " + enteredOperators)
        console.log("digits: " + enteredDigits)

        root.displayer.append("" + value)
        calculationResult(value)
    }

    function addToArguments(digit) {}

    function addition() {
        result = result + argument
    }
}
