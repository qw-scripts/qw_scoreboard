<script lang="ts">
  import { useNuiEvent } from "@hooks/useNuiEvent";
  import { useFetchNui } from "@hooks/useFetchNui";
  import { onMount } from "svelte";
  import { visibility } from "@store/visibility";
  import type { IScoreboard } from "@interfaces/scoreboard"; 
  import { scoreboard } from "@store/scoreboard";

  let isVisible: boolean;
  visibility.subscribe((visible) => {
    isVisible = visible;
  });

  useNuiEvent<{ isVisible: boolean; scoreboardData: IScoreboard }>("setVisible", (data) => {
    visibility.set(data.isVisible);
    scoreboard.set(data.scoreboardData);
  });

  onMount(() => {
    const keyHandler = (e: KeyboardEvent) => {
      if (isVisible && ["Escape"].includes(e.code)) {
        useFetchNui("hideUI");
        visibility.set(false);
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  });
</script>

<main>
  {#if isVisible}
    <slot />
  {/if}
</main>
