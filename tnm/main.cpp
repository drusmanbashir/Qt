#include "mainwindow.h"
#include <QApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <qqml.h>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>
#include "qtquick2applicationviewer.h"
#include "createconnection.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    if (!createConnection())
        return 1;

    MainWindow w;
    QtQuick2ApplicationViewer viewer;

    viewer.rootContext()->setContextProperty("mWindow", &w);
    viewer.setSource(QUrl("qrc:/window.qml"));
   // viewer.setMainQmlFile(QLatin1String(":/new/pref/window.qml"));
    viewer.showFullScreen();
//    viewer.showExpanded();
  //  w.show();
    
    return a.exec();
}
