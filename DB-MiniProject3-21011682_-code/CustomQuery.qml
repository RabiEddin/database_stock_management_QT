import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0
import Newtableviewcolumn 1.0

Window {
    id: customquery_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Custom Query")

    DatabaseManager {
        id: dbmanager2
    }

    property bool customquery_isActive1: true
    property bool customquery_isActive2: false
    property bool customquery_isActive3: false
    property bool customquery_isActive4: false
    property bool customquery_isActive5: false
    property bool customquery_isActive6: false
    property var customquery_situation_text;
    property string customquery_situation_text_color;

    TabBar {
        id: customquery_bar
        width: parent.width
        currentIndex: -1

        TabButton {
            text: qsTr("SQL문 실행")

            onClicked: {
                customquery_textField1.clear();
                customqueryTable1.model.clear();
                currentcolumn_num = customqueryTable1.columnCount
                if (currentcolumn_num !== 0) {
                    for (var i = 0; i < currentcolumn_num; i++) {
                        customqueryTable1.removeColumn(0)
                    }
                } // table에 기존에 있던 정보보다 삭제(초기화)
                customquery_isActive1 = true;
                customquery_isActive2 = false;
                customquery_isActive3 = false;
                customquery_isActive4 = false;
                customquery_isActive5 = false;
                customquery_isActive6 = false;
            }
        }
        TabButton {
            text: qsTr("투자자 등록")

            onClicked: {
                customquery_isActive1 = false;
                customquery_isActive2 = true;
                customquery_isActive3 = false;
                customquery_isActive4 = false;
                customquery_isActive5 = false;
                customquery_isActive6 = false;

                customquery_rectangle2_textField1.clear()
                customquery_rectangle2_textField2.clear()
                customquery_rectangle2_textField3.clear()
            }
        }
        TabButton {
            text: qsTr("주식 매수")

            onClicked: {
                customquery_isActive1 = false;
                customquery_isActive2 = false;
                customquery_isActive3 = true;
                customquery_isActive4 = false;
                customquery_isActive5 = false;
                customquery_isActive6 = false;

                customquery_rectangle3_textField1.clear()
                customquery_rectangle3_textField2.clear()
                customquery_rectangle3_textField3.clear()
                customquery_rectangle3_textField4.clear()
                customquery_rectangle3_textField5.clear()
            }
        }
        TabButton {
            text: qsTr("주식 매도")

            onClicked: {
                customquery_isActive1 = false;
                customquery_isActive2 = false;
                customquery_isActive3 = false;
                customquery_isActive4 = true;
                customquery_isActive5 = false;
                customquery_isActive6 = false;

                customquery_rectangle3_textField1.clear();
                customquery_rectangle3_textField2.clear();
                customquery_rectangle3_textField3.clear();
                customquery_rectangle3_textField4.clear();
                customquery_rectangle3_textField5.clear();
            }
        }
        TabButton {
            text: qsTr("투자자 - 종목별 수익률")

            onClicked: {
                customqueryTable5.model.clear();
                customquery_textField5.text = "";
                customquery_isActive1 = false;
                customquery_isActive2 = false;
                customquery_isActive3 = false;
                customquery_isActive4 = false;
                customquery_isActive5 = true;
                customquery_isActive6 = false;
            }
        }
        TabButton {
            text: qsTr("주식 종목 추가")

            onClicked: {
                customquery_isActive1 = false;
                customquery_isActive2 = false;
                customquery_isActive3 = false;
                customquery_isActive4 = false;
                customquery_isActive5 = false;
                customquery_isActive6 = true;

                customquery_rectangle5_textField1.clear();
                customquery_rectangle5_textField2.clear();
                customquery_rectangle5_textField3.clear();
                customquery_rectangle5_textField4.clear();
                customquery_rectangle5_textField5.clear();
                customquery_rectangle5_textField6.clear();
                customquery_rectangle5_textField7.clear();
                customquery_rectangle5_textField8.clear();
                customquery_rectangle5_textField9.clear();
                customquery_rectangle5_textField10.clear();
                customquery_rectangle5_textField11.clear();
                customquery_rectangle5_textField12.clear();
                customquery_rectangle5_textField13.clear();
            }
        }
    }

    property var currentcolumn_num;

    Rectangle {
        id: customquery_rectangle1
        x: 9
        y: 46
        width: 622
        height: 341
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            id: customquery_row1
            x: 67
            width: 544
            height: 50
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3
            visible: customquery_isActive1

            Text {
                id: customquery_element1
                text: qsTr("Custom Query")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
            }

            TextField {
                id: customquery_textField1
                width: 330
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("Write the Query!")
            }

            Button {
                id: customquery_button1
                text: qsTr("Execute")
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    customqueryTable1.model.clear();
                    currentcolumn_num = customqueryTable1.columnCount
                    if (currentcolumn_num !== 0) {
                        for (var i = 0; i < currentcolumn_num; i++) {
                            customqueryTable1.removeColumn(0)
                        }
                    } // table에 기존에 있던 정보보다 삭제(초기화)

                    var query = customquery_textField1.text
                    var results = dbmanager2.fetchColumnName(query)
                    for (var j = 0; j < results.length; j++) {
                        var newColumn = Qt.createQmlObject('import QtQuick 2.14; import QtQuick.Controls 2.5; import QtQuick.Controls 1.4 as Oldcontrols; Oldcontrols.TableViewColumn { resizable: true }', customqueryTable1);
                        newColumn.title = results[j]
                        newColumn.role = results[j]
                        newColumn.width = 100;
                        customqueryTable1.addColumn(newColumn)
                    } // 쿼리 결과(table)에서 tableviewcolumn을 가져와서 table에 새로 입력

                    var queryresults = dbmanager2.executecustomquery(query)
                    for (var k = 0; k < queryresults.length; k++) {
                        customqueryTable1.model.append(queryresults[k])
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: customqueryTable1
            x: 99
            width: 605
            height: 260
            anchors.top: parent.top
            anchors.topMargin: 70
            anchors.horizontalCenter: parent.horizontalCenter
            visible: customquery_isActive1

            model: ListModel {
            }
        }
    }
    Rectangle {
        id: customquery_rectangle2
        x: 8
        y: 50
        width: 640
        height: 350
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: customquery_isActive2

        Text {
            id: customquery_rectangle2_element1
            x: 90
            y: 40
            text: qsTr("새로운 계좌 번호(9자리)")
            font.pixelSize: 16
        }

        TextField {
            id: customquery_rectangle2_textField1
            x: 360
            y: 31
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle2_element2
            x: 90
            y: 92
            text: qsTr("새로운 투자자 이름")
            font.pixelSize: 16
        }

        TextField {
            id: customquery_rectangle2_textField2
            x: 360
            y: 85
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle2_element3
            x: 90
            y: 146
            text: qsTr("초기 자본 금액")
            font.pixelSize: 16
        }

        TextField {
            id: customquery_rectangle2_textField3
            x: 360
            y: 139
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: customquery_rectangle2_button1
            x: 270
            y: 250
            text: qsTr("Execute")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var query = "INSERT INTO INVESTOR VALUES ("
                        + customquery_rectangle2_textField1.text + ", "
                        + "'" + customquery_rectangle2_textField2.text + "', "
                        + customquery_rectangle2_textField3.text + ", "
                        + customquery_rectangle2_textField3.text + ");"

                dbmanager2.executeinsertquery(query);

                customquery_rectangle2_textField1.clear()
                customquery_rectangle2_textField2.clear()
                customquery_rectangle2_textField3.clear()
            }
        }
    }
    Rectangle {
        id: customquery_rectangle3
        x: 8
        y: 50
        width: 640
        height: 350
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: customquery_isActive3

        Text {
            id: customquery_rectangle3_element1
            x: 132
            y: 20
            text: qsTr("매수 종목 코드")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle3_textField1
            x: 300
            y: 12
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle3_element2
            x: 132
            y: 70
            text: qsTr("투자자 계좌 번호")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle3_textField2
            x: 300
            y: 62
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle3_element3
            x: 132
            y: 120
            text: qsTr("매수 일자(MM/DD/YYYY)")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle3_textField3
            x: 300
            y: 112
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle3_element4
            x: 132
            y: 170
            text: qsTr("수량")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle3_textField4
            x: 300
            y: 160
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle3_element5
            x: 132
            y: 220
            text: qsTr("매수 단가")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle3_textField5
            x: 300
            y: 212
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: customquery_rectangle3_button1
            x: 270
            y: 264
            text: qsTr("Execute")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var num = dbmanager2.executeinsertquery2("SELECT TOP 1 NUMBER FROM HISTORY ORDER BY NUMBER DESC;")
                num += 1;
                var accounting_deposit = dbmanager2.executeinsertquery2("SELECT ACCOUNTING_DEPOSIT FROM INVESTOR WHERE ACCOUNT_NUM = " + customquery_rectangle3_textField2.text + ";")
                var required_num = parseInt(customquery_rectangle3_textField4.text) * parseInt(customquery_rectangle3_textField5.text)

                if (accounting_deposit > required_num + required_num * 0.015) {
                    var query = "INSERT INTO HISTORY VALUES ("
                            + num + ", "
                            + customquery_rectangle3_textField1.text + ", "
                            + customquery_rectangle3_textField2.text + ", "
                            + "'" + customquery_rectangle3_textField3.text + "', "
                            + "'BUY', "
                            + customquery_rectangle3_textField4.text + ", "
                            + customquery_rectangle3_textField5.text + ", "
                            + required_num * 0.015 + ");"

                    dbmanager2.executeinsertquery(query);
                    dbmanager2.executeinsertquery("UPDATE INVESTOR SET ACCOUNTING_DEPOSIT -= "
                                                  + (required_num + required_num * 0.015)
                                                  + "WHERE ACCOUNT_NUM = " + customquery_rectangle3_textField2.text + ";")
                }

                customquery_rectangle3_textField1.clear()
                customquery_rectangle3_textField2.clear()
                customquery_rectangle3_textField3.clear()
                customquery_rectangle3_textField4.clear()
                customquery_rectangle3_textField5.clear()
            }
        }
    }
    Rectangle {
        id: customquery_rectangle4
        x: 8
        y: 50
        width: 640
        height: 350
        color: "#ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: customquery_isActive4

        Text {
            id: customquery_rectangle4_element1
            x: 132
            y: 20
            text: qsTr("매도 종목 코드")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle4_textField1
            x: 300
            y: 12
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle4_element2
            x: 132
            y: 70
            text: qsTr("투자자 계좌 번호")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle4_textField2
            x: 300
            y: 62
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle4_element3
            x: 132
            y: 120
            text: qsTr("매도 일자(MM/DD/YYYY)")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle4_textField3
            x: 300
            y: 112
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle4_element4
            x: 132
            y: 170
            text: qsTr("수량")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle4_textField4
            x: 300
            y: 160
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle4_element5
            x: 132
            y: 220
            text: qsTr("매도 단가")
            font.pixelSize: 14
        }

        TextField {
            id: customquery_rectangle4_textField5
            x: 300
            y: 212
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: customquery_rectangle4_button1
            x: 270
            y: 264
            text: qsTr("Execute")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var num = dbmanager2.executeinsertquery2("SELECT TOP 1 NUMBER FROM HISTORY ORDER BY NUMBER DESC;")
                num += 1;
                var possibility = dbmanager2.executeinsertquery2("SELECT COUNT(*) FROM HISTORY WHERE CODE = "
                                                                 + customquery_rectangle4_textField1.text
                                                                 + " AND INVESTOR_ACCOUNT = " + customquery_rectangle4_textField2.text + ";")
                var required_num = parseInt(customquery_rectangle4_textField4.text) * parseInt(customquery_rectangle4_textField5.text)

                if (possibility === 1) {
                    var buy_num = dbmanager2.executeinsertquery2("SELECT NUMBER FROM HISTORY WHERE CODE = "
                                                                 + customquery_rectangle4_textField1.text
                                                                 + " AND INVESTOR_ACCOUNT = " + customquery_rectangle4_textField2.text + ";")
                    var query = "INSERT INTO HISTORY VALUES ("
                            + num + ", "
                            + customquery_rectangle4_textField1.text + ", "
                            + customquery_rectangle4_textField2.text + ", "
                            + "'" + customquery_rectangle4_textField3.text + "', "
                            + "'SELL', "
                            + customquery_rectangle4_textField4.text + ", "
                            + customquery_rectangle4_textField5.text + ", "
                            + required_num * 0.015 + ");"

                    dbmanager2.executeinsertquery(query);
                    dbmanager2.executeinsertquery("INSERT INTO CONTAINS_HISTORY VALUES ("
                                                  + num + ", " +buy_num + ", "
                                                  + customquery_rectangle4_textField1.text + ", "
                                                  + customquery_rectangle4_textField2.text + ");")
                    dbmanager2.executeinsertquery("UPDATE INVESTOR SET ACCOUNTING_DEPOSIT += "
                                                  + (required_num - required_num * 0.015)
                                                  + "WHERE ACCOUNT_NUM = " + customquery_rectangle4_textField2.text + ";")
                }

                customquery_rectangle3_textField1.clear();
                customquery_rectangle3_textField2.clear();
                customquery_rectangle3_textField3.clear();
                customquery_rectangle3_textField4.clear();
                customquery_rectangle3_textField5.clear();
            }
        }
    }
    Column {
        id: customquery_column5
        x: 13
        y: 66
        width: 614
        height: 306
        visible:customquery_isActive5

        Row {
            id: customquery_row5
            x: 70
            width: 600
            height: 35
            anchors.top: parent.top
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: customquery_element5
                text: qsTr("투자자가 매수하고 매도하지 않은 주식 종목 중에 한 종목에\n대해 현재 수익률을 보여줍니다. 투자자 계좌를 입력해주세요")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            TextField {
                id: customquery_textField5
                width: 130
                height: 25
                anchors.left: parent.left
                anchors.leftMargin: 390
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: customquery_execute5
                width: 70
                height: 25
                text: qsTr("Execute")
                anchors.left: parent.left
                anchors.leftMargin: 530
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    customqueryTable5.model.clear();
                    customqueryTable5.currentRow = -1;
                    var query = "SELECT S.CODE, S.STOCK_NAME, H.AVERAGE_PRICE, S.PRICE FROM HISTORY AS H, STOCKS_INFO AS S WHERE INVESTOR_ACCOUNT = "
                            + customquery_textField5.text + " AND S.CODE = H.CODE AND H.TYPE = 'BUY' AND H.NUMBER NOT IN (SELECT C.BUY_NUM FROM CONTAINS_HISTORY AS C);"
                    var results = dbmanager2.executeselectquery4(query)
                    for (var i = 0; i < results.length; i++) {
                        customqueryTable5.model.append(results[i]);
                    }
                }
            }
        }

        Oldcontrols.TableView {
            id: customqueryTable5
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
            id: customquery_element4_1
            text: qsTr("선택한 종목의 수익률")
            anchors.left: parent.left
            anchors.leftMargin: 430
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
        Text {
            id: customquery_element4_2
            color: if (customquery_situation_text >= 0) {
                       customquery_situation_text_color = "#ff2626"
                   }
                   else {
                       customquery_situation_text_color = "#0473d5"
                   }
            text: valuation_text()
            anchors.top: parent.top
            anchors.topMargin: 180
            anchors.left: parent.left
            anchors.leftMargin: 485
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16

            function valuation_text() {
                customquery_situation_text = ((customqueryTable5.model.get(customqueryTable5.currentRow).PRICE - customqueryTable5.model.get(customqueryTable5.currentRow).AVERAGE_PRICE)
                                                /customqueryTable5.model.get(customqueryTable5.currentRow).AVERAGE_PRICE) * 100
                return customquery_situation_text.toFixed(2) + "%"
            }
        }
    }
    Rectangle {
        id: customquery_rectangle5
        x: 8
        y: 50
        width: 640
        height: 350
        color: "#ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: customquery_isActive6

        TextField {
            id: customquery_rectangle5_textField1
            x: 150
            y: 21
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element1
            x: 50
            y: 30
            text: qsTr("STOCK CODE")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField2
            x: 150
            y: 71
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element2
            x: 50
            y: 80
            text: qsTr("STOCK NAME")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField3
            x: 150
            y: 121
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element3
            x: 50
            y: 130
            text: qsTr("TYPE")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField4
            x: 450
            y: 21
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element4
            x: 350
            y: 30
            text: qsTr("MARKET")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField5
            x: 450
            y: 71
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element5
            x: 350
            y: 80
            text: qsTr("SECTOR")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField6
            x: 450
            y: 121
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element6
            x: 357
            y: 130
            text: qsTr("PRICE")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField7
            x: 123
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: customquery_rectangle5_element7
            x: 50
            y: 180
            text: qsTr("REVENUE")
            font.pixelSize: 12
        }

        Text {
            id: customquery_rectangle5_element8
            x: 242
            y: 180
            text: qsTr("당기순이익")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField8
            x: 315
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle5_element9
            x: 439
            y: 180
            text: qsTr("시가총액")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField9
            x: 512
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle5_element10
            x: 50
            y: 235
            text: qsTr("PER")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField10
            x: 100
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle5_element11
            x: 190
            y: 235
            text: qsTr("PBR")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField11
            x: 250
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle5_element12
            x: 340
            y: 235
            text: qsTr("ROE")
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField12
            x: 400
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: customquery_rectangle5_element13
            x: 490
            y: 229
            text: qsTr("상장폐지\n여부")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        TextField {
            id: customquery_rectangle5_textField13
            x: 550
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: customquery_rectangle5_button1
            x: 270
            y: 283
            text: qsTr("Execute")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var query1 = "INSERT INTO STOCKS_INFO VALUES ("
                        + customquery_rectangle5_textField1.text + ", "
                        + "'" + customquery_rectangle5_textField2.text + "', "
                        + "'" + customquery_rectangle5_textField3.text + "', "
                        + "'" + customquery_rectangle5_textField4.text + "', "
                        + "'" + customquery_rectangle5_textField5.text + "', "
                        + customquery_rectangle5_textField6.text + ");"
                dbmanager2.executeinsertquery(query1);

                var query2 = "INSERT INTO FUNDAMENTAL VALUES ("
                            + customquery_rectangle5_textField1.text + ", "
                            + customquery_rectangle5_textField7.text + ", "
                            + customquery_rectangle5_textField8.text + ", "
                            + customquery_rectangle5_textField9.text + ", "
                            + customquery_rectangle5_textField10.text + ", "
                            + customquery_rectangle5_textField11.text + ", "
                            + customquery_rectangle5_textField12.text + ", "
                            + "'" + customquery_rectangle5_textField13.text + "');"

                dbmanager2.executeinsertquery(query2)

                customquery_rectangle5_textField1.clear();
                customquery_rectangle5_textField2.clear();
                customquery_rectangle5_textField3.clear();
                customquery_rectangle5_textField4.clear();
                customquery_rectangle5_textField5.clear();
                customquery_rectangle5_textField6.clear();
                customquery_rectangle5_textField7.clear();
                customquery_rectangle5_textField8.clear();
                customquery_rectangle5_textField9.clear();
                customquery_rectangle5_textField10.clear();
                customquery_rectangle5_textField11.clear();
                customquery_rectangle5_textField12.clear();
                customquery_rectangle5_textField13.clear();
            }
        }
    }
}

/*##^##
Designer {
    D{i:10;anchors_y:46}D{i:14;anchors_y:102}
}
##^##*/
