# Settings — Design Language v2.1

> Design system documentation for the **Aibii** AI Business Intelligence SaaS platform — Settings screen.
> Updated May 2026 — terminology clarification (workspace vs project), sidebar Settings dropdown pattern.

---

## Overview

The Settings page uses a **2-level tab structure** rendered entirely within the existing Aibii shell (sidebar + breadcrumb bar + scrollable content area). No layout primitives change. All tokens — colors, typography, spacing, radius, shadow — are the same as every other Aibii screen.

**3 top-level sections, each with their own sub-tabs:**

| Section | Sub-tabs | Dynamic heading |
|---|---|---|
| **Profile** | Overview · Projects · Stats | "My Profile" |
| **Organisation** | Data Sources · Users | "Organisation" |
| **Workspace** | Workspace · Users · Datasources · Relationships | "Workspace" |

---

## Screen Anatomy

```
┌──────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)          │  CONTENT AREA (fluid, white)                  │
│  [M] Manish kumar's Work │  ≡  ‹  ›  Settings          ← Breadcrumb h-11│
│  Recent                  │                                               │
│  New dashboard           │  [icon]  My Profile         ← Dynamic heading │
│  New chat                │  View and manage your profile…                │
│  ─────────────────────── │                                               │
│  WORKSPACES        [👁]  │  [ Profile ]  Organisation  Workspace  ← L1 tabs
│  ▶ Sovereign Capital Gate│                                               │
│  ▶ My private workspace  │  [ Overview ]  Workspaces  Stats      ← L2 tabs
│  + Create a workspace    │                                               │
│  ─────────────────────── │  ┌─────────────────────────────────────────┐  │
│  👤 Shared with me       │  │  panel content (per active sub-tab)     │  │
│  ⚙ Settings  ← ACTIVE   │  └─────────────────────────────────────────┘  │
│  ─────────────────────── │                                               │
│  ✦ Explore free features │                                               │
└──────────────────────────┴───────────────────────────────────────────────┘
```

---

## Color System | `#5B63F6` | Active tab border, buttons, focus rings, active nav |
| `bg.hover` | `#EEF2FF` | Heading icon bg, nav hover, active nav bg |
| `bg.tab-container` | `#F3F4F6` | Both L1 and L2 pill tab containers |
| `bg.tab-active` | `#FFFFFF` | Active pill tab background |
| `border.default` | `#E5E7EB` | Card borders, input borders, active tab border |
| `border.subtle` | `#F3F4F6` | Row dividers inside cards |
| `text.primary` | `#111827` | Page title, card headings, input values |
| `text.secondary` | `#6B7280` | Inactive tabs, timestamps |
| `text.muted` | `#9CA3AF` | Placeholder, meta labels |
| `text.brand` | `#5B63F6` | "Data sources connected" status text |
| `status.positive` | `#16A34A` | Connected badge text |
| `status.positive-bg` | `#D1FAE5` | Connected badge bg |
| `status.warning` | `#D97706` | Review / Owner badge text |
| `status.warning-bg` | `#FEF3C7` | Review / Owner badge bg |
| `status.warning-border` | `#FDE68A` | Owner badge border |
| `status.info` | `#3B82F6` | Processing badge text |
| `status.info-bg` | `#DBEAFE` | Processing badge bg |
| `status.danger` | `#EF4444` | Ban / delete icon color |
| `avatar.brand` | `#5B63F6` | User avatar circle bg (org/ws users) |
| `avatar.workspace` | `#3B5BDB` | Workspace sidebar avatar |

---

## Typography

Same scale as all Aibii screens. Notable usages in Settings:

| Element | Size | Weight | Color |
|---|---|---|---|
| Page title (dynamic h1) | 28px | 800 | `#111827` |
| Page subtitle | 14px | 400 | `#9CA3AF` |
| Section heading (e.g. "My Profile") | 15px | 600 | `#111827` |
| Section subtitle | 13px | 400 | `#9CA3AF` |
| Pill tab label | 14px | 500 / 600 active | `#6B7280` / `#111827` |
| Card section overline | 11px | 600 | `#9CA3AF` uppercase tracked |
| Field label | 13px | 600 | `#111827` |
| Field value / input | 14px | 400–500 | `#111827` |
| Row field label (small) | 12px | 400 | `#9CA3AF` |
| Datasource type | 12px | 400 | `#6B7280` |
| Created date | 12px | 400 | `#9CA3AF` |
| Status badge | 11px | 600 | varies |
| Table tag pill | 11px | 400 | `#6B7280` |
| User avatar letter | 13px | 700 | `#FFFFFF` |
| "Add users" / "Manage users" labels | 13px | 600 | `#111827` |

---

## Tab System

Both levels use **identical pill-tab CSS** (`.stab` class), just nested.

### L1 — Top-level tabs

Container: `flex items-center gap-1 p-1 rounded-full w-fit` · `background: #F3F4F6`

| State | bg | border | text | font-weight | shadow |
|---|---|---|---|---|---|
| Active | `#FFFFFF` | `1px solid #E5E7EB` | `#111827` | 600 | `0 1px 4px rgba(0,0,0,0.10)` |
| Inactive | `transparent` | `1px solid transparent` | `#6B7280` | 500 | none |

Button: `h-8 px-4 rounded-full text-[14px] whitespace-nowrap`

### L2 — Sub-tabs (per section)

Identical spec. Tabs differ per section:
- **Profile:** Overview · Workspaces · Stats
- **Organisation:** Data Sources · Users
- **Workspace:** Workspace · Users · Datasources · Relationships

---

## Dynamic Heading

Switches on L1 tab change via JS. Icon wrapper is always `w-9 h-9 rounded-xl bg-[#EEF2FF]`, icon `w-5 h-5 color:#5B63F6`.

| L1 Tab | Title | Subtitle | Icon |
|---|---|---|---|
| Profile | My Profile | View and manage your profile, workspaces, and activity stats | Person |
| Organisation | Organisation | Manage your data connections and users | Building |
| Workspace | Workspace | Manage access and datasources here | Briefcase |

---

## Component Specs

### Profile Card (Profile → Overview)

`bg-white border border-gray-200 rounded-xl shadow-card overflow-hidden max-w-[640px]`

