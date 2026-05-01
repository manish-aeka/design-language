# Settings Page — Design Language

> Design system documentation for the **Aibii** AI Business Intelligence SaaS platform — Settings screen.  
> Version 1.3 · May 2026

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Layout](#spacing--layout)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Iconography](#iconography)
8. [Sidebar](#sidebar)
9. [Components](#components)
   - [Breadcrumb Bar](#breadcrumb-bar)
   - [Page Header with Icon](#page-header-with-icon)
   - [Settings Tab Bar](#settings-tab-bar)
   - [Profile Tab](#profile-tab)
   - [Workspace Tab](#workspace-tab)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)
13. [File Structure](#file-structure)

---

## Overview

The **Settings** page is the user and workspace configuration surface of the Aibii platform. It uses the same shell (sidebar + content area) as all views but introduces a **pill tab bar** for navigating two distinct panels: **Profile** and **Workspace**. The Workspace panel contains all workspace-level settings including workspace info, users with access, data sources, billing, and integrations.

The heading icon and page title update dynamically with each active tab.

---

## Screen Anatomy

```
+-------------------------------------------------------------------------+
| SIDEBAR (220px, white)    |  CONTENT AREA (fluid, white bg)             |
|                           |                                             |
|  [M] Manish kumar's Work  |  =  <  >  Settings        <- Breadcrumb    |
|  ----------------------   |                                             |
|  (clock) Recent           |  [icon]  Profile           <- Page heading  |
|  [grid] Create Dashboard  |  Manage your team and preferences here.    |
|  [chat] AI Chat           |                                             |
|  ----------------------   |  [ Profile   Workspace ]   <- Pill tabs     |
|  PROJECTS            [o]  |                                             |
|  > My Private Project [P] |  +------ Panel content per active tab ----+|
|    | Q4 Strategy           |  |  (see per-tab sections below)          ||
|    | Revenue Overview      |  +----------------------------------------+|
|  > Sovereign Capital Gate |                                             |
|    | Chat                  |                                             |
|    | Dashboard             |                                             |
|    | Document              |                                             |
|  + Create a project       |                                             |
|  ----------------------   |                                             |
|  (people) Shared with me  |                                             |
|  (cog) Settings  <- ACTIVE|                                             |
|  ----------------------   |                                             |
|  [*] Explore free features|                                             |
+---------------------------+---------------------------------------------+
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Active tab, buttons, focus rings, active nav border, pin icon |
| `color-bg-base` | `#FFFFFF` | Page background, sidebar background, card backgrounds |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, heading icon bg |
| `color-bg-tab-container` | `#F3F4F6` | Pill tab bar container |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab background |
| `color-bg-input` | `#FFFFFF` | Editable text inputs |
| `color-bg-input-disabled` | `#F9FAFB` | Read-only inputs, URL display |
| `color-bg-gray-50` | `#F9FAFB` | Table headers, datasource cards |
| `color-bg-explore` | `#E8EEFF` | Explore banner background |
| `color-bg-explore-icon` | `#C7D2FE` | Explore banner icon container |
| `color-billing-banner` | `#E8EEFF` | Billing free plan banner bg |
| `color-billing-banner-border` | `#C7D2FE` | Billing banner border |
| `color-text-primary` | `#111827` | Page title, input values, active tab |
| `color-text-secondary` | `#6B7280` | Inactive tabs, labels, nav items |
| `color-text-muted` | `#9CA3AF` | Placeholder text, meta info |
| `color-text-brand` | `#5B63F6` | Owner badge, active heading icon, billing plan |
| `color-text-danger` | `#EF4444` | Danger zone text, delete button |
| `color-border-default` | `#E5E7EB` | Input borders, card borders, active tab border |
| `color-border-subtle` | `#F3F4F6` | Dividers, table row separators |
| `color-active-nav-border` | `#5B63F6` | 2px left border on active Settings nav item |
| `color-workspace-avatar` | `#3B5BDB` | Workspace avatar background |
| `color-integration-connected` | `#16A34A` | Connected badge text |
| `color-integration-connected-bg` | `#F0FDF4` | Connected badge background |

---

## Typography

| Token | Size | Weight | Usage |
|---|---|---|---|
| `type-page-title` | 28px | 800 ExtraBold | Page heading ("Profile", "Workspace") |
| `type-subtitle` | 14px | 400 Regular | Page subtitle |
| `type-tab` | 14px | 500/600 Medium/SemiBold | Pill tab labels (active = 600) |
| `type-section-label` | 11px | 600 SemiBold | Uppercase card section labels |
| `type-field-label` | 12px | 500 Medium | Form field labels |
| `type-input` | 13–14px | 400/500 | Input values |
| `type-body` | 13px | 400 Regular | General body text, table rows |
| `type-caption` | 11–12px | 400 Regular | Meta text, badges, timestamps |

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

---

## Spacing & Layout

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps |
| `space-2` | 8px | Icon-to-label, inline element gaps |
| `space-3` | 12px | Compact padding |
| `space-4` | 16px | Standard padding, tab horizontal padding |
| `space-5` | 20px | Card padding (`p-5`) |
| `space-6` | 24px | Gap between heading and tabs, tabs and content |
| `space-8` | 32px | Content area horizontal padding |

### Content Layout

- Sidebar: **220px** fixed width
- Content area padding: `px-8 py-7` (32px / 28px)
- Profile panel: `max-w-xl` single-column
- Workspace panel: full-width rows with responsive columns

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-lg` | `rounded-lg` (8px) | Inputs, buttons, small elements |
| `radius-xl` | `rounded-xl` (12px) | Cards, table wrappers, integration items |
| `radius-full` | `rounded-full` (9999px) | Pill tabs, avatars, tab container |

### Card Shadow
```css
box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
```
Applied to all white content cards via `.shadow-card`.

### Datasource Card Hover
```css
.ds-card:hover {
  box-shadow: 0 4px 14px rgba(0,0,0,0.08);
  border-color: #c7d2fe;
}
```

---

## Iconography

### Style Rules
- **Line icons**, uniform stroke weight **1.5px**
- Sizes: `16px` nav/inline, `20px` action areas, `24px` page header

### Icon Inventory

| Location | Icon | Size | Color |
|---|---|---|---|
| Page header: Profile tab | `UserCircle` (person outline) | 20px | `#5B63F6` |
| Page header: Workspace tab | `SquaresGrid` (4 squares) | 20px | `#5B63F6` |
| Nav: Recent | `Clock` (circle + hands) | 16px | `#6B7280` |
| Nav: Create Dashboard | `SquaresGrid` (4 squares) | 16px | `#6B7280` |
| Nav: AI Chat | `ChatBubble` (speech bubble + dots) | 16px | `#6B7280` |
| Projects header | `EyeOff` | 14px | `#D1D5DB` |
| Project chevron | `ChevronRight` | 12px | `#9CA3AF` → rotates 90° when open |
| Submenu: Chat item | `ChatBubble` | 14px | `#5B63F6` |
| Submenu: Dashboard item | `SquaresGrid` | 14px | `#16A34A` |
| Submenu: Document item | `Document` | 14px | `#F97316` |
| Project pin | `Pin` (filled) | 12px | `#5B63F6` |
| Bottom nav: Shared with me | `UserGroup` | 16px | `#9CA3AF` |
| Bottom nav: Settings (active) | `Cog6Tooth` | 16px | `#6B7280` |
| Workspace switcher chevron | `ChevronDown` | 16px | `#9CA3AF` |
| Breadcrumb: Menu | `Bars3` | 18px | `#9CA3AF` |
| Breadcrumb: Back / Forward | `ChevronLeft` / `ChevronRight` | 16px | `#9CA3AF` |
| Workspace avatar | `UserCircle` placeholder | 32px | `#D1D5DB` |
| Profile avatar placeholder | `UserCircle` | 32px | `#D1D5DB` |
| Explore banner | `Sparkles` | 16px | `#4F6EF7` |

---

## Sidebar

The sidebar is **220px** wide with a **white background** (`bg-white`), matching the content area for a seamless feel. Structure is identical to recent-view and sovereign-capital-gate — Settings item is the active nav element.

### Structure (top → bottom)

| Zone | Content |
|---|---|
| **Workspace switcher** | `px-4 py-3`, border-bottom. Round avatar `w-7 h-7` (`#3B5BDB`), workspace name, chevron |
| **Primary nav** | `px-3 py-2 space-y-0.5`. Items: Recent (link to recent-view), Create Dashboard, AI Chat. Height `h-9`, `rounded-lg`, `text-sm` |
| **Divider** | `mx-3 my-1 border-t border-gray-100` |
| **Projects section** | Label "PROJECTS" + eye-slash icon. `id="projects-list"`. Collapsible items with chevron toggle. My Private Project (pinned, always first), Sovereign Capital Gate, "+ Create a project" |
| **Spacer** | `flex-1` |
| **Divider** | `mx-3 border-t border-gray-100` |
| **Bottom utility nav** | `px-3 py-2`. Items: Shared with me, **Settings (active)** |
| **Explore banner** | `mx-3 mb-3`, `background:#E8EEFF`, icon `#C7D2FE`. "Explore free features" + "Credit left: 15" |

### Active Settings Nav Item
```css
background: #EEF2FF;
border-left: 2px solid #5B63F6;
padding-left: 10px;
font-weight: 500;
color: #111827;
```

### Nav Item Hover
```css
.nav-item:hover { background-color: #EEF2FF; }
```

### Projects Section

**Pinned project rule:** "My Private Project" is always first with a `#5B63F6` filled pin icon (`12×12px`) on the right.

```
[>] My Private Project  [pin]   <- pinned, always first
    | (chat) Q4 Strategy
    | (grid) Revenue Overview

[>] Sovereign Capital Gate
    | (chat) Chat
    | (grid) Dashboard
    | (doc)  Document

[+] Create a project            <- calls openNewProjectModal()
```

**Submenu behaviour:**
```js
function toggleWorkspace(id) {
  const sub = document.getElementById(id + '-sub');
  const btn = document.getElementById(id + '-btn');
  sub.classList.toggle('open');
  btn.classList.toggle('open');
}
```
`.ws-submenu` is `display:none` by default; `.ws-submenu.open` is `display:block; max-height:200px; overflow-y:auto`. The `.ws-chevron` rotates 90° when `.ws-item.open`.

---

## Components

### Breadcrumb Bar

```
=   <   >   Settings
```

| Property | Value |
|---|---|
| Height | `h-11` (44px) |
| Border-bottom | `1px solid #F3F4F6` |
| Background | `bg-white` |
| Padding | `px-6` |
| Page label | 13px, `text-gray-500` |

---

### Page Header with Icon

Each tab has a dedicated icon in a rounded container beside the `<h1>`. Both icon and title update dynamically via JS on tab switch.

```
+----+
| [*]|  Profile
+----+  Manage your team and preferences here.
```

| Property | Value |
|---|---|
| Icon container | `w-9 h-9 rounded-xl`, `background:#EEF2FF` |
| Icon | `w-5 h-5`, `color:#5B63F6` |
| Title | 28px, 800 ExtraBold, `text-gray-900` |
| Subtitle | 14px, 400, `text-gray-400` |

**Icon per tab:**

| Tab | Icon |
|---|---|
| Profile | Person / user outline |
| Workspace | Grid / dashboard squares |

**JS:**
```js
const TABS = ['profile', 'workspace'];
const TITLES = { profile: 'Profile', workspace: 'Workspace' };

document.getElementById('page-title').textContent = TITLES[active];
document.getElementById('heading-icon').innerHTML = ICONS[active];
```

---

### Settings Tab Bar

Pill-style tab bar. Container has `#F3F4F6` background, `rounded-full`, `p-1`, `gap-1`.

```
+----------------------------------+
|  [ Profile ]   Workspace         |
+----------------------------------+
```

| State | Background | Border | Text | Font Weight |
|---|---|---|---|---|
| Active | `#FFFFFF` | `1px solid #E5E7EB` | `#111827` | 600 SemiBold |
| Inactive | `transparent` | `1px solid transparent` | `#6B7280` | 400 Regular |

| Property | Value |
|---|---|
| Height | `32px` |
| Padding | `0 16px` |
| Border-radius | `9999px` (full pill) |
| Font size | `14px` |
| Transition | `background, color, border 120ms ease` |

**JS:** `setTab(active)` toggles `.active` class on both `tab-{id}` buttons and `section-{id}` panels.

---

### Profile Tab

`max-w-xl`, single white card with `shadow-card`.

#### Picture section
- Avatar: `w-16 h-16 rounded-xl border border-gray-200`, falls back to gray placeholder icon
- "Upload a picture" button: `border border-gray-200 rounded-lg px-4 h-9 text-[13px] font-medium text-gray-700`
- Section separated from name fields by `border-b border-gray-100 pb-5 mb-5`

#### Name fields
- Two-column grid (`grid grid-cols-2 gap-4`)
- Each: label `12px font-medium text-gray-600` + input `h-9 border border-gray-200 rounded-lg px-3 text-[13px]`

#### Email field
- Read-only display: `text-gray-400`, not disabled but visually dimmed
- Full form width, single column

#### Save button
- Right-aligned in `border-t border-gray-100 pt-4 flex justify-end`
- Style: `px-4 h-9 rounded-lg text-[13px] font-medium text-white background:#5B63F6`

---

### Workspace Tab

Full-width layout. Five stacked sections.

#### Section 1 — 50/50 columns (Row 1)

**Left — Workspace info card:**
- Workspace avatar `w-12 h-12 rounded-xl` (`#3B5BDB`)
- Editable workspace name input (transparent, editable on click)
- Meta text: "Created April 2024 · 3 members"
- Workspace URL (read-only display with `aibii.com/manish-workspace`)
- Description textarea (`rows=2`)
- Save button (right-aligned, `border-t`)

**Right — Users with access card:**
- Header: "USERS WITH ACCESS" label + **Add user** button (`background:#5B63F6`)
- Search bar: icon-prefixed `input[type=text]` placeholder "Search users..."
- Table with `User` column (avatar + name + email) and `Role` column
  - Owner: non-editable badge `background:#EEF2FF color:#5B63F6`
  - Others: `<select>` dropdown (Admin / Editor / Viewer)

#### Section 2 — Data sources (full width)

- Header: "DATA SOURCES" label + **Add a datasource** button (`background:#5B63F6`)
- `grid grid-cols-2 gap-3` for datasource cards
- Each card: icon + name + subtitle + status badge or **Connect** button
- **Connected** badge: `background:#F0FDF4 color:#16A34A` with green dot
- Inline hint panel shown on "Add a datasource" click: dashed indigo border, `bg-indigo-50`

#### Section 3 — Danger zone (full width)

- `border border-red-100`, label in `#EF4444`
- "Delete workspace" description + **Delete** button (`border-red-200 color:#EF4444`)

#### Section 4 — Billing (full width, after danger zone)

**Free plan banner:**
- Background `#E8EEFF`, border `#C7D2FE`
- Sparkles icon + "Free plan" label (`color:#3B4ECC`)
- Price `$0 / month` (22px extrabold, `color:#3B4ECC`)
- Plan details: "15 AI credits · 2 workspaces · 5 GB storage"
- **Upgrade plan** button (`background:#5B63F6`)

**Payment method card:**
- White card `shadow-card`
- "No payment method added yet." + **Add card** button

#### Section 5 — Integrations (full width, after billing)

White card with `divide-y divide-gray-100`. Each row: `px-5 py-4`, integration icon + name + description + action.

| Integration | Icon bg | Status / Action |
|---|---|---|
| Google Sheets | `#0F9D58` | Connect |
| Notion | `bg-gray-900` | Connect |
| Slack | `#4A154B` | **Connected** (green badge) |
| PostgreSQL | `#336791` | Connect |
| REST API | `rgba(91,99,246,0.08)` | Connect |

**Connected badge:** `background:#F0FDF4 color:#16A34A` with checkmark icon  
**Connect button:** `border border-gray-200 text-gray-700 hover:bg-gray-50`

---

## States & Interactions

| Interaction | Behaviour |
|---|---|
| Tab switch | `setTab(id)` — toggles `.active` on pill button + panel; updates `h1` text and heading icon |
| Project submenu | `toggleWorkspace(id)` — toggles `.ws-submenu.open` and rotates `.ws-chevron` 90° |
| Nav item hover | `background-color: #EEF2FF` via `.nav-item:hover` |
| Add datasource | `showAddDataSource()` — toggles `hidden` on `#add-ds-hint` |
| Dismiss datasource hint | Button inside hint adds `hidden` back |
| Create a project | `openNewProjectModal()` — placeholder; modal can be added |
| Datasource card hover | `box-shadow` + border color change via `.ds-card:hover` |

---

## Motion & Animation

| Element | Property | Duration | Easing |
|---|---|---|---|
| Nav item hover | `background-color` | 100ms | `ease` |
| Pill tab active | `background, color, box-shadow` | 120ms | `ease` |
| Workspace chevron | `transform: rotate(90deg)` | 150ms | `ease` |
| Datasource card hover | `box-shadow`, `border-color` | 120ms | `ease` |

---

## Design Principles

1. **Consistent shell** — sidebar and breadcrumb bar identical to all other views; Settings is the active nav item
2. **Pill tabs** — same pattern as recent-view filter tabs; active state uses white background + subtle border
3. **Card-based panels** — every settings group lives in a white card with `shadow-card` for clear visual grouping
4. **Dynamic heading** — page title and icon update on tab switch to reinforce context
5. **Neutral white sidebar** — sidebar background matches canvas (`#FFFFFF`) for a seamless, borderless feel
6. **Workspace tab consolidation** — billing, integrations, and user access are all workspace-level concerns; grouping them under the Workspace tab reduces cognitive overhead and tab count
7. **Role-based access** — Owner is badge-only (non-editable); Admin/Editor/Viewer use `<select>` dropdowns

---

## File Structure

```
settings-profile/
├── index.html      <- Settings page (single-file, Tailwind CDN)
└── README.md       <- This file
```

---

*Design language v1.3 — Aibii AI Business Intelligence SaaS · Settings, May 2026.*
