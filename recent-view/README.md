# Recent View

## Overview

The **Recent** page shows all items the user has recently accessed — dashboards, documents, chats, presentations, forms, and projects — in one place. It is the reference page for the sidebar and topbar patterns shared across the design language.

**File:** `recent-view/index.html`
**Stack:** Plain HTML · Tailwind CSS CDN · Heroicons SVG inline · Inter font (Google Fonts)

---

## Page Layout

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)            │  TOPBAR (44px h-11)                           │
│  ──────────────────────────  │  ☰                            🔔  [M]         │
│  [M] Manish kumar's Work… ▾  │                                               │
│  ──────────────────────────  │  CONTENT (scrollable px-8 py-4)              │
│  🕐 Recent         ◀ active  │                                               │
│  ⊞  New Dashboard            │  Recent (h1 28px 800)                        │
│  💬 New Chat                 │  All your recently accessed items…           │
│  ──────────────────────────  │                                               │
│  PROJECTS                    │  [⊞ Dashboard][📄 Doc][🖥 Pres][📋 Form][💬 Chat] │
│  ▶ My Private Project 📌     │                                               │
│    ├ 💬 Q4 Strategy (×11)    │  [ By me ][ By everyone ][ Shared ][ All ]  │
│  ▶ Sovereign Capital Gate    │        [Search…]  [ Type▾ ][ ≡ ⊞ ]         │
│  + Create a project          │                                               │
│  ──────────────────────────  │  Report grid (4 cols, 11 cards)              │
│  ⚙  Settings                 │                                               │
│  ──────────────────────────  │                                               │
│  🔵 Explore free features    │                                               │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Sidebar

### Workspace Switcher

Full-width button at the top of the sidebar. Clicking opens the Workspace Switcher modal.

| Property | Value |
|---|---|
| Avatar id | `ws-avatar` |
| Name label id | `ws-name` |
| Avatar size | `28×28px` (`w-7 h-7`), `rounded-full` |
| Avatar background | `#3B5BDB` |
| Avatar letter | `M` |
| Display name | `"Manish kumar's Work…"` (truncated) |
| Chevron | ChevronUpDown, 16px, `#9CA3AF` |
| Click handler | `openWsModal()` |

### Primary Nav

Three links below the workspace divider. Row height `36px` (`h-9`), text `14px`.

| Item | Icon | State |
|---|---|---|
| Recent | Clock 16px | **Active** (`id="nav-recent"`) — `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px` |
| New Dashboard | SquaresGrid 16px | Inactive |
| New Chat | ChatBubble 16px | Inactive |

### Projects Section

Collapsible accordion. Label: `"PROJECTS"` — 11px uppercase `#9CA3AF`.

**ws2 — My Private Project** (pinned, always first):

Pin icon: custom thumbtack SVG, `color:#5B63F6`. 11 sub-items (`h-8`, `13px`, `text-gray-600`):

| # | Name | Type | Icon color |
|---|---|---|---|
| 1 | Q4 Strategy | Chat | `#5B63F6` |
| 2 | Revenue Overview | Dashboard | `#16A34A` |
| 3 | Project Brief | Document | `#F97316` |
| 4 | Investor Update | Chat | `#5B63F6` |
| 5 | Meeting Notes | Document | `#F97316` |
| 6 | KPI Tracker | Dashboard | `#16A34A` |
| 7 | Product Feedback | Chat | `#5B63F6` |
| 8 | User Analytics | Dashboard | `#16A34A` |
| 9 | Sprint Planning | Chat | `#5B63F6` |
| 10 | Roadmap 2026 | Document | `#F97316` |
| 11 | API Docs | Document | `#F97316` |

**ws1 — Sovereign Capital Gate** (links to `../sovereign-capital-gate/index.html`):

9 sub-items: Investor Briefing (Chat `#5B63F6`), Capital Analysis (Dashboard `#16A34A`), Deal Memo Q2 (Doc `#F97316`), Pitch Deck 2026 (Presentation `#8B5CF6`), Portfolio Overview (Dashboard `#16A34A`), Risk Register (Doc `#F97316`), Market Signals (Chat `#5B63F6`), LP Survey (Form `#EC4899`), Valuation Model (Dashboard `#16A34A`).

