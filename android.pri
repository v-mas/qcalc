QT += androidextras

SOURCES += jnicalls.cpp

HEADERS += jnicalls.h

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/src/java/com/example/mirek/fcmreceiver/FirebaseTokenProvider.java \
    android/src/java/com/example/mirek/fcmreceiver/MyFirebaseMessagesService.java \
    android/google-services.json \
    $$PWD/android/jniLibs/libcrypto.so \
    $$PWD/android/jniLibs/libssl.so \
    $$PWD/android/jniLibs/arm/libcrypto.a \
    $$PWD/android/jniLibs/arm/libssl.a \
    $$PWD/android/jniLibs/x86/libcryptoArm.so \
    $$PWD/android/jniLibs/x86/libsslArm.so \
    $$PWD/android/src/java/com/example/mirek/fcmreceiver/MyApplication.java

contains(ANDROID_TARGET_ARCH, x86) {
    ANDROID_EXTRA_LIBS = $$PWD/android/jniLibs/x86/libcryptoArm.so \
                         $$PWD/android/jniLibs/x86/libsslArm.so
}
