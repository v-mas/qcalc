OPENSSL_DIR = C:\OpenSSL-Win64

win32 {
    LIBS += -L$${OPENSSL_DIR}/lib -lubsec
} else:android {

} else {

}
INCLUDEPATH += $${OPENSSL_DIR}/include
