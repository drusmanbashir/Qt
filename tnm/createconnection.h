#ifndef CREATECONNECTION_H
#define CREATECONNECTION_H
#include <QSqlQuery>
#include <QMessageBox>
#include <QStandardPaths>
#include <QFileInfo>

#endif // CREATECONNECTION_H


static bool createConnection(){
    QString dbName = "tnmstaging";
    QFile dfile("assets:/database/tnmstaging");
    if (dfile.exists())
    {
        dfile.copy("./tnmDB");
        QFile::setPermissions("./tnmDB",QFile::WriteOwner | QFile::ReadOwner);
   }



    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./tnmDB");
    if (!db.open()) {
        QMessageBox::critical(0, qApp->tr("Cannot open database"),
            qApp->tr("Unable to establish a database connection.\n"
                     "This example needs SQLite support. Please read "
                     "the Qt SQL driver documentation for information how "
                     "to build it.\n\n"
                     "Click Cancel to exit."), QMessageBox::Cancel);
        return false;
    }
    return true;
}

//static bool createTable(){
//    QSqlQuery query;
//    query.exec("create table staging (id int primary key,"
//               "region varchar (20), t1 text, n1 text, m1 text)");
//    query.exec("insert into staging values (1, 'Lung', 'confined to lobe', 'ipsilateral nodes',"
//                "'metastasis to other lung')");
//    query.exec("insert into staging values (2, 'Stomach', 'confined to submucosa', '<5 nodes',"
//                        "'metastasis to other body parts')");
//    return true;
//}
