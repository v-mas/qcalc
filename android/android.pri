QT += androidextras

SOURCES += jnicalls.cpp

HEADERS += jnicalls.h

MODULE_DIR = $$PWD

ANDROID_PACKAGE_SOURCE_DIR = $$MODULE_DIR

DISTFILES += \
    $$MODULE_DIR/gradle/wrapper/gradle-wrapper.jar \
    $$MODULE_DIR/gradle/wrapper/gradle-wrapper.properties \
    $$MODULE_DIR/gradlew \
    $$MODULE_DIR/gradlew.bat \
    $$MODULE_DIR/build.gradle \
    $$MODULE_DIR/google-services.json \
    $$MODULE_DIR/AndroidManifest.xml \
    $$MODULE_DIR/res/values/libs.xml \
    $$MODULE_DIR/src/java/com/example/mirek/fcmreceiver/FirebaseTokenProvider.java \
    $$MODULE_DIR/src/java/com/example/mirek/fcmreceiver/MyFirebaseMessagesService.java \
    $$MODULE_DIR/jniLibs/armeabi/libcrypto.so \
    $$MODULE_DIR/jniLibs/armeabi/libssl.so \
    $$MODULE_DIR/jniLibs/x86/libcrypto.so \
    $$MODULE_DIR/jniLibs/x86/libssl.so

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$MODULE_DIR/jniLibs/armeabi/libcrypto.so \
        $$MODULE_DIR/jniLibs/armeabi/libssl.so
}

contains(ANDROID_TARGET_ARCH, x86) {
    ANDROID_EXTRA_LIBS = \
        $$MODULE_DIR/jniLibs/x86/libcrypto.so \
        $$MODULE_DIR/jniLibs/x86/libssl.so
}
