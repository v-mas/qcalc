import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

CalcButton {
    id: buttonRoot

    property int pointSize: 16

    onPointSizeChanged: {animatedText.restartAnimation()}

    Component.onCompleted: {
        animatedText.runAnimation = Qt.binding(function() { return !pressed })
        pointSize = Qt.binding(function() { return height * 0.3 })
    }

    Text {
        id: animatedText
        anchors.centerIn: parent
        color: mainText.color
        text: mainText.text
        horizontalAlignment: Text.Center

        property bool runAnimation: false
        property double animVal: buttonRoot.pointSize
        font.pixelSize: animVal

        function restartAnimation() {
            anim.restart()
        }

        ParallelAnimation {
            id: anim
            running: animatedText.runAnimation

            onStarted: {
                animatedText.color = mainText.color
            }
            onStopped: {
                if (animatedText.runAnimation) start()
            }

            NumberAnimation {
                easing.type: Easing.InSine
                duration: 1200
                target: animatedText
                property: "animVal"
                from: buttonRoot.pointSize
                to: buttonRoot.pointSize*2.5
            }
            SequentialAnimation {
                PauseAnimation {
                    duration: 400
                }
                PropertyAnimation {
                    easing.type: Easing.InQuad
                    target: animatedText
                    property: "color"
                    to: "#00fcb0b0"
                    duration: 600
                }
                PauseAnimation {
                    duration: 400
                }
            }

        }
    }

    Text {
        id: mainText
        anchors.centerIn: parent
        horizontalAlignment: Text.Center
        color: "#e22424"
        text: "♥"
        font.pixelSize: buttonRoot.pointSize
    }
}
