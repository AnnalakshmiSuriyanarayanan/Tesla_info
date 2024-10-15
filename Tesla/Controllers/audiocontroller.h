#ifndef AUDIOCONTROLLER_H
#define AUDIOCONTROLLER_H

#include <QObject>

class AudioController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged)
public:
    explicit AudioController(QObject *parent = nullptr);

    int volumeLevel() const;

    Q_INVOKABLE void incrementVolume(const int & val);

signals:

    void volumeLevelChanged();
public slots:
    void setVolumeLevel(int newVolumeLevel);


private:

    int m_volumeLevel;
};

#endif // AUDIOCONTROLLER_H
