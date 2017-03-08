#include <jnicalls.h>
#include <QCoreApplication>
#include <QDebug>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg)
{
    const char *message;
    message = env->GetStringUTFChars(msg,NULL);
    QString qmsg(message);
    qDebug() <<qmsg;
    env->ReleaseStringUTFChars(msg, message);
    return;
}

#ifdef __cplusplus
}
#endif

