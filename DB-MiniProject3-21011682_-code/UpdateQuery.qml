import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0
//
Window {
    id: updatequery_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Update Query")

    property bool updatequery_isActive1: true
    property bool updatequery_isActive2: false
    property bool updatequery_isActive3: false
    property bool updatequery_isActive4: false

    DatabaseManager {
        id: dbmanager5
    }

    TabBar {
        id: updatequery_bar
        width: parent.width
        currentIndex: -1
        TabButton {
            id: updatequery_button1
            text: qsTr("Scenario 1")

            onClicked: {
                updatequeryTable1.model.clear();
                updatequery_isActive1 = true;
                updatequery_isActive2 = false;
                updatequery_isActive3 = false;
                updatequery_isActive4 = false;
            }
        }
        TabButton {
            id: updatequery_button2
            text: qsTr("Scenario 2")

            onClicked: {
                updatequeryTable2.model.clear();
                updatequery_isActive1 = false;
                updatequery_isActive2 = true;
                updatequery_isActive3 = false;
                updatequery_isActive4 = false;
            }
        }
        TabButton {
            id: updatequery_button3
            text: qsTr("Scenario 3")

            onClicked: {
                updatequeryTable3.model.clear();
                updatequery_isActive1 = false;
                updatequery_isActive2 = false;
                updatequery_isActive3 = true;
                updatequery_isActive4 = false;
            }
        }
        TabButton {
            id: updatequery_button4
            text: qsTr("Scenario 4")

            onClicked: {
                updatequeryTable4.model.clear();
                updatequery_isActive1 = false;
                updatequery_isActive2 = false;
                updatequery_isActive3 = false;
                updatequery_isActive4 = true;;
            }
        }
    }

    Column {
        id: updatequery_column1
        x: 13
        y: 66
        width: 614
        height: 306
        visible:updatequery_isActive1

        Row {
            id: updatequery_row1
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: updatequery_element1
                text: qsTr("삼성전자의 시가총액을 업데이트 하려고 한다(06/07/2023기준).")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            Button {
                id: updatequery_execute1_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 410
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    updatequeryTable1.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, S.PRICE, F.MARKET_CAP FROM STOCKS_INFO AS S, FUNDAMENTAL AS F WHERE S.CODE = F.CODE AND S.CODE = 005930;"
                    var results = dbmanager5.executeupdatequery1(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable1.model.append(results[i]);
                    }
                }
            }

            Button {
                id: updatequery_execute1_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 490
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager5.executeinsertquery("UPDATE STOCKS_INFO SET PRICE = 71000 WHERE CODE = 005930;");
                    dbmanager5.executeinsertquery("UPDATE FUNDAMENTAL SET MARKET_CAP = 4238546 WHERE CODE = 005930;");
                    updatequeryTable1.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, S.PRICE, F.MARKET_CAP FROM STOCKS_INFO AS S, FUNDAMENTAL AS F WHERE S.CODE = F.CODE AND S.CODE = 005930;"
                    var results = dbmanager5.executeupdatequery1(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable1.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: updatequeryTable1
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 100 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 200 }
            Oldcontrols.TableViewColumn { role: "PRICE"; title: "PRICE"; width: 100 }
            Oldcontrols.TableViewColumn { role: "MARKET_CAP"; title: "MARKET CAP"; width: 100 }

            model: ListModel {

            }
        }
    }

    Column {
        id: updatequery_column2
        x: 13
        y: 66
        width: 614
        height: 306
        visible:updatequery_isActive2

        Text {
            id: updatequery_element2
            text: qsTr("회사의 이름을 수정하려고 한다. 수정할 회사의 코드와 새로운 회사의 이름을 적어주세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            font.pixelSize: 14
        }

        Row {
            id: updatequery_row2
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: updatequery_textField2_1
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("CODE")
            }
            TextField {
                id: updatequery_textField2_2
                width: 150
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 170
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("NEW NAME")
            }

            Button {
                id: updatequery_execute2_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 370
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    updatequeryTable2.model.clear();
                    var query = "SELECT CODE, STOCK_NAME FROM STOCKS_INFO;"
                    var results = dbmanager5.executeupdatequery2(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable2.model.append(results[i]);
                    }
                }
            }

            Button {
                id: updatequery_execute2_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 470
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager5.executeinsertquery("UPDATE MY_INTERESTING_STOCK SET STOCK_NAME = '" + updatequery_textField2_2.text +"' WHERE STOCK_CODE = " + updatequery_textField2_1.text + ";")
                    dbmanager5.executeinsertquery("UPDATE STOCKS_INFO SET STOCK_NAME = '" + updatequery_textField2_2.text +"' WHERE CODE = " + updatequery_textField2_1.text + ";")
                    updatequeryTable2.model.clear();
                    var query = "SELECT CODE, STOCK_NAME FROM STOCKS_INFO;"
                    var results = dbmanager5.executeupdatequery2(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable2.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: updatequeryTable2
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 150 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 200 }

            model: ListModel {

            }
        }
    }

    Column {
        id: updatequery_column3
        x: 13
        y: 66
        width: 614
        height: 306
        visible:updatequery_isActive3

        Text {
            id: updatequery_element3
            text: qsTr("투자자가 추가한 관심종목 중 한 종목을 교체할려고 한다. 교체할 종목코드와 투자자 계좌번호를 적으세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            font.pixelSize: 13
        }


        Row {
            id: updatequery_row3
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: updatequery_textField3_1
                width: 150
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("계좌 번호")
            }

            TextField {
                id: updatequery_textField3_2
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 270
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("OLD CODE")
            }

            TextField {
                id: updatequery_textField3_3
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 380
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("NEW CODE")
            }

            Button {
                id: updatequery_execute3_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 180
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    updatequeryTable3.model.clear();
                    var query = "SELECT * FROM MY_INTERESTING_STOCK WHERE INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";"
                    var results = dbmanager5.executeupdatequery3(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable3.model.append(results[i]);
                    }
                }
            }

            Button {
                id: updatequery_execute3_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 490
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    var num = dbmanager5.executeinsertquery2("SELECT COUNT(*) FROM HISTORY WHERE CODE = " + updatequery_textField3_3.text + "AND INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";")
                    dbmanager5.executeinsertquery("UPDATE MY_INTERESTING_STOCK SET STOCK_CODE = " + updatequery_textField3_3.text +
                                                  ", STOCK_NAME = (SELECT STOCK_NAME FROM STOCKS_INFO WHERE CODE = " + updatequery_textField3_3.text +
                                                  ") WHERE STOCK_CODE = " + updatequery_textField3_2.text + "AND INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";")
                    if (num === 1) {
                        dbmanager5.executeinsertquery("UPDATE MY_INTERESTING_STOCK SET STOCK_HOLDINGS = 'YES' WHERE STOCK_CODE = " + updatequery_textField3_3.text + "AND INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";")
                    }
                    else {
                        dbmanager5.executeinsertquery("UPDATE MY_INTERESTING_STOCK SET STOCK_HOLDINGS = 'NO' WHERE STOCK_CODE = " + updatequery_textField3_3.text + "AND INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";")
                    }
                    updatequeryTable3.model.clear();
                    var query ="SELECT * FROM MY_INTERESTING_STOCK WHERE INVESTOR_ACCOUNT = " + updatequery_textField3_1.text + ";"
                    var results = dbmanager5.executeupdatequery3(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable3.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: updatequeryTable3
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "STOCK_CODE"; title: "CODE"; width: 100 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 200 }
            Oldcontrols.TableViewColumn { role: "STOCK_HOLDINGS"; title: "주식 보유 여부"; width: 100 }

            model: ListModel {

            }
        }
    }

    Column {
        id: updatequery_column4
        x: 13
        y: 66
        width: 614
        height: 306
        visible:updatequery_isActive4

        Text {
            id: updatequery_element4
            text: qsTr("회사가 신 사업을 시작하여 섹터를 변경하려고 한다. 변경할 회사의 코드와 새로운 섹터를 적으세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            font.pixelSize: 14
        }

        Row {
            id: updatequery_row4
            x: 70
            width: 560
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: updatequery_textField4_1
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("CODE")
            }

            TextField {
                id: updatequery_textField4_2
                width: 200
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 170
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("SECTOR")
            }

            Button {
                id: updatequery_execute4_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 390
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    updatequeryTable4.model.clear();
                    var query = "SELECT CODE, STOCK_NAME, SECTOR FROM STOCKS_INFO;"
                    var results = dbmanager5.executeupdatequery4(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable4.model.append(results[i]);
                    }
                }
            }

            Button {
                id: updatequery_execute4_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 480
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager5.executeinsertquery("UPDATE STOCKS_INFO SET SECTOR = '" + updatequery_textField4_2.text + "' WHERE CODE = " + updatequery_textField4_1.text + ";")
                    updatequeryTable4.model.clear();
                    var query = "SELECT CODE, STOCK_NAME, SECTOR FROM STOCKS_INFO;"
                    var results = dbmanager5.executeupdatequery4(query);
                    for (var i = 0; i < results.length; i++) {
                        updatequeryTable4.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: updatequeryTable4
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "STOCK_CODE"; title: "CODE"; width: 100 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 250 }
            Oldcontrols.TableViewColumn { role: "SECTOR"; title: "SECTOR"; width: 200 }

            model: ListModel {

            }
        }
    }
}
