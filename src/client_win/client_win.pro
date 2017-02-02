TARGET = ../../client_win
SOURCES = main.cpp

INCLUDEPATH += ../ThirdPart/asio_win/include
INCLUDEPATH += ../common

LIBS += -mthreads -lws2_32 -lmswsock
