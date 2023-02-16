export interface IScoreboard {
    serverName: string;
    maxPlayerCount: number;
    currentPlayers: {
        name: string;
        id: number;
        ping: number;
    }[];
    jobs: {
        name: string;
        count: number;
    }[];
    discord: string;
}