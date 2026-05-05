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
   - [Page Header](#page-header)
   - [Action Cards Row](#action-cards-row)
   - [Filter Tab Bar](#filter-tab-bar)
   - [View Toggle](#view-toggle)
   - [Type Filter Dropdown](#type-filter-dropdown)
   - [Sidebar Projects Section](#sidebar-projects-section)
   - [Sidebar Toggle](#sidebar-toggle)
   - [Report Grid](#report-grid)
   - [Report Card](#report-card)
   - [Card Type Badge](#card-type-badge)
   - [Card Context Menu](#card-context-menu)
   - [Scrollbar](#scrollbar)
9. [Modals](#modals)
   - [Create Item Modal](#create-item-modal)
   - [Create Project Modal](#create-project-modal)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)

---

## Overview

The **Recent** view is the personal analytics home screen — the first screen a user lands on after selecting a workspace in Aibii. It combines a lightweight action strip, a filter/tab mechanism, and a dense report grid to surface the most relevant analyses and dashboards with zero navigation friction.

Key interactions:
- **5 action-card shortcuts** — New Dashboard, New Document, New Presentation, New Form, New Chat
- **Create Item modal** — shared modal for all action cards; Name (required) + Description (optional) + Select project
- **Create Project modal** — triggered via sidebar "+ Create a project" link
- **Sidebar toggle** — hamburger button collapses/expands the 220px sidebar with smooth animation
- **Card context menu** — `...` on any card opens Share / Rename / Edit dropdown
- **Type filter** — filters report grid by content type; clicking the active type clears the filter
- **View toggle** — switches between 4-column card grid and compact list layout
- **4 filter tabs** — By me / By everyone / Shared with me / Everything

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)             │  CONTENT AREA (fluid)                         │
│                             │                                               │
│  [M] Manish kumar's Work…   │  🕐 Recent                                    │
│  ─────────────────────────  │     All your recently accessed dashboards,    │
│  🕐 Recent  ← active        │     chats, documents, and more — in one place │
│  ⊞  New Dashboard           │                                               │
│  💬 New Chat                │  [⊞ Dashboard][📄 Doc][🖥 Pres][📋 Form][💬 Chat] │ ← 5 Action Cards
│  ─────────────────────────  │                                               │
│  PROJECTS                   │  [ By me ][ By everyone ][ Shared ][ All ]   │ ← 4 Filter Tabs
│  ▶ My Private Project 📌    │                            [ Type▾ ][ ≡ ⊞ ]  │
│    ├ 💬 Q4 Strategy         │                                               │
│    └ …                      │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐       │
│  ▶ Sovereign Capital Gate   │  │      │ │      │ │      │ │      │       │ ← Report Grid
│  + Create a project         │  └──────┘ └──────┘ └──────┘ └──────┘       │
│  ─────────────────────────  │                                               │
│  🗄  Connect Datasource      │                                               │
│  👤 Shared with me          │                                               │
│  ⚙  Settings               │                                               │
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
| Presentation | `#F5F3FF` | `#A78BFA` | `#F5F3FF` | `#7C3AED` |
| Form | `#FDF2F8` | `#F4A8D4` | `#FDF2F8` | `#BE185D` |
| Project | `#FFFBEB` | `#FCD34D` | `#FFFBEB` | `#92400E` |

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
| Action cards | `grid-cols-4` (5 cards across two rows), `gap: 16px` | |
| Report grid | `grid-cols-4`, `gap: 16px` | Grid view |
| Sidebar width | `220px` fixed | Collapsible |

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-sm` | 4px | Badges |
| `radius-md` | 8px | Buttons, icon backgrounds, nav items, context menu items |
| `radius-lg` | 12px | Cards, action cards, dropdown panel, context menu |
| `radius-xl` | 16px | Modals |
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
| Breadcrumb: Hamburger | Bars3 | 18px | `#6B7280` |
| Breadcrumb: Back/Forward | ChevronLeft/Right | 16px | `#9CA3AF` |
| Type filter funnel | Funnel | 14px | `#5B63F6` |
| Card overflow | EllipsisHorizontal | 16px | `#9CA3AF` |
| Context menu: Share | ShareNodes | 14px | `#9CA3AF` |
| Context menu: Rename | PencilSquare | 14px | `#9CA3AF` |
| Context menu: Edit | AdjustmentsHorizontal | 14px | `#9CA3AF` |
| Sidebar pin | Thumbtack | 12px | `#5B63F6` |
| Project chevron | ChevronRight | 12px | `#9CA3AF` |

---

## Components

### Page Header

| Property | Value |
|---|---|
| Icon | Clock, 24px, `#111827` |
| Title | "Recent", 28px, `font-weight: 800`, `#111827` |
| Subtitle | "All your recently accessed dashboards, chats, documents, and more — in one place." |
| Subtitle style | 14px, `#6B7280` |
| Bottom margin | `mb-6` (24px) |

---

### Action Cards Row

Five active cards in a `grid-cols-4` layout (4 + 1 second row).

| # | Title | Description | Opens |
|---|---|---|---|
| 1 | New Dashboard | Charts, KPIs & visual reports | Create Item Modal |
| 2 | New Document | Write, collaborate & share | Create Item Modal |
| 3 | New Presentation | Slides, decks & pitches | Create Item Modal |
| 4 | New Form | Surveys, feedback & data entry | Create Item Modal |
| 5 | New Chat | Ask questions, get AI answers | Create Item Modal |

> **Note:** "Add Datasource" card exists in the HTML but is commented out.

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

Container: bg `#F3F4F6`, radius `9999px`, padding `4px`. Active tab: bg `#FFFFFF`, `1px solid #E5E7EB`, `shadow-tab-active`, text `#111827`. Inactive: transparent bg, text `#6B7280`.

JS: `setTab(active)` — iterates all 4 tab IDs.

---

### View Toggle

Default active: **grid**.

| State | Layout |
|---|---|
| Grid (default) | `grid grid-cols-4 gap-4` on `#report-grid` |
| List | `.list-view` class added; grid classes removed |

List view card row: `[40px icon] [name] [96px type badge] [timestamp] [...]`. Rows separated by `1px solid #F3F4F6`. Container: `1px solid #E5E7EB`, `border-radius: 12px`.

JS: `setView(active)` — toggles `list-view` class and grid Tailwind classes on `#report-grid`.

---

### Type Filter Dropdown

Trigger: pill button with funnel icon + `<span id="type-filter-label">Type</span>`. Label updates to the selected type name on selection; clicking the active type again clears the filter.

Available types: **Chat · Dashboard · Document · Presentation · Form · Project**

JS: `activeTypeFilter` global. `setTypeFilter(type, el)` — toggle logic. `applyFilters()` — combines search + type filter on `.report-card[data-type]`.

---

### Sidebar Projects Section

Collapsible accordion. Always-first pinned entry: **My Private Project** with thumbtack icon.

| Property | Value |
|---|---|
| Section label | "PROJECTS" — `11px`, uppercase, `#9CA3AF`, no decorative icon |
| Project row height | `36px` |
| Chevron open | rotates `90deg`, `150ms ease` |
| Submenu max-height | `160px`, `overflow-y: auto` |
| Submenu item | `32px`, `13px`, `#4B5563` |
| "+ Create a project" | `onclick="openNewProjectModal()"` |

Static projects: **My Private Project** (pinned, 11 sub-items) + **Sovereign Capital Gate** (3 sub-items).

---

### Sidebar Toggle

Hamburger (`Bars3`, `#6B7280`) in breadcrumb bar → `toggleSidebar()` → toggles `.collapsed` on `#sidebar`.

Collapsed state: `width: 0`, `min-width: 0`, `opacity: 0`, `border-right: none`.
Transition: `width/min-width 220ms ease`, `opacity 180ms ease`.

---

### Report Grid

`<div id="report-grid">` — 11 cards with `data-type` attributes (chat, dashboard, document, presentation, form, project).

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

**Grid view:** colored preview zone (160px) + title/badge/timestamp footer + hidden `...` button.

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

`id="create-modal"` — triggered by all 5 active action cards via `openCreateModal(type)`.

Fields:
- **Name** — `id="modal-name"`, required (red `*`), `h-9` input
- **Description** — `id="modal-desc"`, optional label, 3-row textarea, `resize: none`
- **Select project** — `id="modal-project"`, defaults to "My Private Project"

Backdrop: `rgba(17,24,39,0.45)` + `blur(2px)`. Width `max-w-md`. Closes on backdrop click.

---

### Create Project Modal

`id="new-project-modal"` — triggered by sidebar "+ Create a project" link.

Fields:
- **Name** — `id="proj-name"`, required, Enter key submits
- **Description** — `id="proj-desc"`, optional, 3-row textarea

On create: injects a new project row into `#projects-list` after the pinned entry with ID `ws-dyn-{timestamp}`.

---

## States & Interactions

| Component | State | Visual |
|---|---|---|
| Report card | Hover | `rgba(91,99,246,0.4)` border, `shadow-card-hover`, `translateY(-1px)`, `...` visible |
| Filter tab | Active | `#FFFFFF` bg, border, shadow, `#111827` text |
| View toggle btn | Active | `#EEF2FF` bg, brand shadow, `#5B63F6` icon |
| Sidebar | Collapsed | `width: 0`, `opacity: 0` |
| Context menu | Open | `display: block`, fixed positioned |
| Project chevron | Expanded | rotated `90deg` |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| `...` appear | `100ms` | `ease` | `opacity` |
| Tab switch | `120ms` | `ease` | `background-color`, `box-shadow`, `color` |
| View toggle | `150ms` | `ease` | `background-color`, `box-shadow`, `color` |
| Nav hover | `100ms` | `ease` | `background-color` |
| Project chevron | `150ms` | `ease` | `transform` |
| Sidebar collapse | `220ms` / `180ms` | `ease` | `width`, `min-width` / `opacity` |
| Modal open/close | instant | — | `.hidden` class toggle |

---

## Design Principles

1. **Recency as Priority** — 4-column grid maximises visible item count, surfacing in-progress work immediately.
2. **Flat Hierarchy, Contextual Depth** — elevation appears only on interaction.
3. **Segmented Filtering In-Place** — 4 tabs + type filter with no page reload.
4. **Consistent Type Visual Language** — each type has a unique colour applied across sidebar, badges, and filter dropdown.
5. **Progressive Disclosure** — `...` menus, sub-items, and dropdowns hidden until triggered.
6. **Dual-Mode Grid** — list view preserves all data in compact rows with a fixed-width type column.

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
├── RECENT_VIEW_COMPONENT.md
├── SVELTEKIT_MIGRATION.md
└── README.md
```

---

*Design language version 2.1 — Aibii AI Business Intelligence SaaS · Recent View, May 2026.*
