#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSslSocket>
#include <QtNetwork>
#include <QCoreApplication>
#include <QDebug>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QUrlQuery>
#include <QQmlContext>
#include <openssl/crypto.h>
#include "messagereceiver.h"
#include "sharer.h"

#ifdef Q_OS_ANDROID
#include <QtAndroid>
#include <QAndroidJniObject>
#endif

void sendRequest();
void replyFinished(QNetworkReply *reply);

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    qDebug() << "starting aplication";

    bool issucc = QSslSocket::supportsSsl();
    QString ver(SSLeay_version(SSLEAY_VERSION));
    QString version =  QSslSocket::sslLibraryBuildVersionString();
    QString version2 =  QSslSocket::sslLibraryVersionString();
    qDebug() << "SSL:" << issucc << " priv_vers:" << ver << "priv_verNum:" << SSLeay() << "version:" << version << "version2:" << version2;

    //sendRequest();
    qmlRegisterType<Sharer>("com.mirek.Wonderland", 1, 0, "Sharer");

#ifdef Q_OS_ANDROID
    QAndroidJniObject token = QAndroidJniObject::callStaticObjectMethod("com/example/mirek/fcmreceiver/FirebaseTokenProvider", "getDeviceToken", "()Ljava/lang/String;");
    qDebug() << "FCM Device token: " << token.toString();

    QThread * qmlThread = engine.thread();
    QThread * androidUIThread = nullptr;

    QtAndroid::runOnAndroidThreadSync(
                [&]() -> void {
                    androidUIThread = QThread::currentThread();
                    MessageReceiver::instance()->moveToThread(qmlThread);
                });

    qmlRegisterUncreatableType<MessageReceiver>("com.mirek.Receiver", 1, 0, "MessageReceiver", "do not create message receiver");
    engine.rootContext()->setContextProperty("messageReceiver", MessageReceiver::instance());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    int result = app.exec();

    MessageReceiver::instance()->moveToThread(androidUIThread);
#else
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    int result = app.exec();
#endif
    return result;
}

void sendRequest(){
     qDebug() << "Sending request...";
    // create custom temporary event loop on stack
    QEventLoop eventLoop;

    // "quit()" the event-loop, when the network request "finished()"
    QNetworkAccessManager mgr;
    QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));

    // the HTTP request
    QNetworkRequest req( QUrl( QString("http://qcalc-cbb53.firebaseio.com/.json") ) );
    QNetworkReply *reply = mgr.get(req);
    eventLoop.exec(); // blocks stack until "finished()" has been called

    if (reply->error() == QNetworkReply::NoError) {
        //success
        qDebug() << "Success" <<reply->readAll();
        delete reply;
    }
    else {
        //failure
        qDebug() << "Failure" <<reply->errorString();
        delete reply;
    }
}

