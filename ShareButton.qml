import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import com.mirek.Wonderland 1.0

Button {
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 32
    Layout.minimumWidth: 32

    text: "♥"

    onClicked: {
        console.log("sharing: "+displayer.text)
        scaleAnim.start()
//        sharer.share(displayer.text)
    }

    Sharer {
        id: sharer
    }

    SequentialAnimation {
        id: scaleAnim
        PropertyAnimation {
            duration: 500
            easing.type: Easing.InQuart
            target: btnShare
            properties: "scale"
            to: 1.5
        }
        PropertyAnimation {
            easing.type: Easing.InOutSine
            duration: 10
            target: btnShare
            properties: "scale"
            to: 1
        }
    }
}
