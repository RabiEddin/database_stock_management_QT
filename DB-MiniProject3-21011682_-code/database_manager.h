#ifndef DATABASE_MANAGER_H
#define DATABASE_MANAGER_H

#include <QObject>
#include <QVariantList>
#include <QSqlTableModel>
#include <QTableView>

class DatabaseManager : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList executecustomquery(const QString& queryStr);
    Q_INVOKABLE QVariantList schemaInfoQuery(const QString& queryStr);
    Q_INVOKABLE QVariantList fetchColumnName(const QString& queryStr);
    Q_INVOKABLE void executeinsertquery(const QString& queryStr);
    Q_INVOKABLE int executeinsertquery2(const QString& queryStr);
    Q_INVOKABLE QVariantList executeselectquery1(const QString& queryStr);
    Q_INVOKABLE QVariantList executeselectquery2(const QString& queryStr);
    Q_INVOKABLE QVariantList executeselectquery3(const QString& queryStr);
    Q_INVOKABLE QVariantList executeselectquery4(const QString& queryStr);
    Q_INVOKABLE QVariantList executeselectquery5(const QString& queryStr);
    Q_INVOKABLE QVariantList executeupdatequery1(const QString& queryStr);
    Q_INVOKABLE QVariantList executeupdatequery2(const QString& queryStr);
    Q_INVOKABLE QVariantList executeupdatequery3(const QString& queryStr);
    Q_INVOKABLE QVariantList executeupdatequery4(const QString& queryStr);
    Q_INVOKABLE QVariantList executedeletequery1(const QString& queryStr);
    Q_INVOKABLE QVariantList executedeletequery2(const QString& queryStr);
    Q_INVOKABLE QVariantList executedeletequery3(const QString& queryStr);
    Q_INVOKABLE QVariantList executedeletequery4(const QString& queryStr);
private:
    // 멤버 변수 및 함수 선언
};

#endif // DATABASE_MANAGER_H
