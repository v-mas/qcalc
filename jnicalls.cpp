#include <jnicalls.h>
#include <QCoreApplication>
#include <QtAndroid>
#include <QtAndroidExtras>
#include "messagereceiver.h"
#include <pthread.h>
#include <unistd.h>

static JavaVM* jvm = 0;
jmethodID succ_method;

void *thread_runner(void * unused);
void CallMyCMethod(char *filepath, void *callback1, void* callback2);
void imageUploadCallback(char *json, void *completionCallback);

void *thread_runner(void * unused)
{
    void *cb = unused;
    printf("started new thread");
    usleep(3000);
    printf("finished sleeping, calling back");
    imageUploadCallback("kjdsfjkasnfk", cb);
    return NULL;
}

void CallMyCMethod(char *filepath, void *callback1, void *completionCallback)
{
    pthread_t th;
    int res = pthread_create(&th, NULL, thread_runner, completionCallback);
    if (res)
    {
        printf("unable to start thread!!!!!");
    }
}

void imageUploadCallback(char *json, void *completionCallback)
{
    JNIEnv *env;
    jint rs = jvm->AttachCurrentThread(&env, NULL);//create JNIEnv from JavaVM
    jstring abcd = env->NewStringUTF("abcd");
    jobject cbObject = static_cast<jobject>(completionCallback);
    env->CallVoidMethod(cbObject, succ_method, abcd);

    env->DeleteGlobalRef(cbObject);
    jvm->DetachCurrentThread();
}

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyApplication_jniUploadAsync(JNIEnv *env, jobject thizz, jstring imagePath, jobject callback)
{
    env->GetJavaVM(&jvm);

    jobject globalref = env->NewGlobalRef(callback);

    jboolean isCopy(JNI_FALSE);

    const char *filePath = env->GetStringUTFChars(imagePath, &isCopy);

    jclass cbClass = env->FindClass("com/example/mirek/fcmreceiver/Callback");

    succ_method = env->GetMethodID(cbClass, "success", "(Ljava/lang/Object;)V");
    env->DeleteLocalRef(cbClass);


    CallMyCMethod(strdup(filePath), (void *)&imageUploadCallback, (void *)globalref);
    env->ReleaseStringUTFChars(imagePath, filePath);
}

JNIEXPORT void JNICALL Java_com_example_mirek_fcmreceiver_MyJavaNatives_sendMessageToQt(JNIEnv *env, jobject clazz, jstring msg)
{
    Q_UNUSED(env);
    Q_UNUSED(clazz);
    QString qmsg = QAndroidJniObject::fromLocalRef(msg).toString();
    emit MessageReceiver::instance()->messageReceived(qmsg);
    return;
}
