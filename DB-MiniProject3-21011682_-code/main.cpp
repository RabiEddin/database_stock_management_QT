#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtSql>
#include "database_manager.h"
#include "tablemodel.h"
#include "newtableviewcolumn.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<DatabaseManager, 1>("DatabaseManager", 1, 0, "DatabaseManager");
    qmlRegisterType<TableModel, 1>("TableModel", 1, 0, "TableModel");
    qmlRegisterType<Newtableviewcolumn, 1>("Newtableviewcolumn", 1, 0, "Newtableviewcolumn");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
