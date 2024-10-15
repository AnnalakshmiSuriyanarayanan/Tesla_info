#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVACHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY targetTemperatureChanged)
public:
    explicit HVACHandler(QObject *parent = nullptr);

    Q_INVOKABLE void incrementTargetTemperature(const int & val);

    int targetTemperature() const;
    void settargetTemperature(int newTargetTemperature);

signals:

    void targetTemperatureChanged();
private:
    int m_targetTemperature;
};

#endif // HVACHANDLER_H
