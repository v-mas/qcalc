#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSslSocket>
 #include <QtNetwork>
#include <QCoreApplication>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QUrlQuery>
#include <QQmlContext>
#include <openssl/aes.h>
#include "jnicalls.h"
#include "messagereceiver.h"

void sendRequest();
void replyFinished(QNetworkReply *reply);

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterUncreatableType<MessageReceiver>("com.mirek.Receiver", 1, 0, "MessageReceiver", "do not create message receiver");

    engine.rootContext()->setContextProperty("messageReceiver", &messageReceiver);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    bool issucc = QSslSocket::supportsSsl();
    qDebug() << "issucc:" <<issucc;

    QString version =  QSslSocket::sslLibraryBuildVersionString();
    qDebug() << "issucc:" <<version;

    sendRequest();

    return app.exec();
}

void sendRequest(){

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

