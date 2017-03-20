import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import com.mirek.Wonderland 1.0
import "calcLogic.js" as CalcLogic
import "logic/requests.js" as Requests

MainForm {
    anchors.fill: parent
    signal propagateCalcResult(string calcResult)

    Sharer {
        id: sharer
    }

    function cleanCalc() {
        CalcLogic.clear()
    }

    btn1.onDigitClicked: CalcLogic.pushDigit(value)
    btn2.onDigitClicked: CalcLogic.pushDigit(value)
    btn3.onDigitClicked: CalcLogic.pushDigit(value)
    btn4.onDigitClicked: CalcLogic.pushDigit(value)
    btn5.onDigitClicked: CalcLogic.pushDigit(value)
    btn6.onDigitClicked: CalcLogic.pushDigit(value)
    btn7.onDigitClicked: CalcLogic.pushDigit(value)
    btn8.onDigitClicked: CalcLogic.pushDigit(value)
    btn9.onDigitClicked: CalcLogic.pushDigit(value)
    btn0.onDigitClicked: CalcLogic.pushDigit(value)

    btnAAddition.onActionClicked: CalcLogic.pushOperator(action)
    btnAMultiplication.onActionClicked: CalcLogic.pushOperator(action)
    btnASubtraction.onActionClicked: CalcLogic.pushOperator(action)
    btnAResult.onActionClicked: CalcLogic.pushOperator(action)

    btnClean.onClicked: cleanCalc()
    btnShare.onClicked: sharer.share(CalcLogic.getSharableText())

    onPropagateCalcResult: {
       // Requests.makeGetRequest()
        Requests.sendResultToFirebase(calcResult)
    }
}
