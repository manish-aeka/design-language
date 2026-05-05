# Recent View — Design Language

> Design system derived from the **Aibii** AI Business Intelligence SaaS platform — Recent View.

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Grid](#spacing--grid)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Iconography](#iconography)
8. [Components](#components)
   - [Topbar](#topbar)
   - [Notification Dropdown](#notification-dropdown)
   - [Page Header](#page-header)
   - [Action Cards Row](#action-cards-row)
   - [Filter Tab Bar](#filter-tab-bar)
   - [Search Bar](#search-bar)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
   - [Sidebar Workspace Switcher](#sidebar-workspace-switcher)
   - [Sidebar Primary Nav](#sidebar-primary-nav)
   - [Sidebar Projects Section](#sidebar-projects-section)
   - [Sidebar Bottom Nav & Banner](#sidebar-bottom-nav--banner)
   - [Sidebar Toggle](#sidebar-toggle)
   - [Report Grid](#report-grid)
   - [Report Card](#report-card)
   - [Card Type Badge](#card-type-badge)
   - [Card Context Menu](#card-context-menu)
   - [Scrollbar](#scrollbar)
9. [Modals](#modals)
   - [Create Item Modal](#create-item-modal)
   - [Create Project Modal](#create-project-modal)
   - [Workspace Switcher Modal](#workspace-switcher-modal)
   - [New Workspace Modal](#new-workspace-modal)
   - [Datasource Import Modal](#datasource-import-modal)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)

---

## Overview

The **Recent** view is the personal analytics home screen — the first screen a user lands on after selecting a workspace in Aibii. It combines a global topbar, a lightweight action strip, a filter/tab mechanism, and a dense report grid to surface the most relevant analyses and dashboards with zero navigation friction.

Key interactions:
- **Workspace switcher** — avatar + name button at the top of the sidebar opens a searchable workspace list modal; "New Workspace" button inside opens a full-screen creation flow
- **Topbar** — hamburger sidebar toggle on the left; notification bell + user identity pill on the right
- **Notification dropdown** — bell opens a `320px` panel listing recent activity; unread dot; "Mark all as read" action
- **5 action-card shortcuts** — New Dashboard, New Document, New Presentation, New Form, New Chat
- **Create Item modal** — shared modal for all 5 action cards; Name (required) + Description (optional) + Select project
- **Create Project modal** — triggered via sidebar "+ Create a project" link; inserts new project row into sidebar and prepends a card to the grid
- **Sidebar toggle** — hamburger button collapses/expands the 220px sidebar with smooth animation
- **Card context menu** — `...` on any card opens Share / Rename / Edit dropdown
- **Type filter** — filters report grid by content type; clicking the active type clears the filter
- **Search bar** — live text search, combined with the active type filter
- **View toggle** — switches between 4-column card grid and compact list layout
- **4 filter tabs** — By me / By everyone / Shared with me / Everything
- **4 filter tabs** — By me / By everyone / Shared with me / Everything

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ ≡  TOPBAR                                        🔔  [M] Manish Kumar      │ ← Topbar
├─────────────────────────────────────────────────────────────────────────────┤
│ SIDEBAR (220px)             │  CONTENT AREA (fluid)                         │
│                             │                                               │
│  [M] Manish kumar's Work… ▾ │  🕐 Recent                                    │ ← Workspace switcher
│  ─────────────────────────  │     All your recently accessed dashboards,    │
│  🕐 Recent  ← active        │     chats, documents, and more — in one place │
│  ⊞  New Dashboard           │                                               │
│  💬 New Chat                │  [⊞ Dashboard][📄 Doc][🖥 Pres][📋 Form][💬 Chat] │ ← 5 Action Cards
│  ─────────────────────────  │                                               │
│  PROJECTS                   │  [ By me ][ By everyone ][ Shared ][ All ]   │ ← 4 Filter Tabs
│  ▶ My Private Project 📌    │        [Search…]  [ Type▾ ][ ≡ ⊞ ]          │
│    ├ 💬 Q4 Strategy         │                                               │
│    └ …                      │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐       │
│  ▶ Sovereign Capital Gate   │  │      │ │      │ │      │ │      │       │ ← Report Grid
│  + Create a project         │  └──────┘ └──────┘ └──────┘ └──────┘       │
│  ─────────────────────────  │                                               │
│  ⚙  Settings                │                                               │
│  ─────────────────────────  │                                               │
│  🔵 Explore free features   │                                               │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Color System

### Palette

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Active nav border, active toggle icon, focus rings, action card icons |
| `color-brand-hover` | `#4850e4` | Button hover state |
| `color-bg-base` | `#FFFFFF` | Page background, card surface |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, active toggle bg |
| `color-bg-toggle-container` | `#F1F3F4` | View toggle container, type filter trigger |
| `color-bg-tab-container` | `#F3F4F6` | Pill group container |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab |
| `color-text-primary` | `#111827` | Page title, card titles, active tab text |
| `color-text-secondary` | `#374151` | Nav labels, context menu items |
| `color-text-tertiary` | `#6B7280` | Subtitles, timestamps, inactive tab text |
| `color-text-muted` | `#9CA3AF` | Toggle icon (inactive), placeholder labels |
| `color-border-default` | `#E5E7EB` | Card borders, type filter border |
| `color-border-subtle` | `#F3F4F6` | Sidebar dividers, list-view row separators |
| `color-border-active-nav` | `#5B63F6` | 2px left border on active sidebar nav item |

### Type Colour Map

| Type | Preview bg | Icon color | Badge bg | Badge text |
|---|---|---|---|---|
| Chat | `#EEF2FF` | `#93A8F4` | `#EEF2FF` | `#5B63F6` |
| Dashboard | `#F0FDF4` | `#6EE7A6` | `#F0FDF4` | `#16A34A` |
| Document | `#FFF7ED` | `#FCA96A` | `#FFF7ED` | `#F97316` |
| Presentation | `#F5F3FF` | `#A78BFA` | `#F5F3FF` | `#8B5CF6` |
| Form | `#FDF2F8` | `#F4A8D4` | `#FDF2F8` | `#EC4899` |
| Project | `#FFFBEB` | `#FCD34D` | `#FFFBEB` | `#F59E0B` |

---

## Typography

| Token | Size | Weight | Usage |
|---|---|---|---|
| `type-display` | 28px | 800 | Page title ("Recent") |
| `type-subtitle` | 14px | 400 | Page subtitle |
| `type-heading-md` | 16px | 600 | Modal headings |
| `type-body-md` | 14px | 500 | Action card labels, nav labels |
| `type-body-sm` | 13px | 400 | Descriptions, dropdown items, context menu |
| `type-card-title` | 14px | 500 | Report card title (grid view) |
| `type-list-name` | 13px | 500 | Report card name (list view) |
| `type-timestamp` | 11px | 400 | "Updated X ago" |
| `type-badge` | 10px | 500 | Card type badge |
| `type-tab` | 14px | 500 | Filter tab labels |

Font: `'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`

---

## Spacing & Grid

| Token | Value | Usage |
|---|---|---|
| `space-4` | 16px | Card padding, section gaps |
| `space-6` | 24px | Header → action cards margin |
| `space-7` | 28px | Action cards → filter tabs margin |
| Content padding | `px-8 py-4` (32px / 16px) | Main content area |
| Action cards | `grid-cols-4` (5 cards, wraps to second row), `gap: 16px` | |
| Report grid | `grid-cols-4`, `gap: 16px` | Grid view |
| Sidebar width | `220px` fixed | Collapsible |

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Badges |
| `radius-md` | 8px | Buttons, icon backgrounds, nav items, context menu items |
| `radius-lg` | 12px | Cards, action cards, dropdown panel, context menu |
| `radius-xl` | 16px | Modals, workspace switcher modal |
| `radius-full` | 9999px | Pill tabs, type filter trigger |

| Shadow token | Value | Used on |
|---|---|---|
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Cards at rest |
| `shadow-card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Cards on hover |
| `shadow-tab-active` | `0 1px 4px rgba(0,0,0,0.10)` | Active pill tab |
| `shadow-toggle-active` | `0 1px 3px rgba(91,99,246,0.15), 0 1px 2px rgba(91,99,246,0.08)` | Active view toggle button |
| `shadow-context-menu` | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` | Card context menu |
| `shadow-modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modals |

---

## Iconography

All icons: Heroicons outline, inline SVG, `stroke-width: 1.5px`.

| Location | Icon | Size | Color |
|---|---|---|---|
| Page title | Clock | 24px | `#111827` |
| Action card icons | type-specific | 20px | `#5B63F6` |
| Nav: Recent | Clock | 16px | `#6B7280` |
| Nav: New Dashboard | SquaresGrid | 16px | `#6B7280` |
| Nav: New Chat | ChatBubble | 16px | `#6B7280` |
| Topbar: Hamburger | Bars3 | 18px | `#6B7280` |
| Topbar: Notification bell | Bell | 18px | `#6B7280` |
| Topbar: Unread dot | — | 6px dot | `#EF4444` |
| Type filter funnel | Funnel | 14px | `#5B63F6` |
| Card overflow | EllipsisHorizontal | 16px | `#9CA3AF` |
| Context menu: Share | ShareNodes | 14px | `#9CA3AF` |
| Context menu: Rename | PencilSquare | 14px | `#9CA3AF` |
| Context menu: Edit | AdjustmentsHorizontal | 14px | `#9CA3AF` |
| Sidebar pin | Thumbtack (custom) | 12px | `#5B63F6` |
| Project chevron | ChevronRight | 12px | `#9CA3AF` |
| Workspace switcher chevron | ChevronUpDown | 16px | `#9CA3AF` |

---

## Components

### Topbar

Fixed `44px` (`h-11`) bar spanning the full width above the sidebar + content area. Separated from content by `1px solid #F3F4F6` (`border-b border-gray-100`).

| Zone | Content |
|---|---|
| Left | Hamburger button — toggles sidebar via `toggleSidebar()` |
| Right | Notification bell button + User identity pill |

Layout: `flex items-center justify-between px-8`.

---

### Notification Dropdown

Triggered by the bell button (`id="notif-btn"`) via `toggleNotifications()`. Positioned `right-0` below the bell.

| Property | Value |
|---|---|
| `id` | `notif-dropdown` |
| Width | `320px` (`w-80`) |
| Offset | `top-[calc(100%+6px)]` |
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Radius | `16px` (`rounded-2xl`) |
| Shadow | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` |
| z-index | `50` |

**Header row:** "Notifications" label (`14px 600`) + "Mark all as read" text button.

**Notification item anatomy:**

```
[avatar circle]  [Title 13px 500]          [time 11px #9CA3AF]
                 [Body  13px #6B7280]                    [● dot]
```

- Unread: `bg-indigo-50/40` row + `w-2 h-2 bg-indigo-500` dot
- Read: white background, no dot
- Separator: `divide-y divide-gray-50`

**Footer:** "View all notifications" — `12px`, `#5B63F6`, `8px` top border.

JS:
- `toggleNotifications()` — toggles `hidden` on `#notif-dropdown`
- `markAllRead()` — removes `bg-indigo-50/40` rows and `bg-indigo-500` dots; hides `#notif-dot`
- Outside-click listener closes on click outside `#notif-wrapper`

**User identity pill:** `flex items-center gap-2 h-8 pl-1 pr-2.5 rounded-full hover:bg-gray-100`. Avatar: `24×24px` `#3B5BDB`. Label: `13px 500 #374151`.

---

### Page Header

| Property | Value |
|---|---|
| Icon | Clock, 24px, `#111827` |
| Title | "Recent", 28px, `font-weight: 800`, `#111827` |
| Subtitle | "All your recently accessed dashboards, chats, documents, and more - in one place." |
| Subtitle style | 14px, `#6B7280` |
| Bottom margin | `mb-6` (24px) |

---

### Action Cards Row

Five active cards in a `grid-cols-4` layout (4 on row 1, 1 on row 2).

| # | Title | Description | Opens |
|---|---|---|---|
| 1 | New Dashboard | Charts, KPIs & visual reports | Create Item Modal |
| 2 | New Document | Write, collaborate & share | Create Item Modal |
| 3 | New Presentation | Slides, decks & pitches | Create Item Modal |
| 4 | New Form | Surveys, feedback & data entry | Create Item Modal |
| 5 | New Chat | Ask questions, get AI answers | Create Item Modal |

> **Note:** "Add Datasource" card exists in the HTML but is commented out. Its modal (`#datasource-modal`) is fully implemented and reachable via `openDatasourceModal()`.

Card spec: bg `#FFFFFF`, border `1px solid #E5E7EB`, radius `12px`, padding `16px`, icon wrapper `40×40px` with `rgba(91,99,246,0.08)` bg, icon `20px #5B63F6`. Hover: `shadow-card-hover` + `translateY(-1px)`.

---

### Filter Tab Bar

Four pill tabs. Default active: **By me**.

| Tab | id |
|---|---|
| By me | `tab-me` |
| By everyone | `tab-everyone` |
| Shared with me | `tab-shared` |
| Everything | `tab-everything` |

Container: bg `#F3F4F6`, radius `9999px`, padding `4px`. Active tab: bg `#FFFFFF`, `1px solid #E5E7EB`, `shadow-tab-active`, text `#111827`. Inactive: transparent, text `#6B7280`.

JS: `setTab(active)` — iterates all 4 tab IDs.

---

### Search Bar

Inline in the filter row, to the right of the pill tabs.

| Property | Value |
|---|---|
| `id` | `search-input` |
| Default width | `256px` (`w-64`) |
| Focus width | `320px` (`focus:w-80`) |
| Height | `36px` (`h-9`) |
| Icon | MagnifyingGlass, `14px`, `#9CA3AF`, absolute left `12px` |
| Placeholder | `Search…` |

JS: `filterItems(query)` → `applyFilters()`. Search text + active type filter apply simultaneously.

---

### View Toggle

Default active: **grid**.

| State | Layout |
|---|---|
| Grid (default) | `grid grid-cols-4 gap-4` on `#report-grid` |
| List | `.list-view` class; grid classes removed |

List view card row: `[40px icon] [name (max 200px)] [96px badge] [timestamp] [...]`. Rows separated by `1px solid #F3F4F6`. Container: `1px solid #E5E7EB`, `border-radius: 12px`.

JS: `setView(active)` — toggles `list-view` class and grid Tailwind classes on `#report-grid`.

---

### Type Filter Dropdown

Trigger: pill button with funnel icon + `<span id="type-filter-label">Type</span>`. Label updates on selection; clicking active type again clears.

Available types: **Chat · Dashboard · Document · Presentation · Form · Project**

Default active item (on open): **Chat** — rendered with `background:#EEF2FF` and `color:#5B63F6`.

JS: `activeTypeFilter` global. `setTypeFilter(type, el)` — toggle. `applyFilters()` — search + type. Outside-click on non-`.relative` ancestor closes.

---

### Sidebar Workspace Switcher

Top section of sidebar, separated from primary nav by `1px solid #F3F4F6`.

| Property | Value |
|---|---|
| Avatar | `28×28px` circle, `#3B5BDB` bg (`id="ws-avatar"`) |
| Name | `id="ws-name"` — `14px 600 #111827`, truncated |
| Chevron | ChevronUpDown, `16px`, `#9CA3AF` |
| Click | Full row → `openWsModal()` |

`selectWorkspace(id)` updates both `#ws-name` and `#ws-avatar`.

---

### Sidebar Primary Nav

Three links below the workspace switcher divider:

| Item | Icon | Default state |
|---|---|---|
| Recent | Clock, 16px | Active: `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px` |
| New Dashboard | SquaresGrid, 16px | Inactive |
| New Chat | ChatBubble (with dots), 16px | Inactive |

Active item ID: `id="nav-recent"`. Cleared by `clearSidebarActive()` when a project is activated.

---

### Sidebar Projects Section

Collapsible accordion. The pinned project is always first in `#projects-list`.

| Property | Value |
|---|---|
| Section label | "PROJECTS" — `11px`, uppercase, `#9CA3AF` |
| Project row height | `36px` |
| Chevron open | rotates `90deg`, `150ms ease` |
| Submenu max-height | `160px`, `overflow-y: auto` |
| Submenu item height | `32px`, `13px`, `#4B5563` |
| Sub-item icon color | Type-specific (e.g. `#5B63F6` chat, `#16A34A` dashboard, `#F97316` doc) |
| "+ Create a project" | `onclick="openNewProjectModal()"` |

**Static projects:**

| ID | Name | Pin | Sub-items |
|---|---|---|---|
| `ws2` | My Private Project | ✓ | Q4 Strategy (chat), Revenue Overview (dashboard), Project Brief (doc), Investor Update (chat), Meeting Notes (doc), KPI Tracker (dashboard), Product Feedback (chat), User Analytics (dashboard), Sprint Planning (chat), Roadmap 2026 (doc), API Docs (doc) |
| `ws1` | Sovereign Capital Gate | — | Chat, Dashboard, Document |

**Dynamic projects** (`proj-nav-row` class): Inserted after the pinned block by `createNewProject()`. Active state: `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:6px`. Project name is `text-gray-900` (never brand blue).

**Single active state:** `clearSidebarActive()` resets `#nav-recent` and all `.proj-nav-row` elements before highlighting the new item.

---

### Sidebar Bottom Nav & Banner

**Bottom utility nav:**

| Item | Link |
|---|---|
| Settings | `../settings-profile/index.html` |

> Connect Datasource and Shared with me links exist in the HTML but are commented out.

**"Explore free features" banner** — pinned at bottom (`mx-3 mb-3`):

| Property | Value |
|---|---|
| Background | `#E8EEFF` |
| Icon circle | `32×32px`, `#C7D2FE` bg, sparkle icon `#4F6EF7` |
| Title | "Explore free features", `12px 600`, `#3B4ECC` |
| Subtitle | "Credit left: 15", `11px`, `#6B7ADE` |

---

### Sidebar Toggle

Hamburger (`Bars3`, `18px`, `#6B7280`) in topbar left → `toggleSidebar()` → toggles `.collapsed` on `#sidebar`.

Collapsed: `width: 0`, `min-width: 0`, `opacity: 0`, `border-right: none`.
Transition: `width/min-width 220ms ease`, `opacity 180ms ease`.

---

### Report Grid

`<div id="report-grid">` — 12 cards with `data-type` attributes.

| Title | Type | Time |
|---|---|---|
| Q4 Strategy Discussion | chat | 5 min ago |
| Revenue Overview | dashboard | 19 min ago |
| Product Brief 2026 | document | 32 min ago |
| Investor Pitch Deck | presentation | 45 min ago |
| Customer Feedback Form | form | 1 hour ago |
| My Private Project | project | 2 hours ago |
| Sprint Planning | chat | 3 hours ago |
| User Analytics | dashboard | 4 hours ago |
| Sovereign Capital Gate | project | yesterday |
| Roadmap 2026 | presentation | yesterday |
| Onboarding Survey | form | 2 days ago |

---

### Report Card

**Grid view:** colored preview zone (`160px`) + title/badge/timestamp footer + hidden `...` button.

**List view row:** `[40px icon square] [name (max 200px)] [96px badge] [time auto margin-left] [...]`

Overflow button: `opacity: 0` default, `opacity: 1` on card hover. In list view: always `opacity: 1`.

---

### Card Type Badge

`inline-flex`, `gap: 4px`, padding `2px 6px`, radius `4px`, `10px 500`. List view: `width: 96px` fixed, `justify-content: center`.

---

### Card Context Menu

Single `#card-menu` (fixed). Shown on `.overflow-btn` click via `DOMContentLoaded` listeners.

Items: **Share · Rename · Edit** — each `13px`, `#374151`, radius `7px`, hover bg `#F3F4F6`.

Positioning: below button (`rect.bottom + 4px`); flips above if < 124px from viewport bottom. Closes on outside click.

---

### Scrollbar

```css
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## Modals

### Create Item Modal

`id="create-modal"` — triggered by all 5 action cards via `openCreateModal(type)`.

Fields:
- **Name** — `id="modal-name"`, required (red `*`), `h-9` input
- **Description** — `id="modal-desc"`, optional, 3-row textarea, `resize: none`
- **Select project** — `id="modal-project"`, static options: "My Private Project" (default), "Sovereign Capital Gate"

Backdrop: `rgba(17,24,39,0.45)` + `blur(2px)`. Width `max-w-md`. Closes on backdrop click or Close button. `handleCreateBtn()` closes the modal (or routes to datasource modal if type is "Add Datasource").

---

### Create Project Modal

`id="new-project-modal"` — triggered by "+ Create a project" via `openNewProjectModal()`.

Fields:
- **Name** — `id="proj-name"`, required, Enter key submits (`onkeydown`)
- **Description** — `id="proj-desc"`, optional, 3-row textarea

On `createNewProject()`:
1. Calls `clearSidebarActive()`
2. Inserts a new `proj-nav-row` block into `#projects-list` after the pinned project
3. Row is immediately active (`background:#EEF2FF; border-left:2px solid #5B63F6`)
4. Name is `text-gray-900` — never brand blue
5. Includes a `ws-submenu` div (`id="ws-dyn-{timestamp}-sub"`) for future sub-items
6. Prepends a project card to `#report-grid` (folder icon, `#EEF2FF` bg, "Just now" timestamp, optional description)

---

### Workspace Switcher Modal

`id="ws-modal-backdrop"` — triggered by the sidebar workspace switcher button.

| Property | Value |
|---|---|
| Backdrop | `rgba(17,24,39,0.45)` + `blur(2px)`, full-screen, `z-50` |
| Modal card | `max-w-lg`, `border-radius: 16px`, `max-height: 620px` |
| Shadow | `0 20px 60px rgba(0,0,0,0.18)` |

**Header:** "Switch Workspace" title + "New Workspace" button → `openNewWsModal()`.

**Search:** `id="ws-search"`, `oninput="filterWsList()"`, real-time filter.

**Workspace list** (`#ws-modal-list`): `renderWsModalList(filter)`. Max 5 visible rows (`44px × 5`), scrolls beyond. Current workspace: `bg-indigo-50` + checkmark.

**`wsData` (6 defaults):**

| id | Name | Color |
|---|---|---|
| `ws-manish` | Manish kumar's Workspace | `#3B5BDB` |
| `ws-scg` | Sovereign Capital Gate | `#5B63F6` |
| `ws-design` | Design System | `#16A34A` |
| `ws-data` | Data Analytics | `#F97316` |
| `ws-prod` | Product Research | `#8B5CF6` |
| `ws-mkt` | Marketing Hub | `#EC4899` |

Workspaces from the create-workspace page are merged from `localStorage` key `aibii_workspaces` on load.

JS: `openWsModal()`, `closeWsModal(e)`, `filterWsList()`, `renderWsModalList(filter)`, `selectWorkspace(id)`.

---

### New Workspace Modal

`id="new-ws-modal"` — full-screen (not a centered overlay). Triggered by "New Workspace" inside the switcher modal.

**Structure:**
- Fixed topbar: Aibii logo + close (`closeNewWsModal()`)
- Centered card (`max-w-sm`, white, `border-radius: 16px`)

**Fields:**
- **Avatar preview** (`id="ws-preview-avatar"`) — `44×44px` rounded-xl, click → `cycleWsColor()`
- **Name preview** (`id="ws-preview-name"`) — updates live via `onWsNameInput()`
- **Name** (`id="new-ws-name"`) — required, Enter submits
- **Description** (`id="new-ws-desc"`) — optional, 2-row textarea

`cycleWsColor()` cycles 7 colors: `#5B63F6 #16A34A #F97316 #8B5CF6 #EC4899 #0EA5E9 #EAB308`.

`createNewWs()` pushes to `wsData` and calls `selectWorkspace(newWs.id)`.

---

### Datasource Import Modal

`id="datasource-modal"` — 2-step wizard, `max-width: 520px`. Triggered via `openDatasourceModal()`.

**Step indicator:** Circles `ds-step1-circle` / `ds-step2-circle` + `1px` connector. Active = `#5B63F6` + white text. Completed = gray + checkmark SVG.

**Step 1 — Choose app** (`ds-body-step1`): Grid of `ds-app-btn` tiles.

| Source | Notes |
|---|---|
| File Upload | Drag-and-drop or browse; max 10MB |
| Google Drive | Paste folder/file URL; scope toggle (folder vs single file) |
| Notion | Integration token (password input) + optional page URL |

Selected app tile: `2px solid #5B63F6` + `#F8F8FF` bg. Advance → `dsGoStep2()`.

**Step 2 — Import docs** (`ds-body-step2`): Rendered dynamically by `dsGoStep2()` based on `dsSelectedApp`. Upload zone: `ondrop` → `handleDsFiles(files)` renders name + KB per file.

JS: `openDatasourceModal()`, `closeDatasourceModal()`, `dsGoStep1()`, `dsGoStep2()`, `selectDsApp(btn, app)`, `handleDsFiles(files)`.

---

## States & Interactions

| Component | State | Visual |
|---|---|---|
| Topbar hamburger | Hover | `rounded-md bg-gray-100` |
| Notification bell | Hover | `rounded-lg bg-gray-100` |
| Notification bell | Open | `#notif-dropdown` visible, outside-click closes |
| Notification item | Unread | `bg-indigo-50/40`, `bg-indigo-500` dot |
| Notification item | After markAllRead | white bg, dots removed |
| User pill | Hover | `bg-gray-100` |
| Report card | Hover | `rgba(91,99,246,0.4)` border, `shadow-card-hover`, `translateY(-1px)`, `...` visible |
| Filter tab | Active | `#FFFFFF` bg, border, shadow, `#111827` text |
| View toggle btn | Active | `#EEF2FF` bg, brand shadow, `#5B63F6` icon |
| Sidebar | Collapsed | `width: 0`, `opacity: 0` |
| Context menu | Open | `.open` class, `display: block`, fixed |
| Project chevron | Expanded | rotated `90deg` |
| Workspace switcher modal | Open | `#ws-modal-backdrop.open` (`display: flex`) |
| New workspace modal | Open | `#new-ws-modal` removes `.hidden` |
| Active sidebar nav (Recent) | — | `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px` |
| Active sidebar nav (project row) | — | `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:6px` |
| Type filter item | Active | `background:#EEF2FF`, `font-weight:600` |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| `...` appear | `100ms` | `ease` | `opacity` |
| Tab switch | `120ms` | `ease` | `background-color`, `box-shadow`, `color` |
| View toggle | `150ms` | `ease` | `background-color`, `box-shadow`, `color` |
| Nav hover | `100ms` | `ease` | `background-color` |
| Type filter item hover | `80ms` | `ease` | `background-color` |
| Project chevron | `150ms` | `ease` | `transform` |
| Sidebar collapse | `220ms` / `180ms` | `ease` | `width`, `min-width` / `opacity` |
| Modal open/close | instant | — | `.hidden` toggle |
| Workspace modal open/close | instant | — | `.open` toggle |

---

## Design Principles

1. **Recency as Priority** — 4-column grid maximises visible item count, surfacing in-progress work immediately.
2. **Flat Hierarchy, Contextual Depth** — elevation appears only on interaction.
3. **Segmented Filtering In-Place** — 4 tabs + type filter + search, no page reload.
4. **Consistent Type Visual Language** — each type has a unique colour across sidebar sub-items, badges, card thumbnails, and the filter dropdown.
5. **Progressive Disclosure** — `...` menus, sub-items, and dropdowns hidden until triggered.
6. **Dual-Mode Grid** — list view preserves all data in compact rows with a fixed-width type column.
7. **Single Active State** — only one sidebar item (Recent or a project row) is highlighted at a time; `clearSidebarActive()` enforces this.

---

## File Structure

```
recent-view/
├── assets/
├── tokens/
│   ├── colors.json
│   ├── typography.json
│   └── spacing.json
├── components/
├── index.html
└── README.md
```

---

*Design language version 2.3 — Aibii AI Business Intelligence SaaS · Recent View, May 2026.*
