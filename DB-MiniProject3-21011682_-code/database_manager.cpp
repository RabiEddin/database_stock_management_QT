#include "database_manager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>
#include <QDebug>
#include <QSqlTableModel>
#include <QTableView>

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent)
{
    // MSSQL 연결 설정
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    QString dsn = "DB01_SERVER";  // ODBC DSN 이름
    db.setDatabaseName(dsn);
    db.setUserName("STOCK_MASTER");  // MSSQL 사용자 이름
    db.setPassword("1234");  // MSSQL 비밀번호

    if (!db.open()) {
        qDebug() << "Failed to connect to database:" << db.lastError().text();
    }
} // DB 연결 완료

QVariantList DatabaseManager::schemaInfoQuery(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("Column Name", query.value(3).toString());
        columnInfo.insert("Column Name Len", query.value(3).toString().length());
        columnInfo.insert("SQL Data Type", query.value(7).toString());
        if (query.value(7).toString().compare("char") == 0) {
            columnInfo.insert("SQL Data Size", query.value(8).toString());
        }
        else {
            columnInfo.insert("SQL Data Size", query.value(10).toString());
        }
        columnInfo.insert("Data Nullable", query.value(6).toString());
        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} //  Schema Check 완료

QVariantList DatabaseManager::executecustomquery(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QSqlRecord record = query.record();
    QVariantList results;

    int columnCount = record.count();

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        for (int i = 0; i < columnCount; i++) {
            QString roleName = record.fieldName(i);
            columnInfo.insert(roleName, query.value(i).toString().trimmed());
        }
        results.append(columnInfo);
    }

    return results;
} // custom query 함수
QVariantList DatabaseManager::fetchColumnName(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QSqlRecord record = query.record();
    QVariantList results;

    int columnCount = record.count();

    for (int i = 0; i < columnCount; ++i) {
            QString columnName = record.fieldName(i);
            results << columnName;
    }

    return results;
} // tableviewcolumnname 얻어오는 함수
void DatabaseManager::executeinsertquery(const QString& queryStr)
{
    QSqlQuery query;

    query.exec(queryStr);

} // insert query 함수
int DatabaseManager::executeinsertquery2(const QString& queryStr)
{
    QSqlQuery query(queryStr);

    query.next();

    return query.value(0).toInt();
} // insert query 함수(예수금 & 매매 번호)
QVariantList DatabaseManager::executeselectquery1(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("PRICE", query.value(5).toString().trimmed());
        columnInfo.insert("TYPE", query.value(2).toString().trimmed());
        columnInfo.insert("MARKET", query.value(3).toString().trimmed());
        columnInfo.insert("SECTOR", query.value(4).toString().trimmed());
        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // select query 함수1
QVariantList DatabaseManager::executeselectquery2(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("MARKET_CAP", query.value(2).toString().trimmed());
        columnInfo.insert("SECTOR", query.value(3).toString().trimmed());
        columnInfo.insert("REVENUE", query.value(4).toString().trimmed());
        columnInfo.insert("PER", query.value(5).toString().trimmed());
        columnInfo.insert("PBR", query.value(6).toString().trimmed());
        columnInfo.insert("ROE", query.value(7).toString().trimmed());
        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // select query 함수2
QVariantList DatabaseManager::executeselectquery3(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("PRICE", query.value(2).toString().trimmed());
        columnInfo.insert("SECTOR", query.value(3).toString().trimmed());
        columnInfo.insert("MARKET_CAP", query.value(4).toString().trimmed());
        columnInfo.insert("PER", query.value(5).toString().trimmed());
        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // select query 함수3
QVariantList DatabaseManager::executeselectquery4(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("AVERAGE_PRICE", query.value(2).toString().trimmed());
        columnInfo.insert("PRICE", query.value(3).toString().trimmed());
        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // select query 함수4
QVariantList DatabaseManager::executeselectquery5(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("STOCK_CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("STOCK_HOLDINGS", query.value(2).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // select query 함수5
QVariantList DatabaseManager::executeupdatequery1(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("PRICE", query.value(2).toString().trimmed());
        columnInfo.insert("MARKET_CAP", query.value(3).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // update query 함수1
QVariantList DatabaseManager::executeupdatequery2(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // update query 함수2
QVariantList DatabaseManager::executeupdatequery3(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("STOCK_CODE", query.value(1).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(2).toString().trimmed());
        columnInfo.insert("STOCK_HOLDINGS", query.value(3).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // update query 함수3
QVariantList DatabaseManager::executeupdatequery4(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("STOCK_CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("SECTOR", query.value(2).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // update query 함수4
QVariantList DatabaseManager::executedeletequery1(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("STOCK_CODE", query.value(1).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(2).toString().trimmed());
        columnInfo.insert("STOCK_HOLDINGS", query.value(3).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // delete query 함수1
QVariantList DatabaseManager::executedeletequery2(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("ACCOUNT_NUM", query.value(0).toString().trimmed());
        columnInfo.insert("INVESTOR_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("INVESTMENT_AMOUNT", query.value(2).toString().trimmed());
        columnInfo.insert("ACCOUNTING_DEPOSIT", query.value(3).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // delete query 함수2
QVariantList DatabaseManager::executedeletequery3(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("CODE", query.value(0).toString().trimmed());
        columnInfo.insert("STOCK_NAME", query.value(1).toString().trimmed());
        columnInfo.insert("DELIST", query.value(2).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // delete query 함수3
QVariantList DatabaseManager::executedeletequery4(const QString& queryStr)
{
    QSqlQuery query(queryStr);
    QVariantList m_columnInfo;

    while (query.next()) {
        // 쿼리 결과 처리
        QVariantMap columnInfo;
        columnInfo.insert("NUMBER", query.value(0).toString().trimmed());
        columnInfo.insert("INVESTOR_ACCOUNT", query.value(2).toString().trimmed());
        columnInfo.insert("CODE", query.value(1).toString().trimmed());
        columnInfo.insert("OPEN_DATE", query.value(3).toString().trimmed());
        columnInfo.insert("QUANTITY", query.value(5).toString().trimmed());
        columnInfo.insert("AVERAGE_PRICE", query.value(6).toString().trimmed());
        columnInfo.insert("COMMISSION", query.value(7).toString().trimmed());

        m_columnInfo.append(columnInfo);
    }

    return m_columnInfo;
} // delete query 함수4




