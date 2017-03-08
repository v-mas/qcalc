#include <jnicalls.h>
#include <QCoreApplication>
#include <QDebug>

MessageReceiver messageReceiver;

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg)
{
    const char *message;
    message = env->GetStringUTFChars(msg,NULL);
    QString qmsg(message);
    qDebug() <<qmsg;
    env->ReleaseStringUTFChars(msg, message);
    emit messageReceiver.messageReceived(qmsg);
    return;
}

