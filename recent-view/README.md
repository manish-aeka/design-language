# Recent View — Design Language

> Design system derived from the **Aibii** AI Business Intelligence SaaS platform — Recent Reports & Insights view.  
> Place the reference screenshot at `assets/screenshot.png`.

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
   - [Page Header](#page-header)
   - [Action Cards Row](#action-cards-row)
   - [Filter Tab Bar](#filter-tab-bar)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
   - [Sidebar Projects Section](#sidebar-projects-section)
   - [Report Grid](#report-grid)
   - [Report Card](#report-card)
   - [Card Type Badge](#card-type-badge)
   - [Scrollbar](#scrollbar)
9. [Modals](#modals)
   - [New Project Modal](#new-project-modal)
   - [Create Item Modal](#create-item-modal)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)

---

## Overview

The **Recent** view is the personal analytics home screen — the first screen a user lands on after selecting an organisation in Aibii. It combines a lightweight action strip, a filter/tab mechanism, and a dense report grid to surface the most relevant analyses and dashboards with zero navigation friction.

Key interactions available from this screen:
- **7 action-card shortcuts** (New Project, New Dashboard, New Document, New Presentation, New Form, AI chat, Create Datasource)
- **New Project modal** — creates a project and adds it to the sidebar in real-time
- **Create Item modal** — shared modal for Dashboard, Document, Presentation, Form, and AI chat creation
- **Pinned project** — "My Private Project" always appears first in the sidebar Projects list
- **Dynamic sidebar** — new projects are injected immediately after the pinned entry without page reload

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)            │  CONTENT AREA (fluid)                          │
│                            │                                                │
│  [M] Manish kumar's Work…  │  🕐 Recent                                     │
│  ────────────────────────  │     Your recent reports and insights…          │
│  🕐 Recent  ← active       │                                                │
│  ⊞  New dashboard          │  [🗂 New Project][⊞ New Dashboard][📄 New Doc] │
│  💬 New chat               │  [🖥 New Pres.][📋 New Form][✨ AI chat][🗄 DS] │ ← 7 Action Cards (4-col grid)
│  ────────────────────────  │                                                │
│  PROJECTS            [👁]  │  [ By me ][ By everyone ][ Shared with me ]   │ ← Filter Tabs
│  ▶ My Private Project 📌   │                                  [ Type▾][≡⊞] │
│    ├ 💬 Q4 Strategy        │                                                │
│    ├ ⊞  Revenue Overview   │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐        │
│    └ … (scrollable)        │  │      │ │      │ │      │ │      │        │ ← 4-col Report Grid
│  ▶ Sovereign Capital Gate  │  └──────┘ └──────┘ └──────┘ └──────┘        │
│    ├ 💬 Chat               │  Untitled  Untitled  Q1 Rev…  Untitled        │
│    ├ ⊞  Dashboard          │  ─────────────────────────────────────────── │
│    └ 📄 Document           │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐        │
│  [dynamically added proj.] │  │      │ │      │ │      │ │      │        │
│  + Create a project        │  └──────┘ └──────┘ └──────┘ └──────┘        │
│  ────────────────────────  │                                                │
│  👤 Shared with me         │                                                │
│  ⚙  Settings              │                                                │
│  ────────────────────────  │                                                │
│  🔵 Explore free features  │                                                │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Color System

### Palette

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Active nav border, active toggle icon, Chat type icon, focus rings |
| `color-brand-secondary` | `#7C6FF7` | Gradient accents |
| `color-brand-upgrade` | `#7C3AED` | Upgrade CTAs |
| `color-bg-base` | `#FFFFFF` | Page background, card surface |
| `color-bg-sidebar` | `#F8F9FC` | Left navigation sidebar |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, active toggle button bg |
| `color-bg-toggle-container` | `#F1F3F4` | View toggle container bg, Type filter trigger bg |
| `color-bg-tab-container` | `#F3F4F6` | Pill group container background |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab background |
| `color-bg-explore-banner` | `#E8EEFF` | "Explore free features" banner |
| `color-text-primary` | `#111827` | Page title, card titles, active tab text, workspace switcher name |
| `color-text-secondary` | `#374151` | Nav item labels (inactive) |
| `color-text-tertiary` | `#6B7280` | Subtitles, timestamps, inactive tab text |
| `color-text-muted` | `#9CA3AF` | Toggle icon (inactive), placeholder labels |
| `color-border-default` | `#E5E7EB` | Card borders, Type filter border, sidebar top-level dividers |
| `color-border-subtle` | `#F3F4F6` | Sidebar section dividers, breadcrumb border |
| `color-border-active-nav` | `#5B63F6` | 2px left border on active sidebar nav item |
| `color-icon-brand` | `#5B63F6` | Action card icons, Type filter funnel icon |
| `color-icon-chat` | `#5B63F6` | Chat-type icon (sidebar submenu + type filter + card badge) |
| `color-icon-dashboard` | `#16A34A` | Dashboard-type icon |
| `color-icon-document` | `#F97316` | Document-type icon |
| `color-icon-chart` | `#93A8F4` | Chart-type icon in card preview |
| `color-badge-chat-bg` | `#EEF2FF` | Chat badge background |
| `color-badge-dashboard-bg` | `#F0FDF4` | Dashboard badge background |
| `color-badge-document-bg` | `#FFF7ED` | Document badge background |
| `color-preview-chart-bg` | `#EEF2FF` | Chart card preview background |
| `color-preview-dashboard-bg` | `#F0FDF4` | Dashboard card preview background |
| `color-preview-document-bg` | `#FFF7ED` | Document card preview background |
| `color-workspace-avatar` | `#3B5BDB` | Workspace switcher avatar background |
| `color-explore-icon-bg` | `#C7D2FE` | Explore banner icon circle background |
| `color-explore-icon` | `#4F6EF7` | Explore banner sparkle icon |
| `color-explore-title` | `#3B4ECC` | Explore banner heading text |
| `color-explore-subtitle` | `#6B7ADE` | Explore banner generation count |
| `color-scrollbar-thumb` | `#CBD5E1` | Scrollbar thumb |
| `color-scrollbar-track` | `transparent` | Scrollbar track |

---

## Typography

### Type Scale

| Token | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| `type-display` | 28px | 800 (ExtraBold) | 1.2 | Page title ("Recent") |
| `type-subtitle` | 14px | 400 (Regular) | 1.5 | Page subtitle under the title |
| `type-heading-md` | 16px | 600 (SemiBold) | 1.4 | Section/dialog headings |
| `type-body-md` | 14px | 400 (Regular) | 1.5 | Action card labels, nav labels |
| `type-body-sm` | 13px | 400 (Regular) | 1.4 | Action card descriptions |
| `type-card-title` | 14px | 500 (Medium) | 1.4 | Document card title ("Untitled") |
| `type-label` | 12px | 400 (Regular) | 1.3 | Timestamps ("Edited 19 minutes ago") |
| `type-tab` | 14px | 500 (Medium) | 1.3 | Filter tab labels |
| `type-caption` | 11px | 400 (Regular) | 1.3 | Helper text, explore banner |

### Font Family
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

### Page Title Style
The "Recent" heading uses the clock icon (`⏱`) in `color-text-primary` placed **inline** before the text — icon and text are vertically centre-aligned.

```css
.page-title {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 28px;
  font-weight: 800;
  color: #111827;
}
```

---

## Spacing & Grid

### Base Unit: 4px

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps, icon padding |
| `space-2` | 8px | Icon-to-label gaps, inline spacing |
| `space-3` | 12px | Compact row padding |
| `space-4` | 16px | Default card padding, section gap |
| `space-5` | 20px | Sidebar horizontal padding |
| `space-6` | 24px | Between page header and action cards |
| `space-7` | 28px | Between action cards and filter tabs |
| `space-8` | 32px | Content area horizontal padding |
| `space-10` | 40px | Between major layout zones |

### Layout Grid

| Zone | Spec | Notes |
|---|---|---|
| Sidebar | 220px fixed | Constant across all views |
| Content area padding | 32px horizontal | Applied to left/right of content zone |
| Action cards | 4 columns, `gap: 16px` | Equal-width, flex row |
| Document grid | 4 columns, `gap: 16px` | Responsive min-width 200px per card |
| Filter tab bar | `gap: 4px` | Tight spacing between pill tabs |
| Page header bottom margin | 24px | Space between subtitle and action cards |

### 4-Column Document Grid Detail

```css
.document-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}
```

At narrower viewports (< 1100px), drops to 3 columns; at < 800px, drops to 2 columns.

---

## Border Radius & Elevation

### Border Radius

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Badges, tight labels |
| `radius-md` | 8px | Buttons, action icon backgrounds, nav items |
| `radius-lg` | 12px | Document cards, action shortcut cards |
| `radius-xl` | 16px | Modals, dialogs |
| `radius-full` | 9999px | Pill tabs, avatar chips |

### Pill Tab Radius
Active and inactive tabs both use `radius-full` — the tab container itself uses `radius-full` to create a seamlessly rounded group.

### Elevation (Shadows)

| Token | Value | Used on |
|---|---|---|
| `shadow-none` | `none` | Sidebar, flat page surfaces |
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Document cards at rest |
| `shadow-card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Document cards on hover |
| `shadow-tab-active` | `0 1px 4px rgba(0,0,0,0.10)` | Active pill tab elevation |
| `shadow-modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modals / popovers |

---

## Iconography

### Style Rules
- **Line icons**, uniform stroke weight **1.5px**
- Sizes: `16px` inline, `20px` action areas, `24px` page title icon
- Monochromatic per context — `color-icon-brand` on card surfaces, `color-icon-muted` for placeholders
- The `#` symbol for channels is rendered as text/icon at `16px`, `color-text-secondary`

### Icon Inventory

| Location | Icon | Size | Color |
|---|---|---|---|
| Page title | `Clock` (circle + hands) | 24px | `color-text-primary` (#111827) |
| Action card: New Project | `FolderOpen` | 20px | `color-icon-brand` (#5B63F6) |
| Action card: New Dashboard | `SquaresGrid` (4 squares) | 20px | `color-icon-brand` |
| Action card: New Document | `Document` | 20px | `color-icon-brand` |
| Action card: New Presentation | `PresentationChartBar` (screen + legs) | 20px | `color-icon-brand` |
| Action card: New Form | `ClipboardDocumentList` | 20px | `color-icon-brand` |
| Action card: AI chat | `Sparkles` | 20px | `color-icon-brand` |
| Action card: Create Datasource | `Database` (cylinder) | 20px | `color-icon-brand` |
| Nav: Recent (active) | `Clock` | 16px | `#6B7280` |
| Nav: New dashboard | `SquaresGrid` (4 squares) | 16px | `#6B7280` |
| Nav: New chat | `ChatBubble` (speech bubble with dots) | 16px | `#6B7280` |
| Workspaces header | `EyeOff` | 14px | `#D1D5DB` |
| Workspace chevron | `ChevronRight` | 12px | `#9CA3AF` → rotates 90° when open |
| Submenu: Chat item | `ChatBubble` | 14px | `#5B63F6` |
| Submenu: Dashboard item | `SquaresGrid` (4 squares) | 14px | `#16A34A` |
| Submenu: Document item | `Document` | 14px | `#F97316` |
| Bottom nav: Shared with me | `UserGroup` | 16px | `#9CA3AF` |
| Bottom nav: Settings | `Cog6Tooth` | 16px | `#9CA3AF` |
| Workspace switcher | `ChevronDown` | 16px | `#9CA3AF` |
| Breadcrumb: Menu | `Bars3` | 18px | `#6B7280` |
| Breadcrumb: Back / Forward | `ChevronLeft` / `ChevronRight` | 16px | `#9CA3AF` |
| Type filter trigger: funnel | `Funnel` | 14px | `#5B63F6` |
| Type filter trigger: chevron | `ChevronDown` | 12px | `#9CA3AF` |
| Card overflow | `EllipsisHorizontal` (⋯) | 16px | `#9CA3AF`, hidden → visible on hover |
| Card badge: Chart | `BarChart2` | 10px | `#5B63F6` |
| Card badge: Dashboard | `SquaresGrid` | 10px | `#16A34A` |
| Card badge: Document | `Document` | 10px | `#F97316` |
| Card preview: Chart | `BarChart2` | 40px | `#93A8F4` |
| Card preview: Dashboard | `SquaresGrid` | 40px | `#6EE7A6` |
| Card preview: Document | `Document` | 40px | `#FCA96A` |
| Explore banner | `Sparkles` | 16px | `#4F6EF7` |

---

## Components

### Page Header

Appears at the top of the content area. Combines an inline clock icon, bold title, and descriptive subtitle.

```
🕐  Recent
    Your recent reports and insights are displayed here.
    You can also create new reports and dashboards from here.
```

| Property | Value |
|---|---|
| Icon | `Clock`, 24px, `#111827` |
| Title | 28px, `font-weight: 800`, `#111827` |
| Icon + title gap | 8px |
| Subtitle | 14px, `font-weight: 400`, `#6B7280` |
| Title–subtitle gap | 8px (margin-top) |
| Header bottom margin | 24px before action cards |

---

### Action Cards Row

Seven equal-width cards in a **4-column grid** (2 rows) providing primary workflow shortcuts. Cards 1–4 in the first row, cards 5–7 in the second.

```
Row 1:
┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│[🗂] New      │ │[⊞] New       │ │[📄] New      │ │[🖥] New      │
│    Project   │ │    Dashboard │ │    Document  │ │    Pres.     │
└──────────────┘ └──────────────┘ └──────────────┘ └──────────────┘
Row 2:
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│[📋] New      │ │[✨] AI chat  │ │[🗄] Create   │
│    Form      │ │              │ │    Datasource│
└──────────────┘ └──────────────┘ └──────────────┘
```

| Property | Value |
|---|---|
| Layout | `grid-template-columns: repeat(4, 1fr)`, `gap: 16px` |
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Border radius | `12px` |
| Padding | `16px` |
| Icon wrapper | `40×40px`, `border-radius: 8px`, `background: rgba(91,99,246,0.08)` |
| Icon size | `20px`, color `#5B63F6` |
| Title | `14px`, `font-weight: 500`, `#111827` |
| Description | `13px`, `#6B7280` |
| Icon–text gap | `12px` |
| Hover | `shadow-card-hover` + `translateY(-1px)` |
| Transition | `all 150ms ease-out` |
| Click behaviour | New Project → **New Project Modal**; New Dashboard / Document / Presentation / Form / AI chat → **Create Item Modal**; Create Datasource → no modal |

**Card inventory:**

| # | Title | Description | Icon | Opens Modal |
|---|---|---|---|---|
| 1 | New Project | Organize work in a project | `FolderOpen` | New Project Modal |
| 2 | New Dashboard | Build charts & visual reports | `SquaresGrid` | Create Item Modal |
| 3 | New Document | Write, edit & share docs | `Document` | Create Item Modal |
| 4 | New Presentation | Create slides & decks | `PresentationChartBar` | Create Item Modal |
| 5 | New Form | Collect data with forms | `ClipboardDocumentList` | Create Item Modal |
| 6 | AI chat | Generate insights from a prompt | `Sparkles` | Create Item Modal |
| 7 | Create Datasource | Link databases, APIs & more | `Database` | — |

---

### Filter Tab Bar

Segmented pill-style control for filtering the report grid by authorship/sharing scope.

```
┌──────────────────────────────────────────┐
│  ┌────────┐  By everyone  Shared with me │
│  │ By me  │                              │
│  └────────┘                              │
└──────────────────────────────────────────┘
```

| Property | Value |
|---|---|
| Container background | `#F3F4F6` |
| Container border radius | `9999px` (full) |
| Container padding | `4px` |
| Tab height | `32px` |
| Tab padding | `0 16px` |
| Tab border radius | `9999px` |
| Tab font | `14px`, `font-weight: 500` |
| **Active tab** bg | `#FFFFFF` |
| **Active tab** border | `1px solid #E5E7EB` |
| **Active tab** shadow | `0 1px 4px rgba(0,0,0,0.10)` |
| **Active tab** text | `#111827` |
| **Inactive tab** bg | `transparent` |
| **Inactive tab** text | `#6B7280` |
| Tab gap | `4px` |
| Transition | `background-color 120ms ease`, `box-shadow 120ms ease`, `color 120ms ease` |

**Tab options:** `By me` · `By everyone` · `Shared with me`

---

### View Toggle

Compact dual-mode switcher placed to the right of the filter row. Switches between list and grid view.

```
┌─────────────────┐
│  [ ≡ ] │ [ ⊞ ] │
│  active  inactive
└─────────────────┘
```

| Property | Value |
|---|---|
| Container background | `#F1F3F4` |
| Container border | `1px solid rgba(0,0,0,0.06)` |
| Container border-radius | `8px` |
| Container padding | `2px` |
| Button size | `32×32px` |
| Button border-radius | `6px` |
| **Active button** bg | `#EEF2FF` |
| **Active button** shadow | `0 1px 3px rgba(91,99,246,0.15), 0 1px 2px rgba(91,99,246,0.08)` |
| **Active button** icon color | `#5B63F6` |
| **Inactive button** bg | `transparent` |
| **Inactive button** icon color | `#9CA3AF` |
| Icon size | `15px` |
| List icon | `Bars3` (3 horizontal lines) |
| Grid icon | `SquaresGrid` (4 filled squares, `rx 1.5`) |
| Default active | List view |
| Hover (inactive) | bg `rgba(0,0,0,0.05)`, color `#6B7280` |
| Transition | `background-color 150ms ease`, `box-shadow 150ms ease`, `color 150ms ease` |

---

### Type Filter Dropdown

Placed to the right of the tab row alongside the View Toggle. Filters the report grid by content type.

**Trigger button:**

| Property | Value |
|---|---|
| Background | `#F1F3F4` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `9999px` |
| Height | `36px` |
| Padding | `0 12px` |
| Text | "Type", `13px`, `font-weight: 500`, `#374151` |
| Funnel icon | `14px`, `color: #5B63F6` |
| Chevron | `ChevronDown`, `12px`, `#9CA3AF` |

**Dropdown panel:**

| Property | Value |
|---|---|
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `12px` |
| Padding | `6px 0` |
| Shadow | `0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)` |
| Min-width | `180px` |
| Position | `absolute right-0`, below trigger |

**Dropdown items:**

| Property | Value |
|---|---|
| Height | `36px` |
| Padding | `0 12px` |
| Margin | `0 4px` (horizontal, for inset look) |
| Border-radius | `8px` |
| Label | `13px` |
| Icon size | `14px` |
| Hover bg | `#F3F4F6` |
| Transition | `background-color 80ms ease` |

**Type options and colours:**

| Type | Icon | Icon Color | Active bg |
|---|---|---|---|
| Chat | `ChatBubble` | `#5B63F6` | `#EEF2FF` |
| Dashboard | `SquaresGrid` | `#9CA3AF` (default) | — |
| Document | `Document` | `#9CA3AF` (default) | — |
| Other | `EllipsisHorizontal` | `#9CA3AF` (default) | — |

Default open state shows Chat as active (highlighted `#EEF2FF` bg, `#5B63F6` text/icon).

---

### Sidebar Projects Section

The sidebar **Projects** section (formerly "Workspaces") holds all user projects in a collapsible accordion list. The section header is labelled **PROJECTS** in `11px` uppercase muted text.

**Section container:** `id="projects-list"` — used by JS to dynamically inject newly created projects.

**Pinned project rule:** "My Private Project" is always the first entry. A **pin icon** (`12×12px`, `color: #5B63F6`, filled SVG) appears on the right side of its row.

**Sidebar order:**
```
[▶] My Private Project  [📌]   ← pinned, always first
    ├ 💬 Q4 Strategy
    ├ ⊞  Revenue Overview
    └ … (scrollable)

[▶] Sovereign Capital Gate
    ├ 💬 Chat
    ├ ⊞  Dashboard
    └ 📄 Document

[dynamically created projects appear here]

[+] Create a project              ← opens New Project Modal on click
```

**Project row tokens:**

| Property | Value |
|---|---|
| Row height | `36px` |
| Row padding | `0 8px` |
| Row border-radius | `8px` |
| Row hover bg | `#EEF2FF` |
| Chevron button | `20×20px`, `border-radius: 4px`, hover bg `#E5E7EB` |
| Chevron icon | `12px`, `#9CA3AF`, `stroke-width: 2.5` |
| Chevron open state | rotates `90deg` via CSS transition `150ms ease` |
| Project name | `14px`, `#374151`, `truncate` |
| Pin icon | `12×12px`, `color: #5B63F6`, filled path SVG, right-aligned, pinned project only |

**Submenu container tokens:**

| Property | Value |
|---|---|
| Padding-left | `16px` (indent) |
| Margin-top | `2px` |
| Gap between items | `2px` |
| Max-height (open) | `160px` |
| Overflow | `auto` (vertical scroll when items exceed max-height) |
| Default state | `display: none` |
| Open state | `display: block` |

**Submenu item tokens:**

| Property | Value |
|---|---|
| Height | `32px` |
| Padding | `0 12px` |
| Border-radius | `8px` |
| Font | `13px`, `#4B5563` |
| Icon size | `14px` |
| Icon gap | `8px` |
| Hover bg | `#EEF2FF` |

**"Create a project" link:**

| Property | Value |
|---|---|
| Trigger | `onclick="openNewProjectModal()"` |
| Icon | `+` text character, `#9CA3AF`, `font-size: 16px` |
| Label | `14px`, `#6B7280` |
| Hover bg | `#EEF2FF` |

**Static projects and contents:**

| Project | Order | Items |
|---|---|---|
| My Private Project | 1st (pinned) | Q4 Strategy (chat), Revenue Overview (dashboard), Project Brief (doc), Investor Update (chat), Meeting Notes (doc), KPI Tracker (dashboard), Product Feedback (chat), User Analytics (dashboard), Sprint Planning (chat), Roadmap 2026 (doc), API Docs (doc) |
| Sovereign Capital Gate | 2nd | Chat, Dashboard, Document |
| *(dynamically added)* | 3rd+ | Empty submenu initially |

---

### Report Grid

Responsive 4-column grid of report cards below the filter row.

| Property | Value |
|---|---|
| Columns | `repeat(4, 1fr)` |
| Gap | `16px` |
| Top margin | `24px` from filter tab bar |

---

### Report Card

Individual report tile in the grid. Has a coloured preview zone and an info footer.

**Anatomy:**
```
┌────────────────────────────────┐
│                                │
│          [  icon  ]            │  ← Coloured preview zone (160px)
│                                │
├────────────────────────────────┤
│  Q1 Revenue Analysis       ⋯  │  ← Title + overflow button
│  [📄 Document]                 │  ← Type badge
│  Updated about 1 hour ago      │  ← Timestamp
└────────────────────────────────┘
```

| Property | Value |
|---|---|
| Preview height | `160px` |
| Preview border-radius | top corners only (`12px 12px 0 0`) |
| Preview icon size | `40px` |
| Card border | `1px solid #E5E7EB` |
| Card border-radius | `12px` |
| Card background | `#FFFFFF` |
| Info area padding | `10px 12px 12px` |
| Title | `14px`, `font-weight: 500`, `#111827` |
| Timestamp | `11px`, `#9CA3AF`, `margin-top: 4px` |
| Overflow `⋯` | `16px`, `#9CA3AF`, hidden by default → opacity `1` on card hover |
| Hover border | `rgba(91,99,246,0.4)` |
| Hover shadow | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` |
| Hover lift | `translateY(-1px)` |
| Transition | `all 150ms ease-out` |
| Cursor | `pointer` |

**Card type colour map:**

| Type | Preview bg | Preview icon color | Badge bg | Badge text |
|---|---|---|---|---|
| Chart | `#EEF2FF` | `#93A8F4` | `#EEF2FF` | `#5B63F6` |
| Document | `#FFF7ED` | `#FCA96A` | `#FFF7ED` | `#F97316` |
| Dashboard | `#F0FDF4` | `#6EE7A6` | `#F0FDF4` | `#16A34A` |

---

### Card Type Badge

Inline label beneath the card title indicating the content type.

| Property | Value |
|---|---|
| Display | `inline-flex`, `align-items: center`, `gap: 4px` |
| Padding | `2px 6px` |
| Border-radius | `4px` |
| Font | `10px`, `font-weight: 500` |
| Icon size | `10px` |
| Margin-top | `4px` from title |

---

### Scrollbar

Applies globally to the content area and workspace submenus.

| Property | Value |
|---|---|
| Width | `6px` |
| Thumb color | `#CBD5E1` |
| Thumb border-radius | `9999px` |
| Track color | `transparent` |

```css
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## Modals

### New Project Modal

Triggered by: **New Project** action card click, or **"+ Create a project"** sidebar link click.

Functions: `openNewProjectModal()` / `closeNewProjectModal()` / `createNewProject()`

**Anatomy:**
```
┌─────────────────────────────────┐
│  New Project              [ × ] │
├─────────────────────────────────┤
│  Name *                         │
│  [ Enter project name…        ] │
│                                 │
│  Description (optional)         │
│  [ What is this project…      ] │
│  [ (textarea, 3 rows)         ] │
├─────────────────────────────────┤
│                 [ Close][Create]│
└─────────────────────────────────┘
```

| Property | Value |
|---|---|
| Backdrop | `rgba(17,24,39,0.45)` + `backdrop-filter: blur(2px)` |
| Modal width | `max-w-md` (448px) |
| Border radius | `16px` |
| Header padding | `24px 24px 16px` |
| Header border | `1px solid #F3F4F6` (bottom) |
| Title | `16px`, `font-weight: 600`, `#111827` |
| Close button | `32×32px`, `border-radius: 8px`, hover bg `#F3F4F6` |
| Body padding | `24px`, `gap: 16px` between fields |
| Name label | `13px`, `font-weight: 500`, `#374151` |
| Name required marker | `*` in `#F87171` (red-400) |
| Name input | `h-9`, full-width, `border: 1px solid #E5E7EB`, focus ring `#5B63F6` |
| Description label | `13px`, `font-weight: 500`, `#374151` + `(optional)` in `#9CA3AF` normal weight |
| Description textarea | `3 rows`, `resize: none`, same border/focus as name input |
| Footer padding | `0 24px 24px` |
| Close button style | `h-9 px-4`, gray border, hover bg `#F9FAFB` |
| Create button style | `h-9 px-5`, bg `#5B63F6`, hover bg `#4850e4`, white text |
| Enter key | Submits from name field (`onkeydown`) |
| Backdrop click | Closes modal |

**On Create (JS behaviour):**
1. Reads `#proj-name` value — focuses field and returns if empty
2. Generates unique ID: `ws-dyn-{Date.now()}`
3. Creates a new project `<div>` with chevron toggle, name link, empty submenu
4. Inserts into `#projects-list` immediately after `firstBlock.nextSibling` (after the pinned entry)
5. Closes modal

---

### Create Item Modal

Triggered by: **New Dashboard**, **New Document**, **New Presentation**, **New Form**, **AI chat** action card clicks.

Functions: `openCreateModal(type)` / `closeCreateModal()`

The `type` string is passed as the modal title (e.g. `'New Dashboard'`).

**Anatomy:**
```
┌─────────────────────────────────┐
│  New Dashboard            [ × ] │  ← dynamic title
├─────────────────────────────────┤
│  Name                           │
│  [ Enter a name…              ] │
│                                 │
│  Select project                 │
│  [ Choose a project…    ▾     ] │
├─────────────────────────────────┤
│                 [ Close][Create]│
└─────────────────────────────────┘
```

| Property | Value |
|---|---|
| Backdrop | `rgba(17,24,39,0.45)` + `backdrop-filter: blur(2px)` |
| Modal width | `max-w-md` (448px) |
| Border radius | `16px` |
| Title | `16px`, `font-weight: 600`, `#111827` — set dynamically to card name |
| Name input | `h-9`, full-width, focus ring `#5B63F6` |
| Select project | Native `<select>`, `h-9`, custom chevron overlay, focus ring `#5B63F6` |
| Project options | My Private Project, Sovereign Capital Gate |
| Backdrop click | Closes modal |
| Close button | Gray border button |
| Create button | bg `#5B63F6`, hover `#4850e4`, white text |

---

## States & Interactions

### Report Card States

| State | Visual Change |
|---|---|
| **Default** | Border `#E5E7EB`, `shadow-card`, overflow `⋯` hidden (`opacity: 0`) |
| **Hover** | Border `rgba(91,99,246,0.4)`, `shadow-card-hover`, `translateY(-1px)`, `⋯` visible |
| **Active / pressed** | `translateY(0)`, `shadow-card` |

### Filter Tab States

| State | Visual Change |
|---|---|
| **Active** | `#FFFFFF` bg, `1px solid #E5E7EB` border, `shadow-tab-active`, `#111827` text |
| **Inactive default** | `transparent` bg, `#6B7280` text |
| **Inactive hover** | `rgba(0,0,0,0.04)` bg |

### Action Card States

| State | Visual Change |
|---|---|
| **Default** | Border, flat `shadow-card` |
| **Hover** | `shadow-card-hover`, `translateY(-1px)` |
| **Active** | `translateY(0)`, `shadow-card` |
| **Click (modal cards)** | Opens modal overlay |

### View Toggle States

| State | Visual Change |
|---|---|
| **Active button** | `#EEF2FF` bg, brand purple shadow, `#5B63F6` icon |
| **Inactive button** | `transparent` bg, `#9CA3AF` icon |
| **Inactive hover** | `rgba(0,0,0,0.05)` bg, `#6B7280` icon |

### Project Chevron States

| State | Visual Change |
|---|---|
| **Collapsed** | Chevron points right (`0deg`) |
| **Expanded** | Chevron rotates to `90deg`, submenu slides in |

### Action Card — Modal Triggers

| Card | Behaviour on Click |
|---|---|
| New Project | Opens New Project Modal |
| New Dashboard | Opens Create Item Modal — title "New Dashboard" |
| New Document | Opens Create Item Modal — title "New Document" |
| New Presentation | Opens Create Item Modal — title "New Presentation" |
| New Form | Opens Create Item Modal — title "New Form" |
| AI chat | Opens Create Item Modal — title "AI Chat" |
| Create Datasource | No modal — direct action |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover lift | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| Action card hover | `150ms` | `ease-out` | `box-shadow`, `transform` |
| `⋯` button appear | `100ms` | `ease` | `opacity` (0 → 1) |
| Tab switch | `120ms` | `ease` | `background-color`, `box-shadow`, `color` |
| View toggle switch | `150ms` | `ease` | `background-color`, `box-shadow`, `color` |
| Nav item hover | `100ms` | `ease` | `background-color` |
| Project chevron | `150ms` | `ease` | `transform` (rotate 0 → 90deg) |
| Type dropdown item | `80ms` | `ease` | `background-color` |
| Modal open/close | instant | — | `display` toggled via `.hidden` class |

**Principles:**
- Micro-interactions stay ≤ 150ms — feels instant and responsive
- Only animate `transform`, `opacity`, `background-color`, `box-shadow` — never `width`, `height`, or layout properties
- Workspace submenu toggles via `display: none ↔ block` (no animation) at this prototype stage

---

## Design Principles

### 1. Recency as Priority
The Recent view is the analytics home base. The 4-column grid maximises visible report count without scrolling, surfacing in-progress analyses immediately.

### 2. Flat Hierarchy with Contextual Depth
All cards start flat. Elevation (shadow + border shift) appears only on interaction — depth communicates affordance, not decoration.

### 3. Segmented Filtering Without Navigation
The pill tab bar (`By me` / `By everyone` / `Shared with me`) provides scope filtering in place — no page reload, no URL change.

### 4. Projects as Navigable Containers
Projects in the sidebar are expandable in-place. The chevron-toggle splits name navigation from expand/collapse to avoid accidental triggers. Submenus cap at 160px with a scroll to prevent sidebar overflow. New projects created via the modal are injected dynamically without page reload.

### 5. Type-Coded Visual Language
Chat = brand purple `#5B63F6`, Dashboard = green `#16A34A`, Document = orange `#F97316`. This colour system is applied consistently across the sidebar submenu icons, the card type badges, and the Type filter dropdown.

### 6. Progressive Disclosure
Card `⋯` menus, workspace subitems, and type dropdowns are all hidden by default and surface only when triggered — keeping the resting state clean.

### 7. Accessible Contrast
- Title text `#111827` on `#FFFFFF` → **16.1:1** (AAA)
- Timestamp `#9CA3AF` on `#FFFFFF` → **2.85:1** (decorative use)
- Active tab text `#111827` on `#FFFFFF` → AAA
- Brand primary `#5B63F6` icon on `#EEF2FF` bg → sufficient for icon context

---

## File Structure

```
recent-view/
├── assets/
│   └── screenshot.png          ← Place reference screenshot here
├── tokens/
│   ├── colors.json             ← All color tokens
│   ├── typography.json         ← Type scale tokens
│   └── spacing.json            ← Spacing, radius, shadow, layout tokens
├── components/
│   ├── page-header.md          ← Page header spec
│   ├── action-cards.md         ← Action shortcut cards spec
│   ├── filter-tabs.md          ← Filter pill tab bar spec
│   ├── workspace-submenu.md    ← Workspace expand/collapse submenu spec
│   └── report-card.md          ← Report card + type badge spec
└── README.md                   ← This file
```

---

*Design language version 1.3 — Aibii AI Business Intelligence SaaS · Recent View, May 2026.*
