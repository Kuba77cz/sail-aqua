import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("About")
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Sailaqua"
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Version 0.8"
                font.pixelSize: Theme.fontSizeExtraSmall
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "© kuba77"
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "2016"
            }
        }
    }
}
