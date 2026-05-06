# Dashboard — Design Language

**File:** `dashboard/index.html`  
**Stack:** HTML · Tailwind CSS CDN · Chart.js 4.4.2 · Inter (Google Fonts) · Vanilla JS

---

## 1. Screen Anatomy

```
+------------------------------------------------------------------------+
| SIDEBAR (220px)    |                   MAIN CONTENT                    |
|                    |  +----------------------------------------------+ |
| Workspace switcher |  |  NAV BAR  h-11                               | |
|                    |  |  [=]  Sovereign Capital Gate > Sales Overview | |
| Primary nav        |  |                          [bell] [Manish Kumar]| |
|  - Recent          |  +----------------------------------------------+ |
|  - New Dashboard   |  |  DASHBOARD TOOLBAR  h-12                     | |
|  - New Chat        |  |  Sales Overview  [Draft]                     | |
| ----------         |  |  [Publish][Toggle Axis][Comment][palette]    | |
| PROJECTS           |  |  [+KPI] [Fullscreen] [Edit]                  | |
|  > My Private Proj |  +----------------------------------------------+ |
|  > Sovereign Cap.  |  |  CANVAS  (flex-1, overflow-y-auto, bg-white) | |
|    (ACTIVE)        |  |  +------------------+ +-------------------+  | |
| ----------         |  |  | Monthly Revenue  | | Sales by Region   |  | |
| Settings           |  |  | Line  col-span-2 | | Bar   col-span-2  |  | |
| Explore banner     |  |  +------------------+ +-------------------+  | |
|                    |  |  +----------+ +-------+ +-------+           | |
|                    |  |  | Revenue  | |Market | |Retain |  (4-col)  | |
|                    |  |  | Channel  | |Share  | | Rate  |           | |
|                    |  |  +----------+ +-------+ +-------+           | |
|                    |  |  +----------+ +-------+ +-------+           | |
|                    |  |  |New vs Ret| |Top    | |Mktg   |  (4-col)  | |
|                    |  |  +----------+ +-------+ +-------+           | |
|                    |  |  +--------------------------------------+    | |
|                    |  |  |      Cumulative Revenue Growth        |    | |
|                    |  |  +--------------------------------------+    | |
|                    |  |                      +------------------+    | |
|                    |  |                      |  Color Panel  OR |    | |
|                    |  |                      |  Comment Panel   |    | |
|                    |  |                      +------------------+    | |
+------------------------------------------------------------------------+
```

---

## 2. Color System

| Token | Hex | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav border, chart primary, CTA button |
| `brand.secondary` | `#7C6FF7` | Chart secondary dataset, stacked bar layer 2 |
| `hover` | `#EEF2FF` | Active nav bg, active toolbar btn bg, stat badges |
| `sidebar` | `#F8F9FC` | Sidebar bg (Tailwind config) |
| `gray-50` | `#F9FAFB` | Toolbar btn hover, main area bg |
| `gray-100` | `#F3F4F6` | Border separators, Draft badge bg |
| `gray-200` | `#E5E7EB` | Card borders, toolbar button borders |
| `gray-400` | `#9CA3AF` | Chart tick labels, meta text |
| `gray-500` | `#6B7280` | Draft badge text, toolbar icons |
| `gray-700` | `#374151` | Chart card titles, toolbar button text |
| `gray-900` | `#111827` | Page title, nav text |
| `#A5B4FC` | Indigo-300 | Stacked bar layer 3 |
| `#A855F7` | Purple-500 | Chart accent (region B) |
| `#EC4899` | Pink-500 | Chart accent (region C) |
| `#F59E0B` | Amber-500 | Chart accent (region D) |
| `#10B981` | Emerald-500 | Growth/area chart line |
| `#16A34A` | Green-600 | Positive KPI trend text |
| `#3B5BDB` | Indigo-700 | Workspace avatar, user avatar |

---

## 3. Typography

