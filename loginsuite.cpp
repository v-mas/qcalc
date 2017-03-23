#include "loginsuite.h"
#include <QOAuth2AuthorizationCodeFlow>
#include <QOAuthHttpServerReplyHandler>
#include <QDesktopServices>
#include <QDebug>

LoginSuite::LoginSuite(QObject *parent)
    : QObject(parent),
      m_provider(LoginSuite::PROVIDER::Google)
{

}

void LoginSuite::login()
{
    if (flow) {
        this->logout();
    }
    switch(this->m_provider) {
    case LoginSuite::PROVIDER::Google:
        qDebug() << "Logging In With Google";

        flow = new QOAuth2AuthorizationCodeFlow(this);
        flow->setScope("email");
        QObject::connect(flow, &QOAuth2AuthorizationCodeFlow::authorizeWithBrowser, &QDesktopServices::openUrl);
        flow->setAccessTokenUrl(QStringLiteral("https://accounts.google.com/o/oauth2/token"));
        flow->setAuthorizationUrl(QStringLiteral("https://accounts.google.com/o/oauth2/auth"));
        flow->setClientIdentifier(QStringLiteral("932284685991-95l3hq3559t3g56aiv0phl53t7rh19ok.apps.googleusercontent.com"));
        flow->setClientIdentifierSharedKey(QStringLiteral("ENGrpuoosOnMkX5j2u-uqo20"));
        auto replyHandler = new QOAuthHttpServerReplyHandler(8080, this);
        flow->setReplyHandler(replyHandler);

//        QObject::connect(flow, &QOAuth2AuthorizationCodeFlow::finished, this, &LoginSuite::finishedGoogle);
        QObject::connect(flow, &QOAuth2AuthorizationCodeFlow::granted, this, &LoginSuite::grantedGoogle);

        flow->grant();

        break;
    }
}

void LoginSuite::logout()
{
    qDebug() << "Logging Out (removing flow obj)";
    if (flow) {
        delete flow;
    }
}

LoginSuite::PROVIDER LoginSuite::loginProvider() const
{
    return this->m_provider;
}

void LoginSuite::setLoginProvider(LoginSuite::PROVIDER provider)
{
    if (provider != this->m_provider) {
        this->m_provider = provider;
        emit loginProviderChanged(provider);
    }
}

void LoginSuite::grantedGoogle()
{
    qDebug() << "login granted!";
    emit loginResult("OK");
}

void LoginSuite::finishedGoogle(QNetworkReply *reply)
{
    qDebug() << "finished Auth request, response: " << reply;
}
