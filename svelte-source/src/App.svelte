<script lang="ts">
  import Scoreboard from "@components/Scoreboard.svelte";
  import type { IScoreboard } from "@interfaces/scoreboard";
  import VisibilityProvider from "@providers/VisibilityProvider.svelte";
  import { debugData } from "@utils/debugData";
  import { cubicOut, cubicIn } from "svelte/easing";
  import { fly } from "svelte/transition";

  debugData<{ isVisible: boolean; scoreboardData: IScoreboard }>([
    {
      action: "setVisible",
      data: {
        isVisible: true,
        scoreboardData: {
          serverName: "Test Server",
          maxPlayerCount: 48,
          currentPlayers: [
            {
              name: "Test Player",
              id: 1,
              ping: 100,
            },
            {
              name: "Test Player 2",
              id: 2,
              ping: 20,
            },
          ],
          jobs: [
            {
              name: "Police",
              count: 10,
            },
            {
              name: "EMS",
              count: 5,
            },
            {
              name: "Mechanic",
              count: 2,
            },
          ],
          discord: "https://discord.gg/123456",
        },
      },
    },
  ]);
</script>

<main>
  <VisibilityProvider>
    <div
      class="container bg-neutral-800 text-neutral-50"
      in:fly={{ x: 1000, duration: 500, easing: cubicOut }}
      out:fly={{ x: 1000, duration: 500, easing: cubicIn }}
    >
      <Scoreboard />
    </div>
  </VisibilityProvider>
</main>

<style>
  .container {
    position: absolute;
    top: 0;
    right: 0;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    height: 100%;
    width: 25%;
    user-select: none;
  }
</style>
