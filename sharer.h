#ifndef RESULTRECEIVER_H
#define RESULTRECEIVER_H

#include <QObject>

class Sharer : public QObject
{
    Q_OBJECT
public:
    explicit Sharer(QObject *parent = 0);

signals:

public slots:
    void share(const QString &content);

private:
};

#endif // RESULTRECEIVER_H
