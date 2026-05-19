# Create Form

## Overview

The **Create Form** page is a drag-and-drop form builder within Aibii. Users can add, reorder, label, and delete question fields, then toggle between **Edit** mode (authoring) and **Preview** mode (filling in the form as a respondent).

**File:** `create-form/index.html`
**Stack:** Plain HTML · Tailwind CSS CDN · Font Awesome 6.5 (icons inside form cards) · Heroicons SVG inline (sidebar/topbar) · Inter font (Google Fonts)

---

## Page Layout

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)            │  TOPBAR (44px h-11)                           │
│  ──────────────────────────  │  ☰                            🔔  [M]         │
│  [M] Manish kumar's Work… ▾  │                                               │
│  ──────────────────────────  │  CANVAS (scrollable py-10 px-8)              │
│  🕐 Recent                   │                                               │
│  ⊞  New Dashboard            │  Untitled Form (h1 22px 700)  [Edit Form btn]│
│  💬 New Chat                 │  Fill in the fields below…                   │
│  ──────────────────────────  │                                               │
│  PROJECTS                    │  ┌── Question Card ──────────────────────┐   │
│  ▶ My Private Project 📌     │  │  Label *                              │   │
│  ▶ Sovereign Capital Gate    │  │  ────────────────────── (input)       │   │
│  + Create a project          │  └───────────────────────────────────────┘   │
│  ──────────────────────────  │  ┌── Question Card ──────────────────────┐   │
│  ⚙  Settings                 │  │  ...                                  │   │
│  ──────────────────────────  │  └───────────────────────────────────────┘   │
│  🔵 Explore free features    │                        [Clear form] [Submit]  │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Sidebar

### Workspace Switcher

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

**ws2 — My Private Project** (pinned, collapsed): Heroicons outline pin icon `color:#5B63F6`. 11 sub-items.

**ws1 — Sovereign Capital Gate** (collapsed): 9 sub-items:

| # | Name | Type | Icon color |
|---|---|---|---|
| 1 | Investor Briefing | Chat | `#5B63F6` |
| 2 | Capital Analysis | Dashboard | `#16A34A` |
| 3 | Deal Memo Q2 | Document | `#F97316` |
| 4 | Pitch Deck 2026 | Presentation | `#8B5CF6` |
| 5 | Portfolio Overview | Dashboard | `#16A34A` |
| 6 | Risk Register | Document | `#F97316` |
| 7 | Market Signals | Chat | `#5B63F6` |
| 8 | LP Survey | Form | `#EC4899` |
| 9 | Valuation Model | Dashboard | `#16A34A` |

`+ Create a project` → `onclick="event.preventDefault();openNewProjectModal()"`

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
| Unread dot | `id="notif-dot"`, `w-1.5 h-1.5`, `bg-red-500` |
| Dropdown id | `notif-dropdown` |
| Width | `320px` (`w-80`) |
| Radius | `rounded-lg` |

**5 notification items:**

| State | Sender | Content |
|---|---|---|
| Unread | Sara M. (green `#16A34A`) | Shared "Revenue Overview" with you |
| Unread | Riya K. (orange `#F97316`) | Commented on "Q4 Strategy Discussion" |
| Unread | Aibii AI (purple `#8B5CF6`) | Finished processing "Investor Pitch Deck" |
| Read | Priya N. (pink `#EC4899`) | Invited you to "Sovereign Capital Gate" |
| Read | Aibii AI (indigo) | "User Analytics" report is ready |

**Footer:** "View all notifications" — 12px `#5B63F6`.

`markAllRead()` removes unread row highlights and hides `#notif-dot`.

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

## Canvas

Scrollable: `flex-1 overflow-y-auto py-10 px-8`, `id="canvas-scroll"`.

### Form Header Row

```
┌─────────────────────────────────────────────────────┐
│  Untitled Form (h1 22px 700)     [✏ Edit Form btn]  │
│  Fill in the fields below…  (13px gray-500)         │
└─────────────────────────────────────────────────────┘
```

- Title `id="topbar-title"` — also appears in canvas heading but NOT in topbar anymore (topbar is now hamburger + bell + user only)
- Badge `id="mode-badge"` (`hidden` by default): `"✏ Editing"` — 11px 600 `#5B63F6` on `#EEF2FF` bg, `rounded-full`
- Toggle button `id="toggle-mode-btn"` / `onclick="toggleMode()"`:
  - **Preview mode** (default): `"Edit Form"` label, pen icon, white bg `border #E5E7EB`
  - **Edit mode**: `"Preview"` label, eye icon, `bg #EEF2FF border #C7D2FE color #5B63F6`

### Question Cards (`id="fields-container"`)

Built by `renderFields()` → `buildCard(field, idx)`.

**Card anatomy:**

