require 'socket'

server = TCPServer.open(1234)
puts "Opening TCP Server on port 1234"
loop do
    Thread.start(server.accept) do |client|
        remote_ip = client.peeraddr[3]
        remote_port = client.peeraddr[1]
        puts "New client connected #{remote_ip}:#{remote_port}"
        
        puts "Send ping to #{remote_ip}:#{remote_port}"
        client.puts "PING"
        sleep 3
        puts "Disconnecting #{remote_ip}:#{remote_port}"
        client.puts "Closing the connection. Bye!"
        client.close
    end
end