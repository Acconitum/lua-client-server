userList = {};
userList.users = {};
userList.count = 0;

function userList.add(user)
    userList.users[userList.count] = user;
    userList.count = userList.count + 1;
end

function userList.removeDisconnectedUsers()
    local newList = {};
    local newListCount = 0;
    for i = 0, userList.count - 1 do
        if userList.users[i].keepAlive then
            newList[newListCount] = userList.users[i];
            newListCount = newListCount + 1;
        end
    end
    userList.count = newListCount;
    userList.users = newList;
end


return userList;