win32 {
    #static libraries:
    #    LIBS += -L$${OPENSSL_DIR}/lib -lubsec
    #    PRE_TARGETDEPS += $${OPENSSL_DIR}/lib/ubsec.lib
    #shared libraries:
        LIBS += "$${OPENSSL_DIR}/libeay32.dll" "$${OPENSSL_DIR}/libssl32.dll" "$${OPENSSL_DIR}/ssleay32.dll"
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD/release
    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/debug

    dllossl.path  =  "$${DESTDIR}"
    dllossl.files += "$${OPENSSL_DIR}/libeay32.dll"
    dllossl.files += "$${OPENSSL_DIR}/libssl32.dll"
    dllossl.files += "$${OPENSSL_DIR}/ssleay32.dll"

    INSTALLS += dllossl

} else:android {
    equals(ANDROID_TARGET_ARCH, armeabi-v7a){
    LIBS += $$PWD/android/jniLibs/armeabi/libcrypto.so \
            $$PWD/android/jniLibs/armeabi/libssl.so
    }
    equals(ANDROID_TARGET_ARCH, x86){
    LIBS += $$PWD/android/jniLibs/x86/libcryptoArm.so \
            $$PWD/android/jniLibs/x86/libsslArm.so
    }
} else {

}

INCLUDEPATH += $${OPENSSL_DIR}/include
DEPENDPATH += $${OPENSSL_DIR}/include
