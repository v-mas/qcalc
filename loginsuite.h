#ifndef LOGINSUITE_H
#define LOGINSUITE_H

#include <QObject>
#include <QOAuth2AuthorizationCodeFlow>

class LoginSuite : public QObject
{
    Q_OBJECT
    Q_ENUMS(PROVIDER)
    Q_PROPERTY(PROVIDER loginProvider READ loginProvider WRITE setLoginProvider NOTIFY loginProviderChanged)

public:
    LoginSuite(QObject *parent = Q_NULLPTR);

    enum class PROVIDER {
        Google
    };

    PROVIDER loginProvider() const;

signals:
    void loginProviderChanged(PROVIDER provider) const;
    void loginResult(const QString &result) const;

public slots:
    void login();
    void logout();
    void setLoginProvider(PROVIDER provider);

private slots:
    void grantedGoogle();
    void finishedGoogle(QNetworkReply *reply);

private:
    PROVIDER m_provider;
    QOAuth2AuthorizationCodeFlow *flow;
};
Q_DECLARE_METATYPE(LoginSuite::PROVIDER)

#endif // LOGINSUITE_H
