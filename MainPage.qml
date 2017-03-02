import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

MainForm {
    anchors.fill: parent

    onCalcButtonPress: {
        console.log("calc value: "+value)
        root.displayer.append(""+value)
    }
}