**User row** (`border-b border-gray-100 px-5 py-4 flex items-center justify-between`):
- Name: `14px font-semibold text-gray-900`
- Email below: `13px text-gray-400 mt-0.5`
- Owner badge: `bg-[#FEF9C3] text-[#D97706] border border-[#FDE68A] rounded-full px-3 h-7 text-[12px] font-semibold gap-1.5`

**Org section** (`px-5 py-4`):
- Overline: `11px font-semibold text-gray-400 uppercase tracking-widest mb-4`
- Each row: `flex items-center gap-3 space-y-5` — icon `w-4 h-4 text-gray-300` + label `12px text-gray-400` + value `14px font-medium text-gray-900`

---

## Project List Row (Profile → Projects)

Inside `bg-white border border-gray-200 rounded-xl shadow-card overflow-hidden max-w-[640px]`:

`flex items-center gap-4 px-5 h-[72px] border-b border-gray-100 last:border-b-0`

- Icon wrapper: `w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center flex-shrink-0`
- Briefcase icon: `w-4 h-4 text-gray-400`
- Name: `14px font-semibold text-gray-900`
- Status below name: `12px`
  - "Data sources connected" → `color: #5B63F6`
  - "No data sources yet" → `color: #9CA3AF`
- Owner badge (same spec as profile card)
- Chevron right: `w-4 h-4 text-gray-300 ml-auto flex-shrink-0`

---

### Datasource Card (Organisation → Data Sources)

Grid: `grid grid-cols-3 gap-4`

Card: `ds-card bg-white border border-gray-200 rounded-xl p-4 shadow-card`
- Hover: `border-color: #C7D2FE` · `box-shadow: 0 4px 14px rgba(0,0,0,0.08)`

Layout inside:
```
[DB icon 24px text-gray-400]  ─────────────  [Status badge]
Name  (14px font-semibold text-gray-900, mt-3)
Type  (12px text-gray-500)
─────────────
Created [date]  (12px text-gray-400, mt-3)
```

**Status badge spec** (`px-2.5 h-5 rounded-full text-[11px] font-semibold`):

| Label | bg | text |
|---|---|---|
| Connected | `#D1FAE5` | `#16A34A` |
| Review | `#FEF3C7` | `#D97706` |
| Processing | `#DBEAFE` | `#3B82F6` |

---

### Search + Action Bar (Org Data Sources)

`flex items-center gap-2 mb-6`

- Search: `flex-1 h-10 pl-9 pr-3 border border-gray-200 rounded-lg text-[13px]` + magnifier icon absolute `left-3 w-4 h-4 text-gray-400`
  - Focus: `border-[#5B63F6] ring-[3px] ring-[rgba(91,99,246,0.12)]`
- Filter button: `w-10 h-10 rounded-lg border border-gray-200 text-gray-500 hover:bg-gray-50`
- New Data source button: `flex items-center gap-1.5 px-4 h-10 rounded-lg text-[13px] font-medium text-white bg-[#5B63F6] hover:opacity-90`

---

### User Row (Org → Users, Workspace → Users)

Inside `bg-white border border-gray-200 rounded-xl shadow-card overflow-hidden`:

`flex items-center gap-3 px-4 h-14 border-b border-gray-100 last:border-b-0`

- Avatar: `w-9 h-9 rounded-full flex-shrink-0 flex items-center justify-center text-white text-[13px] font-bold bg-[#5B63F6]`
- Email: `14px text-gray-900 flex-1`
- Role select: `border border-gray-200 rounded-lg h-8 px-3 text-[13px] text-gray-600 bg-white min-w-[110px]`
- Ban icon: `w-4 h-4 text-red-400 cursor-pointer hover:text-red-600`
- Delete icon: `w-4 h-4 text-red-400 cursor-pointer hover:text-red-600`

---

### Add Users Bar (Org & Workspace)

`flex items-center gap-3 mb-5`

- Email input (Org) or Select a user dropdown (Workspace): `flex-1 h-10 pl-9 pr-3 border border-gray-200 rounded-lg text-[14px]` with icon prefix
- Role dropdown: `h-10 pl-9 pr-8 border border-gray-200 rounded-lg text-[13px] bg-white min-w-[130px]` with icon prefix

---

### Workspace Form (Workspace → Workspace)

`max-w-[540px]`

- Label: `block text-[13px] font-semibold text-gray-900 mb-1.5`
- Text input: `h-10 w-full px-3.5 border border-gray-200 rounded-lg text-[14px] text-gray-900`
- Textarea: `w-full px-3.5 py-2.5 border border-gray-200 rounded-lg text-[14px] text-gray-400 resize-none h-28`
- Focus on both: `border-[#5B63F6] ring-[3px] ring-[rgba(91,99,246,0.12)]`

---

### Linked Datasource Row (Workspace → Datasources)

Inside `bg-white border border-gray-200 rounded-xl shadow-card overflow-hidden max-w-[640px]`:

`flex items-center gap-4 px-4 h-14 border-b border-gray-100 last:border-b-0`

- Avatar: `w-9 h-9 rounded-full bg-[#5B63F6] flex items-center justify-center` with DB cylinder icon `w-4 h-4 text-white`
- Name: `14px font-semibold text-gray-900`
- Table count: `12px text-gray-400 mt-0.5`
- Table tags: `px-2 h-5 bg-gray-100 text-gray-600 text-[11px] rounded flex items-center` (gap-1.5 flex-wrap)
- Edit icon: `w-4 h-4 ml-auto text-[#5B63F6] cursor-pointer hover:opacity-70 flex-shrink-0`

---

## JavaScript

```js
// Switches L1 panel + updates dynamic heading + syncs sidebar snav active
function setTopTab(tab)

// Switches L2 sub-panel within a section
// prefix: 'prof' | 'org' | 'ws'
function setSubTab(prefix, tab)

// Sidebar settings menu toggle (collapse/expand)
function toggleSettings()

// Sidebar project submenu toggle (identical across all screens)
function toggleWorkspace(id)
```

---

## States & Interactions

