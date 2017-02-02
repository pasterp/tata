#include <iostream>
#include <vector>
#include <stdio.h>


#include "asio.hpp"

#include "protocol.hpp"

using asio::ip::tcp;


int main(){
    asio::io_service io_service;
    tcp::resolver resolver(io_service);
    tcp::resolver::query query(tcp::v4(), "localhost", "1234");
    tcp::resolver::iterator iterator = resolver.resolve(query);

    tcp::socket s(io_service);
    asio::connect(s, iterator);

    while(true){
        char buffer[128];
        asio::error_code error;

        int len = s.read_some(asio::buffer(buffer), error);
        std::cout << "Reçu " << len << " caractères: ";

        if(error == asio::error::eof) //On a été déconnecté
            break;
        else if (error)
            throw asio::system_error(error);
        printf("%150.*s", len, buffer);
    }


    return 0;
}