`+ Create a project` → `onclick="event.preventDefault();openNewProjectModal()"`

Submenu toggle: `toggleWorkspace(id)` adds `.open` to `#wsN-sub` and `#wsN-btn`; chevron rotates 90° via CSS.

### Bottom Nav

Settings only — `href="../settings-profile/index.html"`. Connect Datasource and Shared with me are commented out.

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
| Unread dot | `id="notif-dot"`, `w-1.5 h-1.5`, `bg-red-500`, top-right of button |
| Dropdown id | `notif-dropdown` |
| Width | `320px` (`w-80`) |
| Position | `right-0 top-[calc(100%+6px)]` |
| Radius | `rounded-2xl` |
| Shadow | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` |

**Header:** "Notifications" label + "Mark all as read" → `markAllRead()`.

**5 notification items:**

| State | Sender | Content |
|---|---|---|
| Unread | Sara M. (green) | Shared "Revenue Overview" with you |
| Unread | Riya K. (orange) | Commented on "Q4 Strategy Discussion" |
| Unread | Aibii AI (purple) | Finished processing "Investor Pitch Deck" |
| Read | Priya N. (pink) | Invited you to "Sovereign Capital Gate" |
| Read | Aibii AI (indigo) | "User Analytics" report is ready |

Unread rows: `bg-indigo-50/40` + `w-2 h-2 bg-indigo-500` dot. `markAllRead()` removes both and hides `#notif-dot`.

**Footer:** "View all notifications" — 12px `#5B63F6`.

### User Menu

| Property | Value |
|---|---|
| Wrapper id | `user-menu-wrapper` |
| Avatar | `w-7 h-7 rounded-full`, `background:#3B5BDB`, letter `M` |
| Click | `toggleUserMenu()` |
| Dropdown id | `user-dropdown` |
| Width | `224px` (`w-56`) |
| Position | `right-0 top-[calc(100%+6px)]` |

Dropdown contents:
- Name: `"Manish Kumar"` — 13px 600 `#111827`
- Email: `"manish@aibii.com"` — 12px `#9CA3AF`
- Log out button: `text-red-500 hover:bg-red-50`, ArrowRightOnRectangle icon

`toggleNotifications()` closes `#user-dropdown`; `toggleUserMenu()` closes `#notif-dropdown`. Both have a shared outside-click listener.

---

## Content Area

Scrollable: `flex-1 overflow-y-auto px-8 py-4`.

### Page Header

- Title: `"Recent"` — `text-[28px] font-extrabold text-gray-900`
- Subtitle: `"All your recently accessed dashboards, chats, documents, and more - in one place."` — `text-sm text-gray-500 mt-2`

### Action Cards

5 cards, `grid grid-cols-4 gap-4 mb-7`. Each card: `bg-white border border-gray-200 rounded-xl`, icon wrapper `40×40px` `rgba(91,99,246,0.08)`, icon `20px #5B63F6`. Click → `openCreateModal(type)`. Hover: `translateY(-1px)` + shadow.

| # | Label | Description |
|---|---|---|
| 1 | New Dashboard | Charts, KPIs & visual reports |
| 2 | New Document | Write, collaborate & share |
| 3 | New Presentation | Slides, decks & pitches |
| 4 | New Form | Surveys, feedback & data entry |
| 5 | New Chat | Ask questions, get AI answers |

> "Add Datasource" card exists in the HTML but is commented out. Its modal (`#datasource-modal`) is fully implemented.

### Filter Tab Bar

Layout: `flex items-center justify-between`. Left: pill tabs. Right: search + type filter + view toggle.

**Pill tabs** — container `background:#F3F4F6 rounded-full p-1`.

| Tab | `id` | Default |
|---|---|---|
| By me | `tab-me` | **Active** |
| By everyone | `tab-everyone` | Inactive |
| Shared with me | `tab-shared` | Inactive |
| Everything | `tab-everything` | Inactive |

