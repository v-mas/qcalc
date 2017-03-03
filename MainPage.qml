import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "."

MainForm {
    anchors.fill: parent
    signal calculationResult(string calcResult)
    property double result
    property var arguments: [""] //?

    onCalcButtonPress: {
        console.log("calc value: " + value)

        var arr = ["Hi", "Hello", "Bonjour"]

        // append new value to the array
        arr.push("Hola")

        console.log(arr)

        switch (value) {
        case "+":
            addition(value)
            break
        case "-":
            break
        case "x":
            break
        case "=":
            break
        default:
            var digit = parseFloat(value)
        }

        root.displayer.append("" + result)
        calculationResult(value)
    }

    function addition() {
        result = result + argument
    }
}
