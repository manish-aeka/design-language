# Document Builder — Design Language

> Aibii AI Business Intelligence SaaS · Document Builder screen  
> Version 1.0 · May 2026

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Design Tokens](#design-tokens)
4. [Typography Scale](#typography-scale)
5. [Spacing & Sizing](#spacing--sizing)
6. [Layout Shell](#layout-shell)
7. [Sidebar](#sidebar)
8. [Topbar](#topbar)
9. [Document Title Bar](#document-title-bar)
10. [Formatting Toolbar](#formatting-toolbar)
11. [Document Editor Area](#document-editor-area)
12. [AI Panel](#ai-panel)
13. [Sources Drawer](#sources-drawer)
14. [Share Modal](#share-modal)
15. [Workspace Switcher Modal](#workspace-switcher-modal)
16. [Motion & Transitions](#motion--transitions)
17. [JS Reference](#js-reference)

---

## Overview

The **Document Builder** is a rich-text editing experience with an integrated AI assistant. Users write and format documents in a wide content area; the right-side AI panel lets them ask questions, request drafts, and get AI-generated summaries. A sources drawer slides in from the right to manage referenced datasources.

Key design rules:
- Same 220 px sidebar and `h-11` topbar shell as all Aibii screens.
- A **second bar** (document title bar, `h-12`) sits immediately below the topbar and carries the document name, Sources, Export, and Share actions.
- A **third bar** (formatting toolbar, `h-10`) contains rich-text controls.
- Editor content is constrained to `max-w-[720px]` and centred with `px-8 py-8`.
- The AI panel is `320px` wide, right-anchored, separated from the editor by `border-l border-gray-100`.
- Scrollbar: `width: 6px`, thumb `#CBD5E1`.

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)              │ MAIN CONTENT AREA (fluid)          │ AI PANEL (320px)│
│                              │                                    │                 │
│  [M] Manish kumar's Work…    │ ≡  Topbar (h-11)         🔔  [M]  │                 │
│  ─────────────────────       │────────────────────────────────────│ ─────────────── │
│  🕐 Recent                   │ 📄 Business Intelligence  [Src][↓][Share]            │
│  ⊞  New Dashboard            │────────────────────────────────────│  Aibii AI       │
│  💬 New Chat                 │ Normal▾ | B I U S | ≡ ¶ | ← ↔ → | │  ─────────────  │
│  ─────────────────────       │────────────────────────────────────│  AI messages    │
│  PROJECTS                    │                                    │                 │
│  ▶ My Private Project        │  (contenteditable editor)         │  [AI input...]  │
│  ▼ Sovereign Capital Gate ◀■ │  max-w-720px                      │                 │
│    ├ 📊 Sales Overview       │  Start writing…                   │                 │
│    ├ 💬 Investor Briefing    │                                    │                 │
│    ├ 📊 Capital Analysis     │                                    │                 │
│    ├ 📄 Business Intel. ← ■  │                                    │                 │
│    └ 📄 Deal Memo Q2         │                                    │                 │
│  ▶ Marketing Analytics       │                                    │                 │
│  ▶ Product Roadmap Q3        │                                    │                 │
│  ▶ Engineering Sprint        │                                    │                 │
│  ▶ Customer Success          │                                    │                 │
│  ─────────────────────       │                                    │                 │
│  🗄  Datasources              │                                    │                 │
│  ⚙  Settings                 │                                    │                 │
│  ✨ Explore free features    │                                    │                 │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Focus ring, AI icon, active nav border, active fmt-btn, typing cursor |
| `brand.secondary` | `#7C6FF7` | AI avatar gradient end |
| `hover` | `#EEF2FF` | Active nav item bg, active fmt-btn bg, sources-btn active bg |
| `#3B5BDB` | — | Share button bg, user avatar bg |
| `gray-900` | `#111827` | Document title, editor text headings |
| `gray-700` | `#374151` | Editor body text, toolbar button text |
| `gray-500` | `#6B7280` | Icon colors, placeholder |
| `gray-400` | `#9CA3AF` | Secondary text, AI orb placeholder |
| `gray-200` | `#E5E7EB` | Toolbar dividers, button borders, card borders |
| `gray-100` | `#F3F4F6` | Fmt-btn hover bg |
| `gray-50` | `#F9FAFB` | Toolbar btn hover |
| `#E5E7EB` | — | Input wrapper border at rest |
| `#CBD5E1` | — | Scrollbar thumb |
| `#E8EEFF` | — | Explore banner bg |
| `#C7D2FE` | — | Explore banner icon circle, sources-btn active border |

### Shadows

| Usage | Value |
|---|---|
| Card default | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` |
| Notification dropdown | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` |

---

## Typography Scale

**Family:** `'Inter', system-ui, -apple-system, sans-serif`  
**Weights loaded:** 400, 500, 600, 700, 800

| Role | Size | Weight | Color |
|---|---|---|---|
| Document title (title bar) | `15px` | `700` | `#111827` |
| Toolbar button label | `12px` | `500` | `#374151` |
| Editor body text | `15px` | `400` | `#374151` |
| Editor heading 1 | browser default `h1` | bold | `#111827` |
| AI panel header | `13px` | `600` | `#374151` |
| AI message (user bubble) | `13px` | `400` | `#374151` |
| AI message (bot bubble) | `13px` | `400` | `#374151` |
| AI input text | `13px` | `400` | `#374151` |
| Notification item | `13px` | `400` | `#111827` |
| User dropdown name | `13px` | `600` | `#111827` |
| User dropdown email | `12px` | `400` | `#9CA3AF` |
| Sidebar nav (primary) | `14px` (sm) | `400` | `#374151` |
| Sidebar sub-nav | `13px` | `400` | `#4B5563` |
| Explore banner title | `12px` | `600` | `#3B4ECC` |
| Explore banner sub | `11px` | `400` | `#6B7ADE` |

---

## Spacing & Sizing

| Element | Value |
|---|---|
| Sidebar width | `220px` fixed |
| AI panel width | `320px` fixed |
| Topbar height | `h-11` (44px) |
| Document title bar height | `h-12` (48px) |
| Formatting toolbar height | `h-10` (40px) |
| Editor content padding | `px-8 py-8` |
| Editor max-width | `720px` |
| Toolbar button height | `30px` |
| Toolbar button padding | `0 10px` |
| Toolbar button border-radius | `8px` |
| Format button size | `28 × 28px` (w-7 h-7) |
| Format button border-radius | `6px` (rounded-md) |
| AI panel header height | `h-11` (44px) |
| Sources drawer width | slide-in from right |
| Nav item height | `h-9` (36px) |
| Sub-nav item height | `h-8` (32px) |

---

## Layout Shell

```html
<body class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <aside id="sidebar" class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">
    <!-- sidebar -->
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <!-- topbar h-11 -->
    <div class="flex-1 flex overflow-hidden">
      <!-- document editor column (flex-1) -->
      <div id="ai-panel" class="w-[320px] min-w-[320px] flex flex-col border-l border-gray-100 bg-white">
        <!-- AI panel -->
      </div>
    </div>
  </main>
</body>
```

Sidebar collapses via `.collapsed` class (width → 0, opacity → 0, transition 220ms).  
AI panel collapses via `#ai-panel.collapsed` (same pattern, triggered by toggle button).

---

## Sidebar

The sidebar is structurally identical to all other Aibii screens with the following **page-specific** differences:

### Active Item

**Project:** Sovereign Capital Gate — `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:6px`.  
**Active sub-item:** "Business Intelligence" — `background:#EEF2FF; color:#5B63F6`, orange document icon `#F97316`.

### Project List (6 workspaces)

| ID | Name | State |
|---|---|---|
| `ws2` | My Private Project | Pinned, collapsed |
| `ws1` | Sovereign Capital Gate | **ACTIVE**, expanded |
| `ws3` | Marketing Analytics | Collapsed |
| `ws4` | Product Roadmap Q3 | Collapsed |
| `ws5` | Engineering Sprint | Collapsed |
| `ws6` | Customer Success | Collapsed |

**Sovereign Capital Gate sub-items (5 shown):**

| Name | Type | Icon color |
|---|---|---|
| Sales Overview | Dashboard | `#5B63F6` |
| Investor Briefing | Chat | `#5B63F6` |
| Capital Analysis | Dashboard | `#16A34A` |
| Business Intelligence | Document | `#F97316` (**active**) |
| Deal Memo Q2 | Document | `#F97316` |

**Marketing Analytics sub-items:**

| Name | Type | Icon color |
|---|---|---|
| Campaign Performance | Dashboard | `#16A34A` |
| SEO Strategy Chat | Chat | `#5B63F6` |

**Product Roadmap Q3 sub-items:**

| Name | Type | Icon color |
|---|---|---|
| Feature Backlog | Folder | `#F59E0B` |
| OKR Tracker | Dashboard | `#16A34A` |

**Engineering Sprint sub-items:**

| Name | Type | Icon color |
|---|---|---|
| Velocity Dashboard | Dashboard | `#16A34A` |
| Tech Spec Docs | Document | `#F97316` |

**Customer Success sub-items:**

| Name | Type | Icon color |
|---|---|---|
| Churn Analysis | Dashboard | `#16A34A` |
| NPS Survey | Form | `#EC4899` |

### Bottom Nav

| Item | Icon | `href` |
|---|---|---|
| Datasources | database cylinder | `../datasource/index.html` |
| Settings | gear | `../settings-profile/index.html` |

### Explore Banner

`background:#E8EEFF`, sparkle icon `#4F6EF7` on `#C7D2FE` circle, `rounded-lg` (not rounded-xl).

---

## Topbar

**Height:** `h-11` (44px) · `border-b border-gray-100` · `bg-white` · `px-5`

| Zone | Content |
|---|---|
| Left | Hamburger → `toggleSidebar()` |
| Right | Notification bell + user avatar (`#3B5BDB`, letter `M`) |

### Notification Bell

Dropdown id `notif-dropdown`. 3 items:

| State | Sender | Message |
|---|---|---|
| Unread | AiBii AI (`#5B63F6`) | Drafted a summary for "Untitled" |
| Unread | Sara M. (`#16A34A`) | Shared "Meeting Notes" with you |
| Read | AiBii AI (sparkle icon `#EEF2FF` bg) | "Untitled" document was auto-saved |

### User Menu

Dropdown `id="user-dropdown"`:
- Name: `"Manish Kumar"` — 13px 600
- Email: `"manish@aibii.com"` — 12px `#9CA3AF`
- Log out: `text-red-500 hover:bg-red-50`

---

## Document Title Bar

**Height:** `h-12` (48px) · `border-b border-gray-200` · `bg-white` · `px-5`

### Left

```
document SVG icon (w-15px h-15px, text-gray-700)
h1 id="doc-title-bar"  "Business Intelligence"  text-[15px] font-bold text-gray-900
```

### Right — Toolbar Buttons

| Button | ID | Style | Action |
|---|---|---|---|
| Sources | `sources-topbar-btn` | `.toolbar-btn .sources-btn` | `toggleSourcesDrawer()` |
| *(divider)* | — | `w-px h-5 bg-gray-200` | — |
| Export | — | `.toolbar-btn` | static |
| *(divider)* | — | `w-px h-5 bg-gray-200` | — |
| Share | — | `h-[30px] px-3 rounded-lg text-white bg-[#3B5BDB]` | `openShareModal()` |

**Sources active state:**
```css
background: #EEF2FF !important;
color: #5B63F6 !important;
border-color: #C7D2FE !important;
```

---

## Formatting Toolbar

**Height:** `h-10` (40px) · `border-b border-gray-200` · `bg-white` · `px-5` · `overflow-x-auto`

### Groups (left → right)

```
[Normal ▾]  |  [B] [I] [U] [S]  |  [≡] [¶]  |  [←] [↔] [→]  |  [🔗] ["] [</>]  |  [↩] [↪]
```

| Group | Controls |
|---|---|
| Text style | `select#text-style-select`: Normal, Heading 1, Heading 2, Heading 3 → `applyTextStyle(value)` |
| Inline | Bold `execFmt('bold')`, Italic `execFmt('italic')`, Underline `execFmt('underline')`, Strikethrough `execFmt('strikeThrough')` |
| Lists | Bullet `insertUnorderedList`, Numbered `insertOrderedList` |
| Alignment | Left `justifyLeft`, Center `justifyCenter`, Right `justifyRight` |
| Blocks | Link `insertLink()`, Blockquote `formatBlock:blockquote`, Code `formatBlock:pre` |
| History | Undo `document.execCommand('undo')`, Redo `document.execCommand('redo')` |

### `.fmt-btn` Spec

```css
w-7 h-7 flex items-center justify-center rounded-md
transition: background-color 100ms, color 100ms;
```
- Default: `text-gray-600`
- Hover: `background: #F3F4F6`
- Active: `background: #EEF2FF; color: #5B63F6`

---

## Document Editor Area

**Scroll container:** `flex-1 overflow-y-auto px-8 py-8`  
**Inner constraint:** `max-w-[720px]`

### `#doc-body`

```html
<div
  id="doc-body"
  contenteditable="true"
  data-placeholder="Start writing…"
  class="text-[15px] text-gray-700 focus:outline-none min-h-[400px] mb-8"
></div>
```

| Property | Value |
|---|---|
| Placeholder | CSS `:empty:before { content: attr(data-placeholder); color: #9CA3AF; }` |
| Line height | `1.75` |
| Focus outline | `none` |
| Min height | `400px` |

---

## AI Panel

**Width:** `320px` fixed · `border-l border-gray-100` · `bg-white`  
Collapses via `#ai-panel.collapsed` (width → 0, opacity → 0).

### Header (`h-11`)

```
div.w-6.h-6.rounded-lg  bg:#EEF2FF  → sparkle SVG color:#5B63F6
span  "AiBii AI"  text-[13px] font-semibold text-gray-800
```

### Message Bubbles

**User bubble:** `.ai-msg-user`
```css
background: #EEF2FF;
border-radius: 14px 14px 4px 14px;
```

**Bot bubble:** `.ai-msg-bot`
```css
background: #F9FAFB;
border: 1px solid #E5E7EB;
border-radius: 14px 14px 14px 4px;
```

### AI Orb (welcome state)

When no conversation has started, a cyan orb is shown:

```css
.ai-orb {
  width: 88px; height: 88px; border-radius: 50%;
  background: radial-gradient(circle at 35% 30%, #67E8F9, #22D3EE 40%, #06B6D4 70%, #0891B2);
  box-shadow: 0 8px 32px rgba(6,182,212,0.35), 0 2px 8px rgba(6,182,212,0.20);
}
```

### Suggested Actions (below welcome)

`.suggest-btn` — `bg-gray-100 rounded-md h-8 px-3 text-[12px] text-gray-700`  
Hover: `background: #E5E7EB`

### Input

```
.ai-input-wrap
  #ai-input  (textarea, resize:none, min-height:20px, max-height:120px)
  [Send button]
```

Input wrapper: `border border-gray-200 rounded-xl`, focus-within: `border-color:#5B63F6`.

**Typing cursor animation:**
```css
@keyframes blink { 0%,100%{opacity:1} 50%{opacity:0} }
.typing-cursor::after { content:'|'; animation: blink 0.9s infinite; color:#5B63F6; }
```

---

## Sources Drawer

Slides in from the right edge of the document editor column.

```css
#sources-drawer {
  transform: translateX(100%);
  transition: transform 280ms cubic-bezier(0.4,0,0.2,1);
}
#sources-drawer.open { transform: translateX(0); }
```

### Structure

```
#sources-drawer (absolute right-0, flex-col, bg-white, border-l border-gray-200)
├── Header: "Sources" title + × close
├── Accordion list
│   Each group: header row + .src-accordion-body
│   Group items: status dot (.src-status-dot w-7px h-7px) + source name + metadata
└── Footer: "Add source" button
```

**Accordion animation:**
```css
.src-accordion-body { max-height: 0; overflow: hidden; transition: max-height 260ms cubic-bezier(0.4,0,0.2,1); }
.src-accordion-body.open { max-height: 500px; }
.src-chevron { transition: transform 200ms ease; }
.src-chevron.open { transform: rotate(90deg); }
```

---

## Share Modal

Opened by `openShareModal()` from the title bar Share button.

Backdrop: `rgba(17,24,39,0.45) backdrop-filter:blur(2px)`.

```
modal bg-white rounded-xl max-w-lg
├── Header: "Share document" + × close
├── Invite field: email input + role select + Add button
├── Member list: current members with avatar + name + email + role badge
└── Link sharing: copy link button + toggle
```

---

## Workspace Switcher Modal

Same pattern as all Aibii screens.

```
#ws-modal-backdrop (fixed inset-0 z-50)
  #ws-modal  bg-white rounded-2xl w-full max-w-lg
    ├── Header: "Switch Workspace" + "New Workspace" button + × close
    ├── #ws-search input
    └── #ws-modal-list  (rendered by renderWsModalList())
```

Workspace data:
- `Manish kumar's Workspace` — initial `M`, color `#3B5BDB`, current
- `Sovereign Capital Gate` — initial `S`, color `#5B63F6`

---

## Motion & Transitions

| Element | Transition |
|---|---|
| Sidebar collapse | `width 220ms ease, min-width 220ms ease, opacity 180ms ease` |
| AI panel collapse | `width 220ms ease, min-width 220ms ease, opacity 180ms ease` |
| Sources drawer | `transform 280ms cubic-bezier(0.4,0,0.2,1)` |
| Sources accordion | `max-height 260ms cubic-bezier(0.4,0,0.2,1)` |
| Nav item hover | `background-color 100ms ease` |
| Toolbar button hover | `background-color 120ms ease` |
| Format button | `background-color 100ms, color 100ms` |
| Typing cursor | `blink 0.9s infinite` |

---

## JS Reference

| Function | Description |
|---|---|
| `toggleSidebar()` | Toggles `.collapsed` on `#sidebar` |
| `toggleWorkspace(id)` | Toggles `.open` on `#ws{n}-sub` and `#ws{n}-btn`; chevron rotates |
| `toggleNotifications()` | Toggles `#notif-dropdown` visibility; closes user dropdown |
| `toggleUserMenu()` | Toggles `#user-dropdown` visibility; closes notification dropdown |
| `markAllRead()` | Removes unread dot and row highlights |
| `openWsModal()` / `closeWsModal()` | Controls workspace switcher modal |
| `renderWsModalList()` | Renders workspace list inside modal |
| `selectWorkspace(id)` | Switches active workspace in modal and sidebar header |
| `toggleSourcesDrawer()` | Opens/closes sources drawer; toggles `.active` on sources button |
| `openShareModal()` | Opens share modal |
| `execFmt(cmd, val)` | Calls `document.execCommand(cmd, false, val)` on editor |
| `applyTextStyle(val)` | Wraps selection in `<h1>/<h2>/<h3>/<p>` |
| `insertLink()` | Prompts for URL, calls `execFmt('createLink', url)` |
| `applyTextStyle(value)` | Text style dropdown handler |

---

## File Structure

```
document-builder/
├── index.html    ← All-in-one: HTML + Tailwind + JS
├── README.md     ← This design language document
└── tokens/
    ├── colors.json
    ├── spacing.json
    └── typography.json
```

**External dependencies (CDN):**

| Library | URL |
|---|---|
| Tailwind CSS | `https://cdn.tailwindcss.com` |
| Inter font | `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800` |
