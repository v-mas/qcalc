import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "."

MainForm {
    anchors.fill: parent
    signal calculationResult(string calcResult)

    property var enteredDigits: []
    property var enteredOperators: []
    property double one: -1
    property double result: -1

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
        console.log("enteredOperators: " + enteredOperators)
        console.log("enteredDigits: " + enteredDigits)

        root.displayer.append("" + value)
        calculationResult(value)
        calculate()
    }

    function calculate() {
        var enteredOperatorsCount = enteredOperators.length

        var digitsCount = enteredDigits.length

        var bindedDigits = bindEnteredDigits()
        var enteredOperator = enteredOperators[0]

        if (result === -1) {
            if (enteredOperatorsCount == 1 && enteredOperator !== "=") {
                result = bindedDigits
                enteredDigits = []
                enteredOperators = []
                console.log("entered operators cleaned")
                console.log("saved first argument: " + result)
            }
        }else if(result !== -1) {
            if (enteredOperatorsCount == 1) {
                var second = parseFloat(bindedDigits)

                var newResult = getResult(result, enteredOperator, second)
                console.log("Result of: " + result + " " + enteredOperator + " "
                            + second + " is " + newResult)
                result = newResult
                enteredDigits = []
                console.log("entered digits cleaned")
            }
        }

        console.log("bindedDigit: " + bindedDigits)
        console.log("-----------------------")
    }

    function getResult(firstDigit, operator, secondDigit) {
        switch (operator) {
        case "+":
            return firstDigit + secondDigit
        case "-":
            return firstDigit - secondDigit
        case "x":
            return firstDigit * secondDigit
        }
    }

    function bindEnteredDigits() {
        var digits = ""
        enteredDigits.forEach(function (digit) {
            digits += digit
        })
        return digits
    }

    function addToArguments(digit) {}

    function addition() {
        result = result + argument
    }
}
