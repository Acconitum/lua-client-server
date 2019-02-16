local userList = require('lib/userList');
local user = require('lib/user');
local socket = require('socket');
local server = assert(socket.bind('127.0.0.1', 1337));
local ip, port = server:getsockname();

print('created server on ip: ' .. ip .. ' listening on port: ' .. port);

server:settimeout(0.1);

while true do

    local client = server:accept();
    
    if client then
        local clientName, err = client:receive()
        local newUser = user.__init__(clientName, client);        
        print('New client connected: ' .. clientName);
        newUser = user.__init__(clientName, client); 
        userList.add(newUser);
    end
    
    if userList.count > 0 then
        for i = 0, userList.count - 1 do
            local message, err = userList.users[i].client:receive();
            if message then 
                print(userList.users[i].name .. ': ' .. message);
            end
            if err == "closed" then
                print(userList.users[i].name .. ' left');
                userList.users[i].client:close()
                userList.remove(i);
            end
        end
    end
end





