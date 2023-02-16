import type { IScoreboard } from "@interfaces/scoreboard";
import { writable } from "svelte/store";



export const scoreboard = writable<IScoreboard | null>(null);