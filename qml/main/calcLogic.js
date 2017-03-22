var enteredDigits = []
var enteredOperators = []
var one = -1.0
var accResult = 0
var isAccumulatedResultExist =  false
var firstArgumentExists = false
var secondArgumentExists = false
var firstArgument = 0
var secondArgument = 0
var cleanInNextOperation = false

function clear() {
    enteredDigits = []
    enteredOperators = []
    one = -1.0
    accResult = 0
    isAccumulatedResultExist =  false
    firstArgumentExists = false
    secondArgumentExists = false
    firstArgument = 0
    secondArgument = 0
    cleanInNextOperation = false

    displayer.text = ""
}

function pushOperator(operator) {
    enteredOperators.push(operator)
    displayer.text += operator
    calculate()
}

function pushDigit(digit) {
    enteredDigits.push(parseFloat(digit))
    displayer.text += digit
    calculate()
}

function calculate() {
    function bindEnteredDigits() {
        var digits = ""
        enteredDigits.forEach(function (digit) {
            digits += digit
        })
        return digits
    }

    function prepareCalculationResult(enteredOperator) {
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

        accResult = getResult(firstArgument, enteredOperator, secondArgument)
        cleanInNextOperation = true
        notifyCalcResult(accResult)
    }

    function notifyCalcResult(calcResult) {

        var firstEnteredOperator = getFirstEnteredOperator()
        if (firstEnteredOperator === "" || firstEnteredOperator === "=") {
            displayer.text = calcResult
        } else {
            displayer.text = calcResult + firstEnteredOperator
        }

        propagateCalcResult(calcResult)
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

    console.log("enteredOperators: " + enteredOperators)
    console.log("enteredDigits: " + enteredDigits)

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
            prepareCalculationResult(lastEnteredOperator)
            cleanArgumentsFlags()
            cleanBufors()
        } else {
            if (firstArgumentExists) {
                console.log("2")
                prepareCalculationResult(firstEnteredOperator)
            } else {
                console.log("3")
                accResult = bindedDigits
            }
            console.log("4")
            isAccumulatedResultExist = true
            cleanBufors()
        }
        cleanInNextOperation = true
        notifyCalcResult(accResult)
        console.log("Result (after =):", accResult)
    } else if (!isAccumulatedResultExist) {
        console.log("5")
        if (enteredOperators.length == 2 && secondArgumentExists == true) {
            prepareCalculationResult(lastEnteredOperator)
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
    }

    console.log("bindedDigit: " + bindedDigits)
    console.log("-----------------------")
}

function getSharableText() {
    console.log("return sharable text: "+displayer.text)
    return displayer.text
}
