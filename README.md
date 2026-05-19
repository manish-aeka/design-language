# Aibii Design Language

A reference guide for the HTML/Tailwind CSS design system used across all Aibii prototype pages. Follow these patterns to keep every screen consistent.

---

## Tech Stack

| Concern | Choice |
|---|---|
| Styling | Tailwind CSS (CDN — no build step) |
| Typography | Inter via Google Fonts |
| Charts | Chart.js 4.4 (dashboard only) |
| Icons | Inline SVG (Heroicons outline style, `stroke-width="1.5"`) |

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Buttons, active nav, focus rings, icon accents |
| `brand.secondary` | `#7C6FF7` | Gradient end, AI avatar gradient |
| `workspace.blue` | `#3B5BDB` | Workspace avatars (Manish's workspace) |
| `background.base` | `#FFFFFF` | Page, sidebar, topbar, card surfaces |
| `background.hover` | `#EEF2FF` | Nav item hover AND active nav background |
| `background.canvas` | `#F3F4F6` / `#F4F5F8` | Editor canvas, chart placeholders, tab containers |
| `background.sidebar` | `#F8F9FC` | (Available token; current pages use `#FFFFFF` for sidebar) |
| `text.primary` | `#111827` / `#1F2937` | Page titles, card headings |
| `text.secondary` | `#374151` | Body text, nav labels |
| `text.muted` | `#6B7280` | Subtitles, timestamps |
| `text.placeholder` | `#9CA3AF` | Input placeholders, disabled states |
| `border.default` | `#E5E7EB` | Card borders, toolbar buttons, input borders |
| `border.subtle` | `#F3F4F6` / `#E5E7EB` | Sidebar dividers, topbar bottom border |
| `badge.bg` | `#EEF2FF` | Brand badge backgrounds ("New", active nav fill) |
| `badge.text` | `#5B63F6` | Brand badge text |
| `upgrade.bg` | `#E8EEFF` | "Explore free features" sidebar banner |
| `upgrade.icon.bg` | `#C7D2FE` | Icon circle inside upgrade banner |

### Typography

**Family:** `'Inter', system-ui, -apple-system, sans-serif`  
**Weights loaded:** 400, 500, 600, 700, 800

| Role | Size | Weight | Color |
|---|---|---|---|
| Page display title | `28px` | `800` | `#111827` |
| Section heading | `18–19px` | `700` | `#111827` |
| Card title | `16px` | `600–700` | `#1F2937` |
| Body / nav label | `14px` / `13px` | `500` | `#374151` |
| Small body | `12–12.5px` | `400–500` | `#374151` |
| Caption / timestamp | `11–12px` | `400–500` | `#6B7280` |
| Micro label (badge, section header) | `10–11px` | `500–600` | varies |

### Spacing

Base unit: **4px**. All spacing is a multiple.

| Scale | Value | Common use |
|---|---|---|
| 0.5 → `2px` | `2px` | Sub-pixel nudges |
| 1 → `4px` | `4px` | Icon-label micro-gap |
| 2 → `8px` | `8px` | Inline icon gap |
| 2.5 → `10px` | `10px` | Active nav left padding override |
| 3 → `12px` | `12px` | Chat bubble padding, compact rows |
| 4 → `16px` | `16px` | Card padding, grid gaps |
| 5 → `20px` | `20px` | Topbar horizontal padding (`px-5`) |
| 6 → `24px` | `24px` | Card body horizontal padding (`px-6`) |
| 8 → `32px` | `32px` | Content area padding |

### Border Radius

| Token | Value | Use |
|---|---|---|
| `sm` | `4px` | Badges, micro labels |
| `md` | `8px` | Toolbar buttons, icon chips, nav items |
| `lg` | `12px` | Chat input wrapper, suggestion chips |
| `xl` | `16px` | Modal/popover popovers, generated output cards |
| `2xl` | `20px` | Empty-state icon containers, AI avatar box |
| `full` | `9999px` | Pill tabs, avatars, scrollbar thumb |

### Shadows

| Name | Value | Use |
|---|---|---|
| `card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Cards at rest |
| `card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Cards on hover |
| `modal` | `0 20px 60px rgba(0,0,0,0.18)` | Modals, popovers |
| `ws-dropdown` | `0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)` | Workspace switcher dropdown |
| `ai-avatar` | `0 1px 4px rgba(91,99,246,0.30)` | AI avatar box |
| `tab-active` | `0 1px 4px rgba(0,0,0,0.10)` | Active pill tab |

---

## Layout Structure

Every page uses a **3-zone shell**:

```
┌─────────────────────────────────────────────────────┐
│  SIDEBAR 220px fixed │         MAIN                 │
│  ─────────────────── │  ─────────────────────────── │
│  Workspace switcher  │  TOPBAR h-11                 │
│  Primary nav         │  ─────────────────────────── │
│  ── divider ──       │  CONTENT (flex-1, overflow)  │
│  Projects list       │                              │
│  ── spacer ──        │                              │
│  Bottom nav          │                              │
│  Upgrade banner      │                              │
└─────────────────────────────────────────────────────┘
```

### Shell classes

```html
<body class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <aside class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">
    …
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <!-- topbar -->
    <div class="flex items-center justify-between px-4 h-11 border-b border-gray-100 bg-white flex-shrink-0">…</div>
    <!-- content -->
    <div class="flex-1 overflow-auto …">…</div>
  </main>
</body>
```

---

## Component Patterns

### Topbar

Height `h-11`, padding `px-4`, `border-b border-gray-100`, `bg-white`, `flex-shrink-0`.

**LEFT zone:** hamburger → back → forward → `w-px h-4 bg-gray-200` divider → breadcrumb  
**RIGHT zone:** bell icon button → user avatar + name

```html
<div class="flex items-center justify-between px-4 h-11 border-b border-gray-100 bg-white flex-shrink-0">
  <div class="flex items-center gap-1.5">
    <!-- hamburger, back, fwd, divider, breadcrumb -->
  </div>
  <div class="flex items-center gap-2">
    <!-- bell w-8 h-8 rounded-lg icon button -->
    <!-- user: w-7 h-7 rounded-full avatar + name text-[13px] font-medium -->
  </div>
</div>
```

**Breadcrumb pattern:** `text-gray-400` parent links → `w-3 h-3 text-gray-300` chevron → `font-semibold text-gray-900` current page → optional `Draft` badge

### Sidebar

**Width:** `w-[220px]`  
**Background:** `bg-white`  
**Border:** `border-r border-gray-100`  
**Scrollbar:** 5px wide, `#CBD5E1` thumb, transparent track

#### Workspace Switcher

Top of sidebar, `border-b border-gray-100`. Avatar is `w-7 h-7 rounded-full` with workspace color. Opens `#ws-modal-backdrop` (full-screen modal overlay) via `openWsModal()` — see [Workspace Switcher JS Pattern](#workspace-switcher-js-pattern).

#### Nav Items

```css
.nav-item {
  /* hover: background #EEF2FF, transition 100ms */
}
```

```html
<!-- Inactive item -->
<a class="nav-item flex items-center gap-2.5 px-3 h-9 rounded-lg text-sm text-gray-700">
  <svg class="w-4 h-4 text-gray-500 flex-shrink-0">…</svg>
  Label
</a>

<!-- Active item -->
<a class="flex items-center gap-2.5 px-3 h-9 rounded-lg text-sm font-medium text-gray-900"
   style="background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px;">
  <svg class="w-4 h-4 flex-shrink-0" style="color:#5B63F6">…</svg>
  Label
</a>
```

**Active nav rule:** `background:#EEF2FF`, `border-left:2px solid #5B63F6`, `padding-left:10px` (overrides `px-3`), icon color `#5B63F6`, label `font-medium text-gray-900`.

#### Section Headers

```html
<span class="text-[11px] font-medium text-gray-400 uppercase tracking-widest">Projects</span>
```

#### Submenu items

`pl-4` indent, `h-8 rounded-lg text-[13px] text-gray-600`. Icon `w-3.5 h-3.5` colored by document type:
- Dashboard → `#16A34A` (green)
- Chat/AI → `#5B63F6` (brand)
- Document/notes → `#F97316` (orange)

#### Upgrade Banner

```html
<div class="mx-3 mb-3 mt-1 rounded-xl px-3 py-2.5 flex items-center gap-2.5" style="background:#E8EEFF">
  <div class="w-8 h-8 rounded-full flex-shrink-0" style="background:#C7D2FE">
    <svg style="color:#4F6EF7">…sparkle icon…</svg>
  </div>
  <div>
    <p class="text-[12px] font-semibold" style="color:#3B4ECC">Explore free features</p>
    <p class="text-[11px]" style="color:#6B7ADE">Credit left: 15</p>
  </div>
</div>
```

---

### Buttons

#### Primary CTA

```html
<button class="flex items-center gap-1.5 px-3 h-9 rounded-lg text-[13px] font-semibold text-white hover:opacity-90 transition-opacity"
        style="background:#5B63F6;">
  Label
</button>
```

Heights: `h-7` (compact footer), `h-8` (standard), `h-9` (prominent CTA).

#### Secondary / Outline

```html
<button class="flex items-center gap-1.5 px-3 h-8 rounded-lg border border-gray-200 text-[13px] font-medium text-gray-600 hover:bg-gray-50 transition-colors">
  Label
</button>
```

#### Toolbar Button

Used in editor toolbars (topbar of canvas pages):

```css
.toolbar-btn {
  display: flex; align-items: center; gap: 6px;
  padding: 0 10px; height: 30px; border-radius: 8px;
  border: 1px solid #E5E7EB; background: #fff;
  font-size: 12px; font-weight: 500; color: #374151;
  cursor: pointer; transition: background-color 100ms ease;
}
.toolbar-btn:hover { background: #F9FAFB; }
```

#### Icon Button (topbar)

```html
<button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-colors">
  <svg class="w-4 h-4">…</svg>
</button>
```

---

### Badges & Chips

#### Brand badge

```html
<span class="text-[11px] font-semibold px-2 h-5 rounded flex items-center"
      style="background:#EEF2FF; color:#5B63F6;">New</span>
```

#### Status badge (Draft)

```html
<span class="px-1.5 h-[18px] rounded text-[10px] font-medium flex items-center"
      style="background:#F3F4F6; color:#6B7280;">Draft</span>
```

---

### Cards

#### Content card (generated output, KPI)

```html
<div class="bg-white border border-gray-200 rounded-xl overflow-hidden"
     style="box-shadow:0 1px 3px rgba(0,0,0,0.06),0 1px 2px rgba(0,0,0,0.04);">
  <!-- header: px-6 pt-5 pb-0 -->
  <!-- chart area: mx-6 my-5, rounded-lg, bg-[#F3F4F6] -->
  <!-- footer: px-6 pb-5, flex items-center justify-between -->
</div>
```

#### Dashboard chart card

```html
<div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
  <!-- chart.js canvas -->
</div>
```

#### Document card (recent-view)

`bg-white border border-gray-200 rounded-xl` with `shadow-card` at rest, `shadow-card-hover` on hover. Thumbnail area: `bg-[#F0F1F4] rounded-lg`.

---

### Avatars

| Size | Classes | Style | Use |
|---|---|---|---|
| 28px | `w-7 h-7 rounded-full` | `background:#3B5BDB` | Topbar user, nav workspace |
| 24px | `w-6 h-6 rounded-full` | workspace color | Workspace switcher list |
| 20px | `w-5 h-5 rounded-full` | `background:#5B63F6` | Card footer workspace |
| AI avatar | `w-[26px] h-[26px] rounded-[8px]` | `linear-gradient(140deg,#5B63F6,#7C6FF7)` | Chat AI messages |
| User avatar | `w-[26px] h-[26px] rounded-full` | `background:#3B5BDB` | Chat user messages |

Avatar initials: `text-[10–11px] font-bold text-white`.

---

### Chat UI

#### Message bubbles

```css
/* AI bubble */
.msg-bubble-ai {
  background: #F3F4F6;
  border-radius: 16px 16px 16px 4px; /* tail bottom-left */
  padding: 9px 12px;
  font-size: 12.5px; line-height: 1.65; color: #374151;
  max-width: 208px;
}

/* User bubble */
.msg-bubble-user {
  background: #5B63F6;
  border-radius: 16px 16px 4px 16px; /* tail bottom-right */
  padding: 9px 12px;
  font-size: 12.5px; line-height: 1.65; color: white;
  max-width: 208px;
}
```

Timestamps: `font-size:10px; color:#D1D5DB`. User timestamps right-aligned.

#### Thinking indicator

Three `chat-dot` spans in a `#F3F4F6` bubble with `border-radius:16px 16px 16px 4px`.

```css
@keyframes chatDot {
  0%, 100% { opacity: 0.2; transform: scale(0.85); }
  50%       { opacity: 1; transform: scale(1); }
}
.chat-dot { width:5px; height:5px; border-radius:50%; background:#A0AEC0; }
/* delays: 0s, 0.18s, 0.36s */
```

#### Suggestion chips

```css
.sugg-chip {
  width:100%; text-align:left;
  display:flex; align-items:center; gap:8px;
  padding:7px 10px; border-radius:10px;
  border:1px solid #E5E7EB; background:#F3F4F6;
  font-size:11.5px; font-weight:500; color:#4B5563;
  transition: all 130ms ease;
}
.sugg-chip:hover { background:#EEF2FF; border-color:#C7D2FE; color:#4338CA; }
```

#### Chat input

```css
.input-wrapper {
  border-radius: 12px;
  border: 1.5px solid #E5E7EB;
  background: white;
  transition: border-color 160ms, box-shadow 160ms;
}
.input-wrapper:focus-within {
  border-color: #5B63F6;
  box-shadow: 0 0 0 3px rgba(91,99,246,0.09);
}
```

Toolbar row inside the box: `background:#FAFAFA; border-top:1px solid #E5E7EB`.

---

### Canvas / Editor Surface

Used in KPI Creator and dashboard editor views:

```css
.canvas-grid {
  background-color: #F4F5F8; /* plain — no dot grid */
}
```

Canvas area classes: `flex-1 canvas-grid flex items-center justify-center overflow-auto relative`

**Empty state:** centered flex column, icon in `w-[72px] h-[72px] rounded-2xl bg-[#EEF2FF] border-[1.5px] border-[#C7D2FE]`, heading `text-[19px] font-bold`, sub-text `text-[13px] text-gray-400`.

**Generating overlay:** `absolute inset-0 bg-[#F8F9FC]/70 backdrop-blur-[1px]` with bouncing dots.

**Canvas dot-bounce animation (generating dots):**

```css
@keyframes dotBounce {
  0%, 100% { transform: translateY(0); opacity: 0.4; }
  50%       { transform: translateY(-5px); opacity: 1; }
}
.dot { width:7px; height:7px; border-radius:50%; background:#5B63F6; }
/* delays: 0s, 0.15s, 0.30s */
```

---

### Animations

```css
@keyframes fadeUp {
  from { opacity:0; transform:translateY(10px); }
  to   { opacity:1; transform:translateY(0); }
}
.fade-up { animation: fadeUp 0.3s ease-out forwards; }

@keyframes bubbleIn {
  from { opacity:0; transform:translateY(6px) scale(0.97); }
  to   { opacity:1; transform:translateY(0) scale(1); }
}
.bubble-in { animation: bubbleIn 0.22s ease-out forwards; }
```

- **`fade-up`** — generated canvas output cards
- **`bubble-in`** — chat message bubbles on append

---

### Scrollbar

Applied globally across all pages:

```css
::-webkit-scrollbar { width: 6px; }  /* 5px on chat page */
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

### Role Toggle Button Group

Used when choosing between a small fixed set of options (e.g. role selection in invite modals). Prefer over `<select>` for ≤4 options.

```html
<div class="grid grid-cols-3 gap-2" id="au-role-group">
  <button type="button" onclick="selectRole(this,'Viewer')" data-role="Viewer"
    class="au-role-btn h-9 rounded-lg border border-gray-200 text-[13px] font-medium text-gray-700 bg-white">Viewer</button>
  <button type="button" onclick="selectRole(this,'Editor')" data-role="Editor"
    class="au-role-btn h-9 rounded-lg border border-gray-200 text-[13px] font-medium text-gray-700 bg-white">Editor</button>
  <button type="button" onclick="selectRole(this,'Admin')" data-role="Admin"
    class="au-role-btn h-9 rounded-lg border border-gray-200 text-[13px] font-medium text-gray-700 bg-white">Admin</button>
</div>
<p class="text-[11px] text-gray-400 mt-1.5" id="role-hint">Viewer — can view dashboards only</p>
```

**Active state** (applied via JS):
```js
btn.style.background  = '#EEF2FF';
btn.style.borderColor = '#5B63F6';
btn.style.color       = '#5B63F6';
btn.style.fontWeight  = '600';
```

Hint line below the group updates to describe the selected role. Error state: hint text `color:#DC2626`.

---

### Invite / Add User Modal

Used when inviting a user to a workspace (invite by email — name unknown until accepted).

**Fields:**
1. **Email address** *(required)* — `type="email"`, `h-9 rounded-lg`
2. **Role** *(required)* — Role Toggle Button Group (see above)
3. **Personal message** *(optional)* — `<textarea rows="2">` with `resize-none`

**CTA:** "Send invite" with a send/paper-plane icon (`w-3.5 h-3.5`).

**On submit:** validates email + role; on success closes modal and optimistically adds a pending row to the members list.

**Pending invite row indicator:**
```html
<p class="text-[11px] text-gray-400 flex items-center gap-1">
  <span class="inline-block w-1.5 h-1.5 rounded-full bg-amber-400 flex-shrink-0"></span>
  Invite pending
</p>
```

Distinguishes from confirmed members who show their real name + email.

---

### Data Table with Scoped Scroll

Used in Datasources and Members panels. The **page itself never scrolls** — only the table body does.

**Flex chain required:**
```
body → main → .content-wrapper (overflow-hidden flex flex-col)
  → .settings-panel.active (flex flex-col flex-1 min-h-0)
    → .ws-panel.active (flex flex-col flex-1 min-h-0)
      → .panel-card (flex flex-col flex-1 min-h-0)
        → .table-wrapper (flex-1 min-h-0 overflow-y-auto)
```

**Table container:**
```html
<div class="rounded-xl border border-gray-200 flex-1 min-h-0 overflow-y-auto" style="overflow-x:hidden;">
  <table class="w-full text-[13px] table-fixed">
    <thead class="sticky top-0 z-10">
      <tr class="bg-gray-50 border-b border-gray-200">…</tr>
    </thead>
    <tbody>…</tbody>
  </table>
</div>
```

**Members list (non-table rows):**
```html
<div class="rounded-xl border border-gray-100 overflow-hidden flex flex-col flex-1 min-h-0">
  <div class="flex items-center px-4 h-8 bg-gray-50 border-b border-gray-100 flex-shrink-0">…</div>
  <div class="divide-y divide-gray-100 overflow-y-auto flex-1 min-h-0">…rows…</div>
</div>
```

Header row uses `flex-shrink-0` so it stays pinned while the rows div scrolls independently.

---

### Dashboard (`dashboard/index.html`)

- Toolbar bar below topbar: `h-12 px-5 border-b border-gray-100 bg-white` with date range selector, filter dropdowns, and action buttons
- Tab pills container: `bg-[#F3F4F6] rounded-full p-1`, active tab: `bg-white rounded-full shadow-sm`
- KPI stat cards: `bg-white border border-gray-200 rounded-xl p-5 shadow-card`
- Chart cards: `bg-white border border-gray-200 rounded-lg p-4`
- Grid: responsive `grid-cols-2 lg:grid-cols-4` for KPI stats; `grid-cols-2` for charts

### Chat (`chat/index.html`)

- Right panel `w-[300px]` with `border-l border-gray-100`
- Content area uses `flex-1` document canvas on the left
- Same chat bubble + input patterns as KPI Creator

### KPI Creator (`kpi-creator/index.html`)

#### Layout

Two-column split inside `<main>`:

```
┌─────────────────────────────────────┬──────────────┐
│  CANVAS (flex-1)                    │  CHAT PANEL  │
│  canvas-grid bg                     │  w-[300px]   │
│  flex items-center justify-center   │              │
│  overflow-auto relative             │              │
└─────────────────────────────────────┴──────────────┘
```

```html
<div class="flex-1 flex overflow-hidden">
  <div id="canvas-area" class="flex-1 canvas-grid flex items-center justify-center overflow-auto relative">…</div>
  <div class="w-[300px] min-w-[300px] flex flex-col border-l border-gray-100 bg-white">…</div>
</div>
```

#### Topbar Breadcrumb

Parent page link → `›` chevron → current page name → Draft badge:

```html
<a class="text-gray-400 hover:text-gray-700">Sales Overview</a>
<svg class="w-3 h-3 text-gray-300">…chevron…</svg>
<span class="font-semibold text-gray-900">New KPI</span>
<span class="ml-1 px-1.5 h-[18px] rounded text-[10px] font-medium flex items-center"
      style="background:#F3F4F6;color:#6B7280;">Draft</span>
```

#### Canvas Background

```css
.canvas-grid { background-color: #fcfdff; }
```

> Note: `#fcfdff` (near-white blue tint) — not `#F4F5F8`. Plain color, no dot grid.

#### Empty State

Centered flex column, shown until first message is sent. Hides via `.classList.add('hidden')` on send.

```html
<div id="empty-state" class="flex flex-col items-center text-center px-8 py-10 pointer-events-none select-none">
  <!-- Icon box -->
  <div class="w-[72px] h-[72px] rounded-2xl flex items-center justify-center mb-5"
       style="background:#EEF2FF; border:1.5px solid #C7D2FE; box-shadow:0 1px 3px rgba(91,99,246,0.10);">
    <svg class="w-8 h-8" style="color:#5B63F6">…sparkle icon…</svg>
  </div>
  <!-- Heading -->
  <h2 class="text-[19px] font-bold text-gray-900 mb-2">What would you like to measure?</h2>
  <!-- Sub-text -->
  <p class="text-[13px] text-gray-400 leading-relaxed">Pick an example below, or describe a metric in the chat panel.</p>

  <!-- Suggestion chips grid -->
  <div class="mt-3 w-full max-w-[520px] pointer-events-auto">
    <p class="text-[11px] font-semibold uppercase mb-3" style="color:#C4C9D4;letter-spacing:0.08em">Try an example</p>
    <div class="grid grid-cols-2 gap-2 text-left">
      <button class="sugg-chip" onclick="sendChip('…')">…</button>
      …6 chips total…
    </div>
  </div>
</div>
```

**Chip section label:** `text-[11px] font-semibold uppercase`, color `#C4C9D4`, `letter-spacing:0.08em`  
**Chips layout:** `grid grid-cols-2 gap-2`, `max-w-[520px]`  
**Chip style:** see `.sugg-chip` in the Component Patterns → Suggestion chips section (`background:#F3F4F6; border:1px solid #E5E7EB`)

#### Generating Overlay

Shown while AI is processing. Sits `absolute inset-0` over the canvas.

```html
<div id="generating-state" class="hidden absolute inset-0 flex flex-col items-center justify-center gap-3
     bg-[#F8F9FC]/70 backdrop-blur-[1px]">
  <div class="flex gap-2 mb-1">
    <span class="dot"></span><span class="dot"></span><span class="dot"></span>
  </div>
  <p class="text-[13px] font-medium text-gray-500">Generating your chart…</p>
</div>
```

Three `.dot` spans use `dotBounce` animation (see Animations section). Text: `text-[13px] font-medium text-gray-500`.

#### Generated Chart Card

Rendered inside `#chart-output` with `fade-up` animation. Max width `max-w-[860px]`. Each chart is stored as `{ prompt, source }` in a `charts[]` array; `currentChartIndex` tracks the active position.

```html
<div class="bg-gray-50 border border-gray-200 rounded-xl overflow-hidden"
     style="box-shadow:0 1px 3px rgba(0,0,0,0.06),0 1px 2px rgba(0,0,0,0.04);">

  <!-- Header: title (left) + source badge (right) -->
  <div class="flex items-start justify-between px-6 pt-5 pb-0">
    <h3 class="text-[18px] font-bold text-gray-900">{prompt text}</h3>
    <span class="inline-flex items-center gap-1 px-2 py-0.5 rounded-md text-[11px] font-medium mt-1 flex-shrink-0"
          style="background:{source.bg}; color:{source.color};">
      <!-- source icon 12×12 (file / database / api) -->
      {source.name}
    </span>
  </div>

  <!-- Chart placeholder: mx-6 my-5 h-[380px] -->
  <div class="mx-6 my-5 h-[380px] rounded-lg flex flex-col items-center justify-center gap-2.5"
       style="background:#F3F4F6;">
    <!-- Icon box: w-10 h-10 rounded-xl bg-[#EEF2FF] -->
    <p class="text-[12px] font-medium text-gray-400">Chart renders here in production</p>
    <p class="text-[11px] text-gray-300">Connect a real datasource to populate</p>
  </div>

  <!-- Footer: nav (left) + Add to Dashboard (right) -->
  <div class="flex items-center justify-between px-6 pb-5 pt-4 border-t border-gray-100">
    <!-- Chart navigation -->
    <div class="flex items-center gap-1.5">
      <button onclick="prevChart()" class="w-7 h-7 flex items-center justify-center rounded-lg border border-gray-200 text-gray-500">
        <!-- left chevron SVG 14×14 stroke 2.5 -->
      </button>
      <span class="text-[12px] font-semibold text-gray-500 tabular-nums px-1">1 / 1</span>
      <button onclick="nextChart()" class="w-7 h-7 flex items-center justify-center rounded-lg border border-gray-200 text-gray-500">
        <!-- right chevron SVG 14×14 stroke 2.5 -->
      </button>
    </div>
    <!-- CTA -->
    <button onclick="addToDashboard()" class="flex items-center gap-1.5 px-3 h-7 rounded-lg text-[11px] font-semibold text-white"
            style="background:#5B63F6;">
      <svg …plus icon…/> Add to Dashboard
    </button>
  </div>
</div>
```

**Card bg:** `bg-gray-50` (off-white to separate from `#fcfdff` canvas).  
**Footer button heights:** `h-7` (compact — smaller than standard `h-8`/`h-9`).  
**Nav buttons disabled state:** `opacity-40 cursor-not-allowed` + `disabled` attribute when at first/last chart.  
**Source badge:** same colour token system as datasource type badges in Settings — file=orange, api=green, database=indigo. See `resolveSource(prompt)` in JS for keyword mapping.

#### Source Detection Logic

| Prompt keywords | Source | Icon | bg | color |
|---|---|---|---|---|
| revenue, sales, q4, region | Q4 Revenue Sheet | file | `#FFF7ED` | `#F97316` |
| customer, retention, cohort, returning | CRM Export | database | `#EEF2FF` | `#5B63F6` |
| marketing, spend, roi | Marketing Sheet | file | `#FFF7ED` | `#F97316` |
| product, top, inventory | Sales API | api | `#F0FDF4` | `#22C55E` |
| event, user, session | User Events DB | database | `#EEF2FF` | `#5B63F6` |
| *(fallback)* | Analytics DB | database | `#EEF2FF` | `#5B63F6` |

#### Chat Panel

```
w-[300px] min-w-[300px]
border-l border-gray-100
bg-white
flex flex-col
```

No panel header. Three zones:

| Zone | Classes | Notes |
|---|---|---|
| Messages | `flex-1 overflow-y-auto px-3 py-4 space-y-3` | Scrolls independently |
| Input wrapper | `px-3 pb-3 pt-2.5 border-t border-gray-100 flex-shrink-0` | Never scrolls |

**Input box (`.input-wrapper`):**
```css
border-radius: 12px;
border: 1.5px solid #E5E7EB;
overflow: hidden;
background: white;
transition: border-color 160ms, box-shadow 160ms;
/* focus-within: border #5B63F6, box-shadow 0 0 0 3px rgba(91,99,246,0.09) */
```

**Textarea:** `rows="3"`, `text-[12.5px]`, `px-3 py-2.5`, `placeholder-gray-300`

**Toolbar row inside input box:**
```css
background: #FAFAFA;
border-top: 1px solid #E5E7EB;
padding: 8px 10px;
```
- Hint text: `text-[10px]`, color `#D1D5DB`, content `"↵ send · ⇧↵ newline"`
- Send button: `h-[22px] px-2.5 rounded-md text-[11px] font-semibold`, disabled state `opacity-40 cursor-not-allowed`

#### State Machine

```
empty-state visible
    ↓ (user sends)
empty-state hidden + generating-state visible + thinking bubble in chat
    ↓ (2.2s timeout)
generating-state hidden + chart-output visible (fade-up) + AI response bubble
    ↓ (user sends again)
new chart pushed to charts[] + renderChartAtIndex(latest) — nav counter updates
```

JS functions: `sendChip(text)` → `triggerSend(text)` → `appendUserBubble` + `appendThinkingBubble` → timeout → `removeThinkingBubble` + `appendAIBubble` + `showGeneratedChart`.  
`showGeneratedChart(prompt)` calls `resolveSource(prompt)` then pushes `{prompt, source}` to `charts[]` and calls `renderChartAtIndex(currentChartIndex)`.  
`prevChart()` / `nextChart()` update `currentChartIndex` and re-render.

#### Clear / Reset

`confirmClear()` checks if >1 AI/user bubble exists before prompting. `clearChat()` resets all three states, clears `charts.length = 0`, sets `currentChartIndex = -1`, and re-injects the greeting bubble.

### Recent View (`recent-view/index.html`)

- Content padding: `px-8`
- Display title `text-[28px] font-extrabold`
- Action shortcut cards: `rounded-xl border border-gray-100 bg-white p-4 hover:shadow-card-hover`
- Document grid: `grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4`

### Datasource (`datasource/index.html`)

- Provider cards with connection status badges
- Status: `connected` → `bg-green-50 text-green-700`, `error` → `bg-red-50 text-red-600`

### Settings / Profile (`settings-profile/index.html`)

#### Layout

The **content area does not page-scroll**. Instead, the viewport height is distributed via a flex chain so only the active panel's list/table scrolls:

```html
<main class="flex-1 flex flex-col overflow-hidden">
  <!-- breadcrumb topbar: flex-shrink-0 -->
  <div class="flex-1 overflow-hidden flex flex-col px-8 py-8">
    <!-- heading: flex-shrink-0 -->
    <!-- tab bar: flex-shrink-0 -->
    <!-- .settings-panel.active → flex flex-col flex-1 min-h-0 -->
  </div>
</main>
```

**CSS for panels:**
```css
.settings-panel { display: none; }
.settings-panel.active { display: flex; flex-direction: column; flex: 1; min-height: 0; }
.ws-panel { display: none; }
.ws-panel.active { display: flex; flex-direction: column; flex: 1; min-height: 0; }
```

#### Max-width

All three top-level sections (Profile, Workspace, Organisation) use **`max-w-2xl`** (672px). Never use different widths per tab — all must match.

#### Tab bars

**Top-level pill tabs** (Profile / Workspace / Organisation):
```css
.stab { cursor:pointer; border-radius:9999px; padding:0 16px; height:32px; font-size:14px; }
.stab.active { background:white; color:#111827; font-weight:600; border:1px solid #E5E7EB; box-shadow:0 1px 4px rgba(0,0,0,0.10); }
.stab:not(.active) { color:#6B7280; background:transparent; border:1px solid transparent; }
```
Container: `background:#F3F4F6; border-radius:9999px; padding:4px; width:fit-content`

**Sub-level underline tabs** (within Workspace / Organisation):
```css
.ws-utab { display:inline-flex; align-items:center; gap:6px; padding:0 4px; height:38px;
           font-size:14px; color:#6B7280; border:none; border-bottom:2px solid transparent; }
.ws-utab.active { color:#5B63F6; font-weight:600; border-bottom-color:#5B63F6; }
```
Container: `flex items-center gap-6 border-b border-gray-200 mb-7`

#### Form inputs

All inputs use `h-9` (never `h-10`). Standard pattern:
```html
<input class="w-full h-9 px-3 text-[13px] text-gray-900 bg-white border border-gray-200 rounded-lg
              focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent" />
```

#### Section cards

```html
<div class="bg-white border border-gray-200 rounded-xl shadow-card p-5 flex flex-col flex-1 min-h-0">
  …
</div>
```

Cards that contain scrollable lists must include `flex flex-col flex-1 min-h-0` to participate in the flex chain.

### Create Workspace (`create-workspace/index.html`)

- Centered card layout (no sidebar), `max-w-md` form card, `rounded-2xl`

---

## Workspace Switcher JS Pattern

All pages include the same workspace switcher **modal** with:
- `wsData` array with `{id, name, initial, color, current}` (6 entries, merged with `localStorage('aibii_workspaces')`)
- `openWsModal()` → adds `.open` to `#ws-modal-backdrop`, calls `renderWsModalList('')`, focuses search
- `closeWsModal(e)` → removes `.open` if click target is the backdrop itself
- `renderWsModalList(filter)` → renders filtered `<button>` rows into `#ws-modal-list`
- `filterWsList()` → reads search input, calls `renderWsModalList`
- `selectWorkspace(id)` → updates header avatar + name, closes modal
- `openNewWsModal()` / `closeNewWsModal()` → full-screen new-workspace form
- `cycleWsColor()` → cycles `wsColors` palette (7 colors) on avatar click
- `onWsNameInput(val)` → updates live preview name + avatar initial
- `createNewWs()` → pushes to `wsData`, calls `selectWorkspace`

**Modal structure:**
```html
<div id="ws-modal-backdrop" class="fixed inset-0 z-50 items-center justify-center"
     style="background:rgba(17,24,39,0.45);backdrop-filter:blur(2px)">
  <div id="ws-modal" class="bg-white rounded-lg w-full max-w-lg max-h-[620px] …">
    <!-- Header: "Switch Workspace" h2 + subtitle p + "New Workspace" button -->
    <!-- Search: #ws-search input -->
    <!-- List: #ws-modal-list -->
  </div>
</div>
```

**New Workspace form** (`#new-ws-modal`) is a separate full-screen overlay (`fixed inset-0 z-[60] bg:#F3F4F6`) with a mini Aibii topbar and a centered form card (`rounded-lg max-w-lg`).

`wsColors` palette: `#5B63F6 · #16A34A · #F97316 · #8B5CF6 · #EC4899 · #0EA5E9 · #EAB308`

---

## File Index

```
design-language/
├── README.md                      ← this file
├── index.html                     ← design language landing/overview
├── stitch-prompt.md               ← AI generation prompt template
│
├── dashboard/                     ← Main analytics dashboard
├── chat/                          ← AI chat interface
├── kpi-creator/                   ← KPI canvas editor with chat panel
├── create-form/                   ← New item creation form
├── create-workspace/              ← Workspace onboarding
├── recent-view/                   ← Home / recent documents view
│   └── tokens/
│       ├── colors.json            ← Full color token definitions
│       ├── typography.json        ← Font size, weight, line-height tokens
│       └── spacing.json           ← Spacing, radius, shadow, layout tokens
├── datasource/                    ← Data source connection manager
├── settings-profile/              ← User settings & profile
│   └── tokens/ …
└── sovereign-capital-gate/        ← Sovereign Capital Gate workspace
    └── tokens/ …
```

> The canonical token source is `recent-view/tokens/`. The `settings-profile/` and `sovereign-capital-gate/` token files follow the same schema.
