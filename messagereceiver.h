#ifndef MESSAGERECEIVER_H
#define MESSAGERECEIVER_H

#include <QObject>
#include <QString>

class MessageReceiver : public QObject
{
    Q_OBJECT

public:
    MessageReceiver(): QObject(nullptr){}

signals:
    void messageReceived(QString) const;
};

#endif // MESSAGERECEIVER_H

