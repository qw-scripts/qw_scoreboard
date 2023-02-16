local QBCore = exports['qb-core']:GetCoreObject()

lib.callback.register('qw_scoreboard:server:getScoreboardData', function() 

    local scoreboardData = {}
    local Players = QBCore.Functions.GetQBPlayers()

    scoreboardData.maxPlayerCount = GetConvarInt('sv_maxclients', 32)
    scoreboardData.serverName = GetConvar('sv_hostname', 'Unknown')
    scoreboardData.discord = Config.Discord

    scoreboardData.currentPlayers = {}

    for _, v in pairs(Players) do
        scoreboardData.currentPlayers[#scoreboardData.currentPlayers+1] = {
            name = v.PlayerData.charinfo.firstname .. ' ' .. v.PlayerData.charinfo.lastname,
            id = v.PlayerData.source,
            ping = GetPlayerPing(v.PlayerData.source),
        }
    end

    scoreboardData.jobs = {}

    for _, v in pairs(Config.ScoreboardJobs) do
        scoreboardData.jobs[#scoreboardData.jobs + 1] = {
            name = v,
            count = 0,
        }
    end

    for _, v in pairs(Players) do
        for _, job in pairs(scoreboardData.jobs) do
            if v.PlayerData.job.name == job.name then
                job.count = job.count + 1
            end
        end
    end

    return scoreboardData
end)