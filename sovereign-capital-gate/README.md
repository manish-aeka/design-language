# Sovereign Capital Gate

## Overview

The **Sovereign Capital Gate** page is a project detail view within Aibii. It displays all items belonging to this capital markets project — dashboards, documents, chats, presentations, and forms — with quick-create action cards and filtering controls.

**File:** `sovereign-capital-gate/index.html`
**Stack:** Plain HTML · Tailwind CSS CDN · Heroicons SVG inline · Inter font (Google Fonts)

---

## Page Layout

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)            │  TOPBAR (44px h-11)                           │
│  ──────────────────────────  │  ☰                            🔔  [M]         │
│  [M] Manish kumar's Work… ▾  │                                               │
│  ──────────────────────────  │  CONTENT (scrollable px-8 py-5)              │
│  🕐 Recent                   │                                               │
│  ⊞  New Dashboard            │  Sovereign Capital Gate (h1 28px 800)        │
│  💬 New Chat                 │  Capital markets intelligence…               │
│  ──────────────────────────  │                                               │
│  PROJECTS                    │  [⊞ Dashboard][📄 Doc][🖥 Pres][📋 Form][💬 Chat] │
│  ▶ My Private Project 📌     │                                               │
│  ▼ Sovereign Capital Gate ◀■ │  All items        [Search…]  [Type▾][ ≡ ⊞ ] │
│    ├ 💬 Investor Briefing    │                                               │
│    └ …(9 sub-items)          │  Item grid (4 cols, 9 cards)                 │
│  + Create a project          │                                               │
│  ──────────────────────────  │                                               │
│  ⚙  Settings                 │                                               │
│  ──────────────────────────  │                                               │
│  🔵 Explore free features    │                                               │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Sidebar

### Workspace Switcher

Full-width button at the top. Clicking opens the Workspace Switcher modal.

| Property | Value |
|---|---|
| Avatar id | `ws-avatar` |
| Name label id | `ws-name` |
| Avatar size | `28×28px` (`w-7 h-7`), `rounded-full` |
| Avatar background | `#3B5BDB` |
| Avatar letter | `M` |
| Display name | `"Manish kumar's Work..."` (truncated) |
| Chevron | ChevronUpDown, 16px, `#9CA3AF` |
| Click handler | `openWsModal()` |

### Primary Nav

Three links. Row height `36px` (`h-9`), text `14px`. All inactive on this page.

| Item | Icon | Link |
|---|---|---|
| Recent | Clock 16px | `../recent-view/index.html` |
| New Dashboard | SquaresGrid 16px | `#` |
| New Chat | ChatBubble 16px | `#` |

### Projects Section

Label: `"PROJECTS"` — 11px uppercase `#9CA3AF`.

**ws2 — My Private Project** (pinned, collapsed): Pin icon `color:#5B63F6`. 11 sub-items identical to the recent-view sidebar.

**ws1 — Sovereign Capital Gate** (**ACTIVE** — `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:6px`):

9 sub-items (`h-8`, `13px`, `text-gray-600`):

| # | Name | Type | Icon color |
|---|---|---|---|
| 1 | Investor Briefing | Chat | `#5B63F6` |
| 2 | Capital Flow Analysis | Dashboard | `#16A34A` |
| 3 | Deal Memo Q2 | Document | `#F97316` |
| 4 | Pitch Deck 2026 | Presentation | `#8B5CF6` |
| 5 | Portfolio Overview | Dashboard | `#16A34A` |
| 6 | Risk Register | Document | `#F97316` |
| 7 | Market Signals | Chat | `#5B63F6` |
| 8 | LP Survey | Form | `#EC4899` |
| 9 | Valuation Model | Dashboard | `#16A34A` |

`+ Create a project` → `onclick="event.preventDefault();openNewProjectModal()"`

### Bottom Nav

Settings only — `href="../settings-profile/index.html"`. Shared with me is commented out.

### Explore Banner

`background:#E8EEFF`, sparkle icon `#4F6EF7` on `#C7D2FE` bg circle.
- Label: `"Explore free features"` — 12px 600 `#3B4ECC`
- Sub-label: `"Credit left: 15"` — 11px `#6B7ADE`

---

## Topbar

Fixed `44px` (`h-11`) bar with `border-b border-gray-100`. Layout: `flex items-center justify-between px-8`.

| Zone | Content |
|---|---|
| Left | Hamburger button → `toggleSidebar()` |
| Right | Notification bell (`#notif-wrapper`) + user avatar (`#user-menu-wrapper`) |

### Notification Bell

