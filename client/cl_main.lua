local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('sb', function()
    lib.callback('qw_scoreboard:server:getScoreboardData', false, function(scoreboardData) 
        SendNUIMessage({action = 'setVisible', data = { isVisible = true, scoreboardData = scoreboardData }})
        SetNuiFocus(true, true)
    end)
end, false)

RegisterNUICallback('hideUI', function(_, cb)
    cb('ok')
    SetNuiFocus(false, false)
end)
