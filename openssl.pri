OPENSSL_DIR = C:/OpenSSL-Win32
#!! to make app run with openSSL, you need to add step to build:
#!!       make install
#!! it will copy openssl files to directory with executable

win32 {
    #static libraries:
    #    LIBS += -L$${OPENSSL_DIR}/lib -lubsec
    #    PRE_TARGETDEPS += $${OPENSSL_DIR}/lib/ubsec.lib
    #shared libraries:
    #    LIBS += "$${OPENSSL_DIR}/libeay32.dll" "$${OPENSSL_DIR}/libssl32.dll" "$${OPENSSL_DIR}/ssleay32.dll"
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD/release
    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/debug

    dllossl.path  =  "$${DESTDIR}"
    dllossl.files += "$${OPENSSL_DIR}/libeay32.dll"
    dllossl.files += "$${OPENSSL_DIR}/libssl32.dll"
    dllossl.files += "$${OPENSSL_DIR}/ssleay32.dll"

    INSTALLS += dllossl

} else:android {

} else {

}

INCLUDEPATH += $${OPENSSL_DIR}/include
DEPENDPATH += $${OPENSSL_DIR}/include
