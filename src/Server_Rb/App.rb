 require 'sinatra'
 require 'socket'
 require 'haml'

 require_relative 'Client'


list_clients = []

t_serveur = Thread.new {
    puts "Starting TCP Listenning on port 1234"
    server = TCPServer.open(1234)
    loop do
        client = Client.new(server.accept)

        list_clients << client
    end
}

get('/') do
    @title = "Liste des clients"
    @clients = list_clients
    haml :index
end

get('/Ping/:id') do
    id = params['id'].to_i
    p list_clients
    p id
    client = list_clients.detect{|e| e.id == id }

    client.ping
    
    redirect to('/')
end

get('/Disconnect/:id') do 
    id = params['id'].to_i
    client = list_clients.detect{|e| e.id == id }

    list_clients.delete(client)
    client.disconnect

    redirect to('/')
end

get('/Details/:id') do 
    id = params['id'].to_i
    @client = list_clients.detect{|e| e.id == id }
    @client.info
    
    haml :details
end