| Element | Size | Weight | Color |
|---|---|---|---|
| Page title (`Sales Overview`) | `15px` | `700` | `#111827` |
| Breadcrumb — project name | `13px` | `500` | `#6B7280` |
| Breadcrumb — current page | `13px` | `600` | `#111827` |
| Toolbar button labels | `12px` | `500` | `#374151` |
| Chart card title | `12px` | `600` | `#374151` (uppercase + `letter-spacing:0.04em`) |
| Chart card meta | `11px` | `400` | `#9CA3AF` |
| Draft badge | `11px` | `500` | `#6B7280` |
| Sidebar nav items | `14px` | `400/500` | `#374151` / `#111827` |
| Sidebar section labels | `11px` | `500` | `#9CA3AF` (uppercase, `tracking-widest`) |
| Sub-nav items | `13px` | `400` | `#4B5563` |
| Workspace name | `14px` | `600` | `#111827` |
| Explore banner title | `12px` | `600` | `#3B4ECC` |
| Explore banner sub | `11px` | `400` | `#6B7ADE` |

**Font family:** `Inter, system-ui, -apple-system, sans-serif` (Google Fonts, weights 400/500/600/700/800)

---

## 4. Layout & Spacing

### Shell Structure

```
body: flex h-screen overflow-hidden bg-white
+-- aside#sidebar: w-[220px], bg-white, border-r border-gray-100, overflow-y-auto
|   +-- collapses via .collapsed (toggleSidebar())
+-- main: flex-1, flex flex-col, overflow-hidden
    +-- #nav-bar: h-11, flex-shrink-0, bg-white, border-b border-gray-100
    +-- .dashboard-toolbar: h-12, flex-shrink-0, bg-white, border-b border-gray-200
    +-- flex row (flex-1, overflow-hidden):
        +-- #dashboard-canvas: flex-1, overflow-y-auto, bg-white, padding 12px 14px
        +-- #color-panel:   w-[240px], hidden by default
        +-- #comment-panel: w-[280px], hidden by default
```

### Dashboard Canvas Grid

4-column CSS grid with `gap-2.5` (10px):

| Row | Layout | Charts |
|---|---|---|
| Row 1 | `grid-cols-4` | Monthly Revenue `col-span-2` · Sales by Region `col-span-2` |
| Row 2 | `grid-cols-4` | Revenue by Channel `col-span-2` · Market Share `col-span-1` · Retention Rate `col-span-1` |
| Row 3 | `grid-cols-4` | New vs Returning `col-span-2` · Top Products `col-span-1` · Marketing Spend `col-span-1` |
| Row 4 | `grid-cols-1` | Cumulative Revenue Growth (full width) |

---

## 5. Component: Sidebar

### Workspace Switcher

```
border-b border-gray-100
+-- button onclick="openWsModal()"
    +-- #ws-avatar: w-7 h-7 rounded-full bg-[#3B5BDB] text-white text-xs font-bold
    +-- #ws-name:   text-sm font-semibold truncate flex-1
    +-- chevron up/down: w-4 h-4 text-gray-400
```

### Primary Nav

```
+-- Recent         --> ../recent-view/index.html
+-- New Dashboard  --> # (no active state, text-gray-500 icon)
+-- New Chat       --> ../chat/index.html
```

### Projects Section

**My Private Project** — pinned (thumbtack icon `#5B63F6`), toggle `ws2`  
Sub-items (11): Q4 Strategy, Revenue Overview, Project Brief, Investor Update, Meeting Notes, KPI Tracker, Product Feedback, User Analytics, Sprint Planning, Roadmap 2026, API Docs

**Sovereign Capital Gate** — **ACTIVE** (`background:#EEF2FF; border-left:2px solid #5B63F6`), toggle `ws1`  
Sub-items (9): Investor Briefing, Capital Analysis, Deal Memo Q2, Pitch Deck 2026, Portfolio Overview, Risk Register, Market Signals, LP Survey, Valuation Model

