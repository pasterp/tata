#ifndef PROTOCOL_HPP
#define PROTOCOL_HPP

#define HEADER_SIZE 1
#define MAX_BUFFER_SIZE 500

enum message_type {
    ping,
    cmd,
    output,
    get_info,
    info
};

#endif // PROTOCOL_HPP