| Interaction | Spec |
|---|---|
| L1 tab switch via sidebar | `setTopTab()` — updates `.main-panel`, `.top-ptab`, heading, `.snav-btn` |
| L2 tab switch | `setSubTab(prefix, tab)` — updates `.<prefix>-subpanel`, `.<prefix>-subtab` |
| Datasource card hover | `border-color: #C7D2FE` · `box-shadow: 0 4px 14px rgba(0,0,0,0.08)` · `150ms ease` |
| Input focus | `border-[#5B63F6]` · `ring-[3px] ring-[rgba(91,99,246,0.12)]` · immediate |
| Nav item hover | `bg: #EEF2FF` · `100ms ease` |
| Settings dropdown toggle | `toggleSettings()` — `open` class on `#settings-btn` + `#settings-sub` · `150ms ease` |
| Project submenu toggle | `toggleWorkspace(id)` — same open/chevron pattern on project items |
| Ban / delete icon hover | `text-red-600` · `100ms ease` |

---

## Design Principles

1. **Same shell, new depth** — The 2-level tab pattern reuses the identical pill-tab CSS (`.stab`) at both levels
2. **Consistent tokens** — Every color, size, and shadow is from the shared Aibii token set
3. **Dynamic heading** — Title + subtitle + icon update on L1 tab switch, reinforcing context
4. **Card-based panels** — All list content (workspaces, datasources, users) lives in `rounded-xl border` cards
5. **Status badges** — Connected/Review/Processing use the same positive/warning/info token colors as the rest of the app

---