**Active project row style:**
```css
background: #EEF2FF;
border-left: 2px solid #5B63F6;
font-weight: 600;
color: #111827;
```

Sub-item icon colors: Chat `#5B63F6` · Dashboard `#16A34A` · Document `#F97316` · Presentation `#8B5CF6` · Form `#EC4899`

### Bottom Nav

Settings → `../settings-profile/index.html`

### Explore Banner

```
mx-3 mb-3 mt-1 rounded-xl px-3 py-2.5  bg-[#E8EEFF]
+-- icon w-8 h-8 rounded-full bg-[#C7D2FE]  (sparkle SVG color:#4F6EF7)
+-- "Explore free features"  text-[12px] font-semibold color:#3B4ECC
    "Credit left: 15"        text-[11px] color:#6B7ADE
```

---

## 6. Component: Nav Bar (`#nav-bar`)

**Dimensions:** `h-11`, `border-b border-gray-100`, `bg-white`  
**Hidden in fullscreen mode.**

### Left

```
button onclick="toggleSidebar()" -- hamburger icon w-[18px]

Breadcrumb (text-[13px]):
  <a> Sovereign Capital Gate  -->  ../sovereign-capital-gate/index.html  (text-gray-500 font-medium)
  chevron  (w-3.5 text-gray-300)
  <span> Sales Overview  (text-gray-800 font-semibold)
```

### Right

```
Notification bell (#notif-wrapper):
  button #notif-btn --> toggleNotifications()
  #notif-dot: w-1.5 h-1.5 rounded-full bg-red-500 (absolute top-right)
  #notif-dropdown: w-80, 3 notifications, "Mark all as read"

User button:
  w-6 h-6 avatar bg-[#3B5BDB] initial "M"
  "Manish Kumar" text-[13px] font-medium text-gray-700
```

---

## 7. Component: Dashboard Toolbar

**Dimensions:** `h-12`, `border-b border-gray-200`, `bg-white`

### Left

```
h1: text-[15px] font-bold text-gray-900 -- "Sales Overview"
span.badge: px-2 h-5 rounded-md text-[11px] font-medium bg-[#F3F4F6] text-[#6B7280] -- "Draft"
```

### Right — `#toolbar-btns`

| Button | ID | Action |
|---|---|---|
| Publish | — | static |
| Toggle Axis | — | static |
| Comment | `#btn-comment` | `toggleCommentPanel()` |
| Color Palette | `#btn-color-palette` | `toggleColorPanel()` |
| Add KPI | — | static |
| Fullscreen | `#btn-fullscreen` | `toggleFullscreen()` |
| Edit | — | primary CTA (`bg-[#5B63F6]`) |

### `.toolbar-btn` Spec

```css
display: flex; align-items: center; gap: 6px;
padding: 0 10px; height: 30px; border-radius: 8px;
border: 1px solid #E5E7EB; background: #fff;
font-size: 12px; font-weight: 500; color: #374151;
white-space: nowrap; transition: background-color 100ms;
```
Hover: `background: #F9FAFB`  
Active (panel open): `background: #EEF2FF; color: #5B63F6`

---

## 8. Component: Chart Card

### `.chart-card`

```css
background: #fff;
border: 1px solid #E5E7EB;
border-radius: 8px;
padding: 14px 16px;
box-shadow: 0 1px 2px rgba(0,0,0,0.04);
```

### `.chart-card-title`

```css
font-size: 12px; font-weight: 600; color: #374151;
text-transform: uppercase; letter-spacing: 0.04em;
```

### Canvas Heights

| Charts | Height |
|---|---|
| All row 1–3 charts | `h-[150px]` |
| Row 4 Cumulative Growth | `h-[120px]` |
| Pie / Doughnut wrapper | `110 x 110px` |

---

## 9. Charts — Specifications

### Shared Defaults