Active: `bg-white border border-gray-200 box-shadow:0 1px 4px rgba(0,0,0,0.10)`. JS: `setTab(active)`.

**Search bar:**

| Property | Value |
|---|---|
| `id` | `search-input` |
| Default width | `256px` (`w-64`) |
| Focus width | `320px` (`focus:w-80`) |
| Height | `36px` (`h-9`) |
| Icon | MagnifyingGlass, 14px, absolute left |
| Input handler | `filterItems(query)` → `applyFilters()` |

**Type filter dropdown:**

Trigger: pill button (`background:#F1F3F4 border:1px solid #E5E7EB`) with funnel icon + `id="type-filter-label"`. Dropdown `id="type-dropdown"`, `min-w-[180px]`, `rounded-xl`.

Types: Chat (default highlighted — `background:#EEF2FF`, `color:#5B63F6`), Dashboard, Document, Presentation, Form, Project.

`setTypeFilter(type, el)` — clicking the active type again clears the filter. `applyFilters()` combines search + type simultaneously. Outside-click closes the dropdown.

**View toggle:**

Segmented control, `background:#F1F3F4 border:1px solid rgba(0,0,0,0.06) rounded-lg p-0.5`. Grid active by default (`id="view-grid"` has `.toggle-active`). JS: `setView(active)`.

### Report Grid

`id="report-grid"`. Default: `grid grid-cols-4 gap-4`. List view: `.list-view` class added.

11 sample cards (`data-type` attribute drives filtering):

| # | Name | Type | Preview bg | Icon color |
|---|---|---|---|---|
| 1 | Q4 Strategy Discussion | `chat` | `#EEF2FF` | `#93A8F4` |
| 2 | Revenue Overview | `dashboard` | `#F0FDF4` | `#6EE7A6` |
| 3 | Product Brief 2026 | `document` | `#FFF7ED` | `#FCA96A` |
| 4 | Investor Pitch Deck | `presentation` | `#F5F3FF` | `#A78BFA` |
| 5 | Customer Feedback Form | `form` | `#FDF2F8` | `#F4A8D4` |
| 6 | My Private Project | `project` | `#FFFBEB` | `#FCD34D` |
| 7 | Sprint Planning | `chat` | `#EEF2FF` | `#93A8F4` |
| 8 | User Analytics | `dashboard` | `#F0FDF4` | `#6EE7A6` |
| 9 | Sovereign Capital Gate | `project` | `#FFFBEB` | `#FCD34D` |
| 10 | Roadmap 2026 | `presentation` | `#F5F3FF` | `#A78BFA` |
| 11 | Onboarding Survey | `form` | `#FDF2F8` | `#F4A8D4` |

**Card anatomy:**

```
┌─────────────────────────────┐
│  Preview area h-40          │  ← type-colored bg + 40px icon
├─────────────────────────────┤
│  Title  (14px 500)          │
│  [type icon  Badge]         │  ← 10px badge
│  Updated X ago (11px)       │
│                       [···] │  ← overflow-btn
└─────────────────────────────┘
```

Overflow button (`.overflow-btn`): opacity 0 at rest, 1 on `.report-card:hover`. Click → opens `#card-menu` positioned near the button.

---

## Card Context Menu (`#card-menu`)

Fixed-position context menu. Opens via `.overflow-btn` click with smart vertical positioning (flips up if near bottom of viewport). Items: **Share**, **Rename**, **Edit**. All call `cardMenuAction(action)`. Closes on outside click.

---

## Modals

### 1. Create Item (`#create-modal`)

Opened by `openCreateModal(type)`. Backdrop: `rgba(17,24,39,0.45) blur(2px)`. Max-width `448px`, `rounded-2xl`.

Fields:
- **Name** (required) — validation: red ring if empty
- **Description** (optional) — 3-row textarea
- **Select project** — dropdown: My Private Project, Sovereign Capital Gate