| Property | Value |
|---|---|
| Button id | `notif-btn` |
| Click | `toggleNotifications()` |
| Unread dot | `id="notif-dot"`, `w-1.5 h-1.5`, `bg-red-500` |
| Dropdown id | `notif-dropdown` |
| Width | `320px` (`w-80`) |
| Radius | `rounded-lg` |
| Shadow | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` |

**5 notification items (project-contextual):**

| State | Sender | Content |
|---|---|---|
| Unread | Sara M. (green `#16A34A`) | Shared "Capital Flow Analysis" with you |
| Unread | Riya K. (orange `#F97316`) | Commented on "Investor Briefing" |
| Unread | Aibii AI (purple `#8B5CF6`) | Finished processing "Valuation Model" |
| Read | Priya N. (pink `#EC4899`) | Invited you to "Sovereign Capital Gate" |
| Read | Aibii AI (indigo) | "Portfolio Overview" report is ready |

**Footer:** "View all notifications" — 12px `#5B63F6`.

`markAllRead()` removes unread row highlights and `#notif-dot`.

### User Menu

| Property | Value |
|---|---|
| Wrapper id | `user-menu-wrapper` |
| Avatar | `w-7 h-7 rounded-full`, `background:#3B5BDB`, letter `M` |
| Click | `toggleUserMenu()` |
| Dropdown id | `user-dropdown` |
| Width | `224px` (`w-56`) |

Dropdown:
- Name: `"Manish Kumar"` — 13px 600 `#111827`
- Email: `"manish@aibii.com"` — 12px `#9CA3AF`
- Log out button: `text-red-500 hover:bg-red-50`

`toggleNotifications()` closes `#user-dropdown`; `toggleUserMenu()` closes `#notif-dropdown`. Shared outside-click listener.

---

## Content Area

Scrollable: `flex-1 overflow-y-auto px-8 py-5`.

### Page Header

- Title: `"Sovereign Capital Gate"` — `text-[28px] font-extrabold text-gray-900`
- Subtitle: `"Capital markets intelligence — dashboards, memos, and research in one place."` — `text-sm text-gray-500 mt-2`

### Action Cards

5 active cards, `grid grid-cols-4 gap-4 mb-7`. Each: `bg-white border border-gray-200 rounded-xl`, icon wrapper `40×40px` `rgba(91,99,246,0.08)`, icon `20px #5B63F6`. Hover: `translateY(-1px)` + shadow.

| Label | onclick |
|---|---|
| New Dashboard | `openCreateModal('New Dashboard')` |
| New Document | `openCreateModal('Create Document')` |
| New Presentation | `openCreateModal('Create Presentation')` |
| New Form | `openCreateModal('Create Form')` |
| New Chat | `openCreateModal('New Chat')` |

> "Add Datasource" is commented out in the HTML.

### Section Header & Controls

Layout: `flex items-center justify-between mb-4`.

Left: `"All items"` — 15px 600 `#111827`.  
Right: search bar + type filter dropdown + view toggle.

**Search bar:** `id="search-input"`, `w-64` (focus: `w-80`), `h-9`, `oninput="filterItems()"` → `applyFilters()`.

**Type filter:** Pill button (`background:#F1F3F4 border:1px solid #E5E7EB`) with funnel icon + `id="type-filter-label"`. Dropdown `id="type-dropdown"`, `rounded-xl`, `min-w-[180px]`. Types: Chat (default highlighted `#EEF2FF`/`#5B63F6`), Dashboard, Document, Presentation, Form, Project.

`setTypeFilter(type, el)` — toggle; clicking active type clears. `applyFilters()` combines search + type.

**View toggle:** `background:#F1F3F4 rounded-lg p-0.5`. Grid active by default (`id="view-grid"` has `.toggle-active`). JS: `setView(active)`.

### Items Grid

`id="report-grid"`. Default: `grid grid-cols-4 gap-4`. List view: `.list-view` class.

9 sample cards:

| # | Name | `data-type` | Preview bg | Icon color |
|---|---|---|---|---|
| 1 | Capital Flow Analysis | `dashboard` | `#F0FDF4` | `#6EE7A6` |
| 2 | Deal Memo Q2 | `document` | `#FFF7ED` | `#FCA96A` |
| 3 | Investor Briefing | `chat` | `#EEF2FF` | `#93A8F4` |
| 4 | Dashboard | `dashboard` | `#F0FDF4` | `#6EE7A6` |
| 5 | Document | `document` | `#FFF7ED` | `#FCA96A` |
| 6 | Risk Register | `document` | `#FFF7ED` | `#FCA96A` |
| 7 | Portfolio Overview | `dashboard` | `#F0FDF4` | `#6EE7A6` |
| 8 | Valuation Model | `chat` | `#EEF2FF` | `#93A8F4` |
| 9 | Exit Strategy | `document` | `#FFF7ED` | `#FCA96A` |
| 10 | Market Signals | `chat` | `#EEF2FF` | `#93A8F4` |

