#ifndef GLOBALS_H
#define GLOBALS_H

#include <QObject>

class PageEnum : public QObject
{
    Q_OBJECT
public:
    enum Pages {
        DASHBOARD,
        AIR_CONDITIONING,
        LIGHTING,
        APPLIANCES,
        COMMUNICATIONS,
        SECURITY,
        CCTV,
        SETTINGSPAGE
    };
    Q_ENUM(Pages) // Make the enum available in QML
};

#endif // GLOBALS_H
