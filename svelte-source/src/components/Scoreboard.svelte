<script lang='ts'>
  import Jobs from "./Jobs.svelte";
  import Players from "./Players.svelte";
  import type { IScoreboard } from "@interfaces/scoreboard";
  import { scoreboard } from "@store/scoreboard";

  let scoreboardData: IScoreboard;

  scoreboard.subscribe((data) => {
    scoreboardData = data;
  });
</script>


<div class="flex flex-col gap-2 p-2">
    <div class="flex flex-col gap-1 bg-neutral-900 p-2 rounded-md">
        <h1 class="text-3xl font-bold uppercase">{scoreboardData.serverName}</h1>
        <p>{scoreboardData.currentPlayers.length} / {scoreboardData.maxPlayerCount} Players</p>
    </div>
    <Jobs jobs={scoreboardData.jobs} />
    <Players players={scoreboardData.currentPlayers} />
    <span class="bg-neutral-900 p-2 rounded-md text-lg font-semibold text-center">
        {scoreboardData.discord}
    </span>
</div>