`handleCreateBtn()`:
- If type is `"Add Datasource"` → closes this modal, opens datasource modal
- Otherwise → creates a new `.report-card` matching the type, prepends to `#report-grid`, closes modal

Closing: `closeCreateModal()` or clicking backdrop.

### 2. New Project (`#new-project-modal`)

Opened by `openNewProjectModal()` from sidebar `+ Create a project`. Max-width `448px`, `rounded-2xl`.

Fields: **Name** (required, Enter submits) + **Description** (optional).

`createNewProject()`:
1. Calls `clearSidebarActive()` to remove any active nav state
2. Inserts new collapsible project row into `#projects-list` (after pinned ws2 block), highlighted with `background:#EEF2FF; border-left:2px solid #5B63F6`
3. Prepends a project card (`data-type="project"`) to `#report-grid`
4. Closes modal

### 3. Workspace Switcher (`#ws-modal-backdrop` / `#ws-modal`)

Opened by `openWsModal()`. Backdrop: `rgba(17,24,39,0.45) backdrop-filter:blur(2px)`. Click backdrop → `closeWsModal(event)`.

| Property | Value |
|---|---|
| Modal max-width | `512px` (`max-w-lg`) |
| Max-height | `620px` |
| Radius | `rounded-lg` |
| Shadow | `0 20px 60px rgba(0,0,0,0.18)` |

**Header:** "Switch Workspace" title + "New Workspace" button (`background:#5B63F6`) → `openNewWsModal()`.  
**Search:** `id="ws-search"`, `oninput="filterWsList()"` → `renderWsModalList(filter)`.  
**List:** `id="ws-modal-list"`. Shows 5 rows; scrolls beyond.

`wsData` array (6 entries, merged with `localStorage('aibii_workspaces')`):

| `id` | Name | Initial | Color |
|---|---|---|---|
| `ws-manish` | Manish kumar's Workspace | M | `#3B5BDB` |
| `ws-scg` | Sovereign Capital Gate | S | `#5B63F6` |
| `ws-design` | Design System | D | `#16A34A` |
| `ws-data` | Data Analytics | A | `#F97316` |
| `ws-prod` | Product Research | P | `#8B5CF6` |
| `ws-mkt` | Marketing Hub | H | `#EC4899` |

`selectWorkspace(id)` — sets `ws.current`, updates `#ws-name` (truncated at 24 chars) and `#ws-avatar` bg/initial, closes modal.

### 4. New Workspace (`#new-ws-modal`, full-screen)

Opened by `openNewWsModal()`. Full-screen `background:#F3F4F6` with a mini Aibii topbar (close ×).

Form fields: **Name** (required, Enter submits) + **Description** (optional).

Live preview: `id="ws-preview-avatar"` + `id="ws-preview-name"` (updates via `onWsNameInput(val)`).

`cycleWsColor()` — clicking avatar cycles through 7 colors: `#5B63F6 → #16A34A → #F97316 → #8B5CF6 → #EC4899 → #0EA5E9 → #EAB308`.

`createNewWs()` — pushes new entry to `wsData`, calls `selectWorkspace(newWs.id)`, closes screen.

### 5. Datasource Import (`#datasource-modal`)

Triggered from `handleCreateBtn()` when type is `"Add Datasource"`. 2-step wizard, max-width `520px`.

**Step 1 — Choose app:** Grid of source buttons (`.ds-app-btn`). `selectDsApp(btn, app)` highlights selection with `border-color:#5B63F6 border-width:2px`. `dsSelectedApp` defaults to `"upload"`.

**Step 2 — Import docs:** Content rendered by `dsGoStep2()` based on `dsSelectedApp`:
- `"upload"` → drag-and-drop zone; `handleDsFiles(files)` renders file list in `#ds-file-list`
- `"gdrive"` → URL input + scope radio (Entire folder / Single file)
- `"notion"` → Integration token input + optional page URL

Stepper: `dsGoStep1()` / `dsGoStep2()` update circle backgrounds and label styles.

---

## JavaScript Functions Reference

