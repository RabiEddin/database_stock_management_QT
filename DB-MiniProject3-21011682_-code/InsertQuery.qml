import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 1.4 as Oldcontrols
import QtQuick.Controls 2.5
import DatabaseManager 1.0
import Qt.labs.qmlmodels 1.0

Window {
    id: insertquery_window
    width: 640
    height: 400
    visible: true
    title: qsTr("STOCK - Insert Query")

    DatabaseManager {
        id: dbmanager6
    }

    property bool insertquery_isActive1: true
    property bool insertquery_isActive2: false
    property bool insertquery_isActive3: false
    property bool insertquery_isActive4: false

    TabBar {
        id: bar
        width: parent.width
        currentIndex: -1

        TabButton {
            text: qsTr("주식종목 추가")

            onClicked: {
                insertquery_isActive1 = true;
                insertquery_isActive2 = false;
                insertquery_isActive3 = false;
                insertquery_isActive4 = false;

                insertquery_rectangle1_textField1.clear();
                insertquery_rectangle1_textField2.clear();
                insertquery_rectangle1_textField3.clear();
                insertquery_rectangle1_textField4.clear();
                insertquery_rectangle1_textField5.clear();
                insertquery_rectangle1_textField6.clear();
                insertquery_rectangle1_textField7.clear();
                insertquery_rectangle1_textField8.clear();
                insertquery_rectangle1_textField9.clear();
                insertquery_rectangle1_textField10.clear();
                insertquery_rectangle1_textField11.clear();
                insertquery_rectangle1_textField12.clear();
                insertquery_rectangle1_textField13.clear();
            }
        }
        TabButton {
            text: qsTr("주식종목 매수")

            onClicked: {
                insertquery_isActive1 = false;
                insertquery_isActive2 = true;
                insertquery_isActive3 = false;
                insertquery_isActive4 = false;

                insertquery_rectangle2_textField1.clear();
                insertquery_rectangle2_textField2.clear();
                insertquery_rectangle2_textField3.clear();
                insertquery_rectangle2_textField4.clear();
                insertquery_rectangle2_textField5.clear();
            }
        }
        TabButton {
            text: qsTr("주식종목 매도")

            onClicked: {
                insertquery_isActive1 = false;
                insertquery_isActive2 = false;
                insertquery_isActive3 = true;
                insertquery_isActive4 = false;

                insertquery_rectangle3_textField1.clear();
                insertquery_rectangle3_textField2.clear();
                insertquery_rectangle3_textField3.clear();
                insertquery_rectangle3_textField4.clear();
                insertquery_rectangle3_textField5.clear();
            }
        }
        TabButton {
            text: qsTr("새로운 투자자 등록")

            onClicked: {
                insertquery_isActive1 = false;
                insertquery_isActive2 = false;
                insertquery_isActive3 = false;
                insertquery_isActive4 = true;

                insertquery_rectangle4_textField1.clear()
                insertquery_rectangle4_textField2.clear()
                insertquery_rectangle4_textField3.clear()
            }
        }
    }

    Rectangle {
        id: insertquery_rectangle1
        x: 8
        y: 50
        width: 640
        height: 350
        color: "#ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: insertquery_isActive1

        TextField {
            id: insertquery_rectangle1_textField1
            x: 150
            y: 21
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element1
            x: 50
            y: 30
            text: qsTr("STOCK CODE")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField2
            x: 150
            y: 71
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element2
            x: 50
            y: 80
            text: qsTr("STOCK NAME")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField3
            x: 150
            y: 121
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element3
            x: 50
            y: 130
            text: qsTr("TYPE")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField4
            x: 450
            y: 21
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element4
            x: 350
            y: 30
            text: qsTr("MARKET")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField5
            x: 450
            y: 71
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element5
            x: 350
            y: 80
            text: qsTr("SECTOR")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField6
            x: 450
            y: 121
            width: 150
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element6
            x: 357
            y: 130
            text: qsTr("PRICE")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField7
            x: 123
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }
        Text {
            id: insertquery_rectangle1_element7
            x: 50
            y: 180
            text: qsTr("REVENUE")
            font.pixelSize: 12
        }

        Text {
            id: insertquery_rectangle1_element8
            x: 242
            y: 180
            text: qsTr("당기순이익")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField8
            x: 315
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle1_element9
            x: 439
            y: 180
            text: qsTr("시가총액")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField9
            x: 512
            y: 171
            width: 100
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle1_element10
            x: 50
            y: 235
            text: qsTr("PER")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField10
            x: 100
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle1_element11
            x: 190
            y: 235
            text: qsTr("PBR")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField11
            x: 250
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle1_element12
            x: 340
            y: 235
            text: qsTr("ROE")
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField12
            x: 400
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle1_element13
            x: 490
            y: 229
            text: qsTr("상장폐지\n여부")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        TextField {
            id: insertquery_rectangle1_textField13
            x: 550
            y: 226
            width: 50
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: insertquery_rectangle1_button1
            x: 270
            y: 283
            text: qsTr("Execute")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var query1 = "INSERT INTO STOCKS_INFO VALUES ("
                        + insertquery_rectangle1_textField1.text + ", "
                        + "'" + insertquery_rectangle1_textField2.text + "', "
                        + "'" + insertquery_rectangle1_textField3.text + "', "
                        + "'" + insertquery_rectangle1_textField4.text + "', "
                        + "'" + insertquery_rectangle1_textField5.text + "', "
                        + insertquery_rectangle1_textField6.text + ");"
                dbmanager6.executeinsertquery(query1);

                var query2 = "INSERT INTO FUNDAMENTAL VALUES ("
                            + insertquery_rectangle1_textField1.text + ", "
                            + insertquery_rectangle1_textField7.text + ", "
                            + insertquery_rectangle1_textField8.text + ", "
                            + insertquery_rectangle1_textField9.text + ", "
                            + insertquery_rectangle1_textField10.text + ", "
                            + insertquery_rectangle1_textField11.text + ", "
                            + insertquery_rectangle1_textField12.text + ", "
                            + "'" + insertquery_rectangle1_textField13.text + "');"

                dbmanager6.executeinsertquery(query2)

                insertquery_rectangle1_textField1.clear();
                insertquery_rectangle1_textField2.clear();
                insertquery_rectangle1_textField3.clear();
                insertquery_rectangle1_textField4.clear();
                insertquery_rectangle1_textField5.clear();
                insertquery_rectangle1_textField6.clear();
                insertquery_rectangle1_textField7.clear();
                insertquery_rectangle1_textField8.clear();
                insertquery_rectangle1_textField9.clear();
                insertquery_rectangle1_textField10.clear();
                insertquery_rectangle1_textField11.clear();
                insertquery_rectangle1_textField12.clear();
                insertquery_rectangle1_textField13.clear();
            }
        }
    }
    Rectangle {
        id: insertquery_rectangle2
        x: 8
        y: 50
        width: 640
        height: 350
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: insertquery_isActive2

        Text {
            id: insertquery_rectangle2_element1
            x: 132
            y: 20
            text: qsTr("매수 종목 코드")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle2_textField1
            x: 300
            y: 12
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle2_element2
            x: 132
            y: 70
            text: qsTr("투자자 계좌 번호")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle2_textField2
            x: 300
            y: 62
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle2_element3
            x: 132
            y: 120
            text: qsTr("매수 일자(MM/DD/YYYY)")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle2_textField3
            x: 300
            y: 112
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle2_element4
            x: 132
            y: 170
            text: qsTr("수량")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle2_textField4
            x: 300
            y: 160
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle2_element5
            x: 132
            y: 220
            text: qsTr("매수 단가")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle2_textField5
            x: 300
            y: 212
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: insertquery_rectangle2_button1
            x: 270
            y: 264
            text: qsTr("Execute")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var num = dbmanager6.executeinsertquery2("SELECT TOP 1 NUMBER FROM HISTORY ORDER BY NUMBER DESC;")
                num += 1;
                var accounting_deposit = dbmanager6.executeinsertquery2("SELECT ACCOUNTING_DEPOSIT FROM INVESTOR WHERE ACCOUNT_NUM = " + insertquery_rectangle2_textField2.text + ";")
                var required_num = parseInt(insertquery_rectangle2_textField4.text) * parseInt(insertquery_rectangle2_textField5.text)

                if (accounting_deposit > required_num + required_num * 0.015) {
                    var query = "INSERT INTO HISTORY VALUES ("
                            + num + ", "
                            + insertquery_rectangle2_textField1.text + ", "
                            + insertquery_rectangle2_textField2.text + ", "
                            + "'" + insertquery_rectangle2_textField3.text + "', "
                            + "'BUY', "
                            + insertquery_rectangle2_textField4 .text + ", "
                            + insertquery_rectangle2_textField5.text + ", "
                            + required_num * 0.015 + ");"

                    dbmanager6.executeinsertquery(query);
                    dbmanager6.executeinsertquery("UPDATE INVESTOR SET ACCOUNTING_DEPOSIT -= "
                                                  + (required_num + required_num * 0.015)
                                                  + "WHERE ACCOUNT_NUM = " + insertquery_rectangle2_textField2.text + ";")
                }
                insertquery_rectangle2_textField1.clear()
                insertquery_rectangle2_textField2.clear()
                insertquery_rectangle2_textField3.clear()
                insertquery_rectangle2_textField4.clear()
                insertquery_rectangle2_textField5.clear()
            }
        }
    }
    Rectangle {
        id: insertquery_rectangle3
        x: 8
        y: 50
        width: 640
        height: 350
        color: "#ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: insertquery_isActive3

        Text {
            id: insertquery_rectangle3_element1
            x: 132
            y: 20
            text: qsTr("매도 종목 코드")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle3_textField1
            x: 300
            y: 12
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle3_element2
            x: 132
            y: 70
            text: qsTr("투자자 계좌 번호")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle3_textField2
            x: 300
            y: 62
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle3_element3
            x: 132
            y: 120
            text: qsTr("매도 일자(MM/DD/YYYY)")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle3_textField3
            x: 300
            y: 112
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle3_element4
            x: 132
            y: 170
            text: qsTr("수량")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle3_textField4
            x: 300
            y: 160
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle3_element5
            x: 132
            y: 220
            text: qsTr("매도 단가")
            font.pixelSize: 14
        }

        TextField {
            id: insertquery_rectangle3_textField5
            x: 300
            y: 212
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: insertquery_rectangle3_button1
            x: 270
            y: 264
            text: qsTr("Execute")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                var num = dbmanager6.executeinsertquery2("SELECT TOP 1 NUMBER FROM HISTORY ORDER BY NUMBER DESC;")
                num += 1;
                var possibility = dbmanager6.executeinsertquery2("SELECT COUNT(*) FROM HISTORY WHERE CODE = "
                                                                 + insertquery_rectangle3_textField1.text
                                                                 + " AND INVESTOR_ACCOUNT = " + insertquery_rectangle3_textField2.text + ";")
                var required_num = parseInt(insertquery_rectangle3_textField4.text) * parseInt(insertquery_rectangle3_textField5.text)

                if (possibility === 1) {
                    var buy_num = dbmanager6.executeinsertquery2("SELECT NUMBER FROM HISTORY WHERE CODE = "
                                                                 + insertquery_rectangle3_textField1.text
                                                                 + " AND INVESTOR_ACCOUNT = " + insertquery_rectangle3_textField2.text + ";")
                    var query = "INSERT INTO HISTORY VALUES ("
                            + num + ", "
                            + insertquery_rectangle3_textField1.text + ", "
                            + insertquery_rectangle3_textField2.text + ", "
                            + "'" + insertquery_rectangle3_textField3.text + "', "
                            + "'SELL', "
                            + insertquery_rectangle3_textField4.text + ", "
                            + insertquery_rectangle3_textField5.text + ", "
                            + required_num * 0.015 + ");"

                    dbmanager6.executeinsertquery(query);
                    dbmanager6.executeinsertquery("INSERT INTO CONTAINS_HISTORY VALUES ("
                                                  + num + ", " +buy_num + ", "
                                                  + insertquery_rectangle3_textField1.text + ", "
                                                  + insertquery_rectangle3_textField2.text + ");")
                    dbmanager6.executeinsertquery("UPDATE INVESTOR SET ACCOUNTING_DEPOSIT += "
                                                  + (required_num - required_num * 0.015)
                                                  + "WHERE ACCOUNT_NUM = " + insertquery_rectangle3_textField2.text + ";")
                }

                insertquery_rectangle3_textField1.clear();
                insertquery_rectangle3_textField2.clear();
                insertquery_rectangle3_textField3.clear();
                insertquery_rectangle3_textField4.clear();
                insertquery_rectangle3_textField5.clear();
            }
        }
    }
    Rectangle {
        id: insertquery_rectangle4
        x: 8
        y: 50
        width: 640
        height: 350
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        visible: insertquery_isActive4

        Text {
            id: insertquery_rectangle4_element1
            x: 90
            y: 40
            text: qsTr("새로운 계좌 번호(9자리)")
            font.pixelSize: 16
        }

        TextField {
            id: insertquery_rectangle4_textField1
            x: 360
            y: 31
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle4_element2
            x: 90
            y: 92
            text: qsTr("새로운 투자자 이름")
            font.pixelSize: 16
        }

        TextField {
            id: insertquery_rectangle4_textField2
            x: 360
            y: 85
            height: 30
            placeholderText: qsTr("")
        }

        Text {
            id: insertquery_rectangle4_element3
            x: 90
            y: 146
            text: qsTr("초기 자본 금액")
            font.pixelSize: 16
        }

        TextField {
            id: insertquery_rectangle4_textField3
            x: 360
            y: 139
            height: 30
            placeholderText: qsTr("")
        }

        Button {
            id: insertquery_rectangle4_button1
            x: 270
            y: 250
            text: qsTr("Execute")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: { "111111111, 'S.KIM', 10000000, 10000000 - 63000*30);"
                var query = "INSERT INTO INVESTOR VALUES ("
                        + insertquery_rectangle4_textField1.text + ", "
                        + "'" + insertquery_rectangle4_textField2.text + "', "
                        + insertquery_rectangle4_textField3.text + ", "
                        + insertquery_rectangle4_textField3.text + ");"

                dbmanager6.executeinsertquery(query);

                insertquery_rectangle4_textField1.clear()
                insertquery_rectangle4_textField2.clear()
                insertquery_rectangle4_textField3.clear()
            }
        }
    }
}

/*##^##
Designer {
    D{i:6;anchors_height:333;anchors_width:626;anchors_x:8;anchors_y:58}
}
##^##*/
