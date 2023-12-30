import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0
// 완
Window {
    id: selectquery_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Select Query")

    property bool selectquery_isActive1: true
    property bool selectquery_isActive2: false
    property bool selectquery_isActive3: false
    property bool selectquery_isActive4: false
    property bool selectquery_isActive5: false
    property var selectquery_situation_text;
    property string selectquery_situation_text_color;


    DatabaseManager {
        id: dbmanager3
    }

    TabBar {
        id: selectquery_bar
        width: parent.width
        currentIndex: -1

        TabButton {
            id: selectquery_button1
            text: qsTr("Scenario 1")

            onClicked: {
                selectqueryTable1.model.clear();
                selectquery_isActive1 = true;
                selectquery_isActive2 = false;
                selectquery_isActive3 = false;
                selectquery_isActive4 = false;
                selectquery_isActive5 = false;
            }
        }
        TabButton {
            id: selectquery_button2
            text: qsTr("Scenario 2")

            onClicked: {
                selectqueryTable2.model.clear();
                selectquery_textField2.text = "";
                selectquery_isActive1 = false;
                selectquery_isActive2 = true;
                selectquery_isActive3 = false;
                selectquery_isActive4 = false;
                selectquery_isActive5 = false;
            }
        }
        TabButton {
            id: selectquery_button3
            text: qsTr("Scenario 3")

            onClicked: {
                selectqueryTable3.model.clear();
                selectquery_isActive1 = false;
                selectquery_isActive2 = false;
                selectquery_isActive3 = true;
                selectquery_isActive4 = false;
                selectquery_isActive5 = false;
            }
        }
        TabButton {
            id: selectquery_button4
            text: qsTr("Scenario 4")

            onClicked: {
                selectqueryTable4.model.clear();
                selectquery_textField4.text = "";
                selectquery_isActive1 = false;
                selectquery_isActive2 = false;
                selectquery_isActive3 = false;
                selectquery_isActive4 = true;
                selectquery_isActive5 = false;
            }
        }
        TabButton {
            id: selectquery_button5
            text: qsTr("Scenario 5")

            onClicked: {
                selectqueryTable5.model.clear();
                selectquery_isActive1 = false;
                selectquery_isActive2 = false;
                selectquery_isActive3 = false;
                selectquery_isActive4 = false;
                selectquery_isActive5 = true;
            }
        }
    }

    Column {
        id: column1
        x: 13
        y: 66
        width: 614
        height: 306
        visible:selectquery_isActive1

        Row {
            id: row1
            x: 70
            width: 541
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: selectquery_element1
                text: qsTr("현재 주식 가격이 10만원 이상인 주식 종목을 정렬해서 보여줍니다.")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            Button {
                id: selectquery_execute1
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 440
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    selectqueryTable1.model.clear();
                    var query = "SELECT * FROM STOCKS_INFO WHERE PRICE >= 100000 ORDER BY PRICE;"
                    var results = dbmanager3.executeselectquery1(query)
                    for (var i = 0; i < results.length; i++) {
                        selectqueryTable1.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: selectqueryTable1
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 80 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK_NAME"; width: 170 }
            Oldcontrols.TableViewColumn { role: "PRICE"; title: "PRICE"; width: 50 }
            Oldcontrols.TableViewColumn { role: "TYPE"; title: "TYPE"; width: 150 }
            Oldcontrols.TableViewColumn { role: "MARKET"; title: "MARKET"; width: 100 }
            Oldcontrols.TableViewColumn { role: "SECTOR"; title: "SECTOR"; width: 100 }

            model: ListModel {

            }
        }
    }

    Column {
        id: column2
        x: 13
        y: 66
        width: 614
        height: 306
        visible:selectquery_isActive2

        Row {
            id: row2
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: selectquery_element2
                text: qsTr("특정 시가총액보다 큰 주식종목에 대한 정보를 가져옵니다.\n특정 시가총액을 입력하세요.")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            TextField {
                id: selectquery_textField2
                width: 100
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 380
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("")
            }

            Text {
                id: element
                text: qsTr("억원")
                anchors.left: parent.left
                anchors.leftMargin: 485
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            Button {
                id: selectquery_execute2
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 520
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    selectqueryTable2.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, F.MARKET_CAP, S.SECTOR, F.REVENUE, F.PER, F.PBR, F.ROE FROM STOCKS_INFO AS S, FUNDAMENTAL AS F WHERE F.MARKET_CAP >= "
                            + selectquery_textField2.text + " AND S.CODE = F.CODE ORDER BY F.MARKET_CAP;"
                    var results = dbmanager3.executeselectquery2(query)
                    for (var i = 0; i < results.length; i++) {
                        selectqueryTable2.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: selectqueryTable2
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 80 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 170 }
            Oldcontrols.TableViewColumn { role: "MARKET_CAP"; title: "MARKET CAP"; width: 70 }
            Oldcontrols.TableViewColumn { role: "SECTOR"; title: "SECTOR"; width: 150 }
            Oldcontrols.TableViewColumn { role: "REVENUE"; title: "REVENUE"; width: 70 }
            Oldcontrols.TableViewColumn { role: "PER"; title: "PER"; width: 50 }
            Oldcontrols.TableViewColumn { role: "PBR"; title: "PBR"; width: 50 }
            Oldcontrols.TableViewColumn { role: "ROE"; title: "ROE"; width: 50 }

            model: ListModel {

            }
        }
    }

    Column {
        id: column3
        x: 13
        y: 66
        width: 614
        height: 306
        visible:selectquery_isActive3

        Row {
            id: row3
            x: 70
            width: 550
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: selectquery_element3
                text: qsTr("투자자들 사이에서 매매가 가장 많은 주식 종목을 보여줍니다.")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            Button {
                id: selectquery_execute3
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 450
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    selectqueryTable3.model.clear();
                    var query = "SELECT S.CODE, S.STOCK_NAME, S.PRICE, S.SECTOR, F.MARKET_CAP, F.PER
                                FROM STOCKS_INFO AS S, FUNDAMENTAL AS F
                                WHERE S.CODE = F.CODE
                                AND S.CODE = (SELECT TOP 1 CODE FROM HISTORY GROUP BY CODE ORDER BY COUNT(CODE) DESC);"
                    var results = dbmanager3.executeselectquery3(query)
                    for (var i = 0; i < results.length; i++) {
                        selectqueryTable3.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: selectqueryTable3
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 80 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 170 }
            Oldcontrols.TableViewColumn { role: "PRICE"; title: "PRICE"; width: 70 }
            Oldcontrols.TableViewColumn { role: "SECTOR"; title: "SECTOR"; width: 150 }
            Oldcontrols.TableViewColumn { role: "MARKET_CAP"; title: "시가총액(억원)"; width: 80 }
            Oldcontrols.TableViewColumn { role: "PER"; title: "PER"; width: 50 }

            model: ListModel {

            }
        }
    }

    Column {
        id: column4
        x: 13
        y: 66
        width: 614
        height: 306
        visible:selectquery_isActive4

        Row {
            id: row4
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: selectquery_element4
                text: qsTr("투자자가 매수하고 매도하지 않은 주식 종목 중에 한 종목에\n대해 현재 수익률을 보여줍니다. 투자자 계좌를 입력해주세요")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            TextField {
                id: selectquery_textField4
                width: 130
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 390
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: selectquery_execute4
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 530
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    selectqueryTable4.model.clear();
                    selectqueryTable4.currentRow = -1;
                    var query = "SELECT S.CODE, S.STOCK_NAME, H.AVERAGE_PRICE, S.PRICE FROM HISTORY AS H, STOCKS_INFO AS S WHERE INVESTOR_ACCOUNT = "
                            + selectquery_textField4.text + " AND S.CODE = H.CODE AND H.TYPE = 'BUY' AND H.NUMBER NOT IN (SELECT C.BUY_NUM FROM CONTAINS_HISTORY AS C);"
                    var results = dbmanager3.executeselectquery4(query)
                    for (var i = 0; i < results.length; i++) {
                        selectqueryTable4.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: selectqueryTable4
            width: 410
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40

            Oldcontrols.TableViewColumn { role: "CODE"; title: "CODE"; width: 70 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "STOCK NAME"; width: 170 }
            Oldcontrols.TableViewColumn { role: "AVERAGE_PRICE"; title: "평균 단가"; width: 80 }
            Oldcontrols.TableViewColumn { role: "PRICE"; title: "현재 가격"; width: 80 }

            model: ListModel {

            }
        }

        Text {
            id: selectquery_element4_1
            text: qsTr("선택한 종목의 수익률")
            anchors.left: parent.left
            anchors.leftMargin: 430
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
        Text {
            id: selectquery_element4_2
            color: if (selectquery_situation_text >= 0) {
                       selectquery_situation_text_color = "#ff2626"
                   }
                   else {
                       selectquery_situation_text_color = "#0473d5"
                   }
            text: valuation_text()
            anchors.top: parent.top
            anchors.topMargin: 180
            anchors.left: parent.left
            anchors.leftMargin: 485
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16

            function valuation_text() {
                selectquery_situation_text = ((selectqueryTable4.model.get(selectqueryTable4.currentRow).PRICE - selectqueryTable4.model.get(selectqueryTable4.currentRow).AVERAGE_PRICE)
                                                /selectqueryTable4.model.get(selectqueryTable4.currentRow).AVERAGE_PRICE) * 100
                return selectquery_situation_text.toFixed(2) + "%"
            }
        }
    }

    Column {
        id: column5
        x: 13
        y: 66
        width: 614
        height: 306
        visible:selectquery_isActive5

        Row {
            id: row5
            x: 70
            width: 541
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: selectquery_element5
                text: qsTr("특정 투자자의 관심종목을 보여줍니다.\n특정 투자자의 계좌번호를 적으세요.")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            TextField {
                id: selectquery_textField5
                width: 150
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 270
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("")
            }

            Button {
                id: selectquery_execute5
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 440
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    selectqueryTable5.model.clear();
                    var query = "SELECT STOCK_CODE, STOCK_NAME, STOCK_HOLDINGS FROM MY_INTERESTING_STOCK WHERE INVESTOR_ACCOUNT = " + selectquery_textField5.text + ";"
                    var results = dbmanager3.executeselectquery5(query)
                    for (var i = 0; i < results.length; i++) {
                        selectqueryTable5.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: selectqueryTable5
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Oldcontrols.TableViewColumn { role: "STOCK_CODE"; title: "CODE"; width: 100 }
            Oldcontrols.TableViewColumn { role: "STOCK_NAME"; title: "NAME"; width: 250 }
            Oldcontrols.TableViewColumn { role: "STOCK_HOLDINGS"; title: "주식 보유 여부"; width: 100 }

            model: ListModel {

            }
        }
    }
}

/*##^##
Designer {
    D{i:22;anchors_y:85}D{i:23;anchors_y:85}D{i:34;anchors_y:85}D{i:33;anchors_y:85}D{i:38;anchors_y:126}
D{i:39;anchors_y:126}D{i:40;anchors_y:126}D{i:32;anchors_y:85}D{i:48;anchors_y:126}
D{i:49;anchors_y:126}D{i:47;anchors_y:126}
}
##^##*/
