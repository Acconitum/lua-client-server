userList = {};
userList.users = {};
userList.count = 0;

function userList.add(user)
    userList.users[userList.count] = user;
    userList.count = userList.count + 1;
end

function userList.remove(index)
    local newList = {};
    local newListCount = 0;
    for i = 0, userList.count - 1 do
        if i ~= index then
            newList[newListCount] = userList.users[i];
        end 
    end
    userList.count = userList.count - 1;
    userList.users = newList;
end


return userList;