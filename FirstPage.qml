import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "../config.js" as DB

Page {
    id: page
    property int choose

    function getAm() {
        var amount = DB.getAmount(DB.today())
        if (amount >= 0) {
            return amount;
        } else {
            return amount = 0
        }
    }

    function targetCount() {
        return DB.getWeight() * 33
    }

    function percent() {
        var numb = getAm() / targetCount() * 100
        numb = numb.toFixed(0)
        if (numb >= 0) {
            return percentage.text = "That's "+ numb + " % of your target."
        } else {
            return percentage.text = "You must add your weight in settings."
        }
    }

    function targetToday() {
        var tg = targetCount()
        if (tg >= 0) {
           target.text = "Your target is "+ tg +" ml."
           return target.text;
        } else {
           return target.text = ""
        }
    }

    function textToday() {
        return today.text = "Consumed today "+getAm()+" ml.";
    }

    function send(amountOfWater) {
        if (choose === 0) {
            DB.addAmount(DB.today(),amountOfWater)
        } else {
            DB.addAmount(DB.yest(),amountOfWater)
        }
        textToday()
        percent()
    }

    function del(amountOfWater) {
        if (choose === 0) {
            DB.delAmount(DB.today(),amountOfWater)
        } else {
            DB.delAmount(DB.yest(),amountOfWater)
        }
        textToday()
        percent()
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
            }
            MenuItem {
                text: qsTr("Second")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            MenuItem {
                text: qsTr("Edit mode")
                onClicked: pageStack.push(Qt.resolvedUrl("EditMode.qml"))
            }
            MenuItem {
                text: qsTr("Statistics")
                onClicked: pageStack.push(Qt.resolvedUrl("Stat.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Sailaqua")
            }

            Label {
                id: today
                text: "?"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                Component.onCompleted: textToday()
            }

            Label {
                id: percentage
                text: "?"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                Component.onCompleted: percent()
            }

            Label {
                id: target
                text: "?"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                Component.onCompleted: targetToday()
            }

            Label {
                id: add
                text: "Add more"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }

            RemorsePopup {
                id: deleteRemorse
                onTriggered: send(DB.buttonsList(1))
            }

            Button {
                id: button1
                text: "?"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    deleteRemorse.execute("Cancel adding")
                }
                Component.onCompleted:button1.text = DB.buttonsList(1) + " ml"
            }

            Button {
                id: button2
                text: "?"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    send(DB.buttonsList(2))
                }
                Component.onCompleted:button2.text = DB.buttonsList(2) + " ml"
            }

            Button {
                id: button3
                text: "?"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    send(DB.buttonsList(3))
                }
                Component.onCompleted:button3.text = DB.buttonsList(3) + " ml"
            }

            Button {
                id: button4
                text: "?"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    send(DB.buttonsList(4))
                }
                Component.onCompleted:button4.text = DB.buttonsList(4) + " ml"
            }

            Button {
                id: button5
                text: "?"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    send(DB.buttonsList(5))
                }
                Component.onCompleted:button5.text = DB.buttonsList(5) + " ml"
            }

            TextSwitch {
                id: yesterday
                text: "Yesterday"
                onCheckedChanged: {
                    checked ? choose = 1 : choose = 0
                }
            }
        }
    }
}


