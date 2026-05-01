# Create Form — Design Language

> Design system derived from the **Aibii** AI Business Intelligence SaaS platform — Form Builder screen.  
> Place the reference screenshot at `assets/screenshot.png`.

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Grid](#spacing--grid)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Components](#components)
   - [Topbar](#topbar)
   - [Sidebar](#sidebar)
   - [Canvas Heading Row](#canvas-heading-row)
   - [Question Card](#question-card)
   - [Field Inputs](#field-inputs)
   - [Radio / Checkbox Rows](#radio--checkbox-rows)
   - [Drag Handle](#drag-handle)
   - [Floating Add Button](#floating-add-button)
   - [Submit Row](#submit-row)
   - [Scrollbar](#scrollbar)
8. [Modals](#modals)
   - [Add Field Modal](#add-field-modal)
   - [Delete Confirm Modal](#delete-confirm-modal)
9. [Edit vs Preview Mode](#edit-vs-preview-mode)
10. [Drag & Drop](#drag--drop)
11. [States & Interactions](#states--interactions)
12. [Motion & Animation](#motion--animation)
13. [Design Principles](#design-principles)

---

## Overview

The **Create Form** screen is a Google Forms-style drag-and-drop form builder. Users can add, reorder, label, and delete question fields and toggle between an **Edit** mode (for authoring) and a **Preview** mode (for filling in the form as a respondent).

Key capabilities:
- **9 field types**: Short answer, Email, Number, Long text, Dropdown, Checkboxes, Multiple choice, Date, File upload
- **Inline label editing** via `contenteditable` — click any label in Edit mode to rename it
- **HTML5 drag-and-drop** reordering of fields
- **Add Field modal** — choose type, write label, mark required, define options
- **Delete confirm modal** — two-step deletion guard
- **Edit / Preview toggle** — button sits inline to the right of the form title in the canvas
- **Submit row** — Clear form + Submit buttons visible only in Preview mode
- **Floating Add Field pill** — visible only in Edit mode (fixed bottom-right)

![Reference Screenshot](assets/screenshot.png)

---

## Screen Anatomy

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)            │  CONTENT AREA (fluid)                           │
│                            │                                                 │
│  [M] Manish kumar's Work…  │  TOPBAR (56px)                                  │
│  ──────────────────────    │  ┌─────────────────────────────────────────┐    │
│  🕐 Recent                 │  │ 📋 / Untitled Form                      │    │
│  ▦  Create Dashboard       │  └─────────────────────────────────────────┘    │
│  📋 Create Form ← active   │                                                 │
│  💬 AI Chat                │  CANVAS (scrollable, bg #ede7f6)                │
│  ──────────────────────    │  ┌─────────────────────────────────────────┐    │
│  PROJECTS                  │  │ Untitled Form           [Edit Form btn] │    │
│  ▶ My Private Project      │  │ Fill in the fields below…               │    │
│  ▶ Sovereign Capital Gate  │  │                                         │    │
│  + Create a project        │  │  ┌── Question Card ──────────────────┐  │    │
│  ──────────────────────    │  │  │  Label*                           │  │    │
│  👥 Shared with me         │  │  │  ─────────────────── (input)      │  │    │
│  ⚙  Settings               │  │  └───────────────────────────────────┘  │    │
│  ──────────────────────    │  │  ┌── Question Card ──────────────────┐  │    │
│  [AI] Explore free feat…   │  │  │  ...                              │  │    │
│                            │  │  └───────────────────────────────────┘  │    │
│                            │  │                          [Clear] [Submit]│    │
│                            │  └─────────────────────────────────────────┘    │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `brand-primary` | `#5B63F6` | Active nav, FAB gradient start, focus rings |
| `brand-secondary` | `#7C6FF7` | FAB gradient end, submit gradient end |
| `canvas-bg` | `#ede7f6` | Canvas scroll area background |
| `card-bg` | `#ffffff` | Question card background |
| `label-text` | `#202124` | Question labels, input values |
| `placeholder` | `#80868b` | Input placeholders (disabled state) |
| `input-border` | `#dadce0` | Bottom border on all inputs (1px) |
| `input-focus` | `#1a73e8` | Bottom border on focus (2px) |
| `req-star` | `#d93025` | Required field asterisk |
| `sidebar-bg` | `#F8F9FC` | Sidebar background |
| `nav-active-bg` | `#EEF2FF` | Active nav item + mode badge background |
| `nav-active-border` | `#5B63F6` | Active nav left-border accent (2px) |
| `scrollbar-thumb` | `#CBD5E1` | Custom scrollbar thumb |

---

## Typography

| Element | Size | Weight | Color |
|---|---|---|---|
| Canvas page title | 22px | 700 | `#111827` |
| Canvas subtitle | 13px | 400 | `#6B7280` |
| Question label | 15px | 600 | `#202124` |
| Required star | 15px | 400 | `#d93025` |
| Input value / option | 14px | 400 | `#202124` |
| Topbar breadcrumb | 14px | 600 | `#1F2937` |
| Nav items | 13–14px | 500 | `#374151` |
| Modal headings | 17px | 700 | `#111827` |
| Modal field labels | 12px | 600 | `#374151` |
| FAB label | 13px | 600 | `#ffffff` |
| Submit button | 13px | 600 | `#ffffff` |

Font family: **Inter**, system-ui, sans-serif (via Google Fonts).

---

## Spacing & Grid

| Element | Value |
|---|---|
| Sidebar width | 220px (fixed) |
| Topbar height | 56px |
| Canvas vertical padding | 40px (py-10) |
| Canvas horizontal padding | 32px (px-8) |
| Card internal padding | 24px horizontal × 20px vertical (px-6 py-5) |
| Gap between cards | 12px (mb-3) |
| Label → input gap | 12px (mb-3) |
| Option row vertical padding | 7px each |
| Option row icon gap | 12px |

---

## Border Radius & Elevation

| Element | Radius | Shadow |
|---|---|---|
| Question card | 12px (rounded-xl) | `0 1px 2px rgba(0,0,0,0.10), 0 1px 3px rgba(0,0,0,0.08)` |
| Question card (hover) | 12px | `0 2px 12px rgba(0,0,0,0.10)` |
| FAB (Add Field) | 9999px (pill) | `0 6px 22px rgba(91,99,246,0.42)` |
| Submit button | 12px (rounded-xl) | `0 4px 14px rgba(91,99,246,0.35)` |
| Modal box | 20px | `0 24px 64px rgba(0,0,0,0.16), 0 4px 12px rgba(0,0,0,0.06)` |
| Modal inputs | 10px | none (border only) |
| Topbar icon | — | — |
| Drag-over card | 12px | `outline: 2px solid #5B63F6` |

---

## Components

### Topbar

Fixed 56px bar spanning the full width of the content area.

```
[icon] / Untitled Form
```

- Left: gradient icon chip + `/` breadcrumb separator + page name (`#topbar-title`)
- Right: *empty* — Edit/Preview button was moved to the canvas heading row
- Background: `#ffffff`; bottom `box-shadow: 0 1px 3px rgba(0,0,0,0.04)`

---

### Sidebar

220px fixed, identical to all other screens in the design system.

| Element | Style |
|---|---|
| Active item background | `#EEF2FF` |
| Active item border | `border-left: 2px solid #5B63F6; padding-left: 10px` |
| Hover state | `background: #EEF2FF` |
| Pinned project icon | filled pin SVG, `#5B63F6` |
| AI promo card | `background: #E8EEFF`, rounded-xl |

---

### Canvas Heading Row

```
Untitled Form                           [Editing badge] [Edit Form ▾]
Fill in the fields below. Required fields are marked with *
```

- Title: `text-[22px] font-bold text-gray-900`
- Edit/Preview button (`#toggle-mode-btn`) sits at the right end of a `flex items-center justify-between` row
- Mode badge (`#mode-badge`): hidden in preview mode, visible in edit mode — `#EEF2FF` bg, `#5B63F6` text

---

### Question Card

```
╔════════════════════════════════════════╗
║  [≡ grip]  Label text *               ║
║            ───────────────── (input)  ║
╚════════════════════════════════════════╝
```

HTML structure:

```html
<div class="q-card bg-white rounded-xl px-6 py-5 mb-3">
  <div class="flex items-start gap-2">
    <div class="drag-handle …">⋮⋮</div>
    <div class="flex-1 min-w-0">
      <div class="mb-3">
        <span class="q-label" contenteditable="…">Label</span>
        <span class="req-star">*</span>  <!-- required fields only -->
      </div>
      <!-- input rendered by buildInput() -->
    </div>
    <div class="q-edit-controls …">  <!-- edit mode only -->
      <button>🗑</button>
    </div>
  </div>
</div>
```

- **No type badge** — clean Google Forms style
- **No question number** — no q-num chip
- Required asterisk sits immediately after the label text (inline `<span>`)

---

### Field Inputs

All inputs use bottom-border-only styling — no full border box.

| CSS class | Element | Notes |
|---|---|---|
| `.f-input` | `<input>` | `border-bottom: 1px solid #dadce0`; focus → `2px solid #1a73e8` |
| `.f-textarea` | `<textarea>` | Same border rules; `resize: none; rows="3"` |
| `.f-select` | `<select>` | Extends `.f-input`; extra left padding |

Disabled in **Edit mode** (inputs are not fillable while editing structure).

---

### Radio / Checkbox Rows

```html
<label class="opt-row">
  <input type="radio" …>  Option text
</label>
```

- `display: flex; align-items: center; gap: 12px; padding: 7px 0`
- Native `<input>` with `accent-color: #1a73e8` and `width/height: 18px`

---

### Drag Handle

- `.drag-handle`: `display: none` by default; `display: flex` inside `.edit-mode`
- Cursor: `grab` / `grabbing`
- Icon: Font Awesome `fa-grip-vertical`, 13px, `#CBD5E1`

---

### Floating Add Button

`#fab-add` — fixed `bottom: 28px; right: 28px; z-index: 40`

```
[ + Add field ]
```

- Pill shape (`border-radius: 9999px`), height 44px, padding `0 20px`
- Gradient: `linear-gradient(135deg, #5B63F6 0%, #7C6FF7 100%)`
- `display: none` by default; `display: flex` in Edit mode only
- Hover: `translateY(-2px)` + stronger shadow

---

### Submit Row

`#submit-row` — `display: none` by default; `display: flex` in Preview mode only.

```
                                  [Clear form]  [Submit]
```

- `justify-end`, `gap: 12px`, `margin-top: 24px`
- **Clear form**: plain text button, `#9CA3AF`
- **Submit**: gradient pill `#5B63F6 → #7C6FF7`, `border-radius: 12px`, height 40px

---

### Scrollbar

```css
::-webkit-scrollbar { width: 5px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

Matches the scrollbar across all other Aibii screens.

---

## Modals

### Add Field Modal

Triggered by `#fab-add` (Edit mode only).

| Field | Control |
|---|---|
| Question label | Text `<input>` (required) |
| Field type | `<select>` with 9 options |
| Required toggle | Checkbox |
| Options textarea | Shown for dropdown / checkbox / radio only (one option per line) |

- `backdrop-filter: blur(3px)`, overlay `rgba(10,10,24,0.40)`
- Box: `max-width: 480px`, `border-radius: 20px`, `padding: 28px`
- Animation: `popIn` — `opacity 0→1`, `translateY(10px)→0`, `scale(.97→1)`, 180ms

### Delete Confirm Modal

Two-step guard before removing a field.

- Shows field label to confirm correct target
- **Cancel** (gray) / **Delete** (red gradient) buttons

---

## Edit vs Preview Mode

| Feature | Edit mode | Preview mode |
|---|---|---|
| Canvas class | `.edit-mode` on `#form-canvas` | — |
| Labels | `contenteditable="true"` | `contenteditable="false"` |
| Inputs | `disabled` | enabled |
| Drag handles | visible | hidden |
| Delete buttons | visible | hidden |
| FAB (Add field) | visible | hidden |
| Submit row | hidden | visible |
| Edit button label | "Preview" | "Edit Form" |
| Mode badge | "Editing" (shown) | hidden |

Toggle function: `toggleMode()` — flips `isEditMode` boolean and calls `renderFields()`.

---

## Drag & Drop

Uses the native HTML5 Drag and Drop API.

| Event | Action |
|---|---|
| `dragstart` | Stores source card in `dragSrcEl`, adds `.is-dragging` class |
| `dragover` | Adds `.drag-over` class, prevents default |
| `dragleave` | Removes `.drag-over` class |
| `drop` | Swaps `fields[]` array entries by id, re-renders |
| `dragend` | Cleans up classes on all cards |

Cards are only `draggable="true"` in Edit mode.

---

## States & Interactions

| Component | State | Visual |
|---|---|---|
| Question card | Default | `box-shadow: 0 1px 2px …` |
| Question card | Hover | Shadow lifts to `0 2px 12px rgba(0,0,0,0.10)` |
| Question card | Drag-over | `outline: 2px solid #5B63F6` |
| Question card | Dragging | `opacity: 0.35` |
| Label | Hover (edit) | `border-bottom: 1px solid #dadce0` |
| Label | Focus (edit) | `border-bottom: 1px solid #1a73e8` |
| Input | Focus | `border-bottom: 2px solid #1a73e8` |
| Delete button | Hover | `color: #F87171; background: #FEF2F2` |
| FAB | Hover | `translateY(-2px)` + stronger shadow |
| Nav item | Hover | `background: #EEF2FF` |

---

## Motion & Animation

| Element | Animation |
|---|---|
| Modal open | `popIn` 180ms — fade + slide up 10px + scale from 0.97 |
| FAB hover | `transform: translateY(-2px)` 150ms ease |
| Card hover shadow | `box-shadow` 180ms ease |
| Input focus border | `border-color` 150ms ease |
| Drag handle | `opacity/display` on `.edit-mode` class toggle |

---

## Design Principles

1. **Google Forms familiarity** — bottom-border inputs, no decorative type badges, inline asterisk for required fields, lavender canvas background — immediately familiar to anyone who has used Google Forms.
2. **Edit / Preview duality** — the entire form experience changes with a single toggle, keeping the authoring and respondent views clearly separated without navigating away.
3. **Minimal chrome** — no question numbers, no type labels, no color-coded badges. The question and its input are the only things that matter.
4. **Inline editing** — `contenteditable` labels mean zero friction: click the text, change it, click away. No modal needed.
5. **Shared design tokens** — scrollbar, sidebar, modals, fonts, and shadow scale all match the other Aibii screens for a cohesive system.
