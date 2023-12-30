#include "newtableviewcolumn.h"
#include <QObject>
#include <QTableView>
#include <QStandardItemModel>
#include <QHeaderView>


Newtableviewcolumn::Newtableviewcolumn(QObject* parent) : QObject(parent)
{
}

void Newtableviewcolumn::addColumn(QTableView* tableView, const QString& title, const QString& role)
{
    QStandardItemModel* model = qobject_cast<QStandardItemModel*>(tableView->model());
        if (!model) {
            return;
        }

        QStandardItem* columnHeaderItem = new QStandardItem(title);
        columnHeaderItem->setData(role, Qt::UserRole);

        model->setHorizontalHeaderItem(model->columnCount(), columnHeaderItem);

        QHeaderView* headerView = tableView->horizontalHeader();
        headerView->setSectionResizeMode(model->columnCount() - 1, QHeaderView::ResizeToContents);
        headerView->setStretchLastSection(true);
}
