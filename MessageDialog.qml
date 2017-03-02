import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

MessageDialog {
    id: messageDialog
    title: qsTr("May I have your attention, please?")
    
    function show(caption) {
        messageDialog.text = caption;
        messageDialog.open();
    }

}
