#ifndef NEWTABLEVIEWCOLUMN_H
#define NEWTABLEVIEWCOLUMN_H

#include <QObject>
#include <QTableView>
#include <QStandardItemModel>
#include <QHeaderView>

class Newtableviewcolumn : public QObject
{
    Q_OBJECT
public:
    explicit Newtableviewcolumn(QObject* parent = nullptr);
    Q_INVOKABLE void addColumn(QTableView* tableView, const QString& title, const QString& role);
};

#endif // NEWTABLEVIEWCOLUMN_H