*Design language v2.1 — Aibii AI Business Intelligence SaaS · Settings, May 2026.*

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Layout](#spacing--layout)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Sidebar](#sidebar)
8. [Components](#components)
   - [Breadcrumb Bar](#breadcrumb-bar)
   - [Page Header with Icon](#page-header-with-icon)
   - [Settings Tab Bar](#settings-tab-bar)
   - [Profile Tab](#profile-tab)
   - [Workspace Tab](#workspace-tab)
   - [Billing Tab](#billing-tab)
   - [Users Tab](#users-tab)
   - [Integrations Tab](#integrations-tab)
9. [States & Interactions](#states--interactions)
10. [Design Principles](#design-principles)

---

## Overview

The **Settings** page is the user and workspace configuration surface of the Aibii platform. It uses the same shell (sidebar + content area) as all views but introduces a **pill tab bar** for navigating five distinct panels: Profile, Workspace, Billing, Users, and Integrations. The heading icon updates dynamically with each active tab.

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px, white)    │  CONTENT AREA (fluid, white bg)             │
│                           │                                             │
│  [M] Manish kumar's Work  │  ≡  ‹  ›  Settings        ← Breadcrumb     │
│  ─────────────────────    │                                             │
│  🕐 Recent                │  [🔵 icon]  Profile        ← Page heading   │
│  ⊞  New dashboard         │  Manage your team and preferences here.     │
│  💬 New chat              │                                             │
│  ─────────────────────    │  [ Profile  Workspace  Billing  Users  Integrations ] ← Pill tabs
│  WORKSPACES         [👁]  │                                             │
│  ▶ Sovereign Capital Gate │  ┌─ Panel content per active tab ─────────┐ │
│  ▶ My private workspace   │  │  (see per-tab sections below)          │ │
│  + Create a workspace     │  └────────────────────────────────────────┘ │
│                           │                                             │
│  ─────────────────────    │                                             │
│  👤 Shared with me        │                                             │
│  ⚙ Settings  ← ACTIVE    │                                             │
│  ─────────────────────    │                                             │
│  🔵 Explore free features │                                             │
└───────────────────────────┴─────────────────────────────────────────────┘
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Active tab, buttons, focus rings, active nav border |
| `color-bg-base` | `#FFFFFF` | Page background, sidebar background, card backgrounds |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, heading icon bg |
| `color-bg-tab-container` | `#F3F4F6` | Pill tab bar container |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab background |
| `color-bg-input` | `#FFFFFF` | Editable text inputs |
| `color-bg-input-disabled` | `#F9FAFB` | Read-only inputs, URL display |
| `color-bg-gray-50` | `#F9FAFB` | Table headers, datasource cards |
| `color-bg-explore` | `#E8EEFF` | Explore banner background |
| `color-bg-explore-icon` | `#C7D2FE` | Explore banner icon container |
| `color-text-primary` | `#111827` | Page title, input values, active tab |
| `color-text-secondary` | `#6B7280` | Inactive tabs, labels, nav items |
| `color-text-muted` | `#9CA3AF` | Placeholder text, meta info |
| `color-text-brand` | `#5B63F6` | Owner badge, active heading icon |
| `color-text-danger` | `#EF4444` | Danger zone text, delete button |
| `color-border-default` | `#E5E7EB` | Input borders, card borders, active tab border |
| `color-border-subtle` | `#F3F4F6` (gray-100) | Dividers, table row separators |
| `color-active-nav-border` | `#5B63F6` | 2px left border on active Settings nav item |
| `color-workspace-avatar` | `#3B5BDB` | Workspace avatar background |
| `color-billing-banner` | `#E8EEFF` | Billing free plan banner bg |
| `color-billing-banner-border` | `#C7D2FE` | Billing banner border |

---

## Typography

| Token | Size | Weight | Usage |
|---|---|---|---|
| `type-page-title` | 28px | 800 ExtraBold | Page heading ("Profile", "Workspace", etc.) |
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
- Single-column panels (Profile, Billing, Users, Integrations): `max-w-xl`
- Workspace panel: full-width rows with responsive columns

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-lg` | `rounded-lg` (8px) | Inputs, buttons, small elements |
| `radius-xl` | `rounded-xl` (12px) | Cards, table wrappers |
| `radius-full` | `rounded-full` (9999px) | Pill tabs, avatars, tab container |

### Card Shadow
```css
box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
```
Applied to all white content cards via `.shadow-card`.

---

## Sidebar

The sidebar is **220px** wide with a **white background** (`bg-white`), matching the canvas/content area color for a seamless feel.

### Structure (top → bottom)

| Zone | Content |
|---|---|
| **Workspace switcher** | `px-4 py-3`, border-bottom. Round avatar `w-7 h-7` (`#3B5BDB`), workspace name, chevron |
| **Primary nav** | `px-3 py-2 space-y-0.5`. Items: Recent, New dashboard, New chat. Height `h-9`, `rounded-lg`, `text-sm` |
| **Divider** | `mx-3 my-1 border-t border-gray-100` |
| **Workspaces section** | Label "WORKSPACES" + eye-slash icon. Collapsible items with chevron toggle. Sub-items (Chat/Dashboard/Document). "+ Create a workspace" |
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

### Workspace Submenu Toggle (JS)
```js
function toggleWorkspace(id) {
  const sub = document.getElementById(id + '-sub');
  const btn = document.getElementById(id + '-btn');
  sub.classList.toggle('open');
  btn.classList.toggle('open');
}
```
`.ws-submenu` is `display:none` by default; `.ws-submenu.open` is `display:block`. The `.ws-chevron` rotates 90° when `.ws-item.open`.

---

## Components

### Breadcrumb Bar

```
≡   ‹   ›   Settings
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

Each tab has a dedicated icon displayed in a rounded container beside the `<h1>`. Both the icon and the title update dynamically via JS when switching tabs.

```
┌────┐
│ 🔵 │  Profile
└────┘  Manage your team and preferences here.
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
| Billing | Credit card |
| Users | People / group |
| Integrations | Plug / connect squares |

**JS:**
```js
document.getElementById('page-title').textContent = TITLES[active];
document.getElementById('heading-icon').innerHTML = ICONS[active];
```

---

### Settings Tab Bar

Pill-style tab bar. Container has a `#F3F4F6` background, `rounded-full`, `p-1`, `gap-1`.

```
┌──────────────────────────────────────────────────────────────────┐
│  [ Profile ]   Workspace   Billing   Users   Integrations        │
└──────────────────────────────────────────────────────────────────┘
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

**Sections within the card:**

#### Picture section
- Avatar: `w-16 h-16 rounded-xl border border-gray-200`, falls back to gray placeholder
- Upload button: `border border-gray-200 rounded-lg px-3 h-8 text-sm text-gray-700`
- Remove button: `text-red-400 text-sm`
- Section separated from name fields by `border-b border-gray-100 pb-5 mb-5`

#### Name fields
- Two-column grid (`grid grid-cols-2 gap-3`)
- Each: label `12px font-medium text-gray-600` + input `h-9 border border-gray-200 rounded-lg px-3 text-sm`

#### Email field
- Read-only input: `bg-gray-50 text-gray-400 cursor-default`

#### Save button
- Right-aligned in a `border-t border-gray-100 mt-5 pt-5 flex justify-end`
- Style: `px-4 h-9 rounded-lg text-sm font-medium text-white background:#5B63F6`

---

### Workspace Tab

Full-width layout. Three stacked rows.

#### Row 1 — 50/50 columns (equal height, `items-stretch`)

**Left — Workspace info card:**
- Workspace avatar `w-12 h-12 rounded-xl` (`#3B5BDB`)
- Editable workspace name input (transparent, editable on click)
- Meta text: "Created April 2024 · 3 members"
- Workspace URL (read-only display)
- Description textarea (`rows=2`)
- Save button (right-aligned, `border-t`)

**Right — Users with access card:**
- Header: "USERS WITH ACCESS" label + **Add user** button (`background:#5B63F6`)
- Search bar: icon-prefixed `input[type=text]` placeholder "Search users..."
- Table: `User` column (avatar + name + email) | `Role` column
  - Owner: non-editable badge `background:#EEF2FF color:#5B63F6`
  - Others: `<select>` dropdown (Admin / Editor / Viewer)

#### Row 2 — Data sources (full width)
- Header: "DATA SOURCES" label + **Add a datasource** button
- `grid grid-cols-2 gap-3` for datasource cards
- Each card: icon + name + subtitle + status badge or Connect button
- Inline hint panel (dashed border, `#EEF2FF` tint) shown on "Add a datasource" click

#### Row 3 — Danger zone (full width)
- `border border-red-100`, label in `#EF4444`
- "Delete workspace" description + **Delete** button (`border-red-200 color:#EF4444`)

---

### Billing Tab

`max-w-xl`.

#### Free plan banner
- Background `#E8EEFF`, border `#C7D2FE`
- AI icon + "Free plan" label (`color:#3B4ECC`)
- Price `$0 / month` (28px extrabold, `color:#3B4ECC`)
- Plan details line + **Upgrade plan** button (`background:#5B63F6`)

#### Payment method card
- White card `shadow-card`
- "No payment method added yet." + **Add card** button

---

### Users Tab

`max-w-xl`.

#### Invite bar
- `input[type=email]` placeholder "Search or invite users by email..." (flex-1)
- **Add users** button (`background:#5B63F6`, `flex-shrink-0`)

#### Users list table
White card `rounded-xl border border-gray-200 shadow-card`:

| Column | Width | Content |
|---|---|---|
| User | `flex-1` | Avatar circle + name (`font-medium`) + email (`text-gray-400 text-[11px]`) |
| Role | `w-24` | Badge (Owner) or `<select>` dropdown (Admin/Editor/Viewer/Pending) |

**Rows:**
| Name | Role |
|---|---|
| Manish Kumar | Owner badge `#EEF2FF / #5B63F6` |
| Arjun Patel | Admin (select) |
| Sneha Rao | Editor (select) |
| Riya Sharma | Viewer (select) |
| james.b@example.com | Pending badge `#FEF9C3 / #D97706` |

---

### Integrations Tab

`max-w-xl`. Grid of integration cards (`grid grid-cols-2 gap-3`).

Each card: icon + integration name + description + **Connect** or **Connected** button.

| Integration | Status |
|---|---|
| Google Sheets | Connect |
| Notion | Connect |
| Slack | Connected |
| PostgreSQL | Connect |
| REST API | Connect |

**Connected button style:** `background:#F0FDF4 color:#16A34A border border-green-100`  
**Connect button style:** `border border-gray-200 text-gray-700 hover:bg-gray-50`

---

## States & Interactions

| Interaction | Behavior |
|---|---|
| Tab switch | `setTab(id)` — toggles `.active` on pill button + panel; updates `h1` text and heading icon |
| Workspace submenu | `toggleWorkspace(id)` — toggles `.ws-submenu.open` and rotates `.ws-chevron` |
| Nav item hover | `background-color: #EEF2FF` via `.nav-item:hover` |
| Add datasource | `showAddDataSource()` — removes `hidden` from `#add-ds-hint` |
| Dismiss hint | Button inside hint adds `hidden` back |
| Toggle switch | `toggleSwitch(btn)` — toggles active state |

---

## Design Principles

1. **Consistent shell** — sidebar and breadcrumb bar identical across all views
2. **Pill tabs** — same pattern as recent-view filter tabs; active state uses white background + subtle border
3. **Card-based panels** — every settings group lives in a white card with `shadow-card` for clear visual grouping
4. **Dynamic heading** — page title and icon update on tab switch to reinforce context
5. **Neutral white sidebar** — sidebar background matches canvas (`#FFFFFF`) for a clean, borderless feel
6. **Role-based access** — Users tab and Workspace → Users card both show role dropdowns, Owner is badge-only (non-editable)

---

## File Structure

```
settings-profile/
├── index.html      ← Settings page (single-file, Tailwind CDN)
└── README.md       ← This file
```

---

*Design language v1.2 — Aibii AI Business Intelligence SaaS · Settings, April 2026.*


1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Grid](#spacing--grid)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Iconography](#iconography)
8. [Components](#components)
   - [Breadcrumb Bar](#breadcrumb-bar)
   - [Page Header](#page-header)
   - [Settings Tab Bar](#settings-tab-bar)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
   - [Section Label](#section-label)
   - [Avatar + Upload](#avatar--upload)
   - [Text Input](#text-input)
   - [Email Input (Read-only)](#email-input-read-only)
   - [Form Layout](#form-layout)
9. [States & Interactions](#states--interactions)
10. [Motion & Animation](#motion--animation)
11. [Design Principles](#design-principles)
12. [Differences from Other Views](#differences-from-other-views)

---

## Overview

The **Settings › Profile** page is the user-preference form surface of the Aibii AI Business Intelligence SaaS platform. It uses the same shell (sidebar + content area) as all analytical views, but introduces new primitives unique to settings: a **multi-tab settings bar**, **form inputs**, a **read-only field**, an **avatar upload control**, and a **section label** pattern. The page is intentionally sparse — one form, no distractions.

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
┌──────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)          │  CONTENT AREA (fluid)                         │
│                          │                                               │
│  [M] Manish kumar's Work │  ≡  ‹  ›  Settings          ← Breadcrumb     │
│  ✦ Ask Penno AI  ⌘K      │                                               │
│  🕐 Recent               │  Profile                    ← Page Title      │
│  📄 New document         │  Manage your team and preferences here.       │
│  💬 New chat             │                                               │
│  ─────────────────────── │  [ Profile ]  Workspace  Billing  Members  Integrations  ← Tabs
│  Channels          [👁]  │                                               │
│  # Sovereign Capital Gate│  Picture                    ← Section Label   │
│  # My private channel    │  [Avatar]  [ Upload a picture ]               │
│  + Create a channel      │                                               │
│  ─────────────────────── │  First name        Last name                  │
│  🚀 Upgrade workspace    │  ┌────────────┐   ┌────────────┐             │
│  👤 Shared with me       │  │  Manish    │   │  kumar     │             │
│  ⬇ Import               │  └────────────┘   └────────────┘             │
│  🗂 Templates            │                                               │
│  ⚙ Settings             │  Email                                        │
│  ─────────────────────── │  ┌─────────────────────────────────┐         │
│  🔵 Explore free features│  │  manish7479dlp@gmail.com (dimmed)│         │
└──────────────────────────┴──└─────────────────────────────────┘─────────┘
```

---

## Color System

### Palette

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Focus rings, active tab indicator |
| `color-brand-secondary` | `#7C6FF7` | Upgrade accent |
| `color-brand-gradient-start` | `#4F6EF7` | Logo gradient start |
| `color-brand-gradient-end` | `#8B5CF6` | Logo gradient end |
| `color-bg-base` | `#FFFFFF` | Page background, input backgrounds |
| `color-bg-sidebar` | `#F8F9FC` | Left navigation sidebar |
| `color-bg-hover` | `#EEF2FF` | Nav item hover |
| `color-bg-tab-active` | `#FFFFFF` | Active settings tab background |
| `color-bg-tab-container` | `transparent` | Tab row sits directly on page bg |
| `color-bg-input` | `#FFFFFF` | Editable text input background |
| `color-bg-input-disabled` | `#F9FAFB` | Read-only / disabled input background |
| `color-bg-avatar` | — | Avatar image fills the circle; no bg needed |
| `color-bg-btn-secondary` | `#FFFFFF` | "Upload a picture" button background |
| `color-text-primary` | `#111827` | Page title, input values, section labels |
| `color-text-secondary` | `#6B7280` | Page subtitle, tab labels (inactive), field labels |
| `color-text-tertiary` | `#9CA3AF` | Read-only input placeholder text |
| `color-text-link` | `#5B63F6` | Active tab text |
| `color-text-upgrade` | `#7C3AED` | Upgrade this workspace link |
| `color-border-default` | `#E5E7EB` | Input borders, tab border, avatar ring |
| `color-border-subtle` | `#F3F4F6` | Sidebar dividers |
| `color-border-input-focus` | `#5B63F6` | Focused input border |
| `color-border-tab-active` | `#E5E7EB` | Active tab border (pill outline) |
| `color-icon-muted` | `#9CA3AF` | Breadcrumb chevrons, inactive icons |
| `color-avatar-ring` | `#E5E7EB` | Thin ring around the avatar image |

---

## Typography

### Type Scale

| Token | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| `type-display` | 28px | 700 (Bold) | 1.2 | Page title ("Profile") |
| `type-subtitle` | 14px | 400 (Regular) | 1.5 | Page subtitle |
| `type-section-label` | 14px | 600 (SemiBold) | 1.3 | Section heading ("Picture") |
| `type-field-label` | 13px | 500 (Medium) | 1.3 | Form field labels ("First name", "Email") |
| `type-input` | 14px | 400 (Regular) | 1.5 | Input field values |
| `type-input-placeholder` | 14px | 400 (Regular) | 1.5 | Read-only / placeholder text (dimmed) |
| `type-tab` | 14px | 500 (Medium) | 1.3 | Settings tab labels |
| `type-btn-secondary` | 14px | 500 (Medium) | 1.3 | "Upload a picture" button label |
| `type-breadcrumb` | 13px | 400 (Regular) | 1.3 | Breadcrumb path items |
| `type-caption` | 11px | 400 (Regular) | 1.3 | Helper text, fine print |

### Font Family
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

### Title Weight Note
The "Profile" title on this screen uses **700 (Bold)** — slightly lighter than the 800 (ExtraBold) used on the "Recent" page title — reflecting the calmer, form-focused context.

---

## Spacing & Grid

### Base Unit: 4px

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps |
| `space-2` | 8px | Icon-to-label, inline gaps |
| `space-3` | 12px | Tab padding vertical, field label to input gap |
| `space-4` | 16px | Tab padding horizontal, section top margin |
| `space-5` | 20px | Sidebar horizontal padding |
| `space-6` | 24px | Page title to tabs gap, tabs to first section gap |
| `space-8` | 32px | Content area horizontal padding, between form sections |
| `space-10` | 40px | Page header (title + subtitle) bottom margin |

### Form Layout

| Zone | Spec | Notes |
|---|---|---|
| Sidebar | 220px fixed | Same as all views |
| Content padding | 32px horizontal | Standard content area padding |
| Form max-width | `~600px` | Form doesn't stretch full width — comfortable reading line |
| Name fields | 2 columns, `gap: 16px` | First name and last name side by side |
| Email field | 1 column, full form width | Single-column, half-width of the 2-col row |
| Field label to input gap | `space-2` (8px) | Tight but readable |
| Between form rows | `space-8` (32px) | Generous vertical rhythm between groups |
| Avatar to upload button gap | `space-4` (16px) | Horizontal gap |
| Section label to content gap | `space-4` (16px) | Below the "Picture" label |

---

## Border Radius & Elevation

### Border Radius

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Tight badges |
| `radius-md` | 8px | Inputs, buttons, nav items |
| `radius-lg` | 12px | Cards, modals |
| `radius-xl` | 16px | Large modal overlays |
| `radius-full` | 9999px | Avatar circle, pill tabs |

### Input Border Radius
All text inputs use `radius-md` (8px) — consistent with button and card element rounding.

### Avatar Border Radius
The avatar is a **perfect circle** — `radius-full` with a fixed `width` and `height`.

### Elevation

| Token | Value | Used on |
|---|---|---|
| `shadow-none` | `none` | Inputs (default), sidebar, page bg |
| `shadow-input-focus` | `0 0 0 3px rgba(91,99,246,0.15)` | Focused input ring |
| `shadow-btn` | `0 1px 2px rgba(0,0,0,0.06)` | "Upload a picture" button |
| `shadow-btn-hover` | `0 2px 6px rgba(0,0,0,0.10)` | Button on hover |
| `shadow-modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modals / popovers |

---

## Iconography

### Style Rules
- **Line icons**, stroke weight **1.5px**
- Sizes: `14px` breadcrumb, `16px` nav icons, `20px` feature icons
- Muted icons use `color-icon-muted` (`#9CA3AF`)

### Icon Inventory

| Location | Icon | Size | Color |
|---|---|---|---|
| Breadcrumb separator `›` | `ChevronRight` | 14px | `color-icon-muted` |
| Breadcrumb hamburger `≡` | `Menu` | 18px | `color-text-secondary` |
| Nav: Settings (active) | `Settings` gear | 16px | `color-text-primary` |
| Nav: Recent | `Clock` | 16px | `color-text-secondary` |
| Nav: New document | `FilePlus` | 16px | `color-text-secondary` |
| Nav: Upgrade | `Rocket` | 16px | `color-brand-secondary` |
| Avatar image | User photo | 48px | — (image) |

---

## Components

### Breadcrumb Bar

A top-of-page wayfinding strip with a hamburger menu, back/forward arrows, and the current page name.

```
≡   ‹   ›   Settings
```

| Property | Value |
|---|---|
| Height | `44px` |
| Background | `color-bg-base` |
| Border-bottom | `1px solid color-border-subtle` |
| Hamburger icon | `Menu`, 18px, `color-text-secondary` |
| Arrow icons | `ChevronLeft` / `ChevronRight`, 16px, `color-icon-muted` |
| Page label | `type-breadcrumb` (13px, 400), `color-text-secondary` |
| Item gap | `space-2` (8px) |
| Padding | `0 space-8` |

---

### Page Header

Title + subtitle at the top of the content area, below the breadcrumb.

```
Profile
Manage your team and preferences here.
```

| Property | Value |
|---|---|
| Title | `type-display` (28px, 700), `color-text-primary` |
| Subtitle | `type-subtitle` (14px, 400), `color-text-secondary` |
| Title–subtitle gap | `space-2` (8px) |
| Header padding-top | `space-8` (32px) from breadcrumb bar |
| Header bottom margin | `space-6` (24px) before the settings tab bar |

---

### Settings Tab Bar

A horizontal row of text tabs for navigating settings sections. Different from the pill tab bar in the Recent view — tabs are **underline-style** with a pill active state here.

```
[ Profile ]   Workspace   Billing   Members   Integrations
```

| Property | Value |
|---|---|
| Container | `display: flex`, `gap: space-1` (4px), no background |
| Tab height | `34px` |
| Tab padding | `6px 16px` |
| Tab border-radius | `radius-full` |
| Tab font | `type-tab` (14px, 500) |
| **Active tab** bg | `color-bg-tab-active` (`#FFFFFF`) |
| **Active tab** border | `1px solid color-border-tab-active` |
| **Active tab** text | `color-text-primary` |
| **Inactive tab** bg | `transparent` |
| **Inactive tab** text | `color-text-secondary` |
| **Inactive tab** hover bg | `rgba(0,0,0,0.04)` |
| Tab bottom margin | `space-6` (24px) before first section |
| Transition | `background-color 120ms ease`, `color 120ms ease` |

**Tab list:** `Profile` · `Workspace` · `Billing` · `Members` · `Integrations`

---

### View Toggle

A compact dual-mode switcher displayed to the **right of the tab / filter row**. Switches between **list view** and **grid view**.

```
┌────────────────────────────┐
│  [✓ ≡]  │  [⊞]            │
└────────────────────────────┘
   Active     Inactive
```

Uses an **inverted dark surface** (`#12131F`) for strong visual contrast against the light page background.

| Property | Value |
|---|---|
| Container background | `#12131F` (dark navy) |
| Container border-radius | `radius-full` |
| Container padding | `4px` |
| Button size | `36px × 36px` |
| Button border-radius | `radius-full` |
| **Active button** bg | `#1C3A6E` (dark blue tint) |
| **Active button** icon color | `#FFFFFF` |
| **Inactive button** bg | `transparent` |
| **Inactive button** icon color | `#9CA3AF` |
| Icon size | `16px` |
| List icon | `ListChecks` (✓ ≡) |
| Grid icon | `LayoutGrid` (⊞) |
| Hover (inactive btn) | bg `rgba(255,255,255,0.06)` |
| Transition | `background-color 120ms ease` |
| Placement | Right-aligned, same row as the filter / tab bar |

---

### Type Filter Dropdown

Placed **to the right of the tab row** alongside the View Toggle. Filters content by file or document type.

**Trigger:**
```
[ Type ▾ ]
```

**Trigger button tokens:**

| Property | Value |
|---|---|
| Background | `#1A1A2A` (dark surface) |
| Border | `1px solid rgba(255,255,255,0.12)` |
| Border-radius | `radius-md` (8px) |
| Padding | `6px 12px` |
| Text | "Type", 13px, 500, `#E5E7EB` |
| Chevron | `ChevronDown`, 12px, `#9CA3AF` |
| Hover bg | `rgba(255,255,255,0.06)` |
| Open bg | `rgba(255,255,255,0.10)` |

**Dropdown panel tokens:**

| Property | Value |
|---|---|
| Background | `#1A1A2A` |
| Border | `1px solid rgba(255,255,255,0.10)` |
| Border-radius | `radius-lg` (12px) |
| Padding | `6px 0` |
| Shadow | `0 8px 24px rgba(0,0,0,0.40)` |
| Min-width | `200px` |

**Dropdown item tokens:**

| Property | Value |
|---|---|
| Height | `36px` |
| Padding | `0 12px` |
| Layout | `flex`, `align-items: center`, `gap: 10px` |
| Label | 13px, 400, `#E5E7EB` |
| Icon size | `20px` (coloured badge) |
| Hover bg | `rgba(255,255,255,0.06)` |
| Selected bg | `rgba(91,99,246,0.20)` |
| Selected text | `#FFFFFF` |
| Transition | `background-color 80ms ease` |

**File type icon colour map:**

| Type | Colour |
|---|---|
| Folders | `#6B7280` gray |
| Documents | `#3B82F6` blue |
| Spreadsheets | `#22C55E` green |
| Presentations | `#EAB308` yellow |
| Vids | `#A855F7` purple |
| Gems | `#60A5FA` light blue |
| Forms | `#8B5CF6` violet |
| Photos & Media | `#F97316` orange |
| PDFs | `#EF4444` red |
| Videos | `#F97316` orange |
| Archives | `#6B7280` gray |
| Audio | `#F59E0B` amber |
| Drawings | `#EF4444` red-orange |
| Sites | `#3B82F6` blue |
| Shortcuts | `#9CA3AF` muted gray |

---

### Section Label

A bold heading that introduces a sub-section of the settings form.

```
Picture
```

| Property | Value |
|---|---|
| Font | `type-section-label` (14px, 600), `color-text-primary` |
| Margin-bottom | `space-4` (16px) |
| Margin-top | `space-8` (32px) for sections after the first |

---

### Avatar + Upload

The user's profile picture alongside an upload control.

```
┌──────┐
│ [img]│   [ Upload a picture ]
└──────┘
```

| Property | Value |
|---|---|
| Avatar size | `48px × 48px` |
| Avatar border-radius | `radius-full` |
| Avatar ring | `2px solid color-avatar-ring` (`#E5E7EB`) |
| Avatar object-fit | `cover` |
| Button label | "Upload a picture" |
| Button font | `type-btn-secondary` (14px, 500), `color-text-primary` |
| Button background | `color-bg-btn-secondary` (`#FFFFFF`) |
| Button border | `1px solid color-border-default` |
| Button border-radius | `radius-md` (8px) |
| Button padding | `8px 16px` |
| Button shadow | `shadow-btn` |
| Button hover shadow | `shadow-btn-hover` |
| Button hover bg | `#F9FAFB` |
| Avatar–button gap | `space-4` (16px) |
| Layout | `display: flex`, `align-items: center` |
| Transition | `background-color 120ms ease`, `box-shadow 150ms ease-out` |

---

### Text Input

Standard single-line editable text field.

```
First name
┌────────────────────────────┐
│  Manish                    │
└────────────────────────────┘
```

| Property | Value |
|---|---|
| Height | `40px` |
| Padding | `10px 14px` |
| Background | `color-bg-input` (`#FFFFFF`) |
| Border | `1px solid color-border-default` (`#E5E7EB`) |
| Border-radius | `radius-md` (8px) |
| Font | `type-input` (14px, 400), `color-text-primary` |
| Label | `type-field-label` (13px, 500), `color-text-secondary` |
| Label–input gap | `space-2` (8px) |
| **Focus** border | `1px solid color-border-input-focus` (`#5B63F6`) |
| **Focus** shadow | `shadow-input-focus` (`0 0 0 3px rgba(91,99,246,0.15)`) |
| Transition | `border-color 100ms ease`, `box-shadow 100ms ease` |
| Cursor | `text` |

---

### Email Input (Read-only)

A non-editable field displaying the account email. Visually distinct from editable inputs.

```
Email
┌─────────────────────────────────────┐
│  manish7479dlp@gmail.com            │  ← dimmed placeholder style
└─────────────────────────────────────┘
```

| Property | Value |
|---|---|
| Height | `40px` |
| Padding | `10px 14px` |
| Background | `color-bg-input-disabled` (`#F9FAFB`) |
| Border | `1px solid color-border-default` (`#E5E7EB`) |
| Border-radius | `radius-md` (8px) |
| Text color | `color-text-tertiary` (`#9CA3AF`) — dimmed |
| Font | `type-input-placeholder` (14px, 400) |
| Cursor | `not-allowed` or `default` |
| Width | Same as a single column of the 2-col name row |
| No focus ring | Read-only fields do not receive focus styling |
| `readonly` / `disabled` attribute | `readonly` preferred (still selectable/copyable) |

**Security note:** The email field uses `readonly` (not `disabled`) so the value remains copyable by the user, but cannot be accidentally edited.

---

### Form Layout

The complete form zone within the content area.

```
[Section: Picture]
  [Avatar] [Upload button]

[Field row: 2 columns]
  [First name input]   [Last name input]

[Field row: 1 column]
  [Email input]
```

| Property | Value |
|---|---|
| Form max-width | `600px` |
| Form padding | inherited from content area (`32px` horizontal) |
| Between sections | `space-8` (32px) vertical margin |
| 2-col grid | `display: grid`, `grid-template-columns: 1fr 1fr`, `gap: 16px` |
| 1-col field width | matches 1 column of the 2-col grid (≈ `50% - 8px`) |

---

## States & Interactions

### Text Input States

| State | Border | Shadow | Background |
|---|---|---|---|
| **Default** | `#E5E7EB` | none | `#FFFFFF` |
| **Hover** | `#D1D5DB` | none | `#FFFFFF` |
| **Focus** | `#5B63F6` | `0 0 0 3px rgba(91,99,246,0.15)` | `#FFFFFF` |
| **Filled** | `#E5E7EB` | none | `#FFFFFF` |
| **Disabled / Read-only** | `#E5E7EB` | none | `#F9FAFB` |
| **Error** | `#EF4444` | `0 0 0 3px rgba(239,68,68,0.15)` | `#FFFFFF` |

### Upload Button States

| State | Background | Border | Shadow |
|---|---|---|---|
| **Default** | `#FFFFFF` | `#E5E7EB` | `shadow-btn` |
| **Hover** | `#F9FAFB` | `#D1D5DB` | `shadow-btn-hover` |
| **Active** | `#F3F4F6` | `#D1D5DB` | none |
| **Focus** | `#FFFFFF` | `#5B63F6` | `shadow-input-focus` |

### Settings Tab States

| State | Background | Text |
|---|---|---|
| **Active** | `#FFFFFF` + border | `color-text-primary` |
| **Inactive** | transparent | `color-text-secondary` |
| **Hover (inactive)** | `rgba(0,0,0,0.04)` | `color-text-primary` |
| **Focus** | outline `2px solid #5B63F6` | — |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Input focus ring | `100ms` | `ease` | `border-color`, `box-shadow` |
| Input hover | `80ms` | `ease` | `border-color` |
| Tab switch | `120ms` | `ease-in-out` | `background-color`, `color` |
| Upload button hover | `120ms` | `ease-out` | `background-color`, `box-shadow` |
| Upload button active | `80ms` | `ease-in` | `background-color` |
| Page load | `180ms` | `ease-out` | `opacity` (0 → 1) |

**Principles:**
- Form interactions are the **fastest** in the system (80–120ms) — they must feel instantaneous
- No layout-shifting animations on forms — only color and shadow transitions
- Focus rings appear immediately (no delay) for accessibility

---

## Design Principles

### 1. Form Clarity Over Density
Settings forms use generous vertical rhythm (`32px` between groups) and a capped form width (`600px`). This reduces cognitive load and prevents accidental input errors.

### 2. Read-only vs Editable — Clear Visual Distinction
Read-only fields (`#F9FAFB` bg, `#9CA3AF` text) are immediately distinguishable from editable fields (`#FFFFFF` bg, `#111827` text). Users never wonder whether they can edit something.

### 3. Focus Management
Every interactive element — inputs, tabs, buttons — has a clearly visible focus ring (`0 0 0 3px rgba(91,99,246,0.15)`). This is non-negotiable for keyboard accessibility.

### 4. Minimal Tab Set
Settings tabs (`Profile` · `Workspace` · `Billing` · `Members` · `Integrations`) are flat text tabs, not heavy components. The active pill uses the same pattern as the Recent filter tabs — visual consistency across the product.

### 5. Data Minimalism
Only what is necessary is shown — name, avatar, email. Advanced settings are progressively disclosed under other tabs. The form is never overwhelming.

### 6. Accessible Contrast
- Field label `#6B7280` on `#FFFFFF` → **4.48:1** (AA)
- Input value `#111827` on `#FFFFFF` → **16.1:1** (AAA)
- Disabled email `#9CA3AF` on `#F9FAFB` → **~2.9:1** — acceptable for non-interactive read-only content; pair with `readonly` attribute and `cursor: default`

---

## Differences from Other Views

| Aspect | Recent View | Settings Profile |
|---|---|---|
| Page title weight | 800 ExtraBold | 700 Bold |
| Page icon | Clock inline | None |
| Tab bar style | Pill group on gray container | Bare pill tabs on white |
| Content type | Document grid | Form |
| Form inputs | Not present | Text inputs + read-only field |
| Avatar | Not present | 48px circle image |
| Upload control | Not present | Secondary action button |
| Section labels | Not present | "Picture", "First name", etc. |
| Scrollbar | Visible (long grid) | Hidden (short form) |
| Filter tabs | `By me / By everyone / Shared` | `Profile / Workspace / Billing…` |

---

## File Structure

```
settings-profile/
├── assets/
│   └── screenshot.png          ← Place reference screenshot here
├── tokens/
│   ├── colors.json             ← All color tokens
│   ├── typography.json         ← Type scale tokens
│   └── spacing.json            ← Spacing, radius, shadow, layout tokens
├── components/
│   ├── breadcrumb.md           ← Breadcrumb bar spec
│   ├── settings-tabs.md        ← Settings tab bar spec
│   ├── avatar-upload.md        ← Avatar + upload button spec
│   └── form-inputs.md          ← Text input + read-only input spec
└── README.md                   ← This file
```

---

*Design language version 1.0 — Aibii AI Business Intelligence SaaS · Settings › Profile, April 2026.*
