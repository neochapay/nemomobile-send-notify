import QtQuick 2.0
import QtQuick.Window 2.1

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0

import org.nemomobile.dbus 2.0

import org.nemomobile.notifications 1.0

ApplicationWindow
{
    id: main
    initialPage: Page{
        id: mainPage
        headerTools: HeaderToolsLayout {
            id: tools
            title: qsTr("Simply Notify")
        }
        Column {
            spacing: 40
            anchors.centerIn: parent

            Button{
                id: sendButton
                style: ButtonStyle {}
                text: qsTr("Send Notify")

                onClicked:{
                    simpleNotify.summary = "Hello OMP! You have notify"
                    simpleNotify.publish()
                }
            }
        }
    }

    Notification{
        id: simpleNotify
        category: "x-nemo.example"
        summary: ""
        body: ""
        itemCount: 1
        remoteActions: [ {
            "name": "default",
                "service": "ru.omprussia.notify",
                "path": "/ru/omprussia/notify",
                "iface": "ru.omprussia.notify",
                "method": "activateApp",
                "arguments": [ "Hello OMP! You have notify" ]
        }]
    }

    DBusAdaptor{
        id: dbus

        service: "ru.omprussia.notify"
        iface: "ru.omprussia.notify"
        path: "/ru/omprussia/notify"

        xml: '  <interface name="ru.omprussia.notify">' +
             '    <method name="activateApp">' +
             '      <arg name="message" type="s" direction="in"/>' +
             '    </method>' +
             '  </interface>'

        function activateApp(message)
        {
            tools.title = message
        }
    }
}
