<script lang="ts">
  import type { IScoreboard } from "@interfaces/scoreboard";
  import { each } from "svelte/internal";

  export let players: IScoreboard["currentPlayers"];
</script>

<div class="bg-neutral-900 p-2 rounded-md">
  <div class="flex flex-col gap-2 p-2 h-[42.5rem] overflow-y-scroll">
    {#each players as player}
      <div
        class="flex items-center justify-between gap-2 p-3 bg-neutral-800 rounded-md shadow-sm"
      >
        <div class="flex items-center gap-2">
          <span
            class="flex items-center justify-center w-8 h-8 border-2 border-neutral-50 rounded-full"
          >
            {player.id}
          </span>
          <p class="font-medium">{player.name}</p>
        </div>
        <div class="font-semibold text-sm">
          {#if player.ping <= 50}
            <span class="text-green-400">{player.ping}ms</span>
          {:else if player.ping <= 100 && player.ping > 50}
            <span class="text-yellow-400">{player.ping}ms</span>
          {:else if player.ping > 100}
            <span class="text-red-400">{player.ping}ms</span>
          {/if}
        </div>
      </div>
    {/each}
  </div>
</div>
