# Sovereign Capital Gate — Design Language

> Design system derived from the Sovereign Capital Gate workspace UI (Penno platform).  
> Place the reference screenshot at `assets/screenshot.png`.

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

The Sovereign Capital Gate UI is a **document collaboration workspace** built on clean, minimal principles. The interface prioritises content over chrome — using generous whitespace, subtle borders, and a restrained color palette to keep focus on documents and team actions.

![Reference Screenshot](assets/screenshot.png)

---

## Brand Identity

| Property | Value |
|---|---|
| Product name | Penno |
| Workspace name | Sovereign Capital Gate |
| Brand voice | Professional, collaborative, focused |
| Visual personality | Clean · Trustworthy · Minimal |

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
| Document card grid | 3 columns, `gap: 16px` | Min card width: `220px` |
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
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.07), 0 1px 2px rgba(0,0,0,0.04)` | Document cards, action cards at rest |
| `shadow-card-hover` | `0 4px 12px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.06)` | Document cards on hover |
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
| Start new document | `FileText` | Document with lines |
| Start with AI | `Sparkles` | Wand/sparkle |
| Add sources | `Download` / `Database` | Import arrow |
| Create a folder | `FolderPlus` | Folder with plus |
| Channel | `Hash` | # symbol |
| Add channel | `Plus` | Plus sign |
| Shared with me | `Users` | Person group |
| Import | `ArrowDownTray` | Tray with arrow |
| Templates | `LayoutGrid` | Grid layout |
| Settings | `Settings` | Gear |
| Upgrade | `Rocket` | Rocket / star |
| Document placeholder | `File` | Empty file outline |
| More options | `MoreHorizontal` | Three dots |

---

## Components

### Sidebar Navigation

**Structure:** Fixed-width left panel (`220px`) with vertically stacked navigation groups.

```
┌─────────────────────────┐
│  [M] Manish Kumar's Work │  ← Workspace switcher (bold, 14px)
├─────────────────────────┤
│  ✦ Ask Penno AI  ⌘K     │  ← Quick-action shortcut
│  🕐 Recent               │
│  📄 New document         │
│  💬 New chat             │
├─────────────────────────┤
│  Channels          [👁]  │  ← Section header (12px, gray, uppercase)
│  # Sovereign Capital Gate│  ← SELECTED: bg #EEF2FF, text primary
│  # My private channel    │
│  + Create a channel      │
├─────────────────────────┤
│                          │
│  🚀 Upgrade workspace    │  ← Bottom utility section
│  👤 Shared with me       │
│  ⬇ Import               │
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

Four equal-width shortcut cards at the top of the content area.

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

### Document Cards

Grid cards representing individual documents.

**Anatomy:**
```
┌──────────────────────┐
│                      │
│    [  📄  ]          │  ← Thumbnail area (gray bg, centered icon)
│                      │
├──────────────────────┤
│  Untitled         ⋯  │  ← Title + overflow menu
│  Edited 22 min ago   │  ← Timestamp
└──────────────────────┘
```

| Property | Value |
|---|---|
| Width | ~`240px` (grid auto-fills) |
| Thumbnail height | `~160px` |
| Thumbnail bg | `color-bg-placeholder` |
| Thumbnail icon | `File` icon, 32px, `color-icon-muted` |
| Card border | `1px solid color-border-default` |
| Card radius | `radius-lg` (12px) |
| Title | `type-body-md`, `color-text-primary`, `font-weight: 500` |
| Timestamp | `type-label`, `color-text-secondary` |
| Overflow `⋯` | visible on hover only |
| Hover | `shadow-card-hover`, border transitions to `color-brand-primary` at 30% opacity |

---

### Empty State

When no content exists in a card slot.

| Property | Value |
|---|---|
| Icon | `File` outline, 32px, `#D1D5DB` |
| Background | `color-bg-placeholder` (`#F3F4F6`) |
| Message | `type-body-sm`, `color-text-tertiary` |
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

### 1. Content First
The document grid is the hero. Navigation and toolbars recede visually so the user's work takes centre stage. Use restraint with decorative elements.

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

*Design language version 1.0 — Derived from Sovereign Capital Gate UI reference, April 2026.*
