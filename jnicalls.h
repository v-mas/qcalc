#ifndef JNICALLS_H
#define JNICALLS_H

#include <QtAndroid>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg);

#ifdef __cplusplus
}
#endif
#endif // JNICALLS_H
