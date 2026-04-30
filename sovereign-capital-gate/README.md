# Sovereign Capital Gate — Design Language

> Design system documentation for the **Sovereign Capital Gate** workspace view within the **Aibii** AI Business Intelligence SaaS platform.
> Place the reference screenshot at `assets/screenshot.png`.

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Grid](#spacing--grid)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Icon Inventory](#icon-inventory)
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
9. [States & Interactions](#states--interactions)
10. [Motion & Animation](#motion--animation)
11. [Design Principles](#design-principles)
12. [File Structure](#file-structure)

---

## Overview

The Sovereign Capital Gate view is a **workspace detail page** within the Aibii SaaS platform. It shows all items (Chats, Dashboards, Documents) belonging to the workspace, provides action shortcuts for creating new content, and connects to a shared sidebar for cross-workspace navigation.

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)                │ MAIN CONTENT AREA                              │
│                                │                                                │
│ [M] Manish kumar's Work… [▾]  │ ☰  ‹  ›  Workspaces › Sovereign Capital Gate  │ ← Breadcrumb bar
│ ───────────────────────────── │                                                │
│ 🕐 Recent                     │                                                │
│ ⊞  New dashboard              │ [🏢] Sovereign Capital Gate                    │ ← Workspace header
│ 💬 New chat                   │      11 items · Last updated about 1 hour ago  │
│ ───────────────────────────── │                                                │
│ WORKSPACES              [👁]  │ [📊 New Doc][⊞ Create dash][✨ Ask AI]        │ ← Action cards (5)
│ ▼ Sovereign Capital Gate ←■   │ [+ Add data source][🗄 Connect Datasource]    │
│   ├ 💬 Chat                   │                                                │
│   ├ ⊞  Dashboard              │ All items        [ Search… ] [ Type▾][≡⊞]  │ ← Section header
│   └ 📄 Document               │                                                │
│ ▶ My private workspace        │ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐         │ ← Item grid
│ + Create a workspace          │ │ Chat │ │Dash  │ │ Doc  │ │Cap.  │         │
│                               │ └──────┘ └──────┘ └──────┘ └──────┘         │
│ [Shared with me]              │ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐         │
│ [Settings]                    │ │Deal  │ │Invest│ │Risk  │ │Portf.│         │
│                               │ └──────┘ └──────┘ └──────┘ └──────┘         │
│ [✨ Explore free features]    │ ┌──────┐ ┌──────┐ ┌──────┐                  │
│     Credit left: 15           │ │Valu. │ │Exit  │ │Market│                  │
└─────────────────────────────── └──────┘ └──────┘ └──────┘ ──────────────────┘
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | CTA icons, active states, focus rings, brand accent |
| `color-brand-secondary` | `#7C6FF7` | Gradient secondary, AI highlights |
| `color-bg-base` | `#FFFFFF` | Page background, card surfaces |
| `color-bg-sidebar` | `#F8F9FC` | Left sidebar background |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, active toggle, active type option |
| `color-bg-toggle` | `#F1F3F4` | View toggle container, Type filter trigger background |
| `color-bg-tab-container` | `#F3F4F6` | Filter pill container |
| `color-text-primary` | `#111827` | Headings, card titles, active nav labels |
| `color-text-secondary` | `#6B7280` | Subtitles, timestamps, descriptions |
| `color-text-tertiary` | `#9CA3AF` | Inactive toggle icons, chevron icons |
| `color-text-muted` | `#374151` | Type filter trigger text |
| `color-border-default` | `#E5E7EB` | Card borders, section dividers, breadcrumb buttons |
| `color-border-active-nav` | `#5B63F6` | `2px` left border on the active workspace row |
| `color-icon-brand` | `#5B63F6` | Action card icons, funnel icon, active toggle icon |
| `color-icon-chat` | `#5B63F6` | Chat type icons (sidebar, badges, cards) |
| `color-icon-dashboard` | `#16A34A` | Dashboard type icons |
| `color-icon-document` | `#F97316` | Document type icons |
| `color-icon-other` | `#6B7280` | Other type icon |
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
| `color-avatar-brand` | `#3B5BDB` | Workspace switcher avatar background (sidebar only) |

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
| `type-overline` | 11px | 500 | Workspaces section label (uppercase, tracked) |
| `type-badge` | 10px | 500 | Card type badges |

### Font Family
```css
font-family: 'Inter', system-ui, -apple-system, sans-serif;
```

---

## Spacing & Grid

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps, badge padding |
| `space-2` | 8px | Icon-to-label gap, submenu item padding |
| `space-3` | 12px | Card info padding, type filter trigger padding |
| `space-4` | 16px | Action card padding, grid gap |
| `space-5` | 20px | — |
| `space-6` | 24px | Content area padding top/bottom, section spacing |
| `space-8` | 32px | Content area horizontal padding |

### Layout Grid

| Zone | Width | Notes |
|---|---|---|
| Sidebar | 220px fixed | `min-w-[220px]`, never collapses |
| Content area | `flex-1` | `px-8 py-8` |
| Breadcrumb bar | Full width | `h-11`, `px-8` |
| Action cards | 5 columns → wraps | `grid-cols-4` with 5 cards (wraps to 2 rows on 4-col) |
| Item grid | 4 columns | `grid-cols-4 gap-4` |

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Card type badges |
| `radius-md` | 6–8px | Nav items, toggle buttons, breadcrumb buttons, dropdown items |
| `radius-lg` | 12px | Cards, action cards, dropdown panel, workspace header icon |
| `radius-full` | 9999px | Workspace switcher avatar, scrollbar thumb, type filter trigger |

### Shadows

| Token | Value | Used on |
|---|---|---|
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Item cards, action cards at rest |
| `shadow-card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Cards on hover |
| `shadow-toggle-active` | `0 1px 3px rgba(91,99,246,0.15), 0 1px 2px rgba(91,99,246,0.08)` | Active view toggle button |
| `shadow-dropdown` | `0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)` | Type filter dropdown |

---

## Icon Inventory

| Context | Icon | Size | Color |
|---|---|---|---|
| Page title (workspace header) | `Building` (office/landmark) | 20px | `#5B63F6` in `#EEF2FF` wrapper |
| Workspace switcher chevron | `ChevronDown` | 16px | `#9CA3AF` |
| Nav: Recent | `Clock` (circle + hands) | 16px | `#6B7280` |
| Nav: New dashboard | `SquaresGrid` (4 squares) | 16px | `#6B7280` |
| Nav: New chat | `ChatBubble` (speech bubble with dots) | 16px | `#6B7280` |
| Workspaces header | `EyeOff` | 14px | `#D1D5DB` |
| Workspace chevron | `ChevronRight` | 12px | `#9CA3AF` → rotates 90° when open |
| Submenu: Chat | `ChatBubble` | 14px | `#5B63F6` |
| Submenu: Dashboard | `SquaresGrid` | 14px | `#16A34A` |
| Submenu: Document | `Document` | 14px | `#F97316` |
| Bottom nav: Shared with me | `Users` (person group) | 16px | `#9CA3AF` |
| Bottom nav: Settings | `Cog` (gear) | 16px | `#9CA3AF` |
| Explore banner icon | `Sparkles` | 16px | `#4F6EF7` |
| Breadcrumb: Hamburger | `Bars3` | 18px | `#6B7280` |
| Breadcrumb: Back | `ChevronLeft` | 16px | `#9CA3AF` |
| Breadcrumb: Forward | `ChevronRight` | 16px | `#9CA3AF` |
| Breadcrumb: Divider | `ChevronRight` | 14px | `#D1D5DB` |

| Action card: New Document | `BarChart2` (bar chart) | 20px | `#5B63F6` |
| Action card: Create dashboard | `SquaresGrid` | 20px | `#5B63F6` |
| Action card: Ask AI | `Sparkles` | 20px | `#5B63F6` |
| Action card: Add data source | `Plus` | 20px | `#5B63F6` |
| Action card: Connect Datasource | `Database` (cylinder) | 20px | `#5B63F6` |
| Search bar: magnifier | `MagnifyingGlass` | 14px | `#9CA3AF` |
| Type filter: funnel | `Funnel` | 14px | `#5B63F6` |
| Type filter: chevron | `ChevronDown` | 12px | `#9CA3AF` |
| Type option: Chat | `ChatBubble` | 14px | `#5B63F6` |
| Type option: Dashboard | `SquaresGrid` | 14px | `#16A34A` |
| Type option: Document | `Document` | 14px | `#F97316` |
| Type option: Other | `EllipsisHorizontal` | 14px | `#6B7280` |
| View toggle: List | `Bars3` | 15px | `#5B63F6` (active) / `#9CA3AF` |
| View toggle: Grid | `SquaresGrid` (filled) | 15px | `#5B63F6` (active) / `#9CA3AF` |
| Card preview: Chat | `ChatBubble` (with dots) | 40px | `#93A8F4` |
| Card preview: Dashboard | `SquaresGrid` | 40px | `#6EE7A6` |
| Card preview: Document | `Document` | 40px | `#FCA96A` |
| Card overflow `⋯` | `EllipsisHorizontal` | 16px | `#9CA3AF` |
| Card type badge: Chat | `ChatBubble` | 10px | `#5B63F6` |
| Card type badge: Dashboard | `SquaresGrid` | 10px | `#16A34A` |
| Card type badge: Document | `Document` | 10px | `#F97316` |

---

## Components

### Sidebar Navigation

Fixed 220px left panel, identical to the Recent View sidebar. "Sovereign Capital Gate" workspace row is the active/highlighted item.

```
┌─────────────────────────┐
│ [M] Manish kumar's Work…│  ← Workspace switcher (#3B5BDB avatar)
├─────────────────────────┤
│ 🕐 Recent               │
│ ⊞  New dashboard        │
│ 💬 New chat             │
├─────────────────────────┤
│ WORKSPACES        [👁]  │
│ ▼ Sovereign Capital Gate│  ← Active: #EEF2FF bg, 2px #5B63F6 left border
│   ├ 💬 Chat             │
│   ├ ⊞  Dashboard        │
│   └ 📄 Document         │
│ ▶ My private workspace  │
│ + Create a workspace    │
├─────────────────────────┤
│ 👤 Shared with me       │
│ ⚙  Settings             │
├─────────────────────────┤
│ ✨ Explore free features│  ← #E8EEFF banner
│    Credit left: 15      │
└─────────────────────────┘
```

**Key tokens:**

| Property | Value |
|---|---|
| Sidebar background | `#F8F9FC` |
| Active workspace row bg | `#EEF2FF` |
| Active workspace left border | `2px solid #5B63F6` |
| Active workspace name | `14px`, `font-weight: 500`, `#111827` |
| Inactive nav text | `14px`, `#374151` / `#6B7280` |
| Nav item height | `36px` |
| Nav item border-radius | `8px` |
| Nav item hover bg | `#EEF2FF` |
| Submenu indent | `padding-left: 16px` |
| Submenu max-height (open) | `160px` with `overflow-y: auto` |
| Submenu item height | `32px` |
| Workspace switcher avatar | `28×28px`, `border-radius: 9999px`, `background: #3B5BDB` |
| Workspaces label | `11px`, uppercase, tracked, `#9CA3AF` |
| Chevron open | rotates `90deg`, `150ms ease` |

---

### Breadcrumb Bar

Full-width bar (`h-11`) at the top of the content area, sits above the scrollable content.

```
☰  ‹  ›  Workspaces  ›  Sovereign Capital Gate
```

| Property | Value |
|---|---|
| Height | `44px` |
| Border bottom | `1px solid #E5E7EB` |
| Hamburger icon | `18px`, `#6B7280` |
| Back/forward icons | `16px`, `#9CA3AF` |
| Breadcrumb text | `13px`, `#9CA3AF` (parent) / `#374151` font-medium (current) |
| Divider chevron | `14px`, `#D1D5DB` |

---

### Workspace Header

Appears at the top of the scrollable content area, before the action cards.

```
[🏢]  Sovereign Capital Gate
      11 items · Last updated about 1 hour ago
```

| Property | Value |
|---|---|
| Icon wrapper | `40×40px`, `border-radius: 12px`, `background: #EEF2FF` |
| Icon | Building/landmark, `20px`, `color: #5B63F6` |
| Title | `28px`, `font-weight: 800`, `#111827` |
| Subtitle | `14px`, `#6B7280`, `margin-top: 2px` |
| Icon–text gap | `12px` |
| Header bottom margin | `28px` before action cards |

---

### Action Cards Row

Five shortcut cards laid out in a `grid-cols-4` grid (wraps to 2 rows with 5 cards).

| # | Title | Description | Icon |
|---|---|---|---|
| 1 | New Document | Write, edit & share docs | `BarChart2` |
| 2 | Create dashboard | Group your reports | `SquaresGrid` |
| 3 | Ask AI | Generate insights from a prompt | `Sparkles` |
| 4 | Add data source | Attach data to this workspace | `Plus` |
| 5 | Connect Datasource | Link databases, APIs & more | `Database` |

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

Sits between the action cards and the item grid.

```
All items                                          [ Type▾ ]  [ ≡ ⊞ ]
```

| Property | Value |
|---|---|
| Title | "All items", `15px`, `font-weight: 600`, `#111827` |
| Bottom margin | `16px` before item grid |
| Controls | Search bar + Type filter + View toggle, right-aligned |

---

### Search Bar

Inline text input in the section header controls row, directly before the Type filter.

| Property | Value |
|---|---|
| Height | `36px` |
| Default width | `256px` (`w-64`) |
| Focus width | `320px` (`w-80`) |
| Background | `#FFFFFF` |
| Border | `1px solid #E5E7EB` |
| Border-radius | `8px` |
| Padding | `0 12px 0 32px` (icon offset left) |
| Placeholder | "Search…", `#9CA3AF` |
| Text | `13px`, `#374151` |
| Focus ring | `2px solid #5B63F6`, border transparent |
| Magnifier icon | `14px`, `#9CA3AF`, absolute left `10px` |
| Width transition | `all 150ms ease` |
| Behaviour | Filters item cards live on `oninput`; hides non-matching cards; empty query restores all |

---

### View Toggle

Compact dual-mode switcher (list / grid). Light surface.

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
| Inactive hover bg | `rgba(0,0,0,0.05)` |
| Icon size | `15px` |
| List icon | `Bars3` |
| Grid icon | `SquaresGrid` (filled, 4 rects `rx 1.5`) |
| Default active | List |
| Transition | `background-color 150ms ease`, `box-shadow 150ms ease`, `color 150ms ease` |

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
| Item margin | `0 4px` (inset) |
| Item border-radius | `8px` |
| Item height | `36px` |
| Item hover bg | `#F3F4F6` |
| Transition | `80ms ease` |

**Type options:**

| Type | Icon color | Active bg | Active text |
|---|---|---|---|
| Chat | `#5B63F6` | `#EEF2FF` | `#5B63F6` |
| Dashboard | `#16A34A` | — | `#374151` |
| Document | `#F97316` | — | `#374151` |
| Other | `#6B7280` | — | `#374151` |

Default open state: Chat is active.

---

### Item Grid

4-column responsive grid.

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

Individual workspace item tile.

```
┌──────────────────────────────┐
│                              │
│          [  icon  ]          │  ← Coloured preview zone (160px)
│                              │
├──────────────────────────────┤
│  Capital Flow Analysis   ⋯  │  ← Title + overflow
│  [⊞ Dashboard]               │  ← Type badge
│  Updated 2 hours ago         │  ← Timestamp
└──────────────────────────────┘
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
| Overflow `⋯` | hidden by default → `opacity: 1` on card hover |
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

Inline label beneath the card title.

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

## States & Interactions

### Item Card States

| State | Visual change |
|---|---|
| Default | `border: 1px solid #E5E7EB`, `shadow-card`, overflow hidden |
| Hover | Border `rgba(91,99,246,0.4)`, `shadow-card-hover`, `translateY(-1px)`, `⋯` visible |
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

### Workspace Chevron States

| State | Visual change |
|---|---|
| Collapsed | Chevron at `0deg` |
| Expanded | Chevron at `90deg`, submenu visible with scroll |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| Action card hover | `150ms` | `ease-out` | `box-shadow`, `transform` |
| `⋯` appear | `100ms` | `ease` | `opacity` |
| View toggle | `150ms` | `ease` | `background-color`, `box-shadow`, `color` |
| Nav item hover | `100ms` | `ease` | `background-color` |
| Workspace chevron | `150ms` | `ease` | `transform` (0→90deg) |
| Type dropdown item | `80ms` | `ease` | `background-color` |

---

## Design Principles

### 1. Workspace as Container
The page focuses on the items inside the workspace. The header is compact; the grid takes precedence over chrome.

### 2. Type-Coded Visual Language
Chat = `#5B63F6`, Dashboard = `#16A34A`, Document = `#F97316`. Applied consistently across sidebar submenu icons, card previews, card type badges, and type filter options.

### 3. Contextual Active State
The sidebar reflects which workspace is open — the active row is highlighted and its submenu is expanded. This provides orientation within the larger navigation tree.

### 4. Flat Hierarchy, Depth on Interaction
Cards start flat. Elevation only appears on hover — communicating affordance rather than decoration.

### 5. Progressive Disclosure
Card `⋯` menus, type dropdowns, and workspace submenus are hidden by default and appear only when triggered.

### 6. Accessible Contrast
- Title text `#111827` on `#FFFFFF` → 16.1:1 (AAA)
- Timestamp `#9CA3AF` on `#FFFFFF` → decorative use only
- Brand icon `#5B63F6` on `#EEF2FF` → sufficient for icon context

---

## File Structure

```
sovereign-capital-gate/
├── assets/
│   └── screenshot.png
├── tokens/
│   ├── colors.json
│   ├── typography.json
│   └── spacing.json
├── components/
│   ├── sidebar.md
│   ├── breadcrumb-bar.md
│   ├── action-cards.md
│   ├── item-card.md
│   └── type-badge.md
└── README.md                   ← This file
```

---

*Design language version 1.1 — Aibii AI Business Intelligence SaaS · Sovereign Capital Gate workspace, April 2026.*


---

## Table of Contents

1. [Overview](#overview)
2. [Brand Identity](#brand-identity)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Grid](#spacing--grid)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Iconography](#iconography)
8. [Components](#components)
   - [Sidebar Navigation](#sidebar-navigation)
   - [Action Cards](#action-cards)
   - [Document Cards](#document-cards)
   - [Empty State](#empty-state)
   - [Upgrade Banner](#upgrade-banner)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
9. [Motion & Animation](#motion--animation)
10. [Design Principles](#design-principles)

---

## Overview

The Sovereign Capital Gate view is an **AI-powered Business Intelligence workspace** within the Aibii SaaS platform. It serves as an organisation-level hub where teams access, create, and share data reports, dashboards, and AI-generated insights. The interface prioritises analytical content over chrome — using generous whitespace, subtle borders, and a restrained color palette to keep focus on insights and data work.

![Reference Screenshot](assets/screenshot.png)

---

## Brand Identity

| Property | Value |
|---|---|
| Product name | Aibii |
| Full name | Aibii — AI Business Intelligence |
| Workspace name | Sovereign Capital Gate |
| Brand voice | Intelligent, data-driven, trustworthy |
| Visual personality | Clean · Precise · Analytical |

### Logo Mark
- Gradient pill/shield icon with a **blue-to-violet** gradient
- Used as the workspace avatar in the top-left corner
- Never distorted or recoloured outside the gradient range

---

## Color System

### Palette

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Primary actions, links, icon strokes, focus rings |
| `color-brand-secondary` | `#7C6FF7` | Gradient end, "Upgrade" accent, AI feature highlights |
| `color-brand-gradient-start` | `#4F6EF7` | Logo / brand gradient start |
| `color-brand-gradient-end` | `#8B5CF6` | Logo / brand gradient end |
| `color-bg-base` | `#FFFFFF` | Page background, card surfaces |
| `color-bg-sidebar` | `#F8F9FC` | Left navigation sidebar |
| `color-bg-hover` | `#EEF2FF` | Nav item hover / selected state background |
| `color-bg-card` | `#FFFFFF` | Document & action card background |
| `color-bg-placeholder` | `#F3F4F6` | Empty thumbnail placeholder |
| `color-text-primary` | `#111827` | Headings, body copy, nav labels |
| `color-text-secondary` | `#6B7280` | Subtitles, timestamps, section labels, descriptions |
| `color-text-tertiary` | `#9CA3AF` | Disabled labels, placeholder hint text |
| `color-text-link` | `#5B63F6` | Clickable text links |
| `color-text-upgrade` | `#7C3AED` | "Upgrade this workspace" link |
| `color-border-default` | `#E5E7EB` | Card borders, dividers |
| `color-border-subtle` | `#F3F4F6` | Section separators, sidebar dividers |
| `color-icon-brand` | `#5B63F6` | Action card icons |
| `color-icon-muted` | `#D1D5DB` | Empty-state document icons |

### Dark Mode Considerations
The UI uses an exclusively light-mode palette. If dark mode is introduced:
- `color-bg-base` → `#0F172A`
- `color-bg-sidebar` → `#1E293B`
- `color-text-primary` → `#F8FAFC`
- `color-border-default` → `#334155`

---

## Typography

### Type Scale

| Token | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| `type-display` | 28px | 800 (ExtraBold) | 1.2 | Page / workspace title |
| `type-heading-lg` | 20px | 700 (Bold) | 1.3 | Section headings |
| `type-heading-md` | 16px | 600 (SemiBold) | 1.4 | Card titles, dialog headings |
| `type-body-lg` | 15px | 400 (Regular) | 1.5 | Navigation labels, body copy |
| `type-body-md` | 14px | 400 (Regular) | 1.5 | Action card labels, general body |
| `type-body-sm` | 13px | 400 (Regular) | 1.4 | Action card descriptions, meta |
| `type-label` | 12px | 500 (Medium) | 1.3 | Timestamps, section labels |
| `type-caption` | 11px | 400 (Regular) | 1.3 | Helper text, fine print |

### Font Family

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

**Inter** is the primary typeface — chosen for its high legibility at small sizes and extensive weight range. System fonts serve as fallbacks.

### Type Colour Pairing
- **Headings** → `color-text-primary` (`#111827`)
- **Subtitles / descriptions** → `color-text-secondary` (`#6B7280`)
- **Timestamps / labels** → `color-text-secondary` or `color-text-tertiary`
- **Interactive text / links** → `color-text-link` (`#5B63F6`)

---

## Spacing & Grid

### Base Unit
All spacing is based on a **4px base unit**.

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Icon padding, micro gaps |
| `space-2` | 8px | Inline element gaps, icon-to-label gap |
| `space-3` | 12px | Compact row padding |
| `space-4` | 16px | Default component padding, card padding |
| `space-5` | 20px | Sidebar horizontal padding |
| `space-6` | 24px | Section spacing, content area padding top |
| `space-8` | 32px | Page-level padding, large section gaps |
| `space-10` | 40px | Between major layout sections |
| `space-12` | 48px | Hero / top-of-page spacing |

### Layout Grid

| Zone | Width | Notes |
|---|---|---|
| Sidebar | 220px (fixed) | Never collapses in desktop layout |
| Content area | `calc(100vw - 220px)` | Flexible, padded `32px` on each side |
| Insight card grid | 3 columns, `gap: 16px` | Min card width: `220px` |
| Action shortcut row | 4 equal columns | `gap: 16px`, full content-width |

---

## Border Radius & Elevation

### Border Radius

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Badges, labels |
| `radius-md` | 8px | Navigation items (hover state), buttons, action icons |
| `radius-lg` | 12px | Document cards, action shortcut cards, dialog panels |
| `radius-xl` | 16px | Modal overlays |
| `radius-full` | 9999px | Avatar chips, pill buttons |

### Elevation (Shadows)

| Token | Value | Used on |
|---|---|---|
| `shadow-none` | `none` | Flat surfaces (sidebar, page bg) |
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.07), 0 1px 2px rgba(0,0,0,0.04)` | Insight cards, action cards at rest |
| `shadow-card-hover` | `0 4px 12px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.06)` | Insight cards on hover |
| `shadow-modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modal / popover surfaces |

Cards use **border + subtle shadow** together:
```css
border: 1px solid #E5E7EB;
box-shadow: 0 1px 3px rgba(0,0,0,0.07);
```

---

## Iconography

### Style Rules
- **Line icons** with a uniform stroke weight of **1.5px**
- Icon size: **16px** (inline), **20px** (action areas), **24px** (feature highlights)
- All icons are monochromatic within a single context; use `color-icon-brand` on white backgrounds
- Empty-state / placeholder icons use `color-icon-muted` (`#D1D5DB`)
- Icons never use drop shadows

### Icon Set
The UI uses icons consistent with [Lucide](https://lucide.dev/) or [Heroicons](https://heroicons.com/) (outline variant):

| Context | Icon | Description |
|---|---|---|
| New report / analysis | `BarChart2` | Bar chart icon |
| Ask AI / AI insights | `Sparkles` | Wand/sparkle |
| Connect data source | `Database` | Database cylinder |
| Create dashboard | `LayoutDashboard` | Dashboard grid |
| Project / channel | `Hash` | # symbol |
| Add project | `Plus` | Plus sign |
| Shared with me | `Users` | Person group |
| Import data | `ArrowDownTray` | Tray with arrow |
| Templates | `LayoutGrid` | Grid layout |
| Settings | `Settings` | Gear |
| Upgrade | `Rocket` | Rocket / star |
| Report placeholder | `BarChart2` | Muted chart icon |
| More options | `MoreHorizontal` | Three dots |

---

## Components

### Sidebar Navigation

**Structure:** Fixed-width left panel (`220px`) with vertically stacked navigation groups.

```
┌─────────────────────────┐
│  [M] Manish Kumar's Work │  ← Workspace switcher (bold, 14px)
├─────────────────────────┤
│  ✦ Ask Aibii AI  ⌘K     │  ← AI query shortcut
│  🕐 Recent               │
│  📊 New report           │
│  💬 Ask AI               │
├─────────────────────────┤
│  Projects          [👁]  │  ← Section header (12px, gray, uppercase)
│  # Sovereign Capital Gate│  ← SELECTED: bg #EEF2FF, text primary
│  # My private project    │
│  + Create a project      │
├─────────────────────────┤
│                          │
│  🚀 Upgrade workspace    │  ← Bottom utility section
│  👤 Shared with me       │
│  ⬇ Connect data          │
│  🗂 Templates            │
│  ⚙ Settings             │
└─────────────────────────┘
```

**Tokens:**
- Background: `color-bg-sidebar`
- Selected item: background `color-bg-hover`, text `color-text-primary`, left border `2px solid color-brand-primary`
- Hover item: background `color-bg-hover` (70% opacity)
- Section label: `type-label`, `color-text-secondary`, `letter-spacing: 0.05em`, `text-transform: uppercase`
- Nav item height: `36px`, padding: `0 space-5`
- Nav item `border-radius`: `radius-md`

---

### Action Cards

Four equal-width shortcut cards at the top of the content area. In Aibii these represent the primary analytical workflows.

**Actions:**
1. **New report** — "Build from +100 templates"
2. **Ask AI** — "Generate insights from a prompt"
3. **Connect data** — "Chat with your data sources"
4. **Create dashboard** — "Organise your insights"

**Anatomy:**
```
┌──────────────────────────────┐
│  [Icon]  Title               │
│          Subtitle            │
└──────────────────────────────┘
```

| Property | Value |
|---|---|
| Background | `color-bg-card` |
| Border | `1px solid color-border-default` |
| Border radius | `radius-lg` (12px) |
| Padding | `space-4` (16px) |
| Icon size | 20px, `color-icon-brand` |
| Icon background | Soft blue tint `rgba(91,99,246,0.08)`, `radius-md` |
| Title | `type-body-md`, `color-text-primary` |
| Subtitle | `type-body-sm`, `color-text-secondary` |
| Hover | `shadow-card-hover`, slight `translateY(-1px)` |
| Transition | `all 150ms ease` |

---

### Insight Cards

Grid cards representing individual reports, dashboards, or AI-generated insights.

**Anatomy:**
```
┌──────────────────────┐
│                      │
│    [  📊  ]          │  ← Preview area (gray bg, chart icon)
│                      │
├──────────────────────┤
│  Untitled         ⋯  │  ← Title + overflow menu
│  Updated 22 min ago  │  ← Timestamp
└──────────────────────┘
```

| Property | Value |
|---|---|
| Width | ~`240px` (grid auto-fills) |
| Preview height | `~160px` |
| Preview bg | `color-bg-placeholder` |
| Preview icon | `BarChart2` icon, 32px, `color-icon-muted` |
| Card border | `1px solid color-border-default` |
| Card radius | `radius-lg` (12px) |
| Title | `type-body-md`, `color-text-primary`, `font-weight: 500` |
| Timestamp | `type-label`, `color-text-secondary` |
| Overflow `⋯` | visible on hover only |
| Hover | `shadow-card-hover`, border transitions to `color-brand-primary` at 30% opacity |

---

### Empty State

When no reports or dashboards exist in a project yet.

| Property | Value |
|---|---|
| Icon | `BarChart2` outline, 32px, `#D1D5DB` |
| Background | `color-bg-placeholder` (`#F3F4F6`) |
| Message | `type-body-sm`, `color-text-tertiary` — e.g. "No reports yet — create your first insight" |
| CTA button | `color-brand-primary` text, `type-body-sm`, `font-weight: 500` |

---

### Upgrade Banner

Bottom-of-sidebar persistent call-to-action.

| Property | Value |
|---|---|
| Icon | Rocket, gradient fill matching brand gradient |
| Label | `type-body-sm`, `color-text-upgrade` (`#7C3AED`) |
| Sub-label | `type-caption`, `color-text-secondary` |
| Background | Transparent or very light violet tint `rgba(124,58,237,0.04)` |
| Border radius | `radius-md` |
| Padding | `space-3 space-4` |

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

## Motion & Animation

| Interaction | Duration | Easing | Property |
|---|---|---|---|
| Card hover lift | 150ms | `ease-out` | `box-shadow`, `transform` |
| Nav item highlight | 100ms | `ease` | `background-color` |
| Sidebar selection | 120ms | `ease-in-out` | `background-color`, `color` |
| Modal open | 200ms | `ease-out` | `opacity`, `transform: scale(0.97→1)` |
| Button press | 80ms | `ease-in` | `transform: scale(0.98)` |
| Page transition | 180ms | `ease-in-out` | `opacity` |

**Principles:**
- Keep durations under **200ms** for micro-interactions
- Use `ease-out` for elements entering the screen (they decelerate into place)
- Use `ease-in` for elements leaving (they accelerate away)
- Never animate `width`/`height` directly — prefer `transform` and `opacity`

---

## Design Principles

### 1. Data First
The insight / report grid is the hero. Navigation and toolbars recede visually so the user's analytical work takes centre stage. Use restraint with decorative elements.

### 2. Progressive Disclosure
Show the minimum necessary UI at each level. Actions like "more options" (⋯) appear only on hover. Advanced settings are buried in Settings, not surfaced by default.

### 3. Spatial Consistency
Every padding, gap, and margin is a multiple of **4px**. This creates a predictable rhythm that makes the layout feel ordered and professional.

### 4. Accessible Colour Contrast
- All body text (`#111827` on `#FFFFFF`) meets **WCAG AA** (contrast ratio ≥ 4.5:1)
- Secondary text (`#6B7280` on `#FFFFFF`) is **4.48:1** — just meeting AA
- Interactive elements use `color-brand-primary` with sufficient contrast for focus states
- Focus rings: `2px solid #5B63F6` with `outline-offset: 2px`

### 5. Trustworthy & Professional
Rounded corners soften the UI without making it playful. The blue-violet brand palette communicates trust and technology — appropriate for a capital/finance-adjacent workspace name.

### 6. Scalable Component Thinking
Every UI element is a self-contained component with clear tokens. Changing a token (e.g. `color-brand-primary`) propagates consistently across all surfaces.

---

## File Structure

```
sovereign-capital-gate/
├── assets/
│   └── screenshot.png          ← Place reference screenshot here
├── tokens/
│   ├── colors.json             ← All color tokens
│   ├── typography.json         ← Type scale tokens
│   └── spacing.json            ← Spacing & radius tokens
├── components/
│   ├── sidebar.md              ← Sidebar component spec
│   ├── action-cards.md         ← Action shortcut cards spec
│   └── document-cards.md       ← Document card spec
└── README.md                   ← This file
```

---

*Design language version 1.0 — Aibii AI Business Intelligence SaaS · Sovereign Capital Gate workspace, April 2026.*
