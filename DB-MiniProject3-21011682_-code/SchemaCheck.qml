import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0

Window {
    id: schemacheck_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Schema Check")

    DatabaseManager {
        id: dbManager1
    }

    Oldcontrols.TableView {
        id:schemaTable
        x: 99
        y: 88
        width: 605
        height: 260
        anchors.horizontalCenter: parent.horizontalCenter

        Oldcontrols.TableViewColumn { role: "Column Name"; title: "Column Name"; width: 170 }
        Oldcontrols.TableViewColumn { role: "Column Name Len"; title: "Column Name Len"; width: 130 }
        Oldcontrols.TableViewColumn { role: "SQL Data Type"; title: "SQL Data Type"; width: 100 }
        Oldcontrols.TableViewColumn { role: "SQL Data Size"; title: "SQL Data Size"; width: 100 }
        Oldcontrols.TableViewColumn { role: "Data Nullable"; title: "Data Nullable"; width: 100 }

        model: ListModel {

        }
    }

    Row {
        id: column_schemacheck
        x: 163
        y: 32
        width: 301
        height: 46
        transformOrigin: Item.Center
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: element_schemacheck
            text: qsTr("Table")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
        }

        ComboBox {
            id: comboBox_schemacheck
            width: 240
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 70
            anchors.verticalCenter: parent.verticalCenter
            currentIndex: -1

            model: ListModel {
                ListElement { text: "STOCKS_INFO" }
                ListElement { text: "MY_INTERESTING_STOCK" }
                ListElement { text: "INVESTOR" }
                ListElement { text: "HISTORY" }
                ListElement { text: "FUNDAMENTAL" }
                ListElement { text: "CONTAINS_HISTORY" }
            }

            onActivated: {
                schemaTable.model.clear();
                var query = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = " + "'" + currentText + "' ;";
                var results = dbManager1.schemaInfoQuery(query);
                for (var i = 0; i < results.length; i++) {
                    schemaTable.model.append(results[i]);
                }
            }
        }
    }

//    Component.onCompleted: {
//        var query = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STOCKS_INFO';"
//        var results = dbManager1.schemaInfoQuery(query);
//        for (var i = 0; i < results.length; i++) {
//           var tmp = JSON.stringify(results[i]);
//           console.log(tmp);
//        }
//    }

}
