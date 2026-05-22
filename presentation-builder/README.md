# Presentation Builder — Design Language

> Aibii AI Business Intelligence SaaS · Presentation Builder screen  
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
9. [Presentation Title Bar](#presentation-title-bar)
10. [State System](#state-system)
11. [State: Prompt](#state-prompt)
12. [State: Outline](#state-outline)
13. [State: Theme](#state-theme)
14. [State: Editor](#state-editor)
15. [Slides Filmstrip Panel](#slides-filmstrip-panel)
16. [Main Slide Frame](#main-slide-frame)
17. [AI Chat Panel (Editor)](#ai-chat-panel-editor)
18. [Sources Drawer](#sources-drawer)
19. [Workspace Switcher Modal](#workspace-switcher-modal)
20. [Motion & Transitions](#motion--transitions)
21. [JS Reference](#js-reference)

---

## Overview

The **Presentation Builder** is a four-stage AI-powered slide creator. The user prompts for a topic, reviews a generated outline, picks a theme, and then edits the final presentation in a Google Slides–inspired canvas. An AI chat panel on the right assists throughout.

Key design rules:
- Same 220 px sidebar and `h-11` topbar as all Aibii screens.
- A **presentation title bar** (`h-12`) sits below the topbar (visible only in editor state).
- The main area cycles through four `.ppt-state` panels; only the `.active` one is visible (`display: flex`).
- The editor state uses a left filmstrip panel (`168px`, `background: #E8EAED`) + fluid canvas + right AI panel.
- Slide thumbnail previews are `144 × 81px` with `transform: scale(0.3)` of a `480 × 270px` inner div.
- Scrollbar: `width: 3px`, thumb `#CBD5E1`.

---

## Screen Anatomy

### Prompt / Outline / Theme states

```
┌──────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)  │  MAIN AREA (fluid)                                    │
│                  │  ≡  Topbar (h-11)                        🔔  [M]      │
│                  │──────────────────────────────────────────────────────  │
│                  │                                                       │
│                  │    [Centered prompt / outline / theme UI]            │
│                  │                                                       │
└──────────────────────────────────────────────────────────────────────────┘
```

### Editor state

```
┌───────────────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px) │ EDITOR COLUMN (fluid)                       │ AI PANEL (320px)      │
│                 │ Presentation Title Bar (h-12)               │                       │
│                 │─────────────────────────────────────────────│──────────────────────│
│                 │ FILMSTRIP (168px) │ CANVAS (fluid)          │  Chat messages       │
│                 │  bg:#E8EAED       │  bg:white               │  [input…]            │
│                 │  Slides 1–8       │  16:9 slide frame       │                       │
└───────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active tone/count pill, active outline item border, active theme card border, send button, active nav border, slide accent |
| `brand.secondary` | `#7C6FF7` | AI chat dot animation, slide accent (secondary) |
| `workspace.blue` | `#3B5BDB` | User avatar bg, Share button bg |
| `hover` | `#EEF2FF` | Active nav bg, active tone/count pill bg, sugg-chip hover bg |
| `#FAFAFA` | — | Suggestion chip bg |
| `#E8EAED` | — | Slides filmstrip panel bg |
| `#DADCE0` | — | Filmstrip right border |
| `#80868B` | — | Filmstrip label text |
| `#1A73E8` | — | Active thumbnail border (Google Slides blue) |
| `#AECBFA` | — | Thumbnail hover border |
| `gray-200` | `#E5E7EB` | Input wrapper border, button borders, thumbnail default border |
| `gray-100` | `#F3F4F6` | Canvas empty state icon bg |
| `gray-50` | `#F9FAFB` | Toolbar button hover |
| `#C7D2FE` | — | Active tone/count pill border, explore banner icon circle |
| `#E8EEFF` | — | Explore banner bg |
| `#EEF2FF` | — | Active outline-item bg |
| `#FAFCFF` | — | Outline-item hover bg |

### Status badge / AI dot colors

| Role | Color |
|---|---|
| `.step-dot.done` | bg `#DCFCE7`, text `#16A34A` |
| `.step-dot.act` | bg `#EEF2FF`, text `#5B63F6`, border `#5B63F6` |
| `.step-dot.todo` | bg `#F3F4F6`, text `#D1D5DB` |

---

## Typography Scale

**Family:** `'Inter', system-ui, -apple-system, sans-serif`  
**Weights loaded:** 400, 500, 600, 700, 800

| Role | Size | Weight | Color |
|---|---|---|---|
| Presentation title (title bar) | `15px` | `700` | `#111827` |
| Toolbar button label | `12px` | `500` | `#374151` |
| Prompt empty-state heading | `19px` | `700` | `#111827` |
| Prompt subtitle | `13px` | `400` | `#9CA3AF` |
| Suggestion chip label | `12px` | `500` | `#4B5563` |
| Tone/count pill | `12px` | `500`/`600` (active) | `#374151` / `#4338CA` |
| Outline item heading | `14px` | `600` | `#111827` |
| Outline item sub-text | `12px` | `400` | `#6B7280` |
| Step dot label | `10px` | `700` | varies |
| Filmstrip label | `9.5px` | `600` | `#80868B` |
| AI bubble text | `13px` | `400` | `#374151` |
| AI input text | `13px` | `400` | `#374151` |
| Canvas empty state heading | `15px` | `600` | `#9CA3AF` |
| Canvas empty state sub | `13px` | `400` | `#CBD5E1` |
| Sidebar nav (primary) | `14px` (sm) | `400` | `#374151` |
| Sidebar sub-nav | `13px` | `400` | `#4B5563` |

---

## Spacing & Sizing

| Element | Value |
|---|---|
| Sidebar width | `220px` fixed |
| AI panel width | `320px` fixed |
| Filmstrip panel width | `168px` |
| Topbar height | `h-11` (44px) |
| Presentation title bar height | `h-12` (48px) |
| Input wrapper border-radius | `12px` |
| Input wrapper border at rest | `1.5px solid #E5E7EB` |
| Input wrapper focus border | `1.5px solid #5B63F6` + `0 0 0 3px rgba(91,99,246,0.09)` |
| Suggestion chip padding | `7px 12px` |
| Suggestion chip border-radius | `10px` |
| Tone pill height | `28px` |
| Tone pill padding | `0 12px` |
| Count box size | `36 × 28px` |
| Outline item padding | `10px 14px` |
| Outline item border-radius | `10px` |
| Theme card aspect ratio | `16/10` |
| Theme card border | `1.5px solid #E5E7EB` |
| Theme card border-radius | `10px` |
| Slide thumbnail | `144 × 81px` |
| Thumbnail inner size | `480 × 270px`, `transform: scale(0.3)` |
| Main slide frame aspect ratio | `16/9` |
| Canvas nav button | `36 × 36px` rounded-full |
| Step dot (done/todo) | `22 × 22px` |
| Step dot (active) | `22 × 22px` + `border: 1.5px solid #5B63F6` |
| Generating overlay dot | `7 × 7px` border-radius 50% |
| Generating AI dot (chat) | `5 × 5px` border-radius 50% |

---

## Layout Shell

```html
<body class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <aside id="sidebar" class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">
    <!-- sidebar -->
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <!-- topbar h-11 (always visible) -->
    <!-- ppt-name-bar h-12 (editor state only) -->
    <div class="flex-1 flex overflow-hidden">
      <!-- ppt-state panels: .ppt-state (display:none) → .active (display:flex flex-col flex-1) -->
    </div>
  </main>
</body>
```

---

## Sidebar

### Active Item

**Project:** Sovereign Capital Gate — `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:6px`.  
**Active sub-item:** "Investor Pitch" — `background:#EEF2FF; color:#5B63F6`, presentation icon color `#7C6FF7`.

### Project List (4 workspaces)

| ID | Name | State |
|---|---|---|
| `ws2` | My Private Project | Collapsed |
| `ws1` | Sovereign Capital Gate | **ACTIVE**, expanded |
| `ws4` | Product Roadmap Q3 | Collapsed |

**Sovereign Capital Gate sub-items (3 shown):**

| Name | Type | Icon color | State |
|---|---|---|---|
| Capital Analysis | Dashboard | `#16A34A` | — |
| Investor Pitch | Presentation | `#7C6FF7` | **Active** |
| Business Intelligence | Document | `#F97316` | → `../document-builder/index.html` |

**My Private Project sub-items:**

| Name | Type | Icon color |
|---|---|---|
| Roadmap 2026 | Document | `#F97316` |
| Investor Update | Chat | `#5B63F6` |

**Product Roadmap Q3 sub-items:**

| Name | Type | Icon color |
|---|---|---|
| OKR Tracker | Dashboard | `#16A34A` |

### Bottom Nav

| Item | Icon | `href` |
|---|---|---|
| Datasources | database cylinder | `../datasource/index.html` |
| Settings | gear | `../settings-profile/index.html` |

### Explore Banner

`background:#E8EEFF`, sparkle icon `#4F6EF7` on `#C7D2FE` circle, `rounded-lg`.

---

## Topbar

**Height:** `h-11` · `border-b border-gray-100` · `bg-white` · `px-5`

| Zone | Content |
|---|---|
| Left | Hamburger → `toggleSidebar()` |
| Right | Notification bell + user avatar (`#3B5BDB`, `M`) |

Notification dropdown `id="notif-dropdown"` — no unread items in this page's default state.  
User dropdown `id="user-dropdown"` — same pattern as all screens.

---

## Presentation Title Bar

**Visible in editor state only.** `id="ppt-name-bar"` · `h-12` · `border-b border-gray-200` · `bg-white` · `px-5`

### Left

```
presentation SVG icon (w-15px h-15px, text-gray-700)
h1 id="subbar-title"  "Investor Pitch"  text-[15px] font-bold text-gray-900
```

### Right — `id="sb-actions-editor"`

| Button | Style | Action |
|---|---|---|
| Sources | `.toolbar-btn .sources-btn` | `toggleSourcesDrawer()` |
| *(divider)* | `w-px h-5 bg-gray-200` | — |
| Present | `.toolbar-btn` | static |
| Export | `.toolbar-btn` | static |
| *(divider)* | `w-px h-5 bg-gray-200` | — |
| Share | `h-[30px] px-3 rounded-lg text-white bg-[#3B5BDB]` | static |

---

## State System

Four states managed by `.ppt-state` / `.ppt-state.active`:

| State ID | When active | `display` |
|---|---|---|
| `state-prompt` | Initial load | `flex flex-col flex-1` |
| `state-outline` | After prompt submitted | `flex flex-col flex-1` |
| `state-theme` | After outline confirmed | `flex flex-col flex-1` |
| `state-editor` | After theme selected | `flex flex-1 min-h-0 overflow-hidden` |

Transitions between states: `activateState(id)` — removes `.active` from all, adds to target.

---

## State: Prompt

**Layout:** centred column, `p-8`, `max-w-xl mx-auto`.

```
[Title: "What's your presentation about?"]   (19px 700)
[Subtitle: "Describe your topic..."]          (13px text-gray-400)

[Input wrapper]
  contenteditable #ppt-ai-input (data-placeholder="Describe a topic or paste your notes…")
  [toolbar row: Tone label + tone pills + slide count boxes + Send button]

[Step indicator row: ① Prompt  ② Outline  ③ Theme  ④ Create]

[Suggestion chips grid: 2×3]
```

### Tone Pills

Active by default: **Professional**

| Pill | ID |
|---|---|
| Professional | `tone-pro` |
| Friendly | `tone-friendly` |
| Formal | `tone-formal` |

`.tone-pill.active`: `background:#EEF2FF; border-color:#5B63F6; color:#4338CA; font-weight:600`

### Slide Count Boxes

`.count-box.active` default: `8`

Available counts: 5, 8, 12, 16.  
`.count-box.active`: `background:#EEF2FF; border-color:#5B63F6; color:#4338CA`

### Send Button

```
h-[30px] px-3 rounded-lg text-[12px] font-semibold text-white bg-[#5B63F6]
hover: opacity 0.9
```

Click → `submitPrompt()` → transitions to `state-outline`.

### Step Indicator

```
① Prompt  →  ② Outline  →  ③ Theme  →  ④ Create
```

Each step: `.step-dot` (22px circle) + label text (11px gray-500).

| State | `.step-dot` class | Color |
|---|---|---|
| Completed | `.done` | bg `#DCFCE7`, text `#16A34A` |
| Current | `.act` | bg `#EEF2FF`, text `#5B63F6`, border `#5B63F6` |
| Future | `.todo` | bg `#F3F4F6`, text `#D1D5DB` |

### Suggestion Chips

6 chips in a 2×3 grid. `.sugg-chip` spec:

```css
display: flex; align-items: center; gap: 8px;
padding: 7px 12px; border-radius: 10px;
border: 1px solid #E5E7EB; background: #FAFAFA;
font-size: 12px; font-weight: 500; color: #4B5563;
transition: all 130ms ease;
```
Hover: `background:#EEF2FF; border-color:#C7D2FE; color:#4338CA`

---

## State: Outline

**Layout:** `overflow-y-auto px-8 py-8`, `max-w-2xl mx-auto`.

```
[Back arrow] "Review your outline"  (18px 700)
[Subtitle: "Edit slides below before generating…"]  (13px text-gray-500)

[Outline items list]   (id="outline-list")
  Each item: .outline-item
    [Step dot] [Title (editable)] [Subtitle (editable)] [Delete button]

[Footer row]
  "X slides" counter  +  [Back]  [Generate Presentation →]
```

### `.outline-item`

```css
display: flex; align-items: flex-start; gap: 12px;
padding: 10px 14px; border-radius: 10px;
border: 1px solid #E5E7EB; background: #fff;
transition: all 100ms ease;
```
Hover / active: `border-color:#C7D2FE; background:#FAFCFF`

Rendered by `renderOutline()` — default 8 outline items matching the 8 generated slides.

---

## State: Theme

**Layout:** `overflow-y-auto px-8 py-8`, `max-w-2xl mx-auto`.

```
[Back arrow] "Choose a theme"  (18px 700)
[Subtitle: "Pick a visual style for your slides"]  (13px text-gray-500)

[Theme cards grid: 3 columns, gap-3]
  Each card: .theme-card (border-radius:10px, border:1.5px, aspect-ratio:16/10)
    [Preview swatch + theme name + description]

[Footer row]
  [Back]  [Create Slides →]
```

### `.theme-card`

```css
border-radius: 10px; border: 1.5px solid #E5E7EB;
overflow: hidden; cursor: pointer; aspect-ratio: 16/10;
transition: all 100ms ease;
```
Hover (inactive): `border-color:#C7D2FE`  
Active: `border-color:#5B63F6`

Themes available:
- **Modern Dark** (default) — `bg:#0F172A`, accent `#5B63F6`
- **Clean Light** — `bg:#fff`, accent `#5B63F6`
- **Bold Blue** — gradient `#3730A3 → #1E40AF`
- **Warm Neutral** — `bg:#FFFBF7`, accent `#F97316`
- **Forest** — `bg:#064E3B`, accent `#10B981`
- **Rose Quartz** — `bg:#FFF1F2`, accent `#E11D48`

---

## State: Editor

**Layout:** `flex flex-1 min-h-0 overflow-hidden`

Three regions side by side:
1. Slides filmstrip panel (`168px`)
2. Canvas area (fluid)
3. AI chat panel (`320px`)

Before generation: canvas shows empty state + generating overlay.  
After generation: filmstrip and slide display appear.

---

## Slides Filmstrip Panel

**Width:** `168px` · `background: #E8EAED` · `border-right: 1px solid #DADCE0` · `overflow-y: auto` · `py-3`

Header label: `"SLIDES"` — 9.5px 600 `#80868B` uppercase tracking-wide, `px-4 mb-2`.

### Slide Thumbnails

Each thumbnail: `.thumb-outer` (cursor pointer, `onclick="selectSlide(n)"`)

```
.thumb-label  (9px 600 #80868B, text-center, mb-3px)  "1"
.thumb-preview  (144×81px, rounded 3px, border 1.5px)
  .thumb-inner  (480×270px, transform:scale(0.3), transform-origin:top left)
    [full slide markup at 480×270 resolution]
```

**Thumbnail border states:**
- Default: `border: 1.5px solid transparent`
- Hover: `border-color: #AECBFA`
- Active: `border-color: #1A73E8 !important; box-shadow: 0 0 0 1.5px #1A73E8`

### The 8 Slides

| # | Title | Theme bg | Accent |
|---|---|---|---|
| 1 | INVESTOR PITCH | `#0F172A` (dark) | `#5B63F6` |
| 2 | The Problem | `#fff` | `#EF4444` (red) |
| 3 | Our Solution | `#F0F4FF` | `#5B63F6` |
| 4 | Market Opportunity | `#fff` | TAM/SAM/SOM circles |
| 5 | The Product | `#fff` | `#5B63F6` bullets |
| 6 | We're Growing Fast | `#fff` | `#16A34A` metrics |
| 7 | The Team | `#fff` | indigo/green/orange avatars |
| 8 | The Ask / Raising $3M Seed | `#5B63F6` (brand) | white text |

---

## Main Slide Frame

**Container:** `flex-1 flex flex-col overflow-hidden`, padded `20px 16px`.

```
[prev-btn ←]  [main-slide-frame (flex:1, aspect-ratio:16/9)]  [next-btn →]
```

**`.canvas-nav`** (prev/next):
```css
width: 36px; height: 36px; border-radius: 50%;
background: rgba(0,0,0,0.07); border: none;
transition: background 100ms ease;
```
Hover: `rgba(0,0,0,0.13)` · Disabled: `opacity: 0.25`

**`#main-slide-frame`:**
```css
flex: 1; aspect-ratio: 16/9;
position: relative; overflow: hidden;
background: white;
box-shadow: 0 4px 24px rgba(0,0,0,0.14), 0 1px 4px rgba(0,0,0,0.08);
border-radius: 2px; border: 1px solid #E0E0E0;
```

Slide pages: `.slide-page` (absolute, inset-0) — `display:none` by default, `.active` → `display:block`.

**Generating overlay** (`#generating-overlay`):
```
bg: rgba(241,243,244,0.88); backdrop-filter: blur(2px)
3 × gen-dot (7×7px #5B63F6) + "Generating your slides..." text
```

**Animations:**
```css
@keyframes dotBounce {
  0%,100% { transform: translateY(0); opacity: 0.4; }
  50%      { transform: translateY(-5px); opacity: 1; }
}
```

---

## AI Chat Panel (Editor)

**Width:** `320px` · `border-l border-gray-100` · `bg-white`

Structurally identical to the Document Builder AI panel:

- Header: Aibii sparkle icon `#EEF2FF` bg + `"AiBii AI"` label
- Chat scroll area with `.ai-msg-user` / `.ai-msg-bot` bubbles
- Suggestion buttons: `.suggest-btn` (`bg-gray-100 rounded-md h-8 px-3`)
- Input area: contenteditable `.ppt-ai-input`, send button `bg-[#5B63F6]`
- AI thinking dots: `.ai-dot` (5×5px `#7C6FF7`), 3-dot bounce animation

**User bubble:** `background:#EEF2FF; border-radius:14px 14px 4px 14px`  
**Bot bubble:** `background:#F9FAFB; border:1px solid #E5E7EB; border-radius:14px 14px 14px 4px`

---

## Sources Drawer

Slides in from the right edge of the canvas column (identical to Document Builder):

```css
#sources-drawer { transform: translateX(100%); transition: transform 280ms cubic-bezier(0.4,0,0.2,1); }
#sources-drawer.open { transform: translateX(0); }
```

`#sources-drawer-backdrop { display:none; }` → `.open { display:block; }`

---

## Workspace Switcher Modal

```
#ws-modal (fixed, z-70)
  bg-white rounded-2xl w-[480px] max-w-[92vw]
  Header: "Switch workspace" + "New workspace" button + × close
  #ws-modal-list: workspace rows (rendered by renderWsModalList())
```

Workspace data:
- `Manish kumar's Workspace` — initial `M`, color `#3B5BDB`, current
- `Sovereign Capital Gate` — initial `S`, color `#5B63F6`

---

## Motion & Transitions

| Element | Transition |
|---|---|
| Sidebar collapse | `width 220ms ease, min-width 220ms ease, opacity 180ms ease` |
| Sources drawer | `transform 280ms cubic-bezier(0.4,0,0.2,1)` |
| Sources accordion | `max-height 260ms cubic-bezier(0.4,0,0.2,1)` |
| State transitions | `activateState()` — immediate class swap |
| Suggestion chip hover | `all 130ms ease` |
| Tone/count pill hover | `all 100ms ease` |
| Outline item hover | `all 100ms ease` |
| Theme card hover | `all 100ms ease` |
| Thumbnail border | `border-color 80ms ease` |
| Canvas nav hover | `background 100ms ease` |
| Nav item hover | `background-color 100ms ease` |
| Fade-up animation | `.fade-up { animation: fadeUp 0.3s ease-out forwards }` |
| Generating dots | `dotBounce 1s infinite ease-in-out` (staggered 0 / 0.15s / 0.30s) |
| AI chat dots | `dotBounce 1.2s infinite ease-in-out` (staggered 0 / 0.2s / 0.4s) |

---

## JS Reference

| Function | Description |
|---|---|
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles workspace submenu and chevron |
| `toggleNotifications()` | Toggles notification dropdown |
| `toggleUserMenu()` | Toggles user dropdown |
| `markAllRead()` | Removes unread indicators |
| `openWsModal()` / `closeWsModal()` | Workspace switcher modal |
| `renderWsModalList()` | Renders workspace rows |
| `selectWorkspace(id)` | Switches active workspace |
| `activateState(id)` | Switches visible `.ppt-state` panel |
| `submitPrompt()` | Reads prompt, shows outline state |
| `renderOutline()` | Builds `.outline-item` rows in `#outline-list` |
| `setTone(pill)` | Toggles active tone pill |
| `setCount(box)` | Toggles active count box |
| `generatePresentation()` | Shows editor state, starts generating overlay |
| `selectSlide(n)` | Updates `#main-slide-frame` active page and thumbnail |
| `prevSlide()` / `nextSlide()` | Navigates slide pages, updates `#prev-btn` / `#next-btn` disabled state |
| `toggleSourcesDrawer()` | Opens/closes sources drawer |
| `openWsModal()` | Opens workspace switcher modal |

---

## File Structure

```
presentation-builder/
├── index.html     ← All-in-one: HTML + Tailwind + JS
├── README.md      ← This design language document
└── tokens/
    ├── colors.json
    ├── spacing.json
    └── typography.json
```

**External dependencies (CDN):**

| Library | URL |
|---|---|
| Tailwind CSS | `https://cdn.tailwindcss.com` |
| Inter font | `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800` |