| Function | Description |
|---|---|
| `setTab(active)` | Activates a filter tab (`me` / `everyone` / `shared` / `everything`) |
| `setView(active)` | Switches `#report-grid` between grid and list layout |
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles `.open` on project submenu `#wsN-sub` |
| `clearSidebarActive()` | Removes active styles from Recent nav + all project rows |
| `toggleTypeFilter()` | Opens / closes `#type-dropdown` |
| `setTypeFilter(type, el)` | Sets active type filter; clicking same type clears it |
| `applyFilters()` | Hides / shows `.report-card` elements by search + type |
| `filterItems(query)` | Calls `applyFilters()` from search input |
| `openCreateModal(type)` / `closeCreateModal()` | Create Item modal lifecycle |
| `handleCreateBtn()` | Validates, creates new card, closes modal |
| `openNewProjectModal()` / `closeNewProjectModal()` | New Project modal lifecycle |
| `createNewProject()` | Adds sidebar row + grid card for new project |
| `cardMenuAction(action)` | Handles context menu item clicks |
| `toggleNotifications()` | Toggles `#notif-dropdown`, closes `#user-dropdown` |
| `markAllRead()` | Clears unread bg/dots, hides `#notif-dot` |
| `toggleUserMenu()` | Toggles `#user-dropdown`, closes `#notif-dropdown` |
| `openWsModal()` / `closeWsModal(e)` | Workspace Switcher modal lifecycle |
| `renderWsModalList(filter)` | Renders filtered workspace rows in `#ws-modal-list` |
| `filterWsList()` | Calls `renderWsModalList` from `#ws-search` input |
| `selectWorkspace(id)` | Switches active workspace, updates sidebar header |
| `openNewWsModal()` / `closeNewWsModal()` | New Workspace full-screen lifecycle |
| `cycleWsColor()` | Cycles avatar color through 7 presets |
| `onWsNameInput(val)` | Updates live preview name + avatar letter |
| `createNewWs()` | Pushes new workspace to `wsData`, selects it |
| `openDatasourceModal()` / `closeDatasourceModal()` | Datasource Import modal lifecycle |
| `dsGoStep1()` / `dsGoStep2()` | Datasource wizard step transitions |
| `selectDsApp(btn, app)` | Highlights selected source app button |
| `handleDsFiles(files)` | Renders dropped / browsed file list in `#ds-file-list` |

---

## CSS Custom Classes

| Class | Purpose |
|---|---|
| `.nav-item` | Sidebar row hover: `hover:bg-gray-100 rounded-lg` |
| `.action-card` | Hover lift: `translateY(-1px)` + shadow |
| `.report-card` | Card hover shadow transition |
| `.overflow-btn` | Opacity 0 → 1 on parent `.report-card:hover` |
| `.card-menu` | Context menu toggled via `.open` (opacity + pointer-events) |
| `.filter-tab` | Pill tab transition (background, box-shadow) |
| `.toggle-btn` | View toggle button; inactive icon `#6B7280` |
| `.toggle-active` | Active toggle: `bg-white shadow` + icon `#5B63F6` |
| `.type-dropdown` | Type filter dropdown; shown via `.open` (`opacity:1 pointer-events:all`) |
| `.ws-submenu` | Project submenu; `max-height:0 overflow:hidden` → `160px` via `.open` |
| `.list-view .report-card` | Horizontal list row layout |
| `#ws-modal-backdrop` | WS modal backdrop; `display:none` → `flex` via `.open` |
| `#sidebar.collapsed` | Collapses sidebar to zero width |

---

## Design Tokens (Tailwind config)

| Token | Hex | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav border, focus rings, CTAs, type filter icon |
| `brand.secondary` | `#7C6FF7` | Secondary brand accents |
| `brand.upgrade` | `#7C3AED` | Upgrade prompts |
| `sidebar` | `#F8F9FC` | Sidebar background |
| `hover` | `#EEF2FF` | Active nav bg, item hover, action card icon bg |
| `tab-container` | `#F3F4F6` | Pill tab container, view toggle bg |
