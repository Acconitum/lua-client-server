local host, port = '127.0.0.1', 1337;
local socket = require('socket');

print('Choose your name:');
local clientName = io.read();

if clientName == '' then
    print('no name choosen');
    return;
end

print('Type "exit" to disconnect');

local tcp = assert(socket.tcp());

tcp:connect(host, port);
tcp:send(clientName .. "\n");

while true do 
    message = io.read();
    if message == 'exit' then
        break;
    else
        tcp:send(message .. '\n');
    end
end 

tcp:close();