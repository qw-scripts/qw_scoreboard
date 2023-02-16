<script lang="ts">
  import type { IScoreboard } from "@interfaces/scoreboard";

  export let jobs: IScoreboard["jobs"];
</script>

<div class="bg-neutral-900 p-2 rounded-md">
  <div class="flex flex-col gap-2 p-2 h-[12.5rem] overflow-y-scroll">
    {#each jobs as job}
      <div
        class="flex items-center gap-2 p-3 bg-neutral-800 rounded-md shadow-sm"
      >
        <span
          class="flex items-center justify-center w-8 h-8 border-2 border-neutral-50 rounded-full"
        >
          {job.count}
        </span>
        <p class="font-medium">{job.name}</p>
      </div>
    {/each}
  </div>
</div>
