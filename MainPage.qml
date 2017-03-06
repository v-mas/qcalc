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
    property double accResult: 0
    property bool isAccumulatedResultExist: false
    property bool firstArgumentExists: false
    property bool secondArgumentExists: false
    property double firstArgument
    property double secondArgument
    property bool cleanInNextOperation: false

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

        displayer.text += value
        calculate()
    }

    function calculate() {
        var enteredOperatorsCount = enteredOperators.length
        var digitsCount = enteredDigits.length
        var bindedDigits = bindEnteredDigits()

        var lastEnteredOperator = getLastEnteredOperator()
        var firstEnteredOperator = getFirstEnteredOperator()

        if (bindedDigits !== "" && lastEnteredOperator === "=") {
            console.log("1")
            console.log("first arg exists " + firstArgumentExists)
            console.log("second arg exists " + secondArgumentExists)

            if (enteredOperators.length == 2 && firstArgumentExists
                    && secondArgumentExists) {
                accResult = prepareCalculationResult(lastEnteredOperator)
                cleanArgumentsFlags()
                cleanBufors()
            } else {
                if (firstArgumentExists) {
                    console.log("2")
                    accResult = prepareCalculationResult(firstEnteredOperator)
                } else {
                    console.log("3")
                    accResult = bindedDigits
                }
                console.log("4")
                isAccumulatedResultExist = true
                cleanBufors()
            }
            calculationResult(accResult)
            console.log("Result (after =):", accResult)
        } else if (!isAccumulatedResultExist) {
            console.log("5")
            if (enteredOperators.length == 2 && secondArgumentExists == true) {
                accResult = prepareCalculationResult(lastEnteredOperator)
                cleanArgumentsFlags()

                cleanEnteredDigits()
                enteredOperators.shift()

                firstArgument = accResult
                firstArgumentExists = true
            } else if (enteredOperatorsCount == 1 && !firstArgumentExists) {
                console.log("6")

                firstArgument = parseFloat(bindedDigits)
                firstArgumentExists = true

                cleanEnteredDigits()

                console.log("saved first argument: " + firstArgument)
            } else if (enteredOperatorsCount == 1 && firstArgumentExists) {
                console.log("9")

                secondArgument = parseFloat(bindedDigits)
                secondArgumentExists = true

                console.log("saved second argument: " + secondArgument)
            }
        } else if (enteredOperators.length == 1) {
            console.log("7")
            accResult = prepareCalculationResult()
            isAccumulatedResultExist = true
            cleanBufors()
            console.log("entered digits cleaned")
        }

        console.log("bindedDigit: " + bindedDigits)
        console.log("-----------------------")
    }

    function getFirstEnteredOperator() {
        var firstEnteredOperator = ""
        var enteredOperatorsLength = enteredOperators.length
        if (enteredOperatorsLength > 0) {
            firstEnteredOperator = enteredOperators[enteredOperatorsLength - 1]
        }
        return firstEnteredOperator
    }

    function getLastEnteredOperator() {
        var lastEnteredOperator = ""
        var enteredOperatorsLength = enteredOperators.length
        if (enteredOperatorsLength > 0) {
            lastEnteredOperator = enteredOperators[0]
        }
        return lastEnteredOperator
    }

    function cleanArgumentsFlags() {
        firstArgumentExists = false
        secondArgumentExists = false
        console.log("arguments flags cleaned")
    }

    function cleanBufors() {
        enteredOperators = []
        enteredDigits = []
        console.log("buffors cleaned")
    }

    function cleanEnteredDigits() {
        enteredDigits = []
        console.log("entered digits cleaned")
    }

    function prepareCalculationResult(enteredOperator) {
        var newResult = getResult(firstArgument, enteredOperator,
                                  secondArgument)
        console.log("Result of: " + firstArgument + " " + enteredOperator + " "
                    + secondArgument + " is " + newResult)

        var firstEnteredOperator = getFirstEnteredOperator()
        if (firstEnteredOperator === "" || firstEnteredOperator === "=") {
            displayer.text = newResult
        } else {
            displayer.text = newResult + firstEnteredOperator
        }

        calculationResult(newResult)
        cleanInNextOperation = true
        return newResult
    }

    function getResult(firstDigit, operator, secondDigit) {
        switch (operator) {
        case "+":
            return firstDigit + secondDigit
        case "-":
            return firstDigit - secondDigit
        case "x":
            return firstDigit * secondDigit
        case "=":
            return accResult
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
        accResult = accResult + argument
    }
}
