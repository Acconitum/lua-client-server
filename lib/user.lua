user = {};

function user.__init__(name, client)
    local newUser = {};
    newUser.name = name;
    newUser.keepAlive = true;
    newUser.client = client;
    newUser.client:settimeout(0.1)
    return newUser; 
end

return user;