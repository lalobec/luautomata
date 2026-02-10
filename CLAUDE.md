# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Luautomata is a Conway's Game of Life implementation built with [LÖVE (Love2D)](https://love2d.org/), a Lua framework for 2D games.

## Running the App

```bash
love .
```

To run test prototypes in the `tests/` directory:
```bash
love tests/menu
love tests/winchange
```

## Architecture

The app uses a simple state machine with two states: `MENU` and `PLAYING`.

**Core modules (root directory):**
- `main.lua` — LÖVE entry point. Manages the game state machine and wires together the menu and grid. Uses LÖVE callbacks: `love.load()`, `love.draw()`, `love.update()`, `love.keypressed()`.
- `parameters.lua` — Central configuration (cell size, window dimensions, derived grid dimensions). Required by both `grid.lua` and `main.lua`.
- `grid.lua` — Grid module. Handles creation, rendering, cell selection via mouse, Game of Life rules (`next_grid` with neighbor counting), and clearing.
- `button.lua` — Reusable UI button using metatables. Handles drawing, hover/press states, and click callbacks. Used by both menu and grid screens.
- `menu.lua` — Menu screen with "Start Game of Life" and "Exit" buttons.

**Key controls during gameplay:**
- Left click: activate cells
- Space: advance one generation
- Escape: quit

**`tests/` directory** contains standalone LÖVE prototypes (each is a self-contained `love .`-runnable app) used to develop features in isolation:
- `tests/menu/` — Menu system prototype (has its own older `button.lua` with a different API)
- `tests/winchange/` — Window/state switching prototype

**OOP pattern:** Modules use Lua metatables for object-oriented behavior. `Button.new()` returns a table with `setmetatable(self, {__index = Button})`. Some modules use the colon syntax (`:` methods with implicit `self`), others use dot syntax (`.` methods with explicit parameters).

## Lua / LÖVE Conventions

- Modules return a table at the end of the file (`return Module`).
- Grid is a 2D table indexed as `grid[y][x]` (row-major).
- Colors use LÖVE's 0-1 float range or `love.math.colorFromBytes()` for 0-255 values.
