import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "../config.js" as DB

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Settings")
            }

            TextField {
                id: weight
                label: "Your weight"
                placeholderText: "Your weight"
                width: page.width
                inputMethodHints: Qt.ImhDigitsOnly
                focus: true
                text: "?"
                validator: RegExpValidator { regExp: /^[0-9]+$/ }

                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: {
                    if (weight.text > 0) {
                        DB.addYou(weight.text)
                        pageStack.push(Qt.resolvedUrl("FirstPage.qml"));
                    } else {
                        //console.log("weight is < 0: "+weight.text)
                    }
                }
                Component.onCompleted: weight.text = DB.getWeight()
            }

            TextField {
                id: buttons
                label: "Buttons"
                placeholderText: "Buttons"
                width: page.width
                inputMethodHints: Qt.ImhDigitsOnly
                focus: true
                text: "?"
                validator: RegExpValidator { regExp: /^[0-9,]+$/ }

                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: {
                    DB.addButtons(buttons.text)
                    pageStack.push(Qt.resolvedUrl("FirstPage.qml"));
                    console.log(buttons.text)
                }
                Component.onCompleted: buttons.text = DB.buttonsList()
            }

            Button {
                text: "Set default values"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    //DB.deleteButtons()
                    buttons.text = "200,250,300,330,500"
                    DB.addButtons(buttons.text)
                    pageStack.push(Qt.resolvedUrl("FirstPage.qml"));
                }
            }
        }
    }
}


