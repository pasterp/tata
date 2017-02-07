require 'geocoder'

$next_id = 0

class Client
    def initialize(s)
        $next_id+=1
        @id = $next_id

        @socket = s
        #@last_message = Time.now()

        @os = ""

        puts "Nouveau client n#{id} : #{getIp}:#{getPort}"
        @socket.puts "Hello"
    end

    def getIp
        @socket.peeraddr[3]
    end


    def getPort
        @socket.peeraddr[1]
    end

    def getOs
        @os
    end

    def id
        @id
    end

    def getLocation
        Geocoder.search(getIp()).first.country
    end

    def ping
        @socket.puts "PING"
        @socket.gets 
    end

    def disconnect
        @socket.close
    end

    def info
        @socket.puts "INFO"
        @os = @socket.gets.chomp
    end
end