import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import TableModel 1.0
import Newtableviewcolumn 1.0

Window {
    id: main_window
    width: 640
    height: 400
    visible: true
    title: qsTr("DB - STOCK")

    Column {
        id: main_column
        width: 350
        height: 350
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: main_Title
            width: 80
            height: 25
            text: qsTr("STOCK")
            anchors.top: parent.top
            font.pixelSize: 25
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Tahoma"
        }

        Grid {
            id: mainmenu_grid
            width: 350
            height: 100
            anchors.top: parent.top
            spacing: 20
            anchors.topMargin: 200
            rows: 2
            columns: 3

            Button {
                id: button1
                text: qsTr("Schema Check")

                onClicked: {
                    mainld.source = ""
                    mainld.source = "SchemaCheck.qml"
                }
            }
            Button {
                id: button2
                text: qsTr("Custom Query")

                onClicked: {
                    mainld.source = ""
                    mainld.source = "CustomQuery.qml"
                }
            }
            Button {
                id: button3
                text: qsTr("Select Query")

                onClicked: {
                    mainld.source = ""
                    mainld.source = "SelectQuery.qml"
                }
            }
            Button {
                id: button4
                text: qsTr("Insert Query")
                onClicked: {
                    mainld.source = ""
                    mainld.source = "InsertQuery.qml"
                }
            }
            Button {
                id: button5
                text: qsTr("Delete Query")
                onClicked: {
                    mainld.source = ""
                    mainld.source = "DeleteQuery.qml"
                }
            }
            Button {
                id: button6
                text: qsTr("Update Query")
                onClicked: {
                    mainld.source = ""
                    mainld.source = "UpdateQuery.qml"
                }
            }
        }
    }

    Loader {
        id: mainld
        anchors.fill: parent
    }
}
