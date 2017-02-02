#include "asio.hpp"

using asio::ip::tcp;

int main(){
    asio::io_service io_service;
    tcp::resolver resolver(io_service);
    tcp::resolver::query query(tcp::v4(), "localhost", "1234");
    tcp::resolver::iterator iterator = resolver.resolve(query);

    tcp::socket s(io_service);
    asio::connect(s, iterator);

    return 0;
}