OPENSSL_DIR = C:/Qt/openssl-1.0.2k

win32 {
    LIBS += -L$${OPENSSL_DIR}/lib -lubsec
} else:android {

} else {

}
INCLUDEPATH += $${OPENSSL_DIR}/include