```js
Chart.defaults.font.family = 'Inter, system-ui, sans-serif';
Chart.defaults.font.size   = 11;
Chart.defaults.color       = '#9CA3AF';
const gridColor = '#F3F4F6';
```

### Monthly Revenue — Line (`chartLine`)

Jan–Nov (12pts, last null) · `borderColor: #5B63F6` · `tension: 0.3` · `fill: false` · point `r:3.5` · Y min `100`

### Sales by Region — Bar (`chartBar`)

North America, Europe, Asia Pacific, Latin America · colors `['#5B63F6','#A855F7','#EC4899','#F59E0B']` · `borderRadius: 5` · X grid hidden

### Revenue by Channel — Stacked Bar (`chartStacked`)

Q1–Q4 · Direct `#5B63F6` · Partner `#7C6FF7` · Self-serve `#A5B4FC` · legend `position:'bottom'`

### Market Share — Pie (`chartPie`)

`[35,25,20,15,5]` · colors `['#5B63F6','#A855F7','#EC4899','#F59E0B','#10B981']` · HTML inline legend

### Retention Rate — Doughnut (`chartDoughnut`)

`[91,9]` · colors `['#5B63F6','#F3F4F6']` · `cutout: '72%'` · center overlay `"91%"` (18px bold) + `"retained"` (10px)

### New vs Returning — Multi-line (`chartMultiLine`)

New `#5B63F6` · Returning `#10B981` · `pointRadius: 0` · `tension: 0.3` · tooltip `mode:'index'`

### Top Products — Horizontal Bar (`chartHBar`)

`indexAxis: 'y'` · 5 products · gradient blues `['#5B63F6','#7C6FF7','#A5B4FC','#C7D2FE','#E0E7FF']` · `borderRadius: 4`

### Marketing Spend — Scatter (`chartScatter`)

15 `{x,y}` pairs · `#5B63F6` · `pointRadius: 4`

### Cumulative Revenue Growth — Area (`chartArea`)

Jan–Dec `[100,118,142,168,200,230,268,310,358,410,468,530]` · `borderColor: #10B981` · `backgroundColor: rgba(16,185,129,0.10)` · `fill: true` · `tension: 0.4` · `pointRadius: 0`

---

## 10. Component: Color Palette Panel (`#color-panel`)

**Width:** `240px` · toggled by `#btn-color-palette` · closes Comment Panel when opened

### Structure

```
flex-col (display:none by default, toggled to flex)
+-- Header (sticky): "Color Palette" title + x close button
+-- Scrollable list: 19 palette-option buttons
|   Each row: 4 color swatches (w-4 h-4 rounded-full) + palette name
|   Active:   border-2 border-indigo-400 bg-indigo-50
|   Inactive: border-transparent bg-gray-50
+-- Footer (sticky): [Apply] button --> applyPalette()
```

### Palettes (19)

Indigo · Ocean Blue · Forest · Sunset · Rose · Violet · Amber · Teal · Ruby · Slate · Coral · Mint · Lavender · Steel Blue · Peach · Olive · Midnight · Crimson · Aqua

### `applyPalette()`

Iterates `Chart.instances`, recolors each dataset with the active palette's color array, calls `chart.update()`.

---

## 11. Component: Comment Panel (`#comment-panel`)

**Width:** `280px` · toggled by `#btn-comment` · closes Color Panel when opened

### Structure

```
flex-col (display:none by default, toggled to flex)
+-- Header (sticky): "Comments" title + x close button
+-- #comment-list (flex-1 overflow-y-auto):
|   Each comment: avatar (w-7 h-7 rounded-full) + name + timestamp + message bubble
|   Message bubble: bg-gray-50 rounded-xl px-3 py-2 text-[12px]
+-- Footer (sticky):
    textarea #comment-input (rows-2, resize-none, bg-gray-50, rounded-xl)
    send button (absolute right-2 bottom-2, arrow icon, color:#5B63F6)
```

### Interactions

