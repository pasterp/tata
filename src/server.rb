require 'socket'

server = TCPServer.open(1234)
puts "Opening TCP Server on port 1234"
loop do
    Thread.start(server.accept) do |client|
        puts "New client connected"
        sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
        loop do
            puts "Send ping to " + remote_ip + ":" + remote_port
            client.puts "PING"
            sleep 3
            if s = client.gets
                puts "Received : " + s
            else
                client.puts
                client.close
                break
            end
        end
    end
end