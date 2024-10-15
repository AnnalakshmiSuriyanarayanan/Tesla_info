#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Controllers/system.h"
#include "Controllers/hvachandler.h"
#include "Controllers/audiocontroller.h"
#include <QQmlContext>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }
    QGuiApplication app(argc, argv);
    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    AudioController m_audioController;

    //System *system = NULL;

   // qmlRegisterType<System>("Random",1,0,"Number");


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("systemHandler",&m_systemHandler);
    engine.rootContext()->setContextProperty("driverHVACHandler",&m_driverHVACHandler);
    engine.rootContext()->setContextProperty("passengerHVACHandler",&m_passengerHVACHandler);
    engine.rootContext()->setContextProperty("audioController",&m_audioController);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}
