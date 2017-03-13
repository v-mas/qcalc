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
    android/google-services.json