- **Enter** — calls `postComment()`, appends comment, clears textarea, auto-scrolls list
- **Shift+Enter** — newline in textarea
- Comment text is HTML-escaped before insertion

---

## 12. Fullscreen Mode

Triggered by `#btn-fullscreen` → `toggleFullscreen()`.

**On enter:**
- `document.documentElement.requestFullscreen()`
- `#nav-bar` → hidden
- `aside` → hidden
- All `#toolbar-btns` children except `#btn-fullscreen` → hidden
- `#icon-expand` → hidden, `#icon-compress` → visible

**On exit** (button or Esc via `fullscreenchange` listener): all elements restored, icons swapped back.

---

## 13. Workspace Switcher Modals

### Switch Workspace (`#ws-modal-backdrop`)

Opened by `openWsModal()` from sidebar workspace button.

```
fixed inset-0 z-50, display:none / display:flex via .open class
+-- modal w-[300px] max-h-[420px] rounded-2xl bg-white shadow-xl
    +-- Header: "Switch Workspace" + x
    +-- Search input (#ws-search) --> filterWsList()
    +-- #ws-modal-list: rendered by renderWsModalList()
    +-- Footer: "New workspace" button --> openNewWsModal()
```

### New Workspace (`#new-ws-modal`)

Full-screen overlay · color picker via `cycleWsColor()` · name input · Create button → `createNewWs()`

---

## 14. JS Function Reference

| Function | Description |
|---|---|
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles `.open` on `ws1`/`ws2` sub-menu and chevron |
| `toggleNotifications()` | Toggles `#notif-dropdown` visibility |
| `markAllRead()` | Removes unread indicators from notification items |
| `openWsModal()` / `closeWsModal()` | Controls workspace switcher modal |
| `selectWorkspace(id)` | Sets active workspace, updates sidebar avatar + name |
| `renderWsModalList(filter)` | Renders filtered workspace list in modal |
| `openNewWsModal()` / `createNewWs()` | New workspace creation flow |
| `cycleWsColor()` | Cycles through avatar color options in new-ws form |
| `toggleColorPanel()` | Opens/closes color palette panel; closes comment panel |
| `toggleCommentPanel()` | Opens/closes comment panel; closes color palette panel |
| `selectPalette(name)` | Updates active palette-option UI, sets `_activePalette` |
| `applyPalette()` | Applies active palette colors to all Chart.js instances |
| `postComment()` | Appends new comment to `#comment-list`, clears textarea |
| `handleCommentKey(e)` | Enter (no shift) → `postComment()` |
| `toggleFullscreen()` | Enters/exits fullscreen, hides/shows nav bar + sidebar chrome |

---

## 15. Scrollbar

```css
::-webkit-scrollbar { width: 5px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## 16. File Structure

```
dashboard/
+-- index.html   -- Dashboard view (all-in-one: HTML + Tailwind + Chart.js + JS)
+-- README.md    -- This design language document
```

**External dependencies (CDN):**

| Library | Version | URL |
|---|---|---|
| Tailwind CSS | latest | `https://cdn.tailwindcss.com` |
| Chart.js | 4.4.2 | `https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js` |
| Inter font | — | `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800` |

---

## 17. Design Principles

| Principle | Implementation |
|---|---|
| **Two-tier header** | Nav bar (navigation + identity) separate from dashboard toolbar (editing tools) |
| **Data density** | 9 charts in 4 rows using mixed 2-col / 1-col spans |
| **Visual hierarchy** | Uppercase small-caps card titles + gray meta separate label from data |
| **Consistent palette** | Brand indigo `#5B63F6` anchors primary data; purple/pink/amber/emerald used consistently |
| **Minimal chrome** | White cards on white canvas — borders + subtle shadows carry separation |
| **Focused fullscreen** | Hides nav bar, sidebar, and all toolbar chrome except the exit button |
| **Mutual exclusivity** | Color Palette and Comment panels are mutually exclusive |
