#ifndef MESSAGERECEIVER_H
#define MESSAGERECEIVER_H

#include <QObject>
#include <QString>

class MessageReceiver : public QObject
{
    Q_OBJECT

private:
    static MessageReceiver *s_instance;

    MessageReceiver(): QObject(nullptr) {}
public:
    static MessageReceiver *instance() { return s_instance; }
signals:
    void messageReceived(const QString &message) const;
};

#endif // MESSAGERECEIVER_H

