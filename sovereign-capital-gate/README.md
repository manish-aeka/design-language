# Sovereign Capital Gate — Design Language

> Design system documentation for the **Sovereign Capital Gate** project view within the **Aibii** AI Business Intelligence SaaS platform.  
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
   - [Sidebar Navigation](#sidebar-navigation)
   - [Breadcrumb Bar](#breadcrumb-bar)
   - [Workspace Header](#workspace-header)
   - [Action Cards Row](#action-cards-row)
   - [Section Header & Controls](#section-header--controls)
   - [Search Bar](#search-bar)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
   - [Item Grid](#item-grid)
   - [Item Card](#item-card)
   - [Card Type Badge](#card-type-badge)
   - [Scrollbar](#scrollbar)
9. [Modals](#modals)
   - [Create Item Modal](#create-item-modal)
   - [Create Project Modal](#create-project-modal)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)
13. [File Structure](#file-structure)

---

## Overview

The Sovereign Capital Gate view is a **project detail page** within Aibii. It shows all items (Chats, Dashboards, Documents) belonging to the project, provides action shortcuts for creating new content, and connects to a shared sidebar for cross-project navigation.

Key interactions:
- **6 action-card shortcuts** (Create Dashboard, Create Document, Create Presentation, Create Form, AI Chat, Add Datasource)
- **Create Item modal** — shared modal for Dashboard, Document, Presentation, Form, and AI Chat creation
- **Create Project modal** — creates a new project and injects it into the sidebar dynamically
- **Active project state** — Sovereign Capital Gate row is highlighted in the sidebar with its submenu expanded

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
+---------------------------------------------------------------------------------+
| SIDEBAR (220px)                | MAIN CONTENT AREA                              |
|                                |                                                |
| [M] Manish kumar's Work... [v] | ☰  <  >  Projects > Sovereign Capital Gate    | <- Breadcrumb bar
| ------------------------------ |                                                |
| 🕐 Recent                     |                                                |
| ⊞  Create Dashboard           | [🏢] Sovereign Capital Gate                    | <- Workspace header
| 💬 AI Chat                    |      11 items · Last updated about 1 hour ago  |
| ------------------------------ |                                                |
| PROJECTS                [👁]  | [⊞ Create Dash][📄 Create Doc][🖥 Create Pres] |
| ▶ My Private Project    [📌]  | [📋 Create Form][✨ AI Chat][🗄 Add Source]   | <- 6 Action Cards (4-col)
| ▼ Sovereign Capital Gate <- ■ |                                                |
|   ├ 💬 Chat                   | All items        [ Search... ] [ Type▾][≡⊞]   | <- Section header
|   ├ ⊞  Dashboard              |                                                |
|   └ 📄 Document               | +------+ +------+ +------+ +------+           | <- Item grid
| + Create a project            | | Chat | |Dash  | | Doc  | |Cap.  |           |
| ------------------------------ | +------+ +------+ +------+ +------+           |
| 👤 Shared with me             | +------+ +------+ +------+ +------+           |
| ⚙  Settings                   | |Deal  | |Invest| |Risk  | |Portf.|           |
| ------------------------------ | +------+ +------+ +------+ +------+           |
| ✨ Explore free features       | +------+ +------+ +------+                   |
|    Credit left: 15            | |Valu. | |Exit  | |Market|                   |
+-------------------------------- +------+ +------+ +------+ -----------------+
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | CTA icons, active nav border, focus rings, brand accent |
| `color-brand-secondary` | `#7C6FF7` | Gradient secondary, AI highlights |
| `color-bg-base` | `#FFFFFF` | Page background, card surfaces |
| `color-bg-sidebar` | `#F8F9FC` | Left sidebar background |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, active project row |
| `color-bg-toggle` | `#F1F3F4` | View toggle container, Type filter trigger |
| `color-bg-tab-container` | `#F3F4F6` | Filter pill container |
| `color-text-primary` | `#111827` | Headings, card titles, active nav labels |
| `color-text-secondary` | `#374151` | Nav item labels (inactive) |
| `color-text-tertiary` | `#6B7280` | Subtitles, timestamps, descriptions |
| `color-text-muted` | `#9CA3AF` | Inactive toggle icons, placeholder labels |
| `color-border-default` | `#E5E7EB` | Card borders, section dividers |
| `color-border-subtle` | `#F3F4F6` | Sidebar section dividers |
| `color-border-active-nav` | `#5B63F6` | `2px` left border on active project row |
| `color-icon-brand` | `#5B63F6` | Action card icons, active toggle icon |
| `color-icon-chat` | `#5B63F6` | Chat type icons (sidebar, badges, cards) |
| `color-icon-dashboard` | `#16A34A` | Dashboard type icons |
| `color-icon-document` | `#F97316` | Document type icons |
| `color-preview-chat` | `#EEF2FF` | Chat card preview background |
| `color-preview-chat-icon` | `#93A8F4` | Chat card preview icon |
| `color-preview-dashboard` | `#F0FDF4` | Dashboard card preview background |
| `color-preview-dashboard-icon` | `#6EE7A6` | Dashboard card preview icon |
| `color-preview-document` | `#FFF7ED` | Document card preview background |
| `color-preview-document-icon` | `#FCA96A` | Document card preview icon |
| `color-scrollbar-thumb` | `#CBD5E1` | Custom scrollbar thumb |
| `color-explore-bg` | `#E8EEFF` | Explore features banner background |
| `color-explore-icon-bg` | `#C7D2FE` | Explore features icon circle |
| `color-explore-icon` | `#4F6EF7` | Explore features sparkle icon |
| `color-explore-title` | `#3B4ECC` | Explore features title text |
| `color-explore-subtitle` | `#6B7ADE` | Explore features subtitle text |
| `color-avatar-brand` | `#3B5BDB` | Workspace switcher avatar background |

---

## Typography

### Type Scale

| Token | Size | Weight | Usage |
|---|---|---|---|
| `type-display` | 28px | 800 | Workspace title |
| `type-section` | 15px | 600 | "All items" section heading |
| `type-body-md` | 14px | 400/500 | Nav labels, card titles, action card titles |
| `type-body-sm` | 13px | 400/500 | Action card descriptions, type filter, submenu items, breadcrumb |
| `type-label` | 12px | 600 | Workspace switcher name |
| `type-caption` | 11px | 400 | Card timestamps, explore banner subtitle |
| `type-overline` | 11px | 500 | Projects section label (uppercase, tracked) |
| `type-badge` | 10px | 500 | Card type badges |

### Font Family
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

---

## Spacing & Grid

### Base Unit: 4px

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps, badge padding |
| `space-2` | 8px | Icon-to-label gap, submenu item padding |
| `space-3` | 12px | Card info padding, type filter trigger padding |
| `space-4` | 16px | Action card padding, grid gap |
| `space-6` | 24px | Content area padding top/bottom |
| `space-7` | 28px | Section spacing before action cards / item grid |
| `space-8` | 32px | Content area horizontal padding |

### Layout Grid

| Zone | Width | Notes |
|---|---|---|
| Sidebar | 220px fixed | `min-w-[220px]`, never collapses |
| Content area | `flex-1` | `px-8 py-8` |
| Breadcrumb bar | Full width | `h-11`, `px-8` |
| Action cards | 4 columns | `grid-cols-4 gap-4`, 6 cards wrap to 2 rows |
| Item grid | 4 columns | `grid-cols-4 gap-4` |

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Card type badges |
| `radius-md` | 6–8px | Nav items, toggle buttons, breadcrumb buttons, dropdown items |
| `radius-lg` | 12px | Cards, action cards, dropdown panel |
| `radius-xl` | 16px | Modals |
| `radius-full` | 9999px | Workspace switcher avatar, scrollbar thumb, type filter trigger |

### Shadows

| Token | Value | Used on |
|---|---|---|
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Item cards, action cards at rest |
| `shadow-card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Cards on hover |
| `shadow-toggle-active` | `0 1px 3px rgba(91,99,246,0.15), 0 1px 2px rgba(91,99,246,0.08)` | Active view toggle button |
| `shadow-dropdown` | `0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)` | Type filter dropdown |
| `shadow-modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modals |

---

## Iconography

### Style Rules
- **Line icons**, uniform stroke weight **1.5px**
- Sizes: `16px` inline, `20px` action areas
- Monochromatic per context — `color-icon-brand` on card surfaces

### Icon Inventory

| Context | Icon | Size | Color |
|---|---|---|---|
| Page title icon | `Building` (landmark) | 20px | `#5B63F6` in `#EEF2FF` wrapper |
| Workspace switcher chevron | `ChevronDown` | 16px | `#9CA3AF` |
| Nav: Recent | `Clock` (circle + hands) | 16px | `#6B7280` |
| Nav: Create Dashboard | `SquaresGrid` (4 squares) | 16px | `#6B7280` |
| Nav: AI Chat | `ChatBubble` (speech bubble with dots) | 16px | `#6B7280` |
| Projects header | `EyeOff` | 14px | `#D1D5DB` |
| Project chevron | `ChevronRight` | 12px | `#9CA3AF` → rotates 90° when open |
| Pin icon (My Private Project) | filled pin SVG | 12px | `#5B63F6` |
| Submenu: Chat | `ChatBubble` | 14px | `#5B63F6` |
| Submenu: Dashboard | `SquaresGrid` | 14px | `#16A34A` |
| Submenu: Document | `Document` | 14px | `#F97316` |
| Bottom nav: Shared with me | `UserGroup` | 16px | `#9CA3AF` |
| Bottom nav: Settings | `Cog` (gear) | 16px | `#9CA3AF` |
| Explore banner | `Sparkles` | 16px | `#4F6EF7` |
| Breadcrumb: Hamburger | `Bars3` | 18px | `#6B7280` |
| Breadcrumb: Back / Forward | `ChevronLeft` / `ChevronRight` | 16px | `#9CA3AF` |
| Breadcrumb: Divider | `ChevronRight` | 14px | `#D1D5DB` |
| Action card: Create Dashboard | `SquaresGrid` | 20px | `#5B63F6` |
| Action card: Create Document | `Document` | 20px | `#5B63F6` |
| Action card: Create Presentation | `PresentationChartBar` (screen + legs) | 20px | `#5B63F6` |
| Action card: Create Form | `ClipboardDocumentList` | 20px | `#5B63F6` |
| Action card: AI Chat | `Sparkles` | 20px | `#5B63F6` |
| Action card: Add Datasource | `Database` (cylinder) | 20px | `#5B63F6` |
| Search bar magnifier | `MagnifyingGlass` | 14px | `#9CA3AF` |
| Type filter: funnel | `Funnel` | 14px | `#5B63F6` |
| Type filter: chevron | `ChevronDown` | 12px | `#9CA3AF` |
| Type option: Chat | `ChatBubble` | 14px | `#5B63F6` |
| Type option: Dashboard | `SquaresGrid` | 14px | `#16A34A` |
| Type option: Document | `Document` | 14px | `#F97316` |
| Type option: Other | `EllipsisHorizontal` | 14px | `#6B7280` |
| View toggle: List | `Bars3` | 15px | `#5B63F6` (active) / `#9CA3AF` |
| View toggle: Grid | `SquaresGrid` (filled) | 15px | `#5B63F6` (active) / `#9CA3AF` |
| Card preview: Chat | `ChatBubble` | 40px | `#93A8F4` |
| Card preview: Dashboard | `SquaresGrid` | 40px | `#6EE7A6` |
| Card preview: Document | `Document` | 40px | `#FCA96A` |
| Card overflow `...` | `EllipsisHorizontal` | 16px | `#9CA3AF` |
| Card type badge: Chat | `ChatBubble` | 10px | `#5B63F6` |
| Card type badge: Dashboard | `SquaresGrid` | 10px | `#16A34A` |
| Card type badge: Document | `Document` | 10px | `#F97316` |

---

## Components

### Sidebar Navigation

Fixed 220px left panel. **Sovereign Capital Gate** is the active project row (highlighted, submenu expanded). **My Private Project** is pinned first.

```
+-------------------------+
| [M] Manish kumar's Work…|  <- Workspace switcher (#3B5BDB avatar)
+-------------------------+
| 🕐 Recent               |
| ⊞  Create Dashboard     |
| 💬 AI Chat              |
+-------------------------+
| PROJECTS          [👁]  |
| ▶ My Private Project 📌 |  <- Pinned, always first; pin icon #5B63F6
| ▼ Sovereign Capital Gate|  <- Active: #EEF2FF bg, 2px #5B63F6 left border
|   ├ 💬 Chat             |
|   ├ ⊞  Dashboard        |
|   └ 📄 Document         |
| + Create a project      |  <- opens Create Project Modal
+-------------------------+
| 👤 Shared with me       |
| ⚙  Settings             |
+-------------------------+
| ✨ Explore free features|  <- #E8EEFF banner
|    Credit left: 15      |
+-------------------------+
```

**Section container:** `id="projects-list"` — used by JS to inject dynamically created projects.

**Project row tokens:**

| Property | Value |
|---|---|
| Sidebar background | `#FFFFFF` |
| Active project row bg | `#EEF2FF` |
| Active project left border | `2px solid #5B63F6` |
| Active project name | `14px`, `font-weight: 500`, `#111827` |
| Inactive project name | `14px`, `#374151` |
| Nav item height | `36px` |
| Nav item border-radius | `8px` |
| Nav item hover bg | `#EEF2FF` |
| Chevron button | `20×20px`, `border-radius: 4px` |
| Chevron icon | `12px`, `#9CA3AF`, `stroke-width: 2.5` |
| Chevron open state | rotates `90deg`, `150ms ease` |
| Pin icon | `12×12px`, `color: #5B63F6`, filled SVG, right-aligned |
| Submenu indent | `padding-left: 16px` |
| Submenu item height | `32px` |
| Submenu item font | `13px`, `#4B5563` |
| Projects label | `11px`, uppercase, tracked, `#9CA3AF` |
| Workspace switcher avatar | `28×28px`, `border-radius: 9999px`, `background: #3B5BDB` |

**Static project contents:**

| Project | Order | Sub-items |
|---|---|---|
| My Private Project | 1st (pinned) | Q4 Strategy (chat), Revenue Overview (dashboard), Project Brief (doc), Investor Update (chat), Meeting Notes (doc), KPI Tracker (dashboard), Product Feedback (chat), User Analytics (dashboard), Sprint Planning (chat), Roadmap 2026 (doc), API Docs (doc) |
| Sovereign Capital Gate | 2nd (active) | Chat, Dashboard, Document |
| *(dynamically added)* | 3rd+ | Empty submenu initially |

---

### Breadcrumb Bar

Full-width bar (`h-11`) at the top of the content area.

```
☰  <  >  Projects  >  Sovereign Capital Gate
```

| Property | Value |
|---|---|
| Height | `44px` |
| Border bottom | `1px solid #E5E7EB` |
| Hamburger icon | `18px`, `#6B7280` |
| Back/forward icons | `16px`, `#9CA3AF` |
| Breadcrumb text | `13px`, `#9CA3AF` (parent) / `#374151` font-medium (current) |
| Divider chevron | `14px`, `#D1D5DB` |
| "Projects" link | links to `../recent-view/index.html` |

---

### Workspace Header

Top of the scrollable content area, before the action cards.

```
[🏢]  Sovereign Capital Gate
      11 items · Last updated about 1 hour ago
```

| Property | Value |
|---|---|
| Icon wrapper | `40×40px`, `border-radius: 12px`, `background: #EEF2FF` |
| Icon | `Building`, `20px`, `color: #5B63F6` |
| Title | `28px`, `font-weight: 800`, `#111827` |
| Subtitle | `14px`, `#6B7280`, `margin-top: 2px` |
| Icon–text gap | `12px` |
| Header bottom margin | `28px` before action cards |

---

### Action Cards Row

Six shortcut cards in a `grid-cols-4` grid (wraps to 2 rows).

```
Row 1:
+--------------+ +--------------+ +--------------+ +--------------+
|[⊞] Create   | |[📄] Create  | |[🖥] Create  | |[📋] Create  |
|    Dashboard | |    Document | |    Pres.    | |    Form     |
+--------------+ +--------------+ +--------------+ +--------------+
Row 2:
+--------------+ +--------------+
|[✨] AI Chat  | |[🗄] Add     |
|              | |    Datasource|
+--------------+ +--------------+
```

**Card inventory:**

| # | Title | Description | Icon | Opens Modal |
|---|---|---|---|---|
| 1 | Create Dashboard | Build charts & visual reports | `SquaresGrid` | Create Item Modal |
| 2 | Create Document | Write, edit & share docs | `Document` | Create Item Modal |
| 3 | Create Presentation | Create slides & decks | `PresentationChartBar` | Create Item Modal |
| 4 | Create Form | Collect data with forms | `ClipboardDocumentList` | Create Item Modal |
| 5 | AI Chat | Generate insights from a prompt | `Sparkles` | Create Item Modal |
| 6 | Add Datasource | Link databases, APIs & more | `Database` | — |

**Card tokens:**

| Property | Value |
|---|---|
| Layout | `grid-cols-4`, `gap: 16px` |
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `12px` |
| Padding | `16px` |
| Icon wrapper | `40×40px`, `border-radius: 8px`, `background: rgba(91,99,246,0.08)` |
| Icon | `20px`, `#5B63F6` |
| Title | `14px`, `font-weight: 500`, `#111827` |
| Description | `13px`, `#6B7280` |
| Hover | `shadow-card-hover` + `translateY(-1px)` |
| Transition | `all 150ms ease-out` |

---

### Section Header & Controls

Between action cards and the item grid.

```
All items                                     [ Search... ]  [ Type▾ ]  [ ≡ ⊞ ]
```

| Property | Value |
|---|---|
| Title | "All items", `15px`, `font-weight: 600`, `#111827` |
| Bottom margin | `16px` before item grid |
| Controls | Search bar + Type filter + View toggle, right-aligned |

---

### Search Bar

| Property | Value |
|---|---|
| Height | `36px` |
| Default width | `256px` |
| Focus width | `320px` |
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `8px` |
| Padding | `0 12px 0 32px` |
| Placeholder | "Search…", `#9CA3AF` |
| Text | `13px`, `#374151` |
| Focus ring | `2px solid #5B63F6`, border transparent |
| Magnifier icon | `14px`, `#9CA3AF`, absolute left `10px` |
| Width transition | `all 150ms ease` |
| Behaviour | Filters `.report-card` items live on `oninput`; empty query restores all |

---

### View Toggle

| Property | Value |
|---|---|
| Container background | `#F1F3F4` |
| Container border | `1px solid rgba(0,0,0,0.06)` |
| Container border-radius | `8px` |
| Container padding | `2px` |
| Button size | `32×32px` |
| Button border-radius | `6px` |
| **Active** bg | `#EEF2FF` |
| **Active** shadow | `0 1px 3px rgba(91,99,246,0.15), 0 1px 2px rgba(91,99,246,0.08)` |
| **Active** icon color | `#5B63F6` |
| **Inactive** bg | `transparent` |
| **Inactive** icon color | `#9CA3AF` |
| Icon size | `15px` |
| Default active | List |

---

### Type Filter Dropdown

**Trigger:**

| Property | Value |
|---|---|
| Background | `#F1F3F4` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `9999px` |
| Height | `36px` |
| Padding | `0 12px` |
| Text | "Type", `13px`, `font-weight: 500`, `#374151` |
| Funnel icon | `14px`, `#5B63F6` |
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

**Type options:**

| Type | Icon color | Active bg | Active text |
|---|---|---|---|
| Chat | `#5B63F6` | `#EEF2FF` | `#5B63F6` |
| Dashboard | `#16A34A` | — | `#374151` |
| Document | `#F97316` | — | `#374151` |
| Other | `#6B7280` | — | `#374151` |

---

### Item Grid

4-column grid of workspace item cards.

| Property | Value |
|---|---|
| Columns | `repeat(4, 1fr)` |
| Gap | `16px` |
| Top margin | `16px` from section header |

**Current items (11 total):**

| Name | Type |
|---|---|
| Chat | Chat |
| Dashboard | Dashboard |
| Document | Document |
| Capital Flow Analysis | Dashboard |
| Deal Memo Q2 | Document |
| Investor Briefing | Chat |
| Risk Register | Document |
| Portfolio Overview | Dashboard |
| Valuation Model | Chat |
| Exit Strategy | Document |
| Market Signals | Chat |

---

### Item Card

```
+------------------------------+
|                              |
|          [  icon  ]          |  <- Coloured preview zone (160px)
|                              |
+------------------------------+
|  Capital Flow Analysis   ... |  <- Title + overflow
|  [⊞ Dashboard]               |  <- Type badge
|  Updated 2 hours ago         |  <- Timestamp
+------------------------------+
```

| Property | Value |
|---|---|
| Preview height | `160px` |
| Preview border-radius | top corners only (`12px 12px 0 0`) |
| Preview icon | `40px` |
| Card border | `1px solid #E5E7EB` |
| Card border-radius | `12px` |
| Card background | `#FFFFFF` |
| Info area padding | `10px 12px 12px` |
| Title | `14px`, `font-weight: 500`, `#111827` |
| Timestamp | `11px`, `#9CA3AF`, `margin-top: 4px` |
| Overflow `...` | hidden by default → `opacity: 1` on card hover |
| Hover border | `rgba(91,99,246,0.4)` |
| Hover shadow | `shadow-card-hover` |
| Hover lift | `translateY(-1px)` |
| Transition | `all 150ms ease-out` |

**Card type colour map:**

| Type | Preview bg | Preview icon | Badge bg | Badge text |
|---|---|---|---|---|
| Chat | `#EEF2FF` | `#93A8F4` | `#EEF2FF` | `#5B63F6` |
| Dashboard | `#F0FDF4` | `#6EE7A6` | `#F0FDF4` | `#16A34A` |
| Document | `#FFF7ED` | `#FCA96A` | `#FFF7ED` | `#F97316` |

---

### Card Type Badge

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

| Property | Value |
|---|---|
| Width | `6px` |
| Thumb | `#CBD5E1`, `border-radius: 9999px` |
| Track | `transparent` |

```css
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## Modals

### Create Item Modal

Triggered by clicking Create Dashboard, Create Document, Create Presentation, Create Form, or AI Chat action cards.

```
+---------------------------------+
|  Create Dashboard           [x] |
+---------------------------------+
|  Name                           |
|  [                            ] |
|                                 |
|  Select project                 |
|  [ Choose a project...       v] |
+---------------------------------+
|                  [Close][Create]|
+---------------------------------+
```

| Property | Value |
|---|---|
| Backdrop | `rgba(17,24,39,0.45)`, `backdrop-filter: blur(2px)` |
| Modal background | `#FFFFFF` |
| Border-radius | `16px` |
| Max-width | `448px` |
| Header padding | `24px 24px 16px` |
| Body padding | `20px 24px` |
| Footer padding | `0 24px 24px` |
| Title | dynamic via `id="modal-title"`, `16px`, `font-weight: 600`, `#111827` |
| Close button | `32×32px`, `border-radius: 8px`, hover bg `#F3F4F6` |
| Name input | `id="modal-name"`, `h-9`, `border: 1px solid #E5E7EB`, focus ring `2px #5B63F6` |
| Project select | dropdown: Sovereign Capital Gate + My Private Project |
| Close button | text `#6B7280`, `border: 1px solid #E5E7EB`, hover bg `#F9FAFB` |
| Create button | bg `#5B63F6` → hover `#4850e4`, `color: #FFFFFF` |
| JS functions | `openCreateModal(type)`, `closeCreateModal()` |
| Backdrop click | closes modal |

---

### Create Project Modal

Triggered by "Create a project" sidebar link (`onclick="openNewProjectModal()"`).

```
+---------------------------------+
|  Create Project             [x] |
+---------------------------------+
|  Name *                         |
|  [                            ] |
|                                 |
|  Description (optional)         |
|  [                            ] |
|  [                            ] |
|  [                            ] |
+---------------------------------+
|                [Cancel][Create] |
+---------------------------------+
```

| Property | Value |
|---|---|
| Title | "Create Project", `16px`, `font-weight: 600`, `#111827` |
| Name input | `id="proj-name"`, required; empty → focuses without submit |
| Description textarea | `id="proj-desc"`, `rows: 3`, optional |
| On Create | reads `proj-name`, generates `id="ws-dyn-{timestamp}"`, injects new project row into `#projects-list` after pinned entry, closes modal |
| JS functions | `openNewProjectModal()`, `closeNewProjectModal()`, `createNewProject()` |
| Backdrop click | closes modal |

---

## States & Interactions

### Item Card States

| State | Visual change |
|---|---|
| Default | `border: 1px solid #E5E7EB`, `shadow-card`, overflow `...` hidden |
| Hover | Border `rgba(91,99,246,0.4)`, `shadow-card-hover`, `translateY(-1px)`, `...` visible |
| Active | `translateY(0)`, `shadow-card` |

### View Toggle States

| State | Visual change |
|---|---|
| Active | `#EEF2FF` bg, brand shadow, `#5B63F6` icon |
| Inactive | `transparent` bg, `#9CA3AF` icon |
| Inactive hover | `rgba(0,0,0,0.05)` bg, `#6B7280` icon |

### Action Card States

| State | Visual change |
|---|---|
| Default | Flat `shadow-card`, `#E5E7EB` border |
| Hover | `shadow-card-hover`, `translateY(-1px)` |
| Active | `translateY(0)` |

### Project Chevron States

| State | Visual change |
|---|---|
| Collapsed | Chevron at `0deg`, submenu hidden |
| Expanded | Chevron at `90deg`, submenu visible |

### Nav Item States

| State | Visual change |
|---|---|
| Default | Transparent bg |
| Hover | `#EEF2FF` bg |
| Active (project row) | `#EEF2FF` bg, `2px solid #5B63F6` left border |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| Action card hover | `150ms` | `ease-out` | `box-shadow`, `transform` |
| `...` appear | `100ms` | `ease` | `opacity` |
| View toggle | `150ms` | `ease` | `background-color`, `box-shadow`, `color` |
| Nav item hover | `100ms` | `ease` | `background-color` |
| Project chevron | `150ms` | `ease` | `transform` (0→90deg) |
| Type dropdown item | `80ms` | `ease` | `background-color` |
| Search bar expand | `150ms` | `ease` | `width` |
| Modal open | instant | — | `display` toggle via `.hidden` class |

---

## Design Principles

### 1. Project as Container
The page focuses on the items inside the project. The header is compact; the grid takes precedence over chrome.

### 2. Type-Coded Visual Language
Chat = `#5B63F6`, Dashboard = `#16A34A`, Document = `#F97316`. Applied consistently across sidebar submenu icons, card previews, card type badges, and type filter options.

### 3. Contextual Active State
The sidebar reflects which project is open — the active row is highlighted and its submenu is expanded. The pinned project (My Private Project) always stays first regardless of context.

### 4. Flat Hierarchy, Depth on Interaction
Cards start flat. Elevation appears only on hover — communicating affordance, not decoration.

### 5. Progressive Disclosure
Card `...` menus, type dropdowns, and project submenus are hidden by default and appear only when triggered.

### 6. Consistent Action Vocabulary
All creation shortcuts use the **"Create X"** prefix for predictable language across all views.

### 7. Accessible Contrast
- Title text `#111827` on `#FFFFFF` → 16.1:1 (AAA)
- Brand icon `#5B63F6` on `#EEF2FF` → sufficient for icon context

---

## File Structure

```
sovereign-capital-gate/
├── assets/
│   └── screenshot.png
├── index.html          <- Main view
└── README.md           <- This file
```

---

*Design language version 1.2 — Aibii AI Business Intelligence SaaS · Sovereign Capital Gate project view, May 2026.*
