-- Function to toggle vehicle doors
function toggleDoor(doorIndex)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 and doorIndex then
        doorIndex = doorIndex - 1 -- Lua indexes doors from 0
        local isOpen = GetVehicleDoorAngleRatio(vehicle, doorIndex) > 0.1

        if isOpen then
            SetVehicleDoorShut(vehicle, doorIndex, false)
            TriggerEvent('chat:addMessage', { args = { "[SYSTEM]", "Door " .. (doorIndex + 1) .. " closed." } })
        else
            SetVehicleDoorOpen(vehicle, doorIndex, false, false)
            TriggerEvent('chat:addMessage', { args = { "[SYSTEM]", "Door " .. (doorIndex + 1) .. " opened." } })
        end
    else
        TriggerEvent('chat:addMessage', { args = { "[ERROR]", "You must be in a vehicle to use this command." } })
    end
end

-- Function to toggle vehicle windows
function toggleWindow(windowIndex)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 and windowIndex then
        windowIndex = windowIndex - 1 -- Lua indexes windows from 0
        local isOpen = not IsVehicleWindowIntact(vehicle, windowIndex)

        if isOpen then
            RollUpWindow(vehicle, windowIndex)
            TriggerEvent('chat:addMessage', { args = { "[SYSTEM]", "Window " .. (windowIndex + 1) .. " rolled up." } })
        else
            RollDownWindow(vehicle, windowIndex)
            TriggerEvent('chat:addMessage', { args = { "[SYSTEM]", "Window " .. (windowIndex + 1) .. " rolled down." } })
        end
    else
        TriggerEvent('chat:addMessage', { args = { "[ERROR]", "You must be in a vehicle to use this command." } })
    end
end

-- Register /door and /window commands
RegisterCommand('door', function(_, args)
    if args[1] then toggleDoor(tonumber(args[1])) end
end)

RegisterCommand('window', function(_, args)
    if args[1] then toggleWindow(tonumber(args[1])) end
end)

-- Keymapping
RegisterKeyMapping('door 1', 'Toggle Door 1', 'keyboard', '')
RegisterKeyMapping('door 2', 'Toggle Door 2', 'keyboard', '')
RegisterKeyMapping('door 3', 'Toggle Door 3', 'keyboard', '')
RegisterKeyMapping('door 4', 'Toggle Door 4', 'keyboard', '')

RegisterKeyMapping('window 1', 'Toggle Window 1', 'keyboard', '')
RegisterKeyMapping('window 2', 'Toggle Window 2', 'keyboard', '')
RegisterKeyMapping('window 3', 'Toggle Window 3', 'keyboard', '')
RegisterKeyMapping('window 4', 'Toggle Window 4', 'keyboard', '')
