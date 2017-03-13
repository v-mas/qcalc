#include <jnicalls.h>
#include <QCoreApplication>
#include <QtAndroid>
#include <QtAndroidExtras>
#include "messagereceiver.h"

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg)
{
    Q_UNUSED(env);
    Q_UNUSED(clazz);
    QString qmsg = QAndroidJniObject::fromLocalRef(msg).toString();
    emit MessageReceiver::instance()->messageReceived(qmsg);
    return;
}