```
┌──────────────────────────────────────────────────────┐
│  [≡ drag handle]  Label *          (contenteditable) │
│                   ────────────────────── (input)     │
│                                        [🗑 delete]   │
└──────────────────────────────────────────────────────┘
```

- Container: `q-card bg-white rounded-xl px-6 py-5 mb-3`, `box-shadow: 0 1px 2px…`
- Hover: `0 2px 12px rgba(0,0,0,0.10)`
- `.drag-handle` — hidden by default; `display:flex` in `.edit-mode`
- `.q-edit-controls` (delete button) — hidden by default; `display:flex` in `.edit-mode`
- `.q-label` — 15px 600 `#202124`, `contenteditable` in edit mode; underline appears on hover/focus

**5 default fields:**

| id | Type | Label | Required |
|---|---|---|---|
| f1 | text | Full name | yes |
| f2 | email | Email address | yes |
| f3 | dropdown | How did you hear about us? | no |
| f4 | checkbox | What topics interest you? | no |
| f5 | textarea | Additional comments | no |

### Field Input Types (`.f-input` / `.f-textarea`)

All inputs use a Google Forms-style underline border (`border-bottom: 1px solid #dadce0`), no box.

| Type | Element | Notes |
|---|---|---|
| text | `<input type="text">` | Placeholder "Short answer text" |
| email | `<input type="email">` | Placeholder "example@email.com" |
| number | `<input type="number">` | |
| date | `<input type="date">` | |
| textarea | `<textarea rows="3">` | `.f-textarea` class |
| dropdown | `<select>` | `.f-input.f-select`, `padding: 10px 4px 6px` |
| checkbox | `<label class="opt-row">` rows | `accent-color: #1a73e8` |
| radio | `<label class="opt-row">` rows | `name=field.id` |
| file | `<label>` + hidden `<input type="file">` | Dashed border, hover `#5B63F6` |

Focus state: `border-bottom: 2px solid #1a73e8`. Disabled state (edit mode): `color:#80868b`.

### Required Star

`.req-star` — `color:#d93025`, 15px, `margin-left:4px`.

### Submit Row (`id="submit-row"`)

- `display:none` by default; `display:flex` in preview mode
- "Clear form" — 13px gray-400
- "Submit" — `px-6 h-10 rounded-xl 13px 600 white bg:blue box-shadow`

### Floating Add Button (`id="fab-add"`)

- `display:none` by default; `display:flex` in edit mode
- Fixed `bottom:28px right:28px`, `h-44px px-20px`, `border-radius:9999px`
- Background: `linear-gradient(135deg, #5B63F6, #7C6FF7)`
- Shadow: `0 6px 22px rgba(91,99,246,0.42)`
- Hover: `translateY(-2px)` + shadow intensifies

---

## Modals

### Add Field Modal (`id="add-modal"`)

Class `.modal-bg` backdrop: `rgba(10,10,24,0.40) blur(3px)`.
Box `.modal-box`: `bg-white rounded-[20px] max-w-480px p-28px`, `popIn` animation.

Fields:
- **Question label** (required) — `.m-input`, red border on empty submit
- **Field type** — `<select id="m-type-select">`, 9 options (see field types table above)
- **Options** (`id="m-options-row"`, hidden unless type is dropdown/checkbox/radio) — comma-separated
- **Required field** checkbox

`confirmAdd()` — validates label, pushes to `fields[]`, calls `renderFields()`, scrolls to bottom.

### Delete Confirm Modal (`id="del-modal"`)

Two-step deletion guard. Shows label preview in message body.
`confirmDelete()` — removes field from `fields[]` by `id`, re-renders.

### Workspace Switcher Modal (`id="ws-modal-backdrop"`)

| Property | Value |
|---|---|
| Backdrop | `fixed inset-0 z-50`, `rgba(17,24,39,0.45) blur(2px)` |
| Modal max-width | `lg (512px)` |
| Max-height | `620px` |
| Close | Click outside → `closeWsModal(e)` |

Header: "Switch Workspace" + "New Workspace" button → `openNewWsModal()`.
Search: `id="ws-search"`, `oninput="filterWsList()"`.
List: `id="ws-modal-list"`, rendered by `renderWsModalList(filter)`.

`wsData` (6 workspaces, merged with `localStorage('aibii_workspaces')`):

| `id` | Name | Initial | Color | Current |
|---|---|---|---|---|
| `ws-manish` | Manish kumar's Workspace | M | `#3B5BDB` | ✓ |
| `ws-scg` | Sovereign Capital Gate | S | `#5B63F6` | — |
| `ws-design` | Design System | D | `#16A34A` | — |
| `ws-data` | Data Analytics | A | `#F97316` | — |
| `ws-prod` | Product Research | P | `#8B5CF6` | — |
| `ws-mkt` | Marketing Hub | H | `#EC4899` | — |

### New Workspace Full-Screen (`id="new-ws-modal"`)

