# Recent View — Design Language

> Design system derived from the **Recent** page of the Penno workspace UI.  
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
   - [Document Grid](#document-grid)
   - [Document Card](#document-card)
   - [Scrollbar](#scrollbar)
9. [States & Interactions](#states--interactions)
10. [Motion & Animation](#motion--animation)
11. [Design Principles](#design-principles)

---

## Overview

The **Recent** view is a personal document dashboard — the first screen a user lands on after workspace selection. It combines a lightweight action strip, a filter/tab mechanism, and a dense document grid to surface the most relevant content with zero navigation friction.

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)          │  CONTENT AREA (fluid)                      [↕]  │
│                          │                                                  │
│  [M] Manish kumar's Work │  🕐 Recent                                       │
│  ✦ Ask Penno AI  ⌘K      │     Your recent documents and folders…          │
│  🕐 Recent               │                                                  │
│  📄 New document         │  [ Start new doc ][ Create Channel ][ AI ][ + ] │  ← Action Cards
│  💬 New chat             │                                                  │
│  ─────────────────────── │  [ By me ] [ By everyone ] [ Shared with me ]   │  ← Filter Tabs
│  Channels          [👁]  │                                                  │
│  # Sovereign Capital Gate│  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐          │
│  # My private channel    │  │      │ │      │ │      │ │      │          │  ← 4-col Doc Grid
│  + Create a channel      │  └──────┘ └──────┘ └──────┘ └──────┘          │
│  ─────────────────────── │  Untitled  Untitled  Untitled  Untitled          │
│  🚀 Upgrade workspace    │  ─────────────────────────────────────────────── │
│  👤 Shared with me       │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐          │
│  ⬇ Import               │  │      │ │      │ │      │ │      │          │
│  🗂 Templates            │  └──────┘ └──────┘ └──────┘ └──────┘          │
│  ⚙ Settings             │  API Doc…  Untitled  Untitled  Untitled          │
│  ─────────────────────── │                                                  │
│  🔵 Explore free features│                                              [↕] │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Color System

### Palette

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Primary links, active tab text, icon strokes, focus rings |
| `color-brand-secondary` | `#7C6FF7` | Gradient end, AI/Upgrade accents |
| `color-brand-gradient-start` | `#4F6EF7` | Logo gradient start |
| `color-brand-gradient-end` | `#8B5CF6` | Logo gradient end |
| `color-bg-base` | `#FFFFFF` | Page background |
| `color-bg-sidebar` | `#F8F9FC` | Left navigation sidebar |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, tab hover |
| `color-bg-card` | `#FFFFFF` | Document card surface |
| `color-bg-placeholder` | `#F0F1F4` | Empty document thumbnail background |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab background |
| `color-bg-tab-inactive` | `transparent` | Inactive tab background |
| `color-bg-tab-container` | `#F3F4F6` | Pill group container background |
| `color-text-primary` | `#111827` | Page title, card titles, nav labels |
| `color-text-secondary` | `#6B7280` | Subtitle, timestamps, inactive tab text |
| `color-text-tertiary` | `#9CA3AF` | Placeholder / disabled states |
| `color-text-link` | `#5B63F6` | Active tab text, action card icon labels |
| `color-text-upgrade` | `#7C3AED` | "Upgrade this workspace" |
| `color-border-default` | `#E5E7EB` | Card borders, tab container border |
| `color-border-subtle` | `#F3F4F6` | Sidebar dividers |
| `color-border-tab-active` | `#E5E7EB` | Active pill tab border |
| `color-icon-brand` | `#5B63F6` | Action card icons |
| `color-icon-muted` | `#D1D5DB` | Document placeholder icons |
| `color-scrollbar-thumb` | `#CBD5E1` | Scrollbar thumb |
| `color-scrollbar-track` | `transparent` | Scrollbar track |

### Unique to This Screen vs. Channel View

| New addition | Reason |
|---|---|
| `color-bg-tab-active` / `color-bg-tab-container` | Filter tab pill bar not present in channel view |
| `color-border-tab-active` | Active pill needs a visible outline |
| `color-scrollbar-thumb` | Scrollbar is visible due to longer content |
| `color-bg-placeholder` | Slightly darker than pure white to distinguish thumbnail zone |

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
| Page title | `Clock` (⏱) | 24px | `color-text-primary` |
| Start new document | `FilePlus` | 20px | `color-icon-brand` |
| Create a workspace | `Hash` (#) | 20px | `color-icon-brand` |
| Start with AI | `Sparkles` / `Wand` | 20px | `color-icon-brand` |
| Add sources | `ArrowDownTray` | 20px | `color-icon-brand` |
| Nav: Recent | `Clock` | 16px | `color-text-secondary` |
| Nav: New document | `FilePlus` | 16px | `color-text-secondary` |
| Nav: New chat | `ChatBubble` | 16px | `color-text-secondary` |
| Nav: Channels (eye) | `Eye` / `EyeOff` | 14px | `color-text-tertiary` |
| Nav: Upgrade | `Rocket` | 16px | `color-brand-secondary` |
| Document placeholder | `File` outline | 32px | `color-icon-muted` |
| Card overflow | `MoreHorizontal` (⋯) | 16px | `color-text-secondary` |

---

## Components

### Page Header

Appears at the top of the content area. Combines an icon, bold title, and a descriptive subtitle.

```
🕐  Recent
    Your recent documents and folders are displayed here.
    You can also create new documents and folders from here.
```

| Property | Value |
|---|---|
| Icon | `Clock`, 24px, `color-text-primary` |
| Title | `type-display` (28px, 800), `color-text-primary` |
| Icon + title gap | `space-2` (8px) |
| Subtitle | `type-subtitle` (14px, 400), `color-text-secondary` |
| Title–subtitle gap | `space-2` (8px) |
| Header bottom margin | `space-6` (24px) before action cards |

---

### Action Cards Row

Four equal cards providing primary shortcuts. Laid out as a 4-column flex row.

```
┌──────────────────────┐  ┌──────────────────────┐  ┌──────────────────────┐  ┌──────────────────────┐
│ [📄] Start new doc   │  │ [#]  Create a workspace│  │ [✨] Start with AI   │  │ [⬇] Add sources      │
│      Choose from     │  │      Group your docs  │  │      Create from a   │  │      Chat with your   │
│      +100 templates  │  │                       │  │      prompt          │  │      sources          │
└──────────────────────┘  └──────────────────────┘  └──────────────────────┘  └──────────────────────┘
```

| Property | Value |
|---|---|
| Layout | `display: flex`, `gap: 16px` |
| Background | `color-bg-card` |
| Border | `1px solid color-border-default` |
| Border radius | `radius-lg` (12px) |
| Padding | `space-4` (16px) |
| Icon wrapper | `radius-md`, `rgba(91,99,246,0.08)` tint, `padding: 8px` |
| Icon size | 20px, `color-icon-brand` |
| Title | `type-body-md` (14px), `color-text-primary`, `font-weight: 500` |
| Description | `type-body-sm` (13px), `color-text-secondary` |
| Icon–text gap | `space-3` (12px) |
| Hover | `shadow-card-hover` + `translateY(-1px)` |
| Transition | `all 150ms ease-out` |

**Difference from Channel View:** "Create a Folder" is replaced by "Create a workspace" (icon changes from `FolderPlus` to `Hash`).

---

### Filter Tab Bar

Segmented pill-style control for filtering document scope.

```
┌──────────────────────────────────────────┐
│  ┌────────┐  By everyone  Shared with me │
│  │ By me  │                              │
│  └────────┘                              │
└──────────────────────────────────────────┘
```

| Property | Value |
|---|---|
| Container background | `color-bg-tab-container` (`#F3F4F6`) |
| Container border radius | `radius-full` |
| Container padding | `4px` |
| Tab height | `32px` |
| Tab padding | `8px 16px` |
| Tab border radius | `radius-full` |
| Tab font | `type-tab` (14px, 500) |
| **Active tab** bg | `color-bg-tab-active` (`#FFFFFF`) |
| **Active tab** border | `1px solid color-border-tab-active` |
| **Active tab** shadow | `shadow-tab-active` |
| **Active tab** text | `color-text-primary` |
| **Inactive tab** bg | `transparent` |
| **Inactive tab** text | `color-text-secondary` |
| **Inactive tab** hover bg | `rgba(0,0,0,0.04)` |
| Tab gap | `space-1` (4px) |
| Transition | `background-color 120ms ease`, `box-shadow 120ms ease` |

**Tab options:** `By me` · `By everyone` · `Shared with me`

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

### Document Grid

Responsive 4-column grid of document cards.

| Property | Value |
|---|---|
| Columns | 4 (fluid: drops to 3 → 2 on smaller widths) |
| Gap | `space-4` (16px) |
| Top margin | `space-6` (24px) from filter tab bar |
| Min card width | `200px` |
| Row gap | `space-4` (16px) |

---

### Document Card

Individual document tile in the grid.

**Anatomy:**
```
┌────────────────────────────────┐
│                                │
│           [  📄  ]             │  ← Thumbnail zone
│                                │
├────────────────────────────────┤
│  Untitled                  ⋯  │  ← Title + overflow button
│  Edited 19 minutes ago         │  ← Timestamp
└────────────────────────────────┘
```

| Property | Value |
|---|---|
| Width | `1fr` (grid-controlled) |
| Thumbnail height | `~160px` |
| Thumbnail background | `color-bg-placeholder` (`#F0F1F4`) |
| Thumbnail icon | `File` outline, 32px, `color-icon-muted` (`#D1D5DB`) |
| Thumbnail border-radius | `radius-lg radius-lg 0 0` (top corners only) |
| Card border | `1px solid color-border-default` |
| Card border-radius | `radius-lg` (12px) |
| Card background | `color-bg-card` |
| Info area padding | `12px 12px 12px 12px` |
| Title | `type-card-title` (14px, 500), `color-text-primary` |
| Timestamp | `type-label` (12px, 400), `color-text-secondary` |
| Overflow `⋯` | `MoreHorizontal`, 16px, hidden by default → visible on card hover |
| Named doc title | `type-card-title`, same style — e.g. "API Documentation Template" |
| Hover border | Transitions to `color-brand-primary` at 40% opacity |
| Hover shadow | `shadow-card-hover` |
| Hover transition | `all 150ms ease-out` |
| Card cursor | `pointer` |

**Named vs Untitled cards:** Visually identical — only the title text differs. Named cards (e.g. "API Documentation Template") use the same typography, no special treatment.

---

### Scrollbar

A native-styled scrollbar appears on the right edge of the content area when the document grid overflows vertically.

| Property | Value |
|---|---|
| Width | `6px` |
| Thumb color | `color-scrollbar-thumb` (`#CBD5E1`) |
| Thumb border-radius | `radius-full` |
| Track color | `transparent` |
| Visibility | On overflow only (`overflow-y: auto`) |

```css
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## States & Interactions

### Document Card States

| State | Visual Change |
|---|---|
| **Default** | Border `#E5E7EB`, shadow `shadow-card`, `⋯` hidden |
| **Hover** | Border `rgba(91,99,246,0.4)`, shadow `shadow-card-hover`, `translateY(-1px)`, `⋯` visible |
| **Active / pressed** | `translateY(0)`, shadow `shadow-card` |
| **Selected** | Border `color-brand-primary` (solid), background tint `rgba(91,99,246,0.03)` |

### Filter Tab States

| State | Visual Change |
|---|---|
| **Active** | White bg, border, `shadow-tab-active`, primary text |
| **Inactive default** | Transparent bg, secondary text |
| **Inactive hover** | `rgba(0,0,0,0.04)` bg |
| **Focus** | `outline: 2px solid color-brand-primary`, `outline-offset: 2px` |

### Action Card States

| State | Visual Change |
|---|---|
| **Default** | Border, flat shadow |
| **Hover** | `shadow-card-hover`, `translateY(-1px)` |
| **Active** | `translateY(0)`, `shadow-card` |

---

## Motion & Animation

| Interaction | Duration | Easing | Properties |
|---|---|---|---|
| Card hover lift | `150ms` | `ease-out` | `box-shadow`, `transform`, `border-color` |
| Card active press | `80ms` | `ease-in` | `transform`, `box-shadow` |
| Tab switch | `120ms` | `ease-in-out` | `background-color`, `box-shadow`, `color` |
| Action card hover | `150ms` | `ease-out` | `box-shadow`, `transform` |
| `⋯` button appear | `100ms` | `ease` | `opacity` (0 → 1) |
| Page load fade-in | `200ms` | `ease-out` | `opacity` (0 → 1) |
| Scrollbar fade | `300ms` | `ease` | `opacity` (idle → active) |

**Principles:**
- Micro-interactions stay ≤ 150ms — feels instant and responsive
- `transform` and `opacity` only — never animate `width`, `height`, or `background-size`
- Tab transitions avoid layout shift (pill slides via opacity + bg-color, not position)

---

## Design Principles

### 1. Recency as Priority
The "Recent" view is the home base. The 4-column grid maximises visible document count without scrolling, surfacing work-in-progress immediately.

### 2. Flat Hierarchy with Contextual Depth
All cards start flat. Elevation (shadow + border shift) appears only on interaction — depth communicates affordance, not decoration.

### 3. Segmented Filtering Without Navigation
The pill tab bar (`By me` / `By everyone` / `Shared with me`) provides scope filtering **in place** — no page reload, no URL change. This keeps the user in context.

### 4. Content Density Balance
The 4-column grid is intentionally dense but not cramped. `16px` gaps and `12px` info-area padding ensure cards breathe while maximising document discovery.

### 5. Progressive Disclosure
Card `⋯` menus, overflow labels, and secondary actions are hidden by default and surface on hover — keeping the resting state clean.

### 6. Accessible Contrast
- Title text `#111827` on `#FFFFFF` → **contrast ratio 16.1:1** (AAA)
- Timestamp `#6B7280` on `#FFFFFF` → **4.48:1** (AA)
- Active tab text `#111827` on `#FFFFFF` → AAA
- Brand primary `#5B63F6` on `#FFFFFF` → **5.1:1** (AA large text; use white text on brand bg)

---

## Differences from Channel View

| Aspect | Channel View | Recent View |
|---|---|---|
| Page heading | `#` title only | Clock icon + title + subtitle |
| Action card 3 | "Create a folder" | "Create a workspace" |
| Content below header | Document grid (2 cols) | Filter tabs + document grid (4 cols) |
| Filter/tab bar | Not present | `By me / By everyone / Shared with me` |
| Grid columns | 2 | 4 |
| Scrollbar | Hidden (short content) | Visible (long content) |
| Named documents | All "Untitled" | Mix of named + untitled |

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
│   └── document-card.md        ← Document card spec
└── README.md                   ← This file
```

---

*Design language version 1.0 — Derived from Recent View UI reference, April 2026.*
