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
    property string operator: "-1"
    property double result

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
        console.log("entered digits: " + enteredDigits)

        root.displayer.append("" + value)
        calculationResult(value)
        calculate()
    }

    function calculate() {
        var enteredOperatorsCount = enteredOperators.length


        var digitsCount = enteredDigits.length

        var bindedDigits = bindEnteredDigits()
        var enteredOperator = enteredOperators[0]

        if (operator === "-1") {
            if (enteredOperatorsCount == 1 && enteredOperator !== "=") {
                one = bindedDigits
                operator = enteredOperator
                enteredDigits = []
                enteredOperators = []
                console.log("entered digits cleaned")
                console.log("saved operator: " + operator)
                console.log("saved first argument: " + one)
            }
        } else {
             if (enteredOperatorsCount == 1) {
                var second = parseFloat(bindedDigits)

                var result = getResult(one, enteredOperator, second)
                console.log("Result of: " + one + " " + enteredOperator + " "
                            + second + " is " + result)
                one = result
                enteredDigits = []
                operator = "-1"
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