`hidden fixed inset-0 z-[60]`, `background:#F3F4F6`.
Form card: `rounded-lg max-w-lg px-7 py-8`.
- h2 `"New workspace"` + p `"A shared space for your team's work."`
- `#ws-preview-avatar` `w-11 h-11 rounded-xl` + hint `"Click avatar to change color"` → `cycleWsColor()`
- `#ws-preview-name` live preview
- `#new-ws-name` input → `onWsNameInput(val)`; Enter → `createNewWs()`
- `#new-ws-desc` textarea (optional)
- Cancel + Create buttons (Create: `bg:#5B63F6 hover:#4850e4`)

`wsColors` palette (7): `#5B63F6 · #16A34A · #F97316 · #8B5CF6 · #EC4899 · #0EA5E9 · #EAB308`

`createNewWs()` — pushes to `wsData`, selects it

---

## Edit vs Preview Mode

| Feature | Preview (default) | Edit mode |
|---|---|---|
| Toggle button label | "Edit Form" + pen icon | "Preview" + eye icon |
| Mode badge | hidden | visible (`#EEF2FF #5B63F6`) |
| Drag handles | hidden | visible |
| Delete buttons | hidden | visible |
| Labels `contenteditable` | `false` | `true` |
| Inputs | active | `disabled` |
| Submit row | `display:flex` | `display:none` |
| Floating Add button | `display:none` | `display:flex` |
| Canvas class | — | `.edit-mode` on `#form-canvas` |

---

## Drag & Drop

Native HTML5 drag-and-drop on `.q-card` elements (edit mode only).

| State class | Visual |
|---|---|
| `.is-dragging` | `opacity: 0.35` |
| `.drag-over` | `outline: 2px solid #5B63F6` |

Reorder logic: `onDrop` splices `fields[]` array and calls `renderFields()`.

---

## JavaScript Functions Reference

| Function | Description |
|---|---|
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles `.open` on submenu `#wsN-sub` + chevron |
| `toggleMode()` | Switches edit / preview mode |
| `renderFields()` | Clears `#fields-container`, re-renders all cards |
| `buildCard(field, idx)` | Builds a single `.q-card` DOM element |
| `buildInput(field)` | Returns HTML string for field's input control |
| `onLabelBlur(el)` | Saves inline label edits to `fields[]` |
| `openAddModal()` / `closeAddModal()` | Add Field modal lifecycle |
| `onModalTypeChange()` | Shows/hides options row based on type |
| `confirmAdd()` | Validates + pushes field, re-renders |
| `openDelModal(id)` / `closeDelModal()` | Delete Confirm modal lifecycle |
| `confirmDelete()` | Removes field from `fields[]`, re-renders |
| `onDragStart/Over/Leave/Drop/End` | HTML5 drag-and-drop handlers |
| `handleBgClick(e, id)` | Closes modal on backdrop click |
| `esc(s)` | HTML entity escaper for safe innerHTML injection |
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
| `.ws-submenu` | Project submenu; `display:none` → `display:block` via `.open` |
| `.ws-chevron` | Rotates 90° when submenu is open |
| `.q-card` | Question card; hover shadow lift |
| `.q-card.is-dragging` | `opacity:0.35` during drag |
| `.q-card.drag-over` | `outline:2px solid #5B63F6` drop target |
| `.drag-handle` | Hidden; `display:flex` inside `.edit-mode` |
| `.q-edit-controls` | Hidden; `display:flex` inside `.edit-mode` |
| `.q-label` | 15px 600 contenteditable label |
| `.req-star` | Red `*` for required fields |
| `.f-input` | Underline-only input (no border box) |
| `.f-textarea` | Underline-only textarea |
| `.f-select` | Dropdown with top padding |
| `.opt-row` | Radio/checkbox option row |
| `.modal-bg` | Fixed backdrop with blur |
| `.modal-box` | White card, `rounded-[20px]`, `popIn` animation |
| `.m-input` | Modal field input |
| `.m-label` | Modal field label |
| `.m-select` | Modal select with custom chevron via background-image |
| `#fab-add` | Floating pill button; `display:none` → `flex` in edit mode |
| `#submit-row` | Submit row; `display:none` → `flex` in preview mode |
| `#sidebar.collapsed` | Collapses sidebar to zero width |
| `#ws-modal-backdrop.open` | Shows WS modal (`display:none` → `flex`) |

---

## Design Tokens (Tailwind config)

| Token | Hex | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active states, CTAs, focus rings |
| `brand.secondary` | `#7C6FF7` | FAB gradient endpoint |
| `sidebar` | `#F8F9FC` | Sidebar background |
| `hover` | `#EEF2FF` | Nav item hover, edit mode badge |
| `card` shadow | `0 1px 3px rgba(0,0,0,0.06)…` | Default card shadow |
| `modal` shadow | `0 20px 60px rgba(0,0,0,0.18)` | WS modal shadow |