**Card anatomy:**

```
┌─────────────────────────────┐
│  Preview area h-40          │  ← type-colored bg + 40px icon
├─────────────────────────────┤
│  Title  (14px 500)          │
│  [type icon  Badge]         │  ← 10px badge
│  Updated X ago (11px)       │
│                       [···] │  ← overflow-btn (opacity 0 → 1 on hover)
└─────────────────────────────┘
```

---

## Create Item Modal (`#create-modal`)

Opened by `openCreateModal(type)`. Backdrop: `rgba(17,24,39,0.45) blur(2px)`. `rounded-lg max-w-md shadow-xl`.

Header: `text-base font-semibold text-gray-900`, close × button.
Fields:
- **Name** (required) — `h-9 rounded-lg focus:ring-2 focus:ring-[#5B63F6]`
- **Description** (optional) — 3-row textarea with same focus style

Footer: `Close` (outlined) + `Create` (`bg:#5B63F6 hover:#4850e4`).

`createItem()` — validates name, builds a new card matching the type from `typeMap`, prepends to `#report-grid`, closes modal.

`typeMap` keys: `dashboard`, `document`, `presentation`, `form`, `chat`.

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

---

## JavaScript Functions Reference

| Function | Description |
|---|---|
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles `.open` on project submenu `#wsN-sub` + chevron |
| `toggleTypeFilter()` | Opens / closes `#type-dropdown` |
| `setTypeFilter(type, el)` | Sets active type; clicking same type clears |
| `applyFilters()` | Hides / shows `.report-card` by search + type |
| `filterItems(query)` | Calls `applyFilters()` |
| `setView(active)` | Switches grid / list layout on `#report-grid` |
| `openCreateModal(type)` / `closeCreateModal()` | Create Item modal lifecycle |
| `createItem()` | Validates, builds new card, closes modal |
| `openNewProjectModal()` / `closeNewProjectModal()` | New Project modal lifecycle |
| `createNewProject()` | Adds sidebar row + grid card for new project |
| `toggleNotifications()` | Toggles `#notif-dropdown`, closes `#user-dropdown` |
| `markAllRead()` | Clears unread highlights, hides `#notif-dot` |
| `toggleUserMenu()` | Toggles `#user-dropdown`, closes `#notif-dropdown` |
| `openWsModal()` / `closeWsModal(e)` | Workspace Switcher modal lifecycle |
| `renderWsModalList(filter)` | Renders filtered workspace rows in `#ws-modal-list` |
| `filterWsList()` | Calls `renderWsModalList` from `#ws-search` |
| `selectWorkspace(id)` | Switches active workspace, updates sidebar header |
| `openNewWsModal()` / `closeNewWsModal()` | New Workspace full-screen lifecycle |
| `cycleWsColor()` | Cycles avatar color through 7 presets |
| `onWsNameInput(val)` | Live preview for workspace name + avatar letter |
| `createNewWs()` | Pushes new workspace to `wsData`, selects it |

---

## CSS Custom Classes

| Class | Purpose |
|---|---|
| `.nav-item` | Sidebar row hover: `hover:bg-gray-100 rounded-lg` |
| `.action-card` | Hover lift: `translateY(-1px)` + shadow |
| `.report-card` | Card hover: shadow + `border-color rgba(91,99,246,0.4)` + lift |
| `.overflow-btn` | Opacity 0 → 1 on parent `.report-card:hover` |
| `.filter-tab` | Pill tab transition |
| `.toggle-btn` | View toggle; inactive icon `#9CA3AF` |
| `.toggle-active` | Active toggle: `bg:#EEF2FF shadow` + icon `#5B63F6` |
| `.type-dropdown` | `display:none` → `block` via `.open` |
| `.ws-submenu` | Project submenu; `display:none` → `block max-height:160px` via `.open` |
| `#report-grid.list-view` | Horizontal list row layout with border + dividers |
| `#sidebar.collapsed` | Collapses sidebar to zero width |
| `#ws-modal-backdrop` | WS modal backdrop; `display:none` → `flex` via `.open` |

---

## Design Tokens (Tailwind config)

| Token | Hex | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav border, focus rings, CTAs |
| `brand.secondary` | `#7C6FF7` | Secondary brand accents |
| `brand.upgrade` | `#7C3AED` | Upgrade prompts |
| `sidebar` | `#F8F9FC` | Sidebar background |
| `hover` | `#EEF2FF` | Active nav bg, item hover |
| `tab-container` | `#F3F4F6` | View toggle bg |
