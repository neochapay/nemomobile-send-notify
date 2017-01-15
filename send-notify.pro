TARGET = send-notify

QT += qml quick


SOURCES += \
    src/main.cpp

OTHER_FILES += \
    rpm/SendNotify.changes.in \
    rpm/SendNotify.spec

DISTFILES += \
    qml/send-notify.qml \
    send-notify.desktop

target.path = /usr/bin

desktop.files = send-notify.desktop
desktop.path = /usr/share/applications

qml.files = qml/send-notify.qml
qml.path = /usr/share/send-notify/qml

INSTALLS += target desktop qml
