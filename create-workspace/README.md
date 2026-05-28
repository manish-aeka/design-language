# Create Workspace — Design Language

> Aibii AI Business Intelligence SaaS · Create Workspace screen  
> Version 1.0 · May 2026

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Design Tokens](#design-tokens)
4. [Typography Scale](#typography-scale)
5. [Spacing & Sizing](#spacing--sizing)
6. [Layout Shell](#layout-shell)
7. [Mini Topbar](#mini-topbar)
8. [Workspace Form Card](#workspace-form-card)
9. [Avatar Color Picker](#avatar-color-picker)
10. [Form Fields](#form-fields)
11. [Workspace Switcher Modal](#workspace-switcher-modal)
12. [JS Reference](#js-reference)

---

## Overview

The **Create Workspace** screen is a standalone fullscreen modal page — it has **no sidebar**. It is entered either from the workspace switcher modal ("New Workspace" button) or directly via navigation. The page shows a minimal centered form for naming and describing a new workspace. Upon creation, it navigates to the Recent view.

Key design rules:
- Full-screen overlay on `background: #F3F4F6` (gray-100) — no sidebar, no main nav.
- Mini topbar at top: Aibii brand mark on the left, close `×` (links to Recent) on the right.
- Single white card, centered in the body, `max-w-500px`, `border-radius: 18px` with entrance animation.
- Avatar is clickable to cycle through 7 brand colors. Preview updates the name live.
- All inputs use the same focus ring pattern as the rest of Aibii (`border-color: #5B63F6`, `box-shadow: 0 0 0 3px rgba(91,99,246,0.10)`).
- Cancel goes back to Recent view; Create saves to localStorage and goes to Recent view.

---

## Screen Anatomy

```
┌──────────────────────────────────────────────────────┐
│  [A] Aibii                                      [×]  │  ← Mini topbar (h-11, bg-white)
├──────────────────────────────────────────────────────┤
│                                                      │  ← bg-gray-50, flex-1
│         ┌────────────────────────────────┐          │
│         │  New workspace                 │          │
│         │  A shared space for your team  │          │
│         │                                │          │
│         │  ┌───┐  Your workspace         │          │
│         │  │ A │  Click avatar to change │          │
│         │  └───┘                         │          │
│         │                                │          │
│         │  Name *                        │          │
│         │  [____________________________] │          │
│         │                                │          │
│         │  Description (optional)        │          │
│         │  [________________________]    │          │
│         │  [________________________]    │          │
│         │                                │          │
│         │  [ Cancel ]  [ Create ]        │          │
│         └────────────────────────────────┘          │
│                                                      │
└──────────────────────────────────────────────────────┘
```

A workspace switcher modal (`#ws-modal`) is also available, presenting existing workspaces.

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Default avatar bg, Create button, focus ring, New workspace button tint |
| `#4850e4` | — | Create button hover |
| `#F3F4F6` | gray-100 | Page background |
| `gray-900` | `#111827` | Card header title, input values, workspace name in modal |
| `gray-800` | `#1F2937` | Workspace preview name |
| `gray-600` | `#4B5563` | Form label, Cancel button text |
| `gray-500` | `#6B7280` | Cancel button text (modal) |
| `gray-400` | `#9CA3AF` | Subtitle text, avatar hint, placeholder |
| `gray-200` | `#E5E7EB` | Input border, Cancel button border, workspace row border |
| `gray-100` | `#F3F4F6` | Workspace row background (inactive) |
| `gray-50` | `#F9FAFB` | Input background at rest |
| `#EEF2FF` | indigo-50 | Active workspace row bg, "New workspace" button bg |
| `#E0E7FF` | indigo-100 | "New workspace" button hover bg |
| `#C7D2FE` | indigo-200 | Step dot completed color |
| `#A5B4FC` | indigo-300 | Plan card hover border |
| `#F1F2F9` | — | Member row border |
| `#FAFAFF` | — | Member row background |

### Avatar cycle colors (7 options)

```js
wsColors = ['#5B63F6', '#16A34A', '#F97316', '#8B5CF6', '#EC4899', '#0EA5E9', '#EAB308']
```

### Shadows

| Usage | Value |
|---|---|
| Wizard modal | `0 24px 60px rgba(0,0,0,0.18), 0 4px 16px rgba(0,0,0,0.08)` |
| Form card | `0 1px 4px rgba(0,0,0,0.07)` |
| Member suggestion dropdown | `0 8px 28px rgba(0,0,0,0.11)` |

---

## Typography Scale

**Family:** `'Inter', system-ui, -apple-system, sans-serif`  
**Weights loaded:** 400, 500, 600, 700, 800

| Role | Size | Weight | Color |
|---|---|---|---|
| Topbar brand name | `13px` | `600` | `#374151` |
| Card header title | `17px` | `700` | `#111827` |
| Card header subtitle | `12px` | `400` | `#9CA3AF` |
| Workspace preview name | `13px` | `600` | `#1F2937` |
| Workspace preview hint | `11px` | `400` | `#9CA3AF` |
| Form label | `12px` | `500` | `#4B5563` |
| Input value | `13px` | `400` | `#111827` |
| Input placeholder | `13px` | `400` | `#9CA3AF` |
| Cancel button | `13px` | `500` | `#4B5563` |
| Create button | `13px` | `600` | `#ffffff` |
| Modal title | `16px` | `700` | `#111827` |
| Workspace name in modal | `13px` | `600` | `#111827` |
| Workspace status in modal | `11px` | `400` | `#9CA3AF` |

---

## Spacing & Sizing

| Element | Value |
|---|---|
| Mini topbar height | `h-11` (44px) |
| Mini topbar padding | `px-6` |
| Form card max-width | `500px` |
| Form card border-radius | `18px` |
| Form card padding | `px-7 py-8` (from older form variant) or `max-w-lg mx-4 px-7 py-8` |
| Simple form card border-radius | `8px` (`rounded-lg`) |
| Simple form card shadow | `0 1px 4px rgba(0,0,0,0.07)` |
| Avatar size | `44 × 44px` (`w-11 h-11`) |
| Avatar border-radius | `rounded-xl` (12px) |
| Name input height | `h-9` (36px) |
| Name input padding | `px-3` |
| Name input border-radius | `rounded-lg` (8px) |
| Description textarea rows | `2` |
| Description padding | `px-3 py-2` |
| Form field gap | `space-y-3` |
| Action button height | `h-9` (36px) |
| Action button border-radius | `rounded-lg` (8px) |
| Avatar in modal | `36 × 36px`, `border-radius: 9px` |

---

## Layout Shell

This page is a **fullscreen modal** — there is no sidebar or scrollable content column.

```html
<body class="font-sans bg-gray-50 text-gray-900 flex h-screen overflow-hidden">

  <!-- Full-screen create workspace view -->
  <div id="new-ws-modal" class="fixed inset-0 z-[60] flex flex-col" style="background:#F3F4F6">

    <!-- Mini topbar -->
    <div class="flex items-center justify-between px-6 h-11 bg-white border-b border-gray-100 flex-shrink-0">
      <!-- brand left -->
      <!-- × close right (a href="../recent-view/index.html") -->
    </div>

    <!-- Body — centred card -->
    <div class="flex-1 flex items-center justify-center overflow-y-auto py-8">
      <div class="bg-white rounded-lg w-full max-w-lg mx-4 px-7 py-8">
        <!-- form content -->
      </div>
    </div>

  </div>

  <!-- Workspace switcher modal -->
  <div id="ws-modal" …>…</div>

</body>
```

---

## Mini Topbar

**Height:** `h-11` · `bg-white` · `border-b border-gray-100` · `px-6`

| Zone | Content |
|---|---|
| Left | `w-6 h-6 rounded-full bg-[#5B63F6]` with `"A"` initial + `"Aibii"` text (13px 600 `#374151`) |
| Right | `×` close button → `a href="../recent-view/index.html"` · `w-8 h-8 rounded-lg hover:bg-gray-100 text-gray-400 hover:text-gray-600` |

---

## Workspace Form Card

**Container:** `bg-white rounded-lg w-full max-w-lg mx-4 px-7 py-8`  
**Shadow:** `0 1px 4px rgba(0,0,0,0.07)`

### Header

```
h2  "New workspace"  text-[17px] font-bold text-gray-900  mb-1
p   "A shared space for your team's work."  text-[12px] text-gray-400 mt-1
```

### Avatar + Name Preview Row

```
div.flex.items-center.gap-3.mb-5
  #ws-preview-avatar  w-11 h-11 rounded-xl flex items-center justify-center
                      text-white text-base font-bold cursor-pointer select-none
                      onclick="cycleWsColor()"
                      default: background:#5B63F6, text:"A"
  div.flex-1.min-w-0
    p#ws-preview-name  "Your workspace"  text-[13px] font-semibold text-gray-800 truncate
    p                  "Click avatar to change color"  text-[11px] text-gray-400
```

Both `#ws-preview-name` and `#ws-preview-avatar` update live as the user types in the Name field.

---

## Avatar Color Picker

`cycleWsColor()` cycles through 7 colors on each click:

| Index | Color | Usage |
|---|---|---|
| 0 (default) | `#5B63F6` | Brand indigo |
| 1 | `#16A34A` | Green |
| 2 | `#F97316` | Orange |
| 3 | `#8B5CF6` | Violet |
| 4 | `#EC4899` | Pink |
| 5 | `#0EA5E9` | Sky blue |
| 6 | `#EAB308` | Yellow |

State variables: `wsNewColor`, `wsColorIndex`.

---

## Form Fields

### Name Field (required)

```html
<label class="block text-[12px] font-medium text-gray-600 mb-1">
  Name <span class="text-red-400">*</span>
</label>
<input
  id="new-ws-name"
  type="text"
  placeholder="e.g. Design Team"
  maxlength="48"
  class="w-full h-9 px-3 text-[13px] text-gray-900 bg-gray-50 border border-gray-200 rounded-lg"
  oninput="onWsNameInput(this.value)"
  onkeydown="if(event.key==='Enter') createNewWs()"
/>
```

**Focus style** (inline):
```js
onfocus: borderColor='#5B63F6'; background='#fff'; boxShadow='0 0 0 3px rgba(91,99,246,0.10)'
onblur: reset all
```

### Description Field (optional)

```html
<label>Description <span class="text-gray-400 font-normal">optional</span></label>
<textarea
  id="new-ws-desc"
  rows="2"
  placeholder="What is this workspace for?"
  class="w-full px-3 py-2 text-[13px] text-gray-900 bg-gray-50 border border-gray-200 rounded-lg resize-none"
/>
```

Same focus style as Name field.

### Action Buttons

```
div.flex.gap-2.mt-5
  Cancel → a href="../recent-view/index.html"
    flex-1 h-9 rounded-lg text-[13px] font-medium text-gray-600
    border border-gray-200 hover:bg-gray-50

  Create → button onclick="createNewWs()"
    flex-1 h-9 rounded-lg text-[13px] font-semibold text-white
    background:#5B63F6  hover:#4850e4
```

`createNewWs()`:
1. Validates name (focus if empty)
2. Saves `{ id, name, desc, initial, color, createdAt }` to `localStorage['aibii_workspaces']`
3. Navigates to `../recent-view/index.html`

---

## Workspace Switcher Modal

`id="ws-modal"` — accessible after a workspace is created (replaces the backdrop pattern on other pages).

```
fixed inset-0 z-70
bg: rgba(17,24,39,0.4); backdrop-filter: blur(2px)
onclick backdrop → closeWsModal()

bg-white rounded-2xl shadow-2xl w-[480px] max-w-[92vw]
Header:
  h2  "Switch workspace"  text-[16px] font-bold text-gray-900
  [+ New workspace] button  bg:#EEF2FF color:#5B63F6 hover:#E0E7FF
  [×] close button

#ws-modal-list  px-4 py-3 space-y-1
  (rendered by renderWsModalList())
```

**Workspace row spec:**
```
button: width:100%; display:flex; align-items:center; gap:12px;
        padding:10px 12px; border-radius:10px; border:none;
        background: #EEF2FF (current) / transparent (others)

  avatar: 36×36px, border-radius:9px, bg: workspace color, white initial, 13px 700
  name:   13px 600 #111827
  status: 11px #9CA3AF  ("Current workspace" / "Switch to this")
  checkmark: w-4 h-4 color:#5B63F6 (current only)
```

Workspaces in default state:
- `Manish kumar's Workspace` — `M`, `#3B5BDB`, current
- `Sovereign Capital Gate` — `S`, `#5B63F6`

---

## JS Reference

| Function | Description |
|---|---|
| `cycleWsColor()` | Increments `wsColorIndex`, updates `#ws-preview-avatar` background |
| `onWsNameInput(val)` | Updates `#ws-preview-name` text + avatar initial letter live |
| `createNewWs()` | Validates name, saves to localStorage, navigates to Recent |
| `openWsModal()` | Renders workspace list, shows `#ws-modal` |
| `closeWsModal()` | Hides `#ws-modal` |
| `renderWsModalList()` | Builds workspace row buttons inside `#ws-modal-list` |
| `selectWorkspace(id)` | Marks workspace as current, updates sidebar header, closes modal |

---

## File Structure

```
create-workspace/
├── index.html    ← All-in-one: HTML + Tailwind + JS
└── tokens/
    ├── colors.json
    ├── spacing.json
    └── typography.json
```

> No README was previously present for this screen. This document is the initial version.

**External dependencies (CDN):**

| Library | URL |
|---|---|
| Tailwind CSS | `https://cdn.tailwindcss.com` |
| Inter font | `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800` |
