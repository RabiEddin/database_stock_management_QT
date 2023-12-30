import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0

Window {
    id: deletequery_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Delete Query")

    property bool deletequery_isActive1: true
    property bool deletequery_isActive2: false
    property bool deletequery_isActive3: false
    property bool deletequery_isActive4: false

    DatabaseManager {
        id: dbmanager4
    }

    TabBar {
        id: deletequery_bar
        width: parent.width
        currentIndex: -1
        TabButton {
            id: deletequery_button1
            text: qsTr("Scenario 1")

            onClicked: {
                deletequeryTable1.model.clear();
                deletequery_isActive1 = true;
                deletequery_isActive2 = false;
                deletequery_isActive3 = false;
                deletequery_isActive4 = false;
            }
        }
        TabButton {
            id: deletequery_button2
            text: qsTr("Scenario 2")

            onClicked: {
                deletequeryTable2.model.clear();
                deletequery_isActive1 = false;
                deletequery_isActive2 = true;
                deletequery_isActive3 = false;
                deletequery_isActive4 = false;
            }
        }
        TabButton {
            id: deletequery_button3
            text: qsTr("Scenario 3")

            onClicked: {
                deletequeryTable3.model.clear();
                deletequery_isActive1 = false;
                deletequery_isActive2 = false;
                deletequery_isActive3 = true;
                deletequery_isActive4 = false;
            }
        }
        TabButton {
            id: deletequery_button4
            text: qsTr("Scenario 4")

            onClicked: {
                deletequeryTable4.model.clear();
                deletequery_isActive1 = false;
                deletequery_isActive2 = false;
                deletequery_isActive3 = false;
                deletequery_isActive4 = true;;
            }
        }
    }

    Column {
        id: deletequery_column1
        x: 13
        y: 66
        width: 614
        height: 306
        visible:deletequery_isActive1

        Text {
            id: deletequery_element1
            text: qsTr("관심이 없어진 종목을 관심종목에서 삭제할려고 한다. 관심종목을 볼 투자자의 계좌와 삭제할 종목 코드를 적으세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            font.pixelSize: 12
        }

        Row {
            id: deletequery_row1
            x: 70
            width: 550
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: deletequery_textField1_1
                width: 150
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("계좌 번호")
            }

            TextField {
                id: deletequery_textField1_2
                width: 150
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 280
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("삭제할 주식 종목 코드")
            }

            Button {
                id: deletequery_execute1_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 180
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    deletequeryTable1.model.clear();
                    var query = "SELECT * FROM MY_INTERESTING_STOCK WHERE INVESTOR_ACCOUNT = " + deletequery_textField1_1.text +";"
                    var results = dbmanager4.executedeletequery1(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable1.model.append(results[i]);
                    }
                }
            }

            Button {
                id: deletequery_execute1_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 450
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager4.executeinsertquery("DELETE MY_INTERESTING_STOCK WHERE STOCK_CODE = " + deletequery_textField1_2.text +" AND INVESTOR_ACCOUNT = " + deletequery_textField1_1.text +";")
                    deletequeryTable1.model.clear();
                    var query = "SELECT * FROM MY_INTERESTING_STOCK WHERE INVESTOR_ACCOUNT = " + deletequery_textField1_1.text +";"
                    var results = dbmanager4.executedeletequery1(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable1.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: deletequeryTable1
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
        id: deletequery_column2
        x: 13
        y: 66
        width: 614
        height: 306
        visible:deletequery_isActive2

        Text {
            id: deletequery_element2
            text: qsTr("투자자들 중에 한 번도 거래를 하지 않은 투자자를 삭제하고자 한다.\n 한 번도 거래하지 않은 투자자들 중에 삭제할 투자자 1명의 계좌번호를 입력하세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 290
            font.pixelSize: 13
        }

        Row {
            id: deletequery_row2
            x: 70
            width: 500
            height: 35
            anchors.topMargin: 20
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: deletequery_textField2
                width: 200
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("계좌 번호")
            }

            Button {
                id: deletequery_execute2_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 300
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    deletequeryTable2.model.clear();
                    var query = "SELECT * FROM INVESTOR WHERE ACCOUNT_NUM NOT IN (SELECT INVESTOR_ACCOUNT FROM HISTORY GROUP BY INVESTOR_ACCOUNT);"
                    var results = dbmanager4.executedeletequery2(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable2.model.append(results[i]);
                    }
                }
            }

            Button {
                id: deletequery_execute2_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 400
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager4.executeinsertquery("DELETE INVESTOR WHERE ACCOUNT_NUM = " + deletequery_textField2.text +";");
                    deletequeryTable2.model.clear();
                    var query = "SELECT * FROM INVESTOR WHERE ACCOUNT_NUM NOT IN (SELECT INVESTOR_ACCOUNT FROM HISTORY GROUP BY INVESTOR_ACCOUNT);"
                    var results = dbmanager4.executedeletequery2(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable2.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: deletequeryTable2
            width: 605
            height: 240
            anchors.top: parent.top
            anchors.topMargin: 60
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "ACCOUNT_NUM"; title: "계좌 번호"; width: 170 }
            Oldcontrols.TableViewColumn { role: "INVESTOR_NAME"; title: "투자자 이름"; width: 130 }
            Oldcontrols.TableViewColumn { role: "INVESTMENT_AMOUNT"; title: "초기 자본"; width: 100 }
            Oldcontrols.TableViewColumn { role: "ACCOUNTING_DEPOSIT"; title: "투자 가능 자금(예수금)"; width: 150 }

            model: ListModel {

            }
        }
    }

    Column {
        id: deletequery_column3
        x: 13
        y: 66
        width: 614
        height: 306
        visible:deletequery_isActive3

        Row {
            id: deletequery_row3
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: deletequery_element3
                text: qsTr("거래가 없는 주식 종목들 중 하나를 삭제하려고 한다.\n삭제할 주식 종목 코드를 적으세요.")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            TextField {
                id: deletequery_textField3
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 345
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("CODE")
            }

            Button {
                id: deletequery_execute3_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 450
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    deletequeryTable3.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, F.DELIST FROM STOCKS_INFO AS S, FUNDAMENTAL AS F WHERE S.CODE = F.CODE AND (S.CODE NOT IN (SELECT H.CODE FROM HISTORY AS H GROUP BY H.CODE));"
                    var results = dbmanager4.executedeletequery3(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable3.model.append(results[i]);
                    }
                }
            }

            Button {
                id: deletequery_execute3_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 530
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    dbmanager4.executeinsertquery("DELETE STOCKS_INFO WHERE CODE = " + deletequery_textField3.text + ";")
                    deletequeryTable3.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, F.DELIST FROM STOCKS_INFO AS S, FUNDAMENTAL AS F WHERE S.CODE = F.CODE AND (S.CODE NOT IN (SELECT H.CODE FROM HISTORY AS H GROUP BY H.CODE));"
                    var results = dbmanager4.executedeletequery3(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable3.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: deletequeryTable3
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 170 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK_NAME"; width: 130 }
            Oldcontrols.TableViewColumn { role: "DELIST"; title: "상장폐지 여부"; width: 100 }

            model: ListModel {

            }
        }
    }

    Column {
        id: deletequery_column4
        x: 13
        y: 66
        width: 614
        height: 306
        visible:deletequery_isActive4

        Text {
            id: deletequery_element4
            text: qsTr("투자자가 주식 종목을 매수를 잘못하여 매수 이력을 삭제할려고 한다.\n 투자자 계좌번호와 삭제할 매수 번호를 적으세요.")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 290
            font.pixelSize: 13
        }

        Row {
            id: deletequery_row4
            x: 70
            width: 600
            height: 35
            anchors.topMargin: 20
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: deletequery_textField4_1
                width: 200
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("계좌 번호")
            }

            Button {
                id: deletequery_execute4_2
                width: 70
                height: 25
                text: qsTr("Show")
                anchors.left: parent.left
                anchors.leftMargin: 270
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    deletequeryTable4.model.clear();
                    var query = "SELECT * FROM HISTORY AS H WHERE H.INVESTOR_ACCOUNT = " + deletequery_textField4_1.text + " AND H.TYPE = 'BUY'
                                AND H.NUMBER NOT IN (SELECT BUY_NUM FROM CONTAINS_HISTORY WHERE H.NUMBER = BUY_NUM);"
                    var results = dbmanager4.executedeletequery4(query);
                    for (var i = 0; i < results.length; i++) {
                        deletequeryTable4.model.append(results[i]);
                    }
                }
            }

            TextField {
                id: deletequery_textField4_2
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 370
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("NUMBER")
            }

            Button {
                id: deletequery_execute4_1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 490
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    var foundIndex = -1;
                    for (var i = 0; i < deletequeryTable4.model.count; i++) {
                        if (deletequeryTable4.model.get(i).NUMBER === deletequery_textField4_2.text) {
                            foundIndex = i;
                            break
                        }
                    }

                    var quantity = parseInt(deletequeryTable4.model.get(foundIndex).QUANTITY)
                    var price = parseInt(deletequeryTable4.model.get(foundIndex).AVERAGE_PRICE)
                    var comission = parseInt(deletequeryTable4.model.get(foundIndex).COMMISSION)
                    var add_num = quantity * price + comission

                    dbmanager4.executeinsertquery("UPDATE INVESTOR SET ACCOUNTING_DEPOSIT += " + add_num.toString() + " WHERE ACCOUNT_NUM = " + deletequery_textField4_1.text + ";")
                    dbmanager4.executeinsertquery("DELETE FROM HISTORY WHERE NUMBER = " + deletequery_textField4_2.text + ";")
                    deletequeryTable4.model.clear();
                    var query = "SELECT * FROM HISTORY AS H WHERE H.INVESTOR_ACCOUNT = " + deletequery_textField4_1.text + " AND H.TYPE = 'BUY'
                                AND H.NUMBER NOT IN (SELECT BUY_NUM FROM CONTAINS_HISTORY WHERE H.NUMBER = BUY_NUM);"
                    var results = dbmanager4.executedeletequery4(query);
                    for (var j = 0; j < results.length; j++) {
                        deletequeryTable4.model.append(results[j]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: deletequeryTable4
            width: 605
            height: 240
            anchors.top: parent.top
            anchors.topMargin: 60
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "NUMBER"; title: "매수 번호"; width: 70 }
            Oldcontrols.TableViewColumn { role: "INVESTOR_ACCOUNT"; title: "계좌 번호"; width: 100 }
            Oldcontrols.TableViewColumn { role: "CODE"; title: "주식 코드"; width: 70 }
            Oldcontrols.TableViewColumn { role: "OPEN_DATE"; title: "매수 일자"; width: 100 }
            Oldcontrols.TableViewColumn { role: "QUANTITY"; title: "수량"; width: 50 }
            Oldcontrols.TableViewColumn { role: "AVERAGE_PRICE"; title: "평균단가"; width: 70 }
            Oldcontrols.TableViewColumn { role: "COMMISSION"; title: "수수료"; width: 70 }


            model: ListModel {

            }
        }
    }
}
