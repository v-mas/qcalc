#include <jnicalls.h>
#include <QCoreApplication>
#include <QDebug>
#include <QtAndroid>
#include <QtAndroidExtras>

MessageReceiver messageReceiver;

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg)
{
    Q_UNUSED(env);
    Q_UNUSED(clazz);
    QString qmsg = QAndroidJniObject::fromLocalRef(msg).toString();
    qDebug() << qmsg;
//    emit messageReceiver.messageReceived(qmsg);
    QMetaObject::invokeMethod(&messageReceiver, "onMessageReceived", Qt::QueuedConnection, Q_ARG(QString, qmsg));
    return;
}

