# Settings — Profile Page Design Language

> Design system derived from the **Settings › Profile** page of the Penno workspace UI.  
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

The **Settings › Profile** page is a user-preference form surface. It uses the same shell (sidebar + content area) as all other views, but introduces new primitives unique to settings: a **multi-tab settings bar**, **form inputs**, a **read-only field**, an **avatar upload control**, and a **section label** pattern. The page is intentionally sparse — one form, no distractions.

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

*Design language version 1.0 — Derived from Settings › Profile UI reference, April 2026.*
