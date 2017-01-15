#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif
#include <QtGui/QGuiApplication>


#include <QtQml>
#include <QtQuick/QQuickView>
#include <QtCore/QString>
#include <QScreen>
#include <QCoreApplication>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QScreen* sc = app.primaryScreen();
    if(sc){
        sc->setOrientationUpdateMask(Qt::LandscapeOrientation
                             | Qt::PortraitOrientation
                             | Qt::InvertedLandscapeOrientation
                             | Qt::InvertedPortraitOrientation);
    }
    QQmlApplicationEngine* engine = new QQmlApplicationEngine(QUrl("/usr/share/send-notify/qml/send-notify.qml"));
    QObject *topLevel = engine->rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);
    setenv("QT_QUICK_CONTROLS_STYLE", "Nemo", 1);
    engine->rootContext()->setContextProperty("__window", window);
    window->setTitle("Simple Notify");
    window->showFullScreen();
    return app.exec();
}
