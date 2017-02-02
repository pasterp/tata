TEMPLATE = subdirs
SUBDIRS =  src/server src/common
win32 {
    SUBDIRS += src/client_win
}
unix {
     SUBDIRS += src/client_linux 
}
