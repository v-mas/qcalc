#ifndef JNICALLS_H
#define JNICALLS_H

#include <QtAndroid>
#include "messagereceiver.h"

#ifdef __cplusplus
extern "C" {
#endif

extern MessageReceiver messageReceiver;

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg);

#ifdef __cplusplus
}
#endif
#endif // JNICALLS_H
