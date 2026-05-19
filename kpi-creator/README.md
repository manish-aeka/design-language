# KPI Creator — Design Language

> Aibii AI Business Intelligence SaaS · KPI Creator screen  
> Version 1.0 · May 2026

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Design Tokens](#design-tokens)
4. [Typography Scale](#typography-scale)
5. [Spacing & Sizing](#spacing--sizing)
6. [Layout Shell](#layout-shell)
7. [Sidebar](#sidebar)
8. [Topbar](#topbar)
9. [Canvas Area](#canvas-area)
10. [Chat Panel](#chat-panel)
11. [Chat Bubbles](#chat-bubbles)
12. [Suggestion Chips](#suggestion-chips)
13. [Chat Input](#chat-input)
14. [Generated Chart Card](#generated-chart-card)
15. [Source Badge](#source-badge)
16. [Chart Navigation](#chart-navigation)
17. [Animations & Motion](#animations--motion)
18. [States](#states)
19. [JS Reference](#js-reference)

---

## Overview

The **KPI Creator** is a three-panel AI-powered chart generation screen. The user types a metric description in the chat panel; the AI responds and renders a live chart preview in the central canvas. Multiple charts can be generated in one session and navigated via back/forward controls.

Key design rules:
- Same sidebar and topbar shell as every other Aibii screen.
- Canvas is a borderless, faintly tinted grid area (`#FCFDFF`) — visually distinct from the white sidebar/chat.
- Chat panel is 300 px wide, right-anchored, visually detached from canvas via an 8 px margin and `rounded-xl`.
- Generated chart cards: `bg-gray-50 border border-gray-200 rounded-xl`, max-width 860 px, centred.
- All interactive controls follow the same token set as Settings (same brand colour, same button heights, same badge patterns).

---

## Screen Anatomy

```
┌────────────────────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)            │ CANVAS (fluid)                      │ CHAT PANEL (300px)      │
│                            │                                     │  m-8px r,t,b            │
│  [M] Manish kumar's Work…  │  ≡   (breadcrumb topbar h-11)      │                         │
│  ─────────────────────     │──────────────────────────────────── │  ·· AI greeting bubble  │
│  🕐 Recent                 │                                     │                         │
│  ⊞  New Dashboard          │         [✦ icon]                    │  [Describe a chart…   ] │
│  💬 New Chat  ← active     │  What would you like to measure?    │  ─────────────────────  │
│  ─────────────────────     │  Pick an example below…             │   ↵ send · ⇧↵ newline  │
│  PROJECTS                  │                                     │                  [Send] │
│  ▶ My Private Project 📌   │   Try an example (6 chips 2×3)     │                         │
│  ▶ Sovereign Capital Gate  │                                     │                         │
│  ─────────────────────     │      ↓ after send ↓                 │                         │
│  👤 Shared with me         │                                     │                         │
│  ⚙  Settings               │  ┌──────────────────────────────┐   │   User bubble (right)   │
│  ─────────────────────     │  │ Chart title        [Source]  │   │                         │
│  ✨ Explore free           │  │ ┌────────────────────────┐   │   │   AI thinking (dots)    │
│                            │  │ │ Chart placeholder      │   │   │                         │
│                            │  │ └────────────────────────┘   │   │   AI response bubble    │
│                            │  │ ← 1 / 1 →    [Add to Dash]  │   │                         │
│                            │  └──────────────────────────────┘   │                         │
└────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Send button, Add to Dashboard, AI avatar gradient start, focus ring |
| `brand.secondary` | `#7C6FF7` | AI avatar gradient end |
| `workspace.blue` | `#3B5BDB` | User avatar bg, workspace avatar |
| `canvas.bg` | `#FCFDFF` | Canvas area background |
| `canvas.placeholder` | `#F3F4F6` | Chart placeholder fill inside card |
| `card.bg` | `#F9FAFB` | Generated chart card background (`bg-gray-50`) |
| `chat.bg` | `#FFFFFF` | Chat panel background |
| `bubble.ai.bg` | `#F3F4F6` | AI message bubble background |
| `bubble.user.bg` | `#5B63F6` | User message bubble background |
| `bubble.ai.text` | `#374151` | AI bubble text colour |
| `bubble.user.text` | `#FFFFFF` | User bubble text colour |
| `input.border` | `#E5E7EB` | Chat input wrapper border at rest |
| `input.border.focus` | `#5B63F6` | Chat input wrapper border on focus |
| `input.shadow.focus` | `rgba(91,99,246,0.09)` | Chat input focus glow (`0 0 0 3px`) |
| `input.toolbar.bg` | `#FAFAFA` | Toolbar row inside the input box |
| `chip.bg` | `#F3F4F6` | Suggestion chip background |
| `chip.bg.hover` | `#EEF2FF` | Suggestion chip hover |
| `chip.border` | `#E5E7EB` | Suggestion chip border |
| `chip.border.hover` | `#C7D2FE` | Suggestion chip hover border |
| `chip.text` | `#4B5563` | Suggestion chip label |
| `chip.text.hover` | `#4338CA` | Suggestion chip hover label |
| `time.text` | `#D1D5DB` | Message timestamp colour |
| `nav.active.bg` | `#EEF2FF` | Active sidebar nav item bg |
| `nav.active.border` | `#5B63F6` | Active nav item left border (2px) |

### Status / source badge colours (same as Settings)

| Source type | bg | color |
|---|---|---|
| Database | `#EEF2FF` | `#5B63F6` |
| File | `#FFF7ED` | `#F97316` |
| API | `#F0FDF4` | `#22C55E` |

---

## Typography Scale

**Family:** `'Inter', system-ui, -apple-system, sans-serif`  
**Weights loaded:** 400, 500, 600, 700, 800

| Role | Size | Weight | Colour |
|---|---|---|---|
| Page title (h1) | — | — | Not shown on KPI Creator (full canvas used) |
| Chart card title | `18px` | `700` | `#111827` |
| Empty state heading | `19px` | `700` | `#111827` |
| Empty state subtitle | `13px` | `400` | `#9CA3AF` |
| Try-an-example label | `11px` | `600` | `#C4C9D4` uppercase tracking-wide |
| AI/user bubble text | `12.5px` | `400` | `#374151` / `#FFFFFF` |
| Message timestamp | `10px` | `400` | `#D1D5DB` |
| Suggestion chip label | `11.5px` | `500` | `#4B5563` |
| Chat input text | `12.5px` | `400` | `#374151` |
| Chat input placeholder | `12.5px` | `400` | `#D1D5DB` |
| Send hint (`↵ send`) | `10px` | `400` | `#D1D5DB` |
| Send button | `11px` | `600` | `#FFFFFF` |
| Chart footer nav counter | `12px` | `600` | `#6B7280` tabular-nums |
| Add to Dashboard button | `11px` | `600` | `#FFFFFF` |
| Chart placeholder label | `12px` | `500` | `#9CA3AF` |
| Chart placeholder caption | `11px` | `400` | `#D1D5DB` |
| Source badge text | `11px` | `500` | varies by source type |
| Topbar user name | `13px` | `500` | `#374151` |
| Sidebar nav (primary) | `14px` | `400` | `#374151` |
| Sidebar nav (sub) | `13px` | `400` | `#6B7280` |

---

## Spacing & Sizing

| Element | Value |
|---|---|
| Sidebar width | `220px` fixed |
| Chat panel width | `300px` fixed |
| Chat panel margin | `8px` (top, right, bottom) separating it from canvas |
| Topbar height | `h-11` (44px) |
| Canvas padding (content) | `p-8` (32px) centred wrapper |
| Chat panel horizontal padding | `px-3` |
| Chat messages vertical padding | `py-4` |
| Chat message gap | `space-y-3` |
| Bubble padding | `9px 12px` |
| Bubble max-width | `208px` |
| Suggestion chip padding | `7px 10px` |
| Suggestion chip border-radius | `10px` |
| Suggestion chip icon size | `14px` |
| AI avatar size | `26 × 26px`, `border-radius: 8px` |
| User avatar size | `26 × 26px`, `border-radius: 50%` |
| AI avatar margin-top | `2px` (mt-0.5) to align with first text line |
| Chat input rows | `3` rows textarea |
| Send button height | `22px` |
| Send button padding | `px-2.5` |
| Chart card max-width | `860px` |
| Chart card header padding | `px-6 pt-5 pb-0` |
| Chart card body margin | `mx-6 my-5` |
| Chart card body height | `h-[380px]` |
| Chart card footer padding | `px-6 pb-5 pt-4` |
| Chart nav button size | `28 × 28px` (w-7 h-7), `border-radius: 8px` |
| Empty-state icon container | `72 × 72px`, `border-radius: 16px` |

---

## Layout Shell

```html
<body class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <aside id="sidebar" class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">
    <!-- sidebar content -->
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <!-- topbar h-11 (flex-shrink-0) -->
    <div class="flex-1 flex overflow-hidden">
      <!-- canvas area (flex-1) -->
      <!-- chat panel (w-[300px], margin: 8px 8px 8px 0) -->
    </div>
  </main>
</body>
```

The three-panel row uses `flex overflow-hidden` so that neither the canvas nor the chat panel ever causes a global scroll. The canvas uses `overflow-auto` internally to allow panning on large charts.

---

## Sidebar

Identical to all other Aibii screens:
- `w-[220px] bg-white border-r border-gray-100 overflow-y-auto`
- Workspace switcher at top (`border-b border-gray-100`, h ≈ 40px)
- Primary nav: `h-9` items, `px-3`, `rounded-lg`, hover `bg-[#EEF2FF]`
- Active item: `bg-[#EEF2FF] border-l-2 border-[#5B63F6]` (`pl-[10px]` overrides normal `px-3`)
- Project accordion: chevron rotates 90° on open (`.ws-chevron` transition)
- Collapsible via topbar hamburger — `#sidebar.collapsed { width:0; opacity:0 }`

---

## Topbar

```html
<div class="flex items-center justify-between px-8 h-11 border-b border-gray-100 flex-shrink-0">
  <!-- left: sidebar toggle (hamburger) -->
  <!-- right: notification bell + user avatar chip -->
</div>
```

- Height: `h-11` (44px), `border-b border-gray-100`
- Hamburger: `w-[18px] h-[18px]`, `text-gray-500 hover:text-gray-700`
- Notification bell: `w-8 h-8 rounded-lg`, hover `bg-gray-100`; red dot `w-1.5 h-1.5 bg-red-500`
- Notification dropdown: `w-80 rounded-2xl`, `max-h-72 overflow-y-auto`
- User chip: `pl-1 pr-2.5 h-8 rounded-full hover:bg-gray-100`; avatar `w-6 h-6 rounded-full bg-[#3B5BDB]`

---

## Canvas Area

```html
<div id="canvas-area" class="flex-1 canvas-grid flex items-center justify-center overflow-auto relative">
  <!-- #empty-state -->
  <!-- #generating-state (absolute overlay) -->
  <!-- #chart-output -->
</div>
```

```css
.canvas-grid { background-color: #FCFDFF; }
```

The canvas always occupies the remaining width after sidebar and chat panel. It uses `items-center justify-center` to centre all three states (empty, generating, chart). The `overflow-auto` allows panning if a chart is wider than the viewport.

### Empty State

```html
<div id="empty-state" class="flex flex-col items-center text-center px-8 py-10 ... bg-white rounded-xl overflow-hidden">
  <!-- icon container: 72×72 rounded-2xl bg-[#EEF2FF] border border-[#C7D2FE] -->
  <!-- h2 19px bold -->
  <!-- p 13px gray-400 -->
  <!-- try-an-example section: 6 suggestion chips in a 2-col grid -->
</div>
```

- White card lifts out of the tinted canvas to draw focus.
- Section label `"TRY AN EXAMPLE"`: `11px 600 uppercase #C4C9D4 letter-spacing:0.08em`

### Generating State

```html
<div id="generating-state" class="hidden absolute inset-0 flex flex-col items-center justify-center gap-3 bg-[#F8F9FC]/70 backdrop-blur-[1px]">
  <div class="flex gap-2 mb-1">
    <span class="dot"></span><span class="dot"></span><span class="dot"></span>
  </div>
  <p class="text-[13px] font-medium text-gray-500">Generating your chart…</p>
</div>
```

- Full-canvas semi-transparent overlay (`bg-[#F8F9FC]/70 backdrop-blur-[1px]`)
- Three brand dots animated with `dotBounce` (see [Animations](#animations--motion))

### Chart Output

```html
<div id="chart-output" class="hidden w-full h-full overflow-auto flex items-start justify-center p-8 rounded-xl bg-white"></div>
```

- Inner content: one chart card per `renderChartAtIndex()` call (always renders the current chart)

---

## Chat Panel

```html
<div class="w-[300px] min-w-[300px] flex flex-col border-l border-gray-100 bg-white rounded-xl overflow-hidden"
     style="margin:8px 8px 8px 0;">
  <div id="messages-container" class="flex-1 overflow-y-auto px-3 py-4 space-y-3 rounded-xl bg-white">
    <!-- bubbles -->
  </div>
  <div class="px-3 pb-3 pt-2.5 border-t border-gray-100 flex-shrink-0">
    <!-- input wrapper -->
  </div>
</div>
```

- `rounded-xl` on the outer container creates the detached floating appearance against the canvas.
- Messages scroll independently within `flex-1 overflow-y-auto`.
- Input area is `flex-shrink-0` — always visible at the bottom.
- `border-l border-gray-100` provides a hairline separator from the canvas on the left.

---

## Chat Bubbles

### AI Avatar

```css
.ai-avatar {
  width: 26px; height: 26px;
  border-radius: 8px;
  background: linear-gradient(140deg, #5B63F6 0%, #7C6FF7 100%);
  box-shadow: 0 1px 4px rgba(91,99,246,0.30);
}
```

Contains a 12–13px white SVG (sparkle / AI icon).

### User Avatar

```css
.user-avatar {
  width: 26px; height: 26px;
  border-radius: 50%;
  background: #3B5BDB;
  font-size: 10px; font-weight: 700; color: white;
}
```

Shows the user's initial ("M" for Manish).

### AI Bubble

```html
<div class="flex items-start gap-2 bubble-in">
  <div class="ai-avatar mt-0.5 flex-shrink-0"><!-- sparkle SVG --></div>
  <div>
    <div class="msg-bubble-ai">Message text here.</div>
    <p class="msg-time">just now</p>
  </div>
</div>
```

```css
.msg-bubble-ai {
  background: #F3F4F6;
  border-radius: 16px 16px 16px 4px;  /* flat bottom-left corner */
  padding: 9px 12px;
  font-size: 12.5px; line-height: 1.65;
  color: #374151;
  max-width: 208px;
}
```

### User Bubble

```html
<div class="flex items-start gap-2 justify-end bubble-in">
  <div>
    <div class="msg-bubble-user">User typed message.</div>
    <p class="msg-time right">just now</p>
  </div>
  <div class="user-avatar mt-0.5">M</div>
</div>
```

```css
.msg-bubble-user {
  background: #5B63F6;
  border-radius: 16px 16px 4px 16px;  /* flat bottom-right corner */
  padding: 9px 12px;
  font-size: 12.5px; line-height: 1.65;
  color: white;
  max-width: 208px;
}
```

### Timestamp

```css
.msg-time      { font-size: 10px; color: #D1D5DB; margin-top: 3px; padding-left: 2px; }
.msg-time.right { text-align: right; padding-right: 2px; padding-left: 0; }
```

### Thinking Bubble

Replaces the AI avatar + bubble with three animated dots while the chart is generating:

```html
<div style="background:#F3F4F6; border-radius:16px 16px 16px 4px; padding:10px 14px; display:inline-flex; align-items:center; gap:5px;">
  <span class="chat-dot"></span>
  <span class="chat-dot"></span>
  <span class="chat-dot"></span>
</div>
```

```css
.chat-dot {
  width: 5px; height: 5px; border-radius: 50%;
  background: #A0AEC0;
}
/* each nth-child staggered 0.18s */
```

---

## Suggestion Chips

Used in the empty state canvas to offer pre-canned queries.

```html
<button class="sugg-chip" onclick="sendChip('...')">
  <!-- 14×14 SVG icon -->
  Monthly revenue trend
</button>
```

```css
.sugg-chip {
  width: 100%; text-align: left;
  display: flex; align-items: center; gap: 8px;
  padding: 7px 10px;
  border-radius: 10px;
  border: 1px solid #E5E7EB;
  background: #F3F4F6;
  font-size: 11.5px; font-weight: 500; color: #4B5563;
  cursor: pointer;
  transition: all 130ms ease;
}
.sugg-chip:hover {
  background: #EEF2FF;
  border-color: #C7D2FE;
  color: #4338CA;
}
.sugg-chip svg { flex-shrink: 0; color: #9CA3AF; }
.sugg-chip:hover svg { color: #6366F1; }
```

Chips are arranged in a `grid grid-cols-2 gap-2` within a `max-w-[520px]` container.

---

## Chat Input

The input is a custom-styled wrapper — not a plain `<input>` — to allow multi-line text and a toolbar row.

```html
<div class="input-wrapper">
  <textarea id="chat-input" rows="3" placeholder="Describe a chart…"
    class="w-full text-[12.5px] text-gray-800 placeholder-gray-300 px-3 py-2.5 leading-relaxed bg-white block"
    oninput="onInputChange(this)" onkeydown="onKeyDown(event)">
  </textarea>
  <!-- Toolbar row -->
  <div class="flex items-center justify-between px-2.5 py-2 border-t border-gray-100" style="background:#FAFAFA;">
    <span class="text-[10px]" style="color:#D1D5DB;">↵ send · ⇧↵ newline</span>
    <button id="send-btn" onclick="sendMessage()"
      class="flex items-center gap-1.5 px-2.5 h-[22px] rounded-md text-[11px] font-semibold text-white"
      style="background:#5B63F6;">
      Send
      <!-- up-arrow SVG 10×10 stroke-width 2.5 -->
    </button>
  </div>
</div>
```

```css
.input-wrapper {
  border-radius: 12px;
  border: 1.5px solid #E5E7EB;
  background: white;
  overflow: hidden;
  transition: border-color 160ms ease, box-shadow 160ms ease;
}
.input-wrapper:focus-within {
  border-color: #5B63F6;
  box-shadow: 0 0 0 3px rgba(91,99,246,0.09);
}
```

Send button starts at `opacity: 0.4; cursor: not-allowed` and activates (`opacity:1; cursor:pointer`) when input is non-empty. Pressing `Enter` (without Shift) submits; `Shift+Enter` inserts a newline.

---

## Generated Chart Card

Rendered by `renderChartAtIndex(idx)` into `#chart-output`.

```html
<div class="w-full max-w-[860px] fade-up">
  <div class="bg-gray-50 border border-gray-200 rounded-xl overflow-hidden"
       style="box-shadow:0 1px 3px rgba(0,0,0,0.06),0 1px 2px rgba(0,0,0,0.04);">

    <!-- Header: title (left) + source badge (right) -->
    <div class="flex items-start justify-between px-6 pt-5 pb-0">
      <h3 class="text-[18px] font-bold text-gray-900">Chart title</h3>
      <span class="inline-flex items-center gap-1 px-2 py-0.5 rounded-md text-[11px] font-medium mt-1 flex-shrink-0"
            style="background:{source.bg}; color:{source.color};">
        <!-- source type icon 12×12 -->
        Source name
      </span>
    </div>

    <!-- Chart placeholder -->
    <div class="mx-6 my-5 h-[380px] rounded-lg flex flex-col items-center justify-center gap-2.5"
         style="background:#F3F4F6;">
      <!-- icon: 40×40 rounded-xl bg-[#EEF2FF] -->
      <p class="text-[12px] font-medium text-gray-400">Chart renders here in production</p>
      <p class="text-[11px] text-gray-300">Connect a real datasource to populate</p>
    </div>

    <!-- Footer: navigation (left) + CTA (right) -->
    <div class="flex items-center justify-between px-6 pb-5 pt-4 border-t border-gray-100">
      <!-- nav -->
      <div class="flex items-center gap-1.5">
        <button onclick="prevChart()">← chevron</button>
        <span class="text-[12px] font-semibold text-gray-500 tabular-nums px-1">1 / 1</span>
        <button onclick="nextChart()">→ chevron</button>
      </div>
      <!-- CTA -->
      <button onclick="addToDashboard()" style="background:#5B63F6;"
        class="flex items-center gap-1.5 px-3 h-7 rounded-lg text-[11px] font-semibold text-white hover:opacity-90">
        + Add to Dashboard
      </button>
    </div>
  </div>
</div>
```

---

## Source Badge

The source badge appears top-right in the chart card header and identifies which datasource the chart was derived from. It reuses the same colour token system as the Type badges in the Settings Datasources tables.

### Source detection logic (keyword → datasource)

| Prompt keywords | Source name | Icon type | bg | color |
|---|---|---|---|---|
| revenue, sales, q4, region | Q4 Revenue Sheet | `file` | `#FFF7ED` | `#F97316` |
| customer, retention, cohort, returning | CRM Export | `database` | `#EEF2FF` | `#5B63F6` |
| marketing, spend, roi | Marketing Sheet | `file` | `#FFF7ED` | `#F97316` |
| product, top, inventory | Sales API | `api` | `#F0FDF4` | `#22C55E` |
| event, user, session | User Events DB | `database` | `#EEF2FF` | `#5B63F6` |
| *(fallback)* | Analytics DB | `database` | `#EEF2FF` | `#5B63F6` |

### Icon SVGs used (12×12, stroke 1.5)
- **file** — document icon (Heroicons `document-text`)
- **api** — code brackets icon (Heroicons `code-bracket-square`)
- **database** — cylinder icon (custom ellipse + paths)

---

## Chart Navigation

The bottom-left of every chart card shows `←  n / total  →`:

- **Back button**: `w-7 h-7 rounded-lg border border-gray-200` — disabled (`opacity-40 cursor-not-allowed`) when `idx === 0`
- **Counter**: `text-[12px] font-semibold text-gray-500 tabular-nums` — e.g. `2 / 4`
- **Forward button**: same as back, disabled when `idx === charts.length - 1`

The charts array is in-memory: `const charts = []` (`{ prompt, source }` objects). Clearing the chat resets this array and `currentChartIndex` to `-1`. Each new chart is pushed to the array and the view navigates to the newest.

---

## Animations & Motion

| Name | Applied to | Description |
|---|---|---|
| `dotBounce` | `.dot` (generating overlay) | Three 7px brand-coloured dots, `translateY(-5px)` at 50%, staggered `0s / 0.15s / 0.30s`, duration `0.9s` |
| `chatDot` | `.chat-dot` (thinking bubble) | Three 5px grey dots, scale + opacity pulse, staggered `0s / 0.18s / 0.36s`, duration `1.1s` |
| `fadeUp` | `.fade-up` (chart card) | `opacity 0→1` + `translateY 10px→0`, `0.3s ease-out` |
| `bubbleIn` | `.bubble-in` (new messages) | `opacity 0→1` + `translateY(6px) scale(0.97) → normal`, `0.22s ease-out` |

All transitions on interactive elements:
- Sidebar nav: `background-color 100ms ease`
- Suggestion chips: `all 130ms ease`
- Input wrapper border: `160ms ease`
- Send button opacity: `150ms`
- Chart nav buttons: `colors` transition (Tailwind default)

Sidebar collapse: `width 220ms ease, min-width 220ms ease, opacity 180ms ease`

---

## States

### Send Button
| State | Style |
|---|---|
| Empty input | `opacity: 0.4; cursor: not-allowed` |
| Input has text | `opacity: 1; cursor: pointer` |

### Chart Nav Buttons
| State | Style |
|---|---|
| Navigable | `hover:bg-gray-100 cursor-pointer` |
| At boundary | `opacity-40 cursor-not-allowed` `disabled` attribute |

### Chart Output
| State | Visible element |
|---|---|
| No query sent | `#empty-state` (centred in canvas) |
| Generating | `#generating-state` (absolute overlay, `#empty-state` hidden) |
| Chart ready | `#chart-output` (generating hidden, `#empty-state` hidden) |
| Session cleared | Back to `#empty-state`, `#chart-output` emptied and hidden |

---

## JS Reference

| Function | Purpose |
|---|---|
| `sendMessage()` | Reads textarea, trims, calls `triggerSend()` |
| `sendChip(text)` | Directly calls `triggerSend(text)` (from empty-state chips) |
| `triggerSend(text)` | Adds user bubble, thinking bubble, hides empty state, shows generating overlay; after 2.2s timeout: removes thinking, adds AI bubble, calls `showGeneratedChart()` |
| `showGeneratedChart(prompt)` | Resolves source, pushes `{prompt, source}` to `charts[]`, sets `currentChartIndex`, calls `renderChartAtIndex()` |
| `renderChartAtIndex(idx)` | Renders complete chart card HTML with correct nav state into `#chart-output` |
| `prevChart()` / `nextChart()` | Decrement/increment `currentChartIndex`, call `renderChartAtIndex()` |
| `resolveSource(prompt)` | Keyword-matches prompt to a datasource object `{name, icon, bg, color}` |
| `sourceIconSVG(type)` | Returns inline SVG string for `'file'`, `'api'`, or `'database'` |
| `addToDashboard()` | Navigates to `../dashboard/index.html` |
| `appendUserBubble(text)` | Creates and appends user message DOM node |
| `appendThinkingBubble()` | Creates thinking-dots node, returns id for removal |
| `removeThinkingBubble(id)` | Removes node by id |
| `appendAIBubble(text)` | Creates and appends AI response node |
| `clearChat()` / `confirmClear()` | Resets messages, clears `charts[]`, resets `currentChartIndex`, shows empty state |
| `onInputChange(el)` | Enables/disables send button based on input value |
| `onKeyDown(e)` | `Enter` → submit; `Shift+Enter` → newline |
| `escHtml(s)` | Escapes `&`, `<`, `>`, `"` for safe DOM insertion |
| `toggleSidebar()` | Toggles `#sidebar.collapsed` class |
| `toggleWorkspace(id)` | Accordion toggle for sidebar project groups |
| `toggleNotifications()` | Shows/hides `#notif-dropdown` |
| `markAllRead()` | Clears notification dot and unread highlight styles |
| `openWsModal()` / `closeWsModal(e)` | Workspace Switcher modal lifecycle |
| `renderWsModalList(filter)` | Renders filtered workspace rows in `#ws-modal-list` |
| `filterWsList()` | Reads `#ws-search`, calls `renderWsModalList` |
| `selectWorkspace(id)` | Switches active workspace, updates sidebar header |
| `openNewWsModal()` / `closeNewWsModal()` | New Workspace full-screen lifecycle |
| `cycleWsColor()` | Cycles avatar color through 7 presets |
| `onWsNameInput(val)` | Live preview for workspace name + avatar letter |
| `createNewWs()` | Pushes new workspace to `wsData`, selects it |

---

## Workspace Switcher Modal (`#ws-modal-backdrop`)

Opened by `openWsModal()`. Backdrop: `rgba(17,24,39,0.45) backdrop-filter:blur(2px)`. Click backdrop → `closeWsModal(event)`.

```
#ws-modal  rounded-lg max-w-lg max-height:620px bg-white
  Header
    h2  "Switch Workspace"  text-[15px] font-semibold text-gray-900
    p   "Select a workspace to switch to"  text-[12px] text-gray-400
    button  "New Workspace"  bg:#5B63F6 hover:#4850e4  → openNewWsModal()
  Search  #ws-search  oninput="filterWsList()"
  List    #ws-modal-list  rendered by renderWsModalList(filter)
```

`wsData` array (6 entries, merged with `localStorage('aibii_workspaces')`):

| `id` | Name | Initial | Color | Current |
|---|---|---|---|---|
| `ws-manish` | Manish kumar's Workspace | M | `#3B5BDB` | ✓ |
| `ws-scg` | Sovereign Capital Gate | S | `#5B63F6` | — |
| `ws-design` | Design System | D | `#16A34A` | — |
| `ws-data` | Data Analytics | A | `#F97316` | — |
| `ws-prod` | Product Research | P | `#8B5CF6` | — |
| `ws-mkt` | Marketing Hub | H | `#EC4899` | — |

## New Workspace (`#new-ws-modal`, full-screen)

`hidden fixed inset-0 z-[60]`, `background:#F3F4F6` with mini Aibii topbar (close ×).
Form card: `rounded-lg max-w-lg px-7 py-8`.
- `#ws-preview-avatar` `w-11 h-11 rounded-xl` → `cycleWsColor()`; hint `"Click avatar to change color"`
- `#ws-preview-name` live preview
- `#new-ws-name` → `onWsNameInput(val)`; Enter → `createNewWs()`
- `#new-ws-desc` textarea (optional)
- Cancel + Create buttons (Create: `bg:#5B63F6 hover:#4850e4`)

`wsColors` palette (7): `#5B63F6 · #16A34A · #F97316 · #8B5CF6 · #EC4899 · #0EA5E9 · #EAB308`
