# Settings — Design Language

> Aibii AI Business Intelligence SaaS · Settings screen  
> Version 3.0 · May 2026

---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Design Tokens](#design-tokens)
4. [Typography Scale](#typography-scale)
5. [Spacing & Sizing](#spacing--sizing)
6. [Elevation & Borders](#elevation--borders)
7. [Layout Shell](#layout-shell)
8. [Breadcrumb Bar](#breadcrumb-bar)
9. [Page Header](#page-header)
10. [Tab Bars](#tab-bars)
11. [Settings Cards](#settings-cards)
12. [Form Elements](#form-elements)
13. [Buttons](#buttons)
14. [Data Tables](#data-tables)
15. [Filter Dropdowns](#filter-dropdowns)
16. [Badges & Status](#badges--status)
17. [Modals](#modals)
18. [Connector Browser Overlay](#connector-browser-overlay)
19. [Connector Wizard (3-Step)](#connector-wizard-3-step)
20. [Sidebar](#sidebar)
21. [States & Interactions](#states--interactions)
22. [Motion](#motion)
23. [JS Reference](#js-reference)

---

## Overview

The **Settings** screen uses the standard Aibii shell (220 px fixed sidebar + fluid scrollable content area). It has three top-level sections — **Profile**, **Workspace**, **Organisation** — each exposed through a **pill tab bar**. Workspace and Organisation each have their own nested **underline tab bar** for sub-sections. The shared **Connector Browser** overlay slides over the main area when adding a datasource.

Key design rules:
- Everything uses **Inter** at weights 400–800.
- All cards: `bg-white border border-gray-200 rounded-xl shadow-card p-5`.
- All inputs: `h-9 px-3 border border-gray-200 rounded-lg`, focus ring `ring-2 ring-indigo-400`.
- All primary buttons: `h-9 px-4 rounded-lg text-[13px] font-medium text-white bg-[#5B63F6]`.
- Content max-width for forms: `max-w-xl` (Profile) or `640px` (Connector wizard).

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)            │ MAIN CONTENT AREA (fluid)                      │
│                            │                                                │
│  [M] Manish kumar's Work…  │ ≡  ‹  ›   Settings                  ← Breadcrumb bar (h-11)
│  ─────────────────────     │──────────────────────────────────────────────  │
│  🕐 Recent                 │                                                │
│  ⊞  Create Dashboard      │ [icon] Profile                      ← Page h1 28px extrabold
│  💬 AI Chat               │         Manage your team and preferences here.  │
│  ─────────────────────     │                                                │
│  PROJECTS                  │ [ Profile ][ Workspace ][ Organisation ]       │ ← Pill tab bar
│  ▶ My Private Project 📌   │                                                │
│    ├ Q4 Strategy           │  ┌─────────────────────────────────────────┐   │
│    └ Revenue Overview      │  │ Picture                                 │   │ ← Settings card
│  ▶ Sovereign Capital Gate  │  │ [Avatar] [Upload a picture]             │   │   (rounded-xl shadow-card p-5)
│  + Create a project        │  │ ───────────────────────────             │   │
│  ─────────────────────     │  │ [First name]   [Last name]              │   │
│  👤 Shared with me         │  │ [Email]                                 │   │
│  ⚙  Settings  ← active     │  │                          [Save changes] │   │
│  ─────────────────────     │  └─────────────────────────────────────────┘   │
│  ✨ Explore free features  │                                                │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Design Tokens

### Colors

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Primary buttons, active tabs, focus rings, progress bars |
| `brand.secondary` | `#7C6FF7` | Gradient accents |
| `brand.upgrade` | `#7C3AED` | Upgrade CTA |
| `gray-900` | `#111827` | Page titles, input values, strong labels |
| `gray-700` | `#374151` | Secondary text |
| `gray-600` | `#4B5563` | Form labels |
| `gray-500` | `#6B7280` | Subtitles, inactive tab text, placeholder |
| `gray-400` | `#9CA3AF` | Icons (muted), metadata text |
| `gray-200` | `#E5E7EB` | Input borders, card borders, dividers |
| `gray-100` | `#F3F4F6` | Table headers, pill tab bar bg, row dividers |
| `gray-50` | `#F9FAFB` | Read-only input bg, table header bg, dropdown hover |
| `#EEF2FF` | indigo-50 | Active nav item bg, Owner badge bg, brand-tinted areas |
| `#F0FDF4` | green-50 | "Paid" / "Connected" badge bg |
| `#FEE2E2` | red-50 | "Error" badge bg |

### Shadows

| Token | Value | Usage |
|---|---|---|
| `shadow-card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | All settings cards |
| `shadow-card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Connector cards on hover |
| `shadow-2xl` | Tailwind default | Modals |
| Dropdown shadow | `0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)` | Filter dropdowns |

---

## Typography Scale

| Role | Size | Weight | Color | Class |
|---|---|---|---|---|
| Page title | 28px | 800 extrabold | `gray-900` | `text-[28px] font-extrabold text-gray-900` |
| Page subtitle | 14px (sm) | 400 | `gray-500` | `text-sm text-gray-500` |
| Card section header | 15px | 600 | `gray-900` | `text-[15px] font-semibold text-gray-900` |
| Modal title | 17px | 700 | `gray-900` | `text-[17px] font-bold text-gray-900` |
| Form label | 12px | 500 | `gray-600` | `text-[12px] font-medium text-gray-600` |
| Input value | 13px | 400 | `gray-900` | `text-[13px] text-gray-900` |
| Input placeholder | 13px | 400 | `gray-400` | `placeholder-gray-400` |
| Button text | 13px | 500 | varies | `text-[13px] font-medium` |
| Tab text | 14px | 400/600 | varies | `font-size:14px` (CSS class) |
| Table header | 11px | 600 | `gray-400` | `text-[11px] font-semibold text-gray-400 uppercase tracking-wide` |
| Table row | 13px | 400/500 | `gray-900` | `text-[13px] font-medium text-gray-900` |
| Meta / badge | 11px | 600 | varies | `text-[11px] font-semibold` |
| Sidebar nav | 14px (sm) | 400 | `gray-700` | `text-sm text-gray-700` |
| Sub-nav | 13px | 400 | `gray-600` | `text-[13px] text-gray-600` |

---

## Spacing & Sizing

| Element | Value |
|---|---|
| Sidebar width | 220px fixed |
| Breadcrumb bar height | `h-11` (44px) |
| Page content padding | `px-8 py-8` |
| Card padding | `p-5` (20px) |
| Card gap between sections | `mb-5` |
| Form field gap | `mb-4` |
| Label-to-input gap | `mb-1.5` (6px) |
| Input height | `h-9` (36px) |
| Input padding | `px-3` (12px) |
| Button height (primary) | `h-9` (36px) |
| Button padding (primary) | `px-4` |
| Small button (icon+text) | `h-8 px-3` |
| Nav item height | `h-9` (36px) |
| Nav item padding | `px-3` |
| Modal width | `w-[440px]` |
| Modal header padding | `px-6 pt-5 pb-4` |
| Modal body padding | `px-6 py-5` |
| Modal footer padding | `px-6 pb-5` |
| Connector browser padding | `px-8 py-8` |
| Wizard card max-width | `640px` |
| Profile panel max-width | `max-w-xl` (576px) |

---

## Elevation & Borders

### Cards
```
bg-white border border-gray-200 rounded-xl shadow-card p-5
```

### Inputs
```
border border-gray-200 rounded-lg
focus: ring-2 ring-indigo-400 border-transparent
```

### Modals
```
bg-white rounded-2xl shadow-2xl overflow-hidden
Overlay: rgba(17,24,39,0.4) backdrop-filter:blur(2px)
```

### Dropdowns
```
bg-white rounded-xl border border-gray-200
box-shadow: 0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)
```

### Tables
```
rounded-xl border border-gray-200 overflow-hidden
```

---

## Layout Shell

```html
<body class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <aside class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">
    <!-- sidebar -->
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <!-- breadcrumb bar (h-11) -->
    <!-- scrollable content (flex-1 overflow-y-auto px-8 py-8) -->
  </main>
</body>
```

The sidebar uses `bg-white border-r border-gray-100` — **not** the `#F8F9FC` sidebar token used in other screens. This keeps Settings feeling clean and form-like.

---

## Breadcrumb Bar

```html
<div class="flex items-center gap-2 px-8 h-11 border-b border-gray-100 flex-shrink-0">
  <!-- hamburger icon: text-gray-400 hover:text-gray-600, w-[18px] h-[18px] -->
  <!-- back chevron: w-4 h-4 -->
  <!-- forward chevron: w-4 h-4 -->
  <span class="text-[13px] text-gray-500">Settings</span>
  <!-- optional: › separator + sub-page title when connector browser is open -->
</div>
```

- Height: `h-11` (44px), `border-b border-gray-100`
- Three control icons: hamburger, back chevron, forward chevron — all `text-gray-400 hover:text-gray-600`
- Page name: `text-[13px] text-gray-500`
- When connector browser is open: appends `› Add Datasource` in same `text-[13px] text-gray-500`

---

## Page Header

```html
<div class="mb-6">
  <div class="flex items-center gap-2">
    <span class="flex-shrink-0">
      <!-- 24px icon, text-gray-900 stroke-1.5 -->
    </span>
    <h1 class="text-[28px] font-extrabold text-gray-900 leading-tight">Profile</h1>
  </div>
  <p class="mt-2 text-sm text-gray-500">Manage your team and preferences here.</p>
</div>
```

- Icon + title on same row with `gap-2`
- Icon: `w-6 h-6 text-gray-900 stroke-width="1.5"`
- Title: `text-[28px] font-extrabold text-gray-900`
- Subtitle: `mt-2 text-sm text-gray-500`
- Margin below: `mb-6`
- The icon and title **update dynamically** via JS when switching top-level tabs

---

## Tab Bars

### Pill Tab Bar (top-level: Profile / Workspace / Organisation)

```html
<div class="flex items-center gap-1 p-1 rounded-full mb-7 w-fit" style="background:#F3F4F6">
  <button class="stab active">Profile</button>
  <button class="stab">Workspace</button>
  <button class="stab">Organisation</button>
</div>
```

```css
.stab {
  cursor: pointer;
  border-radius: 9999px;
  padding: 0 16px;
  height: 32px;
  font-size: 14px;
  transition: background-color 120ms, box-shadow 120ms, color 120ms;
  white-space: nowrap;
}
.stab.active {
  background: white;
  color: #111827;
  font-weight: 600;
  border: 1px solid #E5E7EB;
  box-shadow: 0 1px 4px rgba(0,0,0,0.10);
}
.stab:not(.active) {
  color: #6B7280;
  background: transparent;
  border: 1px solid transparent;
}
.stab:not(.active):hover { color: #374151; }
```

- Container: `p-1 rounded-full bg-[#F3F4F6]`
- Pills sit flush with no gap between them except `gap-1`
- Active pill lifts with white bg + subtle border + shadow
- `mb-7` below the bar before content

### Underline Tab Bar (nested: General / Members / Integrations / Billing)

```html
<div class="flex items-center gap-6 border-b border-gray-200 mb-7">
  <button class="ws-utab active">
    <!-- w-4 h-4 icon --> General
  </button>
  <button class="ws-utab">Members</button>
  ...
</div>
```

```css
.ws-utab {
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 0 4px;
  height: 38px;
  font-size: 14px;
  color: #6B7280;
  background: transparent;
  border: none;
  border-bottom: 2px solid transparent;
  transition: color 120ms, border-color 120ms;
}
.ws-utab:hover { color: #374151; }
.ws-utab.active {
  color: #5B63F6;
  font-weight: 600;
  border-bottom-color: #5B63F6;
}
```

- Tabs sit on `border-b border-gray-200`
- Active state: `text-[#5B63F6] font-semibold border-bottom-color:#5B63F6`
- Each tab includes a `w-4 h-4` icon to the left of the label

---

## Settings Cards

The fundamental container for all setting panels:

```html
<div class="bg-white border border-gray-200 rounded-xl shadow-card p-5">
  <p class="text-[15px] font-semibold text-gray-900 mb-4">Section title</p>
  <!-- content -->
  <div class="flex justify-end pt-4 border-t border-gray-100">
    <button class="px-4 h-9 rounded-lg text-[13px] font-medium text-white" style="background:#5B63F6">
      Save changes
    </button>
  </div>
</div>
```

Rules:
- `rounded-xl` (12px) corner radius
- `shadow-card` elevation
- `p-5` internal padding
- Section header: `text-[15px] font-semibold text-gray-900 mb-4`
- Internal dividers: `border-t border-gray-100` (used before Save footer and inside avatar rows)
- Save footer always uses `pt-4 border-t border-gray-100 flex justify-end`

---

## Form Elements

### Text / Email / Password Input

```html
<div class="mb-4">
  <label class="block text-[12px] font-medium text-gray-600 mb-1.5">Field label</label>
  <input type="text" placeholder="Placeholder"
    class="w-full h-9 px-3 text-[13px] text-gray-900 bg-white border border-gray-200 rounded-lg
           placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent" />
</div>
```

### Textarea

```html
<div class="mb-4">
  <label class="block text-[12px] font-medium text-gray-600 mb-1.5">Description</label>
  <textarea rows="2" placeholder="..."
    class="w-full px-3 py-2 text-[13px] text-gray-900 bg-white border border-gray-200 rounded-lg
           placeholder-gray-400 resize-none focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent">
  </textarea>
</div>
```

### Select

```html
<select class="w-full h-9 px-3 text-[13px] text-gray-900 bg-white border border-gray-200 rounded-lg
               focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent">
  <option>Option</option>
</select>
```

### Read-only / URL Display Field

```html
<div class="flex items-center h-9 px-3 border border-gray-200 rounded-lg bg-gray-50 text-[13px] text-gray-500">
  aibii.com/<span class="text-gray-800 font-medium">slug</span>
</div>
```

---

## Billing Panel

The Billing sub-panel lives under **Organisation → Billing**. It is a single card that fills the available vertical space via the flex-chain scroll containment pattern (see [Scroll Containment](#scroll-containment)). All sections except the invoice list are `flex-shrink-0`; the invoice list grows to fill remaining height and scrolls internally.

### Plan Header

```html
<div class="flex items-start justify-between mb-3">
  <div>
    <!-- Pro badge -->
    <span class="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[11px] font-semibold mb-2"
          style="background:#EEF2FF; color:#5B63F6;">
      <!-- sparkle SVG 10×10 -->  Pro plan
    </span>
    <!-- Price -->
    <div class="flex items-baseline gap-1">
      <span class="text-[26px] font-extrabold text-gray-900 leading-none">$29</span>
      <span class="text-[13px] text-gray-400">/ month</span>
    </div>
    <p class="text-[12px] text-gray-400 mt-0.5">
      Next billing: <span class="font-medium text-gray-600">June 1, 2026</span>
    </p>
  </div>
  <button class="px-4 h-8 rounded-full border border-gray-200 text-[12px] font-medium text-gray-700 bg-white hover:bg-gray-50 mt-1">
    Manage plan
  </button>
</div>
```

- Plan badge: `rounded-full px-2 py-0.5 text-[11px] font-semibold` — same tokens as Owner badge but with a sparkle icon
- Price: `text-[26px] font-extrabold` — largest text in the panel
- "Manage plan": `h-8 rounded-full` pill button, ghost style

### Usage Stats

```html
<div class="grid grid-cols-3 gap-4 pb-4 border-b border-gray-100 flex-shrink-0">
  <!-- one stat cell -->
  <div>
    <p class="text-[11px] text-gray-400 mb-1">AI credits</p>
    <p class="text-[13px] font-semibold text-gray-900 mb-1.5">
      1,240 <span class="text-[11px] font-normal text-gray-400">/ 5,000</span>
    </p>
    <!-- progress bar -->
    <div class="h-1 rounded-full bg-gray-100 overflow-hidden">
      <div class="h-full rounded-full" style="width:25%; background:#5B63F6;"></div>
    </div>
  </div>
  <!-- repeat for Datasources, Workspaces -->
</div>
```

- Three columns: AI credits, Datasources, Workspaces
- Progress bar: `h-1 rounded-full bg-gray-100` track; fill uses `#5B63F6` (brand) or `#F97316` (orange) when nearing limit
- Used / total: `text-[13px] font-semibold` + `text-[11px] font-normal text-gray-400` inline

### Payment Method

```html
<div class="py-3 border-b border-gray-100 flex-shrink-0">
  <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-widest mb-2.5">
    Payment method
  </p>
  <div class="flex items-center justify-between">
    <div class="flex items-center gap-2">
      <!-- card icon 28×20 rounded-md bg-[#1A1F71] (Visa blue) -->
      <div>
        <p class="text-[13px] font-medium text-gray-900">Visa ···· 4242</p>
        <p class="text-[11px] text-gray-400">Expires 08/28</p>
      </div>
    </div>
    <button class="px-3 h-7 rounded-lg border border-gray-200 text-[12px] font-medium text-gray-600 hover:bg-gray-50">
      Update
    </button>
  </div>
</div>
```

- Section label style: `text-[10px] font-semibold text-gray-400 uppercase tracking-widest` — reused across all sub-section labels in the billing card
- Card logo container: `w-[28px] h-[20px] rounded-md` with brand-coloured background

### Recent Invoices

```html
<div class="pt-3 flex flex-col flex-1 min-h-0">
  <!-- header: label + year filter -->
  <div class="flex items-center justify-between mb-3 flex-shrink-0">
    <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-widest">Recent invoices</p>
    <!-- Year dropdown button -->
    <div class="relative flex-shrink-0">
      <button onclick="toggleBillingYearDropdown()" id="billing-year-btn"
        class="flex items-center gap-1.5 px-2.5 h-6 rounded-md text-[12px] font-medium text-gray-600 border border-gray-200 bg-white hover:bg-gray-50"
        style="min-width:68px; justify-content:space-between;">
        <span id="billing-year-label">2026</span>
        <!-- chevron-down SVG 10×10 stroke 2.5 -->
      </button>
      <div id="billing-year-dropdown"
        class="type-dropdown absolute right-0 top-full mt-1.5 z-50 rounded-xl py-0.5 bg-white overflow-y-auto"
        style="min-width:80px; max-height:160px; overflow-x:hidden; border:1px solid #E5E7EB;
               box-shadow:0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06);
               scrollbar-width:thin; scrollbar-color:#D1D5DB transparent;">
        <!-- year buttons -->
      </div>
    </div>
  </div>
  <!-- scrollable invoice list -->
  <div id="billing-invoice-list"
    class="overflow-y-auto overflow-x-hidden ds-filter-scroll flex-1 min-h-0 divide-y divide-gray-100">
  </div>
</div>
```

#### Year dropdown sizing
- Fixed `max-height: 160px` — shows ~4 years before scrolling
- `scrollbar-width: thin; scrollbar-color: #D1D5DB transparent` (Firefox)
- `-webkit-scrollbar { width: 4px }` (Chromium), same as `.ds-filter-scroll`

#### Invoice row (rendered by `renderBillingInvoices(year)`)

```html
<div class="flex items-center justify-between py-2.5 group hover:bg-gray-50 rounded-lg px-1 transition-colors">
  <div>
    <p class="text-[13px] font-semibold text-gray-900">{date}</p>
    <p class="text-[11px] text-gray-400 mt-0.5">Pro plan — monthly</p>
  </div>
  <div class="flex items-center gap-3">
    <span class="text-[13px] font-semibold text-gray-900">{amount}</span>
    <span class="text-[12px] font-medium" style="color:#16A34A;">paid</span>
    <!-- download icon — opacity-0 group-hover:opacity-100 -->
    <button class="w-6 h-6 flex items-center justify-center rounded-md text-gray-400 hover:text-indigo-500 hover:bg-indigo-50 opacity-0 group-hover:opacity-100 transition-all" title="Download PDF">
      <!-- download SVG 14×14 stroke 2 -->
    </button>
  </div>
</div>
```

- Date: `text-[13px] font-semibold text-gray-900`
- Sub-label "Pro plan — monthly": `text-[11px] text-gray-400`
- Amount: `text-[13px] font-semibold text-gray-900`
- Status: `text-[12px] font-medium color:#16A34A` (paid) or `#DC2626` (unpaid)
- Download button: hidden until row hover (`group-hover:opacity-100`)
- Row uses `px-1` (not `-mx-2`) to avoid horizontal overflow

---

## Scroll Containment

The Settings page uses a strict flex-chain to prevent any global page scroll. All scrollable areas are self-contained within their flex region.

### Flex chain (outer → inner)

```
body (h-screen overflow-hidden flex)
 └─ main (flex-1 flex flex-col overflow-hidden)
     └─ content div (flex-1 overflow-hidden flex flex-col px-8 py-6)
         ├─ page heading (flex-shrink-0)
         ├─ pill tab bar (flex-shrink-0)
         └─ .settings-panel.active (flex:1 min-height:0 display:flex flex-direction:column)
             └─ [for Workspace / Organisation: underline tab bar (flex-shrink-0)]
             └─ .ws-panel.active (flex:1 min-height:0 display:flex flex-direction:column)
                 └─ card (flex-1 min-h-0 flex flex-col — only on scroll-needing panels)
                     └─ [static sections: flex-shrink-0]
                     └─ scrollable section (flex-1 min-h-0 overflow-y-auto)
```

### CSS rules

```css
.settings-panel        { display: none; }
.settings-panel.active { display: flex; flex-direction: column; flex: 1; min-height: 0; }
.ws-panel              { display: none; }
.ws-panel.active       { display: flex; flex-direction: column; flex: 1; min-height: 0; }
```

`min-height: 0` is **required** on every flex child that participates in the chain — without it, the browser uses the natural content height as the minimum, causing overflow.

### Which panels use internal scroll

| Panel | Scrolling element | What scrolls |
|---|---|---|
| Workspace Members | `.divide-y > div` container | Member rows |
| Workspace Datasources | table wrapper `div` | Table rows |
| Organisation Members | `#org-members-list` | Member rows |
| Organisation Datasources | table wrapper `div` | Table rows |
| Organisation Billing | `#billing-invoice-list` | Invoice rows |

### Preventing horizontal scroll

- `html { overflow-x: hidden; }` — prevents the HTML root from scrolling horizontally if any absolutely positioned element escapes bounds
- All tables use `table-fixed` + percentage-based column widths — no unconstrained table column expansion
- Invoice rows use `px-1` hover padding (not negative margins) to stay within their container
- Datasource table wrappers have `overflow-x: hidden` inline

---

## Filter Dropdowns

All filter dropdowns share the same `.type-dropdown` pattern. They open downward, sit at `z-50`, and are dismissed by a shared click-outside listener.

```css
.type-dropdown       { display: none; }
.type-dropdown.open  { display: block; }
```

```html
<div class="relative">
  <button onclick="toggleXxxDropdown()"
    class="flex items-center gap-1.5 px-3 h-9 rounded-full text-[13px] font-medium text-gray-700 border border-gray-300 bg-white hover:bg-gray-50"
    style="width:120px; justify-content:space-between;">
    <!-- filter icon (brand colour) -->
    <span id="xxx-label">Category</span>
    <!-- chevron-down SVG -->
  </button>
  <div id="xxx-dropdown"
    class="type-dropdown absolute right-0 top-full mt-1.5 z-50 rounded-xl py-1.5 min-w-[160px] bg-white ds-filter-scroll"
    style="border:1px solid #E5E7EB; box-shadow:0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)">
    <button onclick="filterXxx('All')" class="w-full text-left px-4 py-2 text-[13px] text-gray-700 hover:bg-gray-50">All</button>
    <!-- connector items with colour dot -->
  </div>
</div>
```

### Scrollable dropdown (`.ds-filter-scroll`)

Used on all connector-category and member-role dropdowns:

```css
.ds-filter-scroll {
  max-height: 260px;
  overflow-y: auto;
  scrollbar-width: thin;
  scrollbar-color: #D1D5DB transparent;
}
.ds-filter-scroll::-webkit-scrollbar       { width: 4px; }
.ds-filter-scroll::-webkit-scrollbar-track { background: transparent; }
.ds-filter-scroll::-webkit-scrollbar-thumb { background: #D1D5DB; border-radius: 4px; }
```

The year dropdown in Billing uses `max-height: 160px` (shorter) but the same scrollbar styling.

### Connector dropdown population

Both Workspace and Organisation datasource filter dropdowns are dynamically populated from `DS_CONNECTORS` on `DOMContentLoaded`:

```js
buildDsConnectorDropdown('settings-ds-type-dropdown', 'filterSettingDsType');
buildDsConnectorDropdown('org-ds-type-dropdown',      'filterOrgDsType');
```

`buildDsConnectorDropdown` reads `Object.values(DS_CONNECTORS).flat()`, sorts alphabetically, and renders one button per connector with a colour dot matching the connector's category colour.


### File Upload Drop Zone

```html
<label class="flex flex-col items-center justify-center gap-2 w-full py-5 rounded-lg
              border-2 border-dashed border-gray-200 cursor-pointer
              hover:border-indigo-400 hover:bg-indigo-50 transition-colors">
  <!-- upload icon w-5 h-5 text-gray-400 -->
  <span class="text-[12px] text-gray-400">Click to upload or drag &amp; drop</span>
  <input type="file" class="hidden" accept="..." />
</label>
```

### Toggle Switch

```html
<div class="flex items-center justify-between py-2">
  <label class="block text-[12px] font-medium text-gray-600 mb-0">Label</label>
  <button type="button" role="switch"
    class="relative inline-flex w-10 h-5 rounded-full transition-colors flex-shrink-0"
    style="background:#E5E7EB"
    onclick="this.dataset.on=this.dataset.on?'':'1';
             this.style.background=this.dataset.on?'#5B63F6':'#E5E7EB';
             this.querySelector('span').style.transform=this.dataset.on?'translateX(18px)':'translateX(2px)'">
    <span class="inline-block w-4 h-4 bg-white rounded-full shadow transition-transform mt-0.5"
          style="transform:translateX(2px)"></span>
  </button>
</div>
```

### Inline-edit Name Field (avatar header row)

```html
<input type="text" value="Name"
  class="w-full text-[14px] font-semibold text-gray-900 border-none outline-none bg-transparent
         focus:bg-white focus:border focus:border-indigo-300 focus:rounded px-1" />
```

- Used only in the workspace/org header row next to the avatar
- Transparent bg at rest, gains white bg + indigo border on focus

### Two-column Grid Layout

```html
<div class="grid grid-cols-2 gap-4 mb-4">
  <!-- two fields side by side -->
</div>
```

---

## Buttons

### Primary (brand)

```html
<button class="px-4 h-9 rounded-lg text-[13px] font-medium text-white" style="background:#5B63F6">
  Save changes
</button>
```

### Primary with icon

```html
<button class="flex items-center gap-1.5 px-3 h-8 rounded-lg text-[13px] font-medium text-white"
        style="background:#5B63F6">
  <!-- w-3.5 h-3.5 + icon -->
  Add user
</button>
```

### Secondary (outlined)

```html
<button class="px-4 h-9 rounded-lg text-[13px] font-medium text-gray-600
               border border-gray-200 bg-white hover:bg-gray-50 transition-colors">
  Cancel
</button>
```

### Ghost (for modals, wizards — back/cancel)

Same as Secondary.

### Destructive / Disabled

- Disabled: same classes + `disabled` attr, `opacity:0.5; cursor:not-allowed`

### Button height summary

| Context | Height | Padding |
|---|---|---|
| Primary action (Save, Add) | `h-9` | `px-4` |
| Small inline (Add user, New member) | `h-8` | `px-3` |
| Icon-only close button | `w-8 h-8` | — |
| Filter pill button | `h-9` | `px-3` |

---

## Data Tables

Used in Members lists and Datasource integrations:

```html
<!-- Members list (avatar rows) -->
<div class="overflow-hidden rounded-xl border border-gray-100 flex-1">
  <!-- Header row -->
  <div class="flex items-center px-4 h-8 bg-gray-50 border-b border-gray-100">
    <span class="text-[11px] font-semibold text-gray-400 uppercase tracking-widest flex-1">User</span>
    <span class="text-[11px] font-semibold text-gray-400 uppercase tracking-widest w-24 text-right">Role</span>
  </div>
  <!-- Data rows -->
  <div class="divide-y divide-gray-100">
    <div class="flex items-center px-4 h-12">
      <!-- avatar w-7 h-7 rounded-full -->
      <!-- name text-[13px] font-medium gray-900, email text-[11px] gray-400 -->
      <!-- role badge or select -->
    </div>
  </div>
</div>

<!-- Datasource table (HTML table) -->
<div class="rounded-xl border border-gray-200 overflow-hidden" style="max-height:280px; overflow-y:auto;">
  <table class="w-full text-[13px] table-fixed">
    <thead class="sticky top-0 z-10">
      <tr class="bg-gray-50 border-b border-gray-200">
        <th class="text-left px-4 py-3 font-semibold text-gray-500 text-[11px] uppercase tracking-wide" style="width:40%">Name</th>
        <th class="text-left px-4 py-3 font-semibold text-gray-500 text-[11px] uppercase tracking-wide" style="width:20%">Connector</th>
        <th class="text-left px-4 py-3 font-semibold text-gray-500 text-[11px] uppercase tracking-wide" style="width:25%">Status</th>
        <th class="text-left px-4 py-3 font-semibold text-gray-500 text-[11px] uppercase tracking-wide" style="width:15%">Tables</th>
      </tr>
    </thead>
    <tbody>
      <tr class="border-b border-gray-100 hover:bg-gray-50 transition-colors">
        <td class="px-4 py-3 font-medium text-gray-900">...</td>
      </tr>
    </tbody>
  </table>
</div>
```

### Avatar

```html
<div class="w-7 h-7 rounded-full flex items-center justify-center text-white text-xs font-bold flex-shrink-0"
     style="background:#3B5BDB">M</div>
```

- Size: `w-7 h-7` in table rows, `w-12 h-12` in card headers
- Shape: `rounded-full` for users, `rounded-xl` for workspace/org logos
- Content: single uppercase initial, white text, `text-xs font-bold`

### Role Column

```html
<!-- Owner: non-editable badge -->
<span class="inline-flex items-center px-2 py-0.5 rounded-md text-[11px] font-semibold"
      style="background:#EEF2FF; color:#5B63F6">Owner</span>

<!-- User: editable select -->
<select class="text-[12px] text-gray-700 border border-gray-200 rounded-lg px-2 h-7 bg-white
               focus:outline-none focus:ring-1 focus:ring-indigo-400">
  <option>Owner</option>
  <option selected>User</option>
</select>
```

---

## Filter Dropdowns

Used in Workspace > Integrations, Organisation > Integrations, and the Connector Browser:

- The **Integrations** panels (Workspace and Organisation) filter by **Category** (Database / File / API / Cloud). The table column shows the specific **Connector** name (PostgreSQL, MySQL, REST API etc.).
- The **Connector Browser** picker also uses a Category filter.

```html
<!-- Trigger button -->
<button onclick="toggleDropdown()"
  class="flex items-center gap-1.5 px-3 h-9 rounded-full text-[13px] font-medium text-gray-700
         border border-gray-300 bg-white hover:bg-gray-50 transition-colors"
  style="width:120px; justify-content:space-between;">
  <!-- filter funnel icon style="color:#5B63F6" w-3.5 h-3.5 -->
  <span id="label">Category</span>
  <!-- chevron-down w-3 h-3 text-gray-400 -->
</button>

<!-- Dropdown panel -->
<div id="dropdown" class="type-dropdown absolute right-0 top-full mt-1.5 z-50 rounded-xl py-1.5 min-w-[160px] bg-white"
     style="border:1px solid #E5E7EB; box-shadow:0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06)">
  <button onclick="filter('All')" class="w-full flex items-center gap-2.5 px-4 py-2 text-[13px] text-gray-700 hover:bg-gray-50">
    <!-- icon --> All
  </button>
  <!-- more options -->
</div>
```

```css
.type-dropdown { display: none; }
.type-dropdown.open { display: block; }
```

- Trigger: `h-9 px-3 rounded-full border-gray-300` pill shape (not rectangular)
- Panel: `rounded-xl`, `mt-1.5` gap from trigger, `py-1.5` vertical padding
- Each item: `px-4 py-2 text-[13px] hover:bg-gray-50`, icon left-aligned with `gap-2.5`
- Label updates to selected value (e.g. "Database"); reverts to **"Category"** when "All" is selected
- Closes on outside click via shared `document.addEventListener('click', ...)` handler

---

## Badges & Status

### Owner badge (indigo)

```html
<span class="inline-flex items-center px-2 py-0.5 rounded-md text-[11px] font-semibold"
      style="background:#EEF2FF; color:#5B63F6">Owner</span>
```

### Pro Plan badge

```html
<span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-[12px] font-semibold"
      style="background:#EEF2FF; color:#5B63F6">
  <!-- star icon --> Pro Plan
</span>
```

### Type badge (table row)

```html
<!-- Database -->
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-[11px] font-semibold"
      style="background:#EEF2FF; color:#5B63F6">Database</span>
<!-- File -->
<span style="background:#FFF7ED; color:#F97316">File</span>
<!-- API -->
<span style="background:#F0FDF4; color:#22C55E">API</span>
```

### Status dot (Connected / Error)

```html
<span class="inline-flex items-center gap-1.5 text-[12px] font-medium" style="color:#16A34A">
  <span class="w-1.5 h-1.5 rounded-full flex-shrink-0" style="background:#16A34A"></span>
  Connected
</span>
```

### Invoice status

```html
<span class="inline-flex items-center gap-1 px-2 py-0.5 rounded text-[11px] font-medium"
      style="background:#F0FDF4; color:#16A34A">Paid</span>
```

---

## Modals

All modals follow this exact pattern:

```html
<!-- Overlay -->
<div id="modal-overlay"
  onclick="if(event.target===this)closeModal()"
  style="display:none; position:fixed; inset:0; z-index:60;
         background:rgba(17,24,39,0.4); backdrop-filter:blur(2px);
         align-items:center; justify-content:center;">

  <!-- Panel -->
  <div onclick="event.stopPropagation()"
       class="bg-white rounded-2xl shadow-2xl w-[440px] max-w-[92vw] overflow-hidden">

    <!-- Header -->
    <div class="flex items-center justify-between px-6 pt-5 pb-4 border-b border-gray-100">
      <h2 class="text-[17px] font-bold text-gray-900">Modal Title</h2>
      <button onclick="closeModal()"
        class="w-8 h-8 rounded-lg flex items-center justify-center text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors">
        <!-- X icon w-4 h-4 stroke-width="2" -->
      </button>
    </div>

    <!-- Body -->
    <div class="px-6 py-5">
      <!-- form fields -->
    </div>

    <!-- Footer -->
    <div class="flex items-center justify-end gap-2 px-6 pb-5">
      <button onclick="closeModal()"
        class="px-4 h-9 rounded-lg text-[13px] font-medium text-gray-600 border border-gray-200 hover:bg-gray-50 transition-colors">
        Cancel
      </button>
      <button onclick="submitModal()"
        class="px-5 h-9 rounded-lg text-[13px] font-semibold text-white hover:opacity-90 transition-opacity"
        style="background:#5B63F6">
        Add
      </button>
    </div>
  </div>
</div>
```

- Overlay: `position:fixed; inset:0; z-index:60; background:rgba(17,24,39,0.4); backdrop-filter:blur(2px)`
- Panel: `rounded-2xl shadow-2xl w-[440px] max-w-[92vw]`
- Header: `px-6 pt-5 pb-4 border-b border-gray-100` with title + close X
- Body: `px-6 py-5`
- Footer: `px-6 pb-5 flex justify-end gap-2`
- Opens by setting `display:flex` on the overlay element

---

## Connector Browser Overlay

Appears over the main content area (not full-screen — leaves sidebar exposed):

```html
<div id="connector-browser"
  style="display:none; position:fixed; left:220px; top:0; right:0; bottom:0; z-index:50;
         background:white; flex-direction:column;
         opacity:0; transform:translateY(8px);
         transition:opacity 200ms ease, transform 200ms ease;">

  <!-- Breadcrumb bar — identical to main breadcrumb -->
  <div class="flex items-center gap-2 px-8 h-11 border-b border-gray-100 bg-white flex-shrink-0">
    <!-- hamburger + back/forward + Settings › Add Datasource -->
  </div>

  <!-- Step 1: Connector picker -->
  <div id="cb-step-pick" class="flex-1 overflow-y-auto overflow-x-hidden">
    <div class="px-8 py-8 bg-white">
      <!-- Page heading (28px extrabold) -->
      <!-- Search input (h-9) + Category filter pill (label: "Category" → resets to "Category" on All) -->
      <!-- Connector groups: Database / File / API / Cloud -->
    </div>
  </div>

  <!-- Step 2: Credentials wizard -->
  <div id="cb-step-creds" class="flex-1 overflow-y-auto" style="display:none; background:white">
    <div class="px-8 py-8">
      <div id="cb-creds-inner"><!-- rendered by JS --></div>
    </div>
  </div>
</div>
```

- Left edge at `220px` (sidebar width) — sidebar remains visible
- Entry animation: `opacity 0→1 + translateY 8px→0` over 200ms ease
- Exit animation: reverse, then `display:none`

### Connector Cards (Step 1 grid)

```html
<button class="connector-card bg-white border border-gray-200 rounded-xl p-5
               flex flex-col items-center text-center shadow-card">
  <!-- icon container: w-12 h-12 rounded-xl flex items-center justify-center mb-3, bg from connector.bg -->
  <!-- connector name: text-[13px] font-semibold text-gray-900 -->
  <!-- connector subtitle: text-[11px] text-gray-500 mt-1 leading-relaxed -->
</button>
```

```css
.connector-card {
  transition: all 150ms ease-out;
  cursor: pointer;
}
.connector-card:hover {
  box-shadow: 0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05);
  border-color: rgba(91,99,246,0.35);
  transform: translateY(-1px);
}
```

- Grid: `grid grid-cols-4 gap-3`
- Icon bg colors are connector-specific (brand-accurate tints)
- Icon container: `w-12 h-12 rounded-xl` with brand background color

---

## Connector Wizard (3-Step)

After selecting a connector, the credentials area renders a 3-step flow dynamically (JS):

### Structure

```
[Connector icon + name heading]  ← 28px extrabold
[Configure step by step subtitle]

[Step indicator bar]
  ① General Info ─── ② Test Connection ─── ③ Select Tables

[Active step card: bg-white border border-gray-200 rounded-xl shadow-card p-5]
```

### Step Indicator

```html
<div class="flex items-center mb-7" style="max-width:640px">
  <!-- Step bubble: w-7 h-7 rounded-full -->
  <!--   Active/done: bg:#5B63F6 text-white -->
  <!--   Done (passed): bg:#5B63F6 text-white + checkmark SVG -->
  <!--   Future: bg:white border-2 border-gray-300 text-gray-400 -->
  <!-- Step label: text-[13px] font-medium gray-900 (active/done) or gray-400 (future) -->
  <!-- Connector line: flex-1 h-px bg-gray-200 mx-3 (done: bg:#5B63F6) -->
</div>
```

### Step 1 — General Info

- Connection Name input (required, enables Continue button)
- Description textarea (optional)
- Footer: `pt-4 border-t border-gray-100` + right-aligned Continue button
- Continue starts `opacity:0.5 cursor:not-allowed` until name is entered

### Step 2 — Connection Details

- Connector-specific fields from `CB_FIELDS` (host, port, database, username, password etc.)
- Half-width fields use `grid grid-cols-2 gap-4`
- Footer states:
  - **Idle**: Back + "Test Connection" buttons
  - **Loading**: spinner animation + "Testing connection…" text
  - **Success**: green checkmark + table preview + Re-test / "Continue — Select Tables"
  - **Error**: red error message + Retry

### Step 3 — Select Tables

- Select-all checkbox row: `bg-gray-50 border border-gray-100 rounded-lg`
- Table rows: `border border-gray-100 rounded-lg` with checkbox + monospace table name + row count
- Footer: `pt-4 border-t border-gray-100` + Back + "Connect Datasource →"

---

## Sidebar

```html
<aside class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100 overflow-y-auto">

  <!-- Workspace switcher (border-b border-gray-100) -->
  <!-- Primary nav items: h-9 rounded-lg text-sm text-gray-700, hover:bg-[#EEF2FF] -->
  <!-- Section label: text-[11px] font-medium text-gray-400 uppercase tracking-widest -->
  <!-- Projects: collapsible with ws-chevron, sub-items h-8 text-[13px] text-gray-600 -->
  <!-- Active item: bg:#EEF2FF border-left:2px solid #5B63F6 -->
  <!-- Bottom: Shared with me, Settings (active) -->
  <!-- Banner: bg:#E8EEFF rounded-xl px-3 py-2.5 with credit display -->

</aside>
```

- Nav item: `flex items-center gap-2.5 px-3 h-9 rounded-lg text-sm text-gray-700`
- Hover: `background:#EEF2FF`
- Active: `background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px`
- Dividers between sections: `mx-3 border-t border-gray-100`
- Scrollbar: custom 6px width, `#CBD5E1` thumb, transparent track

---

## States & Interactions

| State | Visual |
|---|---|
| Input default | `border-gray-200` |
| Input focus | `ring-2 ring-indigo-400 border-transparent outline-none` |
| Input disabled/readonly | `bg-gray-50 text-gray-500` |
| Button hover (primary) | `hover:opacity-90` |
| Button hover (secondary) | `hover:bg-gray-50` |
| Button disabled | `opacity-50 cursor-not-allowed` |
| Card hover (connector) | `translateY(-1px) + shadow-card-hover + border rgba(91,99,246,0.35)` |
| Nav item hover | `bg:#EEF2FF` |
| Dropdown item hover | `bg-gray-50` |
| Tab active (pill) | white bg + border + shadow |
| Tab active (underline) | `#5B63F6` text + `border-bottom: 2px solid #5B63F6` |

---

## Motion

| Element | Property | Duration | Easing |
|---|---|---|---|
| Nav item bg | background-color | 100ms | ease |
| Pill tab | background, box-shadow, color | 120ms | — |
| Underline tab | color, border-color | 120ms | — |
| Connector browser open | opacity + translateY(8px→0) | 200ms | ease |
| Connector browser close | opacity + translateY(0→8px) | 200ms | ease |
| Connector card hover | box-shadow + transform | 150ms | ease-out |
| Toggle switch knob | transform | 150ms | ease |
| Dropdown toggle | display (no animation) | — | — |
| Workspace submenu | max-height | — | — |
| Add workspace canvas | translateX(100%→0) | 280ms | ease |

---

## JS Reference

| Function | Description |
|---|---|
| `setTab(tab)` | Switches Profile / Workspace / Organisation. Updates heading icon + title. |
| `setWsTab(tab)` | Switches Workspace sub-tabs (info / users / datasources / billing) |
| `setOrgTab(tab)` | Switches Organisation sub-tabs (info / users / datasources) |
| `showAddDataSource()` | Alias for `openConnectorBrowser()` |
| `openConnectorBrowser()` | Shows `#connector-browser` with fade-in animation |
| `closeConnectorBrowser()` | Hides with fade-out animation |
| `cbGoBack()` | Back: wizard→picker or picker→close |
| `cbShowPicker()` | Resets to Step 1 picker, clears search + category filter |
| `cbSetCat(cat, label)` | Filters connector grid by category, updates dropdown label |
| `cbToggleCatDropdown()` | Toggles `#cb-cat-dropdown` `.open` class |
| `cbFilterSearch(q)` | Filters connector grid by search query |
| `cbRenderSections(q)` | Renders connector groups respecting `cbActiveCat` + search |
| `cbOpenCreds(name, cat)` | Opens 3-step wizard for selected connector |
| `cbValidateStep1()` | Enables/disables Continue button based on name input |
| `cbGoStep(n)` | Navigates wizard to step n, updates step indicators |
| `cbTestConn()` | Simulates connection test (1.6s), shows success/error state |
| `cbResetConnTest()` | Resets Step 2 back to idle state |
| `cbGoToSelectTables()` | Advances to Step 3, populates table list |
| `cbToggleAllTables(cb)` | Select/deselect all table checkboxes |
| `cbFinishConnector()` | Closes browser (hook point for real save logic) |
| `renderSettingsDsTable()` | Renders Workspace datasources table |
| `filterSettingDs(q)` | Search filter for workspace datasources |
| `filterSettingDsType(t)` | Category filter for workspace datasources (Database/File/API/Cloud) |
| `renderOrgDsTable()` | Renders Organisation datasources table |
| `filterOrgDs(q)` | Search filter for org datasources |
| `filterOrgDsType(t)` | Category filter for org datasources (Database/File/API/Cloud) |
| `filterOrgMembers(q)` | Search filter for org members list |
| `openNewMemberModal()` | Opens New Member modal |
| `closeNewMemberModal()` | Closes New Member modal |
| `addOrgMember()` | Validates + appends new member row to org list |
| `openWsModal()` / `closeWsModal(e)` | Workspace switcher modal lifecycle |
| `renderWsModalList(filter)` | Renders filtered workspace rows in `#ws-modal-list` |
| `filterWsList()` | Reads `#ws-search`, calls `renderWsModalList` |
| `selectWorkspace(id)` | Switches active workspace, updates sidebar header |
| `openNewWsModal()` / `closeNewWsModal()` | New Workspace full-screen lifecycle |
| `cycleWsColor()` | Cycles avatar color through 7 presets |
| `onWsNameInput(val)` | Live preview for workspace name + avatar letter |
| `createNewWs()` | Pushes new workspace to `wsData`, selects it |
| `toggleWorkspace(id)` | Sidebar project chevron expand/collapse |

---

## Workspace Switcher Modal (`#ws-modal-backdrop`)

Opened by `openWsModal()`. Backdrop: `rgba(17,24,39,0.45) backdrop-filter:blur(2px)`. Click backdrop → `closeWsModal(event)`.

```
#ws-modal  rounded-lg max-w-lg max-height:620px bg-white
  Header
    h2  "Switch Workspace"  text-[15px] font-semibold text-gray-900
    p   "Select a workspace to switch to"  text-[12px] text-gray-400
    button  "New Workspace"  bg:#5B63F6 hover:#4850e4  → openNewWsModal()
  Search  #ws-search  oninput="filterWsList()"
  List    #ws-modal-list  rendered by renderWsModalList(filter)
```

`wsData` array (6 entries, merged with `localStorage('aibii_workspaces')`):

| `id` | Name | Initial | Color | Current |
|---|---|---|---|---|
| `ws-manish` | Manish kumar's Workspace | M | `#3B5BDB` | ✓ |
| `ws-scg` | Sovereign Capital Gate | S | `#5B63F6` | — |
| `ws-design` | Design System | D | `#16A34A` | — |
| `ws-data` | Data Analytics | A | `#F97316` | — |
| `ws-prod` | Product Research | P | `#8B5CF6` | — |
| `ws-mkt` | Marketing Hub | H | `#EC4899` | — |

## New Workspace (`#new-ws-modal`, full-screen)

`hidden fixed inset-0 z-[60]`, `background:#F3F4F6` with mini Aibii topbar (close ×).
Form card: `rounded-lg max-w-lg px-7 py-8`.
- `#ws-preview-avatar` `w-11 h-11 rounded-xl` → `cycleWsColor()`; hint `"Click avatar to change color"`
- `#ws-preview-name` live preview
- `#new-ws-name` → `onWsNameInput(val)`; Enter → `createNewWs()`
- `#new-ws-desc` textarea (optional)
- Cancel + Create buttons (Create: `bg:#5B63F6 hover:#4850e4`)

`wsColors` palette (7): `#5B63F6 · #16A34A · #F97316 · #8B5CF6 · #EC4899 · #0EA5E9 · #EAB308`


All section headings use `text-[15px] font-semibold text-gray-900` — matching the datasource screen — instead of the older all-caps label pattern.

---

## Screen Anatomy

```
┌─────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (220px)          │  CONTENT AREA (fluid)                    │
│                          │                                          │
│  [M] Manish kumar's...   │  ≡  ‹  ›  Settings       ← breadcrumb   │
│  ─────────────────────   │                                          │
│  Recent                  │  ○  Profile               ← heading      │
│  Create Dashboard        │  Manage your team…                       │
│  AI Chat                 │                                          │
│  ─────────────────────   │  [ Profile ]  Workspace   ← pill tabs    │
│  PROJECTS                │                                          │
│  ▶ My Private Project ◉  │  ┌─────────────────────────────────────┐ │
│    ├ Q4 Strategy         │  │  panel content (per active tab)     │ │
│    ├ Revenue Overview    │  └─────────────────────────────────────┘ │
│    └ …                   │                                          │
│  ▶ Sovereign Capital Gate│                                          │
│  + Create a project      │                                          │
│  ─────────────────────   │                                          │
│  Shared with me          │                                          │
│  ●  Settings   ← ACTIVE  │                                          │
│  ─────────────────────   │                                          │
│  ✦ Explore free features │                                          │
└──────────────────────────┴──────────────────────────────────────────┘
```

---

## Design Tokens

### Colors

| Token | Hex | Usage |
|---|---|---|
| `brand-primary` | `#5B63F6` | Buttons, active nav border, focus rings, pin icon |
| `bg-base` | `#FFFFFF` | Page, sidebar, card backgrounds |
| `bg-hover` | `#EEF2FF` | Nav hover, active nav item |
| `bg-tab-container` | `#F3F4F6` | Pill tab bar background |
| `bg-tab-active` | `#FFFFFF` | Active pill tab |
| `bg-gray-50` | `#F9FAFB` | Table headers, read-only inputs |
| `bg-explore` | `#E8EEFF` | Explore banner |
| `bg-billing-banner` | `linear-gradient(135deg, #EEF2FF, #F5F3FF)` | Billing plan card |
| `text-primary` | `#111827` | Headings, input values, active tab |
| `text-secondary` | `#6B7280` | Inactive tabs, nav labels |
| `text-muted` | `#9CA3AF` | Placeholder, meta |
| `text-brand` | `#5B63F6` | Owner badge, billing plan label |
| `border-default` | `#E5E7EB` | Card borders, input borders |
| `border-subtle` | `#F3F4F6` | Dividers, table separators |
| `active-nav-border` | `#5B63F6` | 2px left border on active nav item |
| `status-connected` | `#16A34A` on `#F0FDF4` | Connected status badge |
| `status-error` | `#DC2626` on `#FEF2F2` | Error status badge |
| `status-syncing` | `#2563EB` on `#EFF6FF` | Syncing status badge |

### Shadows

```css
/* Card */
box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);

/* Dropdown */
box-shadow: 0 4px 16px rgba(0,0,0,0.12), 0 1px 4px rgba(0,0,0,0.06);
```

---

## Typography

| Role | Size | Weight | Usage |
|---|---|---|---|
| Page title | 28px | 800 | `<h1>` — updates per tab |
| Section title | 15px | 600 | Card section headings |
| Subtitle | 14px | 400 | Page subtitle under h1 |
| Tab label | 14px | 500 / 600 | Pill tab buttons |
| Field label | 12px | 500 | Form `<label>` elements |
| Body / input | 13px | 400 | Input values, table rows |
| Caption | 11–12px | 400 | Meta text, badges, timestamps |
| Table header | 11px | 600 | Uppercase column headers |

```css
font-family: 'Inter', system-ui, -apple-system, sans-serif;
```

---

## Layout & Spacing

| Property | Value |
|---|---|
| Sidebar width | `220px` fixed |
| Content padding | `px-8 py-8` |
| Card padding | `p-5` |
| Profile panel max-width | `max-w-xl` |
| Workspace cards | full-width |
| Grid gap (row 1 columns) | `gap-5` |
| Card border-radius | `rounded-xl` (12px) |
| Input / button border-radius | `rounded-lg` (8px) |
| Input height | `h-9` (36px) |
| Button height | `h-8` – `h-9` (32–36px) |

---

## Sidebar

Identical to `recent-view` sidebar. **Settings** is the active nav item.

```
Active nav style:
  background: #EEF2FF
  border-left: 2px solid #5B63F6
  padding-left: 10px
  font-weight: 500

Nav hover:
  .nav-item:hover { background-color: #EEF2FF; }
```

### Structure

| Zone | Details |
|---|---|
| Workspace switcher | `px-4 py-3`, avatar `w-7 h-7 #3B5BDB`, name, chevron |
| Primary nav | Recent · Create Dashboard · AI Chat |
| Projects section | My Private Project (pinned ◉) → items; Sovereign Capital Gate → items; + Create a project |
| Spacer | `flex-1` |
| Bottom nav | Shared with me · **Settings (active)** |
| Explore banner | `#E8EEFF` bg, sparkles icon, "Explore free features" + "Credit left: 15" |

---

## Breadcrumb Bar

```
≡   ‹   ›   Settings
```

| Property | Value |
|---|---|
| Height | `h-11` (44px) |
| Padding | `px-8` |
| Border | `border-b border-gray-100` |
| Label | `text-[13px] text-gray-500` |

---

## Page Header

Inline icon + `<h1>` + subtitle. Icon and title update on tab switch.

```
[icon]  Profile
        Manage your team and preferences here.
```

| Property | Value |
|---|---|
| Icon | `w-6 h-6 text-gray-900` inline SVG (no background box) |
| Title | `text-[28px] font-extrabold text-gray-900` |
| Subtitle | `text-sm text-gray-500 mt-2` |
| Wrapper margin-bottom | `mb-6` |

**Icon per tab:**

| Tab | Icon |
|---|---|
| Profile | Person / user outline |
| Workspace | 4-square grid |

---

## Tab Bar

Pill-style. Container: `#F3F4F6` bg, `rounded-full`, `p-1`, `gap-1`.

| State | Bg | Border | Text | Weight |
|---|---|---|---|---|
| Active | `#FFFFFF` | `1px solid #E5E7EB` | `#111827` | 600 |
| Inactive | transparent | transparent | `#6B7280` | 400 |
| Inactive hover | transparent | transparent | `#374151` | 400 |

```css
.stab { height: 32px; padding: 0 16px; border-radius: 9999px; font-size: 14px; }
```

Tabs: **Profile** · **Workspace**

---

## Profile Tab

Single card (`max-w-xl`, `shadow-card`).

### Picture
- Avatar placeholder: `w-16 h-16 rounded-xl border border-gray-200 bg-gray-100`
- "Upload a picture" button: `border border-gray-200 rounded-lg h-9 px-4 text-[13px] font-medium text-gray-700`

### Name fields
- `grid grid-cols-2 gap-4`
- Label: `text-[12px] font-medium text-gray-600 mb-1.5`
- Input: `h-9 border border-gray-200 rounded-lg px-3 text-[13px]`

### Email
- Full-width, value visually dimmed (`text-gray-400`)

### Save
- Right-aligned, `border-t border-gray-100 pt-4`
- `px-4 h-9 rounded-lg text-[13px] font-medium text-white background:#5B63F6`

---

## Workspace Tab

Three full-width cards stacked vertically.

### Card 1 — Row with two columns

**Left — Workspace info**
- Avatar `w-12 h-12 rounded-xl #3B5BDB` + editable name input + meta ("Created April 2024 · 3 members")
- Workspace URL (read-only display box)
- Description `<textarea rows=2>`
- Save button (right-aligned, `border-t`)

**Right — Users with access**
- Header: `text-[15px] font-semibold text-gray-900` + **Add user** button (`#5B63F6`)
- Search input: `h-9 rounded-lg bg-white border border-gray-200`
- User table: avatar + name + email | Role column
  - Owner: badge `background:#EEF2FF color:#5B63F6` (non-editable)
  - Others: `<select>` (Admin / Editor / Viewer), `h-7 rounded-lg`

### Card 2 — Data Sources

- Section title: `text-[15px] font-semibold text-gray-900`
- **Add a datasource** button (right of title, `#5B63F6`)
- **Search + Type filter row:**
  - Search input: `h-9 pl-9 rounded-lg border border-gray-200`
  - Type dropdown button: `width:120px`, `rounded-lg`, `border border-gray-200`
  - Dropdown: `rounded-xl`, 4 options — All / Database / File / API (each with icon)
- **Table:** `table-fixed`, `max-height:280px overflow-y:auto`, sticky `thead`
  - Columns: Name (38%) · Type (22%) · Status (25%) · Tables (10%)
  - Status badges use `STATUS_STYLE` map (Connected / Error / Syncing)
- **Add hint panel:** dashed indigo border, `bg-indigo-50`, dismissible

**Data:** 5 sample rows — Q4 Revenue Sheet (File), Analytics DB (Database), Sales API (API), CRM Export (File), User Events DB (Database)

### Card 3 — Billing

- Pro Plan badge (`#EEF2FF / #5B63F6`)
- **Plan card** (gradient `#EEF2FF → #F5F3FF`):
  - "Pro · $29 / month" + next billing date + **Manage plan** button
  - 3 usage meters: AI Credits · Datasources · Workspaces (indigo progress bars)
- **Payment method row:** Visa card icon + last 4 + expiry + **Update** button
- **Recent invoices:** 2 rows (date · amount · Paid badge · Download link)

---

## States & Interactions

| Interaction | Behaviour |
|---|---|
| Tab switch | `setTab(id)` — toggles `.active` on pill + panel; updates `h1` and heading icon |
| Project submenu | `toggleWorkspace(id)` — `.ws-submenu.open` show/hide, `.ws-chevron` rotates 90° |
| Nav hover | `background-color: #EEF2FF` |
| Add datasource | `showAddDataSource()` — toggles `hidden` on `#add-ds-hint` |
| DS search | `filterSettingDs(q)` — filters table rows by name/type |
| DS type filter | `filterSettingDsType(type)` — filters table by type, updates button label |
| DS type dropdown | `toggleSettingDsTypeDropdown()` — toggle + outside-click close |
| Create a project | `openNewProjectModal()` — placeholder |

---

## Motion

| Element | Property | Duration | Easing |
|---|---|---|---|
| Nav item hover | `background-color` | 100ms | ease |
| Pill tab | `background, color, box-shadow` | 120ms | ease |
| Workspace chevron | `transform: rotate(90deg)` | 150ms | ease |
| Toggle knob | `transform` | 150ms | ease |
| Inputs / buttons | `border-color` | — | transition-colors |

---

## JS Reference

```js
// Tab switching
const TABS = ['profile', 'workspace'];
const TITLES = { profile: 'Profile', workspace: 'Workspace' };
const ICONS = { profile: '…svg…', workspace: '…svg…' };
function setTab(active) { … }

// Datasource table
const SETTING_DS_DATA = [ … ];       // 5 sample rows
const TYPE_ICONS = { Database, File, API };
const STATUS_STYLE = { Connected, Error, Syncing };
function renderSettingDsTable() { … }
function filterSettingDs(q) { … }
function filterSettingDsType(type) { … }
function toggleSettingDsTypeDropdown() { … }
function showAddDataSource() { … }

// Sidebar
function toggleWorkspace(id) { … }   // expand/collapse project submenu
function openNewProjectModal() { … } // placeholder

// Init
document.addEventListener('DOMContentLoaded', () => {
  renderSettingDsTable();
});
```

---

## File Structure

```
settings-profile/
├── index.html   ← single-file SPA (Tailwind CDN, no build step)
└── README.md    ← this file
```

---

*Aibii Design Language v2.0 · Settings · May 2026*


---

## Table of Contents

1. [Overview](#overview)
2. [Screen Anatomy](#screen-anatomy)
3. [Color System](#color-system)
4. [Typography](#typography)
5. [Spacing & Layout](#spacing--layout)
6. [Border Radius & Elevation](#border-radius--elevation)
7. [Iconography](#iconography)
8. [Sidebar](#sidebar)
9. [Components](#components)
   - [Breadcrumb Bar](#breadcrumb-bar)
   - [Page Header with Icon](#page-header-with-icon)
   - [Settings Tab Bar](#settings-tab-bar)
   - [Profile Tab](#profile-tab)
   - [Workspace Tab](#workspace-tab)
10. [States & Interactions](#states--interactions)
11. [Motion & Animation](#motion--animation)
12. [Design Principles](#design-principles)
13. [File Structure](#file-structure)

---

## Overview

The **Settings** page is the user and workspace configuration surface of the Aibii platform. It uses the same shell (sidebar + content area) as all views but introduces a **pill tab bar** for navigating two distinct panels: **Profile** and **Workspace**. The Workspace panel contains all workspace-level settings including workspace info, users with access, data sources, billing, and integrations.

The heading icon and page title update dynamically with each active tab.

---

## Screen Anatomy

```
+-------------------------------------------------------------------------+
| SIDEBAR (220px, white)    |  CONTENT AREA (fluid, white bg)             |
|                           |                                             |
|  [M] Manish kumar's Work  |  =  <  >  Settings        <- Breadcrumb    |
|  ----------------------   |                                             |
|  (clock) Recent           |  [icon]  Profile           <- Page heading  |
|  [grid] Create Dashboard  |  Manage your team and preferences here.    |
|  [chat] AI Chat           |                                             |
|  ----------------------   |  [ Profile   Workspace ]   <- Pill tabs     |
|  PROJECTS            [o]  |                                             |
|  > My Private Project [P] |  +------ Panel content per active tab ----+|
|    | Q4 Strategy           |  |  (see per-tab sections below)          ||
|    | Revenue Overview      |  +----------------------------------------+|
|  > Sovereign Capital Gate |                                             |
|    | Chat                  |                                             |
|    | Dashboard             |                                             |
|    | Document              |                                             |
|  + Create a project       |                                             |
|  ----------------------   |                                             |
|  (people) Shared with me  |                                             |
|  (cog) Settings  <- ACTIVE|                                             |
|  ----------------------   |                                             |
|  [*] Explore free features|                                             |
+---------------------------+---------------------------------------------+
```

---

## Color System

| Token | Hex | Usage |
|---|---|---|
| `color-brand-primary` | `#5B63F6` | Active tab, buttons, focus rings, active nav border, pin icon |
| `color-bg-base` | `#FFFFFF` | Page background, sidebar background, card backgrounds |
| `color-bg-hover` | `#EEF2FF` | Nav item hover, active nav item, heading icon bg |
| `color-bg-tab-container` | `#F3F4F6` | Pill tab bar container |
| `color-bg-tab-active` | `#FFFFFF` | Active pill tab background |
| `color-bg-input` | `#FFFFFF` | Editable text inputs |
| `color-bg-input-disabled` | `#F9FAFB` | Read-only inputs, URL display |
| `color-bg-gray-50` | `#F9FAFB` | Table headers, datasource cards |
| `color-bg-explore` | `#E8EEFF` | Explore banner background |
| `color-bg-explore-icon` | `#C7D2FE` | Explore banner icon container |
| `color-billing-banner` | `#E8EEFF` | Billing free plan banner bg |
| `color-billing-banner-border` | `#C7D2FE` | Billing banner border |
| `color-text-primary` | `#111827` | Page title, input values, active tab |
| `color-text-secondary` | `#6B7280` | Inactive tabs, labels, nav items |
| `color-text-muted` | `#9CA3AF` | Placeholder text, meta info |
| `color-text-brand` | `#5B63F6` | Owner badge, active heading icon, billing plan |
| `color-text-danger` | `#EF4444` | Danger zone text, delete button |
| `color-border-default` | `#E5E7EB` | Input borders, card borders, active tab border |
| `color-border-subtle` | `#F3F4F6` | Dividers, table row separators |
| `color-active-nav-border` | `#5B63F6` | 2px left border on active Settings nav item |
| `color-workspace-avatar` | `#3B5BDB` | Workspace avatar background |
| `color-integration-connected` | `#16A34A` | Connected badge text |
| `color-integration-connected-bg` | `#F0FDF4` | Connected badge background |

---

## Typography

| Token | Size | Weight | Usage |
|---|---|---|---|
| `type-page-title` | 28px | 800 ExtraBold | Page heading ("Profile", "Workspace") |
| `type-subtitle` | 14px | 400 Regular | Page subtitle |
| `type-tab` | 14px | 500/600 Medium/SemiBold | Pill tab labels (active = 600) |
| `type-section-label` | 11px | 600 SemiBold | Uppercase card section labels |
| `type-field-label` | 12px | 500 Medium | Form field labels |
| `type-input` | 13–14px | 400/500 | Input values |
| `type-body` | 13px | 400 Regular | General body text, table rows |
| `type-caption` | 11–12px | 400 Regular | Meta text, badges, timestamps |

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

---

## Spacing & Layout

| Token | Value | Usage |
|---|---|---|
| `space-1` | 4px | Micro gaps |
| `space-2` | 8px | Icon-to-label, inline element gaps |
| `space-3` | 12px | Compact padding |
| `space-4` | 16px | Standard padding, tab horizontal padding |
| `space-5` | 20px | Card padding (`p-5`) |
| `space-6` | 24px | Gap between heading and tabs, tabs and content |
| `space-8` | 32px | Content area horizontal padding |

### Content Layout

- Sidebar: **220px** fixed width
- Content area padding: `px-8 py-7` (32px / 28px)
- Profile panel: `max-w-xl` single-column
- Workspace panel: full-width rows with responsive columns

---

## Border Radius & Elevation

| Token | Value | Used on |
|---|---|---|
| `radius-lg` | `rounded-lg` (8px) | Inputs, buttons, small elements |
| `radius-xl` | `rounded-xl` (12px) | Cards, table wrappers, integration items |
| `radius-full` | `rounded-full` (9999px) | Pill tabs, avatars, tab container |

### Card Shadow
```css
box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
```
Applied to all white content cards via `.shadow-card`.

### Datasource Card Hover
```css
.ds-card:hover {
  box-shadow: 0 4px 14px rgba(0,0,0,0.08);
  border-color: #c7d2fe;
}
```

---

## Iconography

### Style Rules
- **Line icons**, uniform stroke weight **1.5px**
- Sizes: `16px` nav/inline, `20px` action areas, `24px` page header

### Icon Inventory

| Location | Icon | Size | Color |
|---|---|---|---|
| Page header: Profile tab | `UserCircle` (person outline) | 20px | `#5B63F6` |
| Page header: Workspace tab | `SquaresGrid` (4 squares) | 20px | `#5B63F6` |
| Nav: Recent | `Clock` (circle + hands) | 16px | `#6B7280` |
| Nav: Create Dashboard | `SquaresGrid` (4 squares) | 16px | `#6B7280` |
| Nav: AI Chat | `ChatBubble` (speech bubble + dots) | 16px | `#6B7280` |
| Projects header | `EyeOff` | 14px | `#D1D5DB` |
| Project chevron | `ChevronRight` | 12px | `#9CA3AF` → rotates 90° when open |
| Submenu: Chat item | `ChatBubble` | 14px | `#5B63F6` |
| Submenu: Dashboard item | `SquaresGrid` | 14px | `#16A34A` |
| Submenu: Document item | `Document` | 14px | `#F97316` |
| Project pin | `Pin` (filled) | 12px | `#5B63F6` |
| Bottom nav: Shared with me | `UserGroup` | 16px | `#9CA3AF` |
| Bottom nav: Settings (active) | `Cog6Tooth` | 16px | `#6B7280` |
| Workspace switcher chevron | `ChevronDown` | 16px | `#9CA3AF` |
| Breadcrumb: Menu | `Bars3` | 18px | `#9CA3AF` |
| Breadcrumb: Back / Forward | `ChevronLeft` / `ChevronRight` | 16px | `#9CA3AF` |
| Workspace avatar | `UserCircle` placeholder | 32px | `#D1D5DB` |
| Profile avatar placeholder | `UserCircle` | 32px | `#D1D5DB` |
| Explore banner | `Sparkles` | 16px | `#4F6EF7` |

---

## Sidebar

The sidebar is **220px** wide with a **white background** (`bg-white`), matching the content area for a seamless feel. Structure is identical to recent-view and sovereign-capital-gate — Settings item is the active nav element.

### Structure (top → bottom)

| Zone | Content |
|---|---|
| **Workspace switcher** | `px-4 py-3`, border-bottom. Round avatar `w-7 h-7` (`#3B5BDB`), workspace name, chevron |
| **Primary nav** | `px-3 py-2 space-y-0.5`. Items: Recent (link to recent-view), Create Dashboard, AI Chat. Height `h-9`, `rounded-lg`, `text-sm` |
| **Divider** | `mx-3 my-1 border-t border-gray-100` |
| **Projects section** | Label "PROJECTS" + eye-slash icon. `id="projects-list"`. Collapsible items with chevron toggle. My Private Project (pinned, always first), Sovereign Capital Gate, "+ Create a project" |
| **Spacer** | `flex-1` |
| **Divider** | `mx-3 border-t border-gray-100` |
| **Bottom utility nav** | `px-3 py-2`. Items: Shared with me, **Settings (active)** |
| **Explore banner** | `mx-3 mb-3`, `background:#E8EEFF`, icon `#C7D2FE`. "Explore free features" + "Credit left: 15" |

### Active Settings Nav Item
```css
background: #EEF2FF;
border-left: 2px solid #5B63F6;
padding-left: 10px;
font-weight: 500;
color: #111827;
```

### Nav Item Hover
```css
.nav-item:hover { background-color: #EEF2FF; }
```

### Projects Section

**Pinned project rule:** "My Private Project" is always first with a `#5B63F6` filled pin icon (`12×12px`) on the right.

```
[>] My Private Project  [pin]   <- pinned, always first
    | (chat) Q4 Strategy
    | (grid) Revenue Overview

[>] Sovereign Capital Gate
    | (chat) Chat
    | (grid) Dashboard
    | (doc)  Document

[+] Create a project            <- calls openNewProjectModal()
```

**Submenu behaviour:**
```js
function toggleWorkspace(id) {
  const sub = document.getElementById(id + '-sub');
  const btn = document.getElementById(id + '-btn');
  sub.classList.toggle('open');
  btn.classList.toggle('open');
}
```
`.ws-submenu` is `display:none` by default; `.ws-submenu.open` is `display:block; max-height:200px; overflow-y:auto`. The `.ws-chevron` rotates 90° when `.ws-item.open`.

---

## Components

### Breadcrumb Bar

```
=   <   >   Settings
```

| Property | Value |
|---|---|
| Height | `h-11` (44px) |
| Border-bottom | `1px solid #F3F4F6` |
| Background | `bg-white` |
| Padding | `px-6` |
| Page label | 13px, `text-gray-500` |

---

### Page Header with Icon

Each tab has a dedicated icon in a rounded container beside the `<h1>`. Both icon and title update dynamically via JS on tab switch.

```
+----+
| [*]|  Profile
+----+  Manage your team and preferences here.
```

| Property | Value |
|---|---|
| Icon container | `w-9 h-9 rounded-xl`, `background:#EEF2FF` |
| Icon | `w-5 h-5`, `color:#5B63F6` |
| Title | 28px, 800 ExtraBold, `text-gray-900` |
| Subtitle | 14px, 400, `text-gray-400` |

**Icon per tab:**

| Tab | Icon |
|---|---|
| Profile | Person / user outline |
| Workspace | Grid / dashboard squares |

**JS:**
```js
const TABS = ['profile', 'workspace'];
const TITLES = { profile: 'Profile', workspace: 'Workspace' };

document.getElementById('page-title').textContent = TITLES[active];
document.getElementById('heading-icon').innerHTML = ICONS[active];
```

---

### Settings Tab Bar

Pill-style tab bar. Container has `#F3F4F6` background, `rounded-full`, `p-1`, `gap-1`.

```
+----------------------------------+
|  [ Profile ]   Workspace         |
+----------------------------------+
```

| State | Background | Border | Text | Font Weight |
|---|---|---|---|---|
| Active | `#FFFFFF` | `1px solid #E5E7EB` | `#111827` | 600 SemiBold |
| Inactive | `transparent` | `1px solid transparent` | `#6B7280` | 400 Regular |

| Property | Value |
|---|---|
| Height | `32px` |
| Padding | `0 16px` |
| Border-radius | `9999px` (full pill) |
| Font size | `14px` |
| Transition | `background, color, border 120ms ease` |

**JS:** `setTab(active)` toggles `.active` class on both `tab-{id}` buttons and `section-{id}` panels.

---

### Profile Tab

`max-w-xl`, single white card with `shadow-card`.

#### Picture section
- Avatar: `w-16 h-16 rounded-xl border border-gray-200`, falls back to gray placeholder icon
- "Upload a picture" button: `border border-gray-200 rounded-lg px-4 h-9 text-[13px] font-medium text-gray-700`
- Section separated from name fields by `border-b border-gray-100 pb-5 mb-5`

#### Name fields
- Two-column grid (`grid grid-cols-2 gap-4`)
- Each: label `12px font-medium text-gray-600` + input `h-9 border border-gray-200 rounded-lg px-3 text-[13px]`

#### Email field
- Read-only display: `text-gray-400`, not disabled but visually dimmed
- Full form width, single column

#### Save button
- Right-aligned in `border-t border-gray-100 pt-4 flex justify-end`
- Style: `px-4 h-9 rounded-lg text-[13px] font-medium text-white background:#5B63F6`

---

### Workspace Tab

Full-width layout. Five stacked sections.

#### Section 1 — 50/50 columns (Row 1)

**Left — Workspace info card:**
- Workspace avatar `w-12 h-12 rounded-xl` (`#3B5BDB`)
- Editable workspace name input (transparent, editable on click)
- Meta text: "Created April 2024 · 3 members"
- Workspace URL (read-only display with `aibii.com/manish-workspace`)
- Description textarea (`rows=2`)
- Save button (right-aligned, `border-t`)

**Right — Users with access card:**
- Header: "USERS WITH ACCESS" label + **Add user** button (`background:#5B63F6`)
- Search bar: icon-prefixed `input[type=text]` placeholder "Search users..."
- Table with `User` column (avatar + name + email) and `Role` column
  - Owner: non-editable badge `background:#EEF2FF color:#5B63F6`
  - Others: `<select>` dropdown (Admin / Editor / Viewer)

#### Section 2 — Data sources (full width)

- Header: "DATA SOURCES" label + **Add a datasource** button (`background:#5B63F6`)
- `grid grid-cols-2 gap-3` for datasource cards
- Each card: icon + name + subtitle + status badge or **Connect** button
- **Connected** badge: `background:#F0FDF4 color:#16A34A` with green dot
- Inline hint panel shown on "Add a datasource" click: dashed indigo border, `bg-indigo-50`

#### Section 3 — Danger zone (full width)

- `border border-red-100`, label in `#EF4444`
- "Delete workspace" description + **Delete** button (`border-red-200 color:#EF4444`)

#### Section 4 — Billing (full width, after danger zone)

**Free plan banner:**
- Background `#E8EEFF`, border `#C7D2FE`
- Sparkles icon + "Free plan" label (`color:#3B4ECC`)
- Price `$0 / month` (22px extrabold, `color:#3B4ECC`)
- Plan details: "15 AI credits · 2 workspaces · 5 GB storage"
- **Upgrade plan** button (`background:#5B63F6`)

**Payment method card:**
- White card `shadow-card`
- "No payment method added yet." + **Add card** button

#### Section 5 — Integrations (full width, after billing)

White card with `divide-y divide-gray-100`. Each row: `px-5 py-4`, integration icon + name + description + action.

| Integration | Icon bg | Status / Action |
|---|---|---|
| Google Sheets | `#0F9D58` | Connect |
| Notion | `bg-gray-900` | Connect |
| Slack | `#4A154B` | **Connected** (green badge) |
| PostgreSQL | `#336791` | Connect |
| REST API | `rgba(91,99,246,0.08)` | Connect |

**Connected badge:** `background:#F0FDF4 color:#16A34A` with checkmark icon  
**Connect button:** `border border-gray-200 text-gray-700 hover:bg-gray-50`

---

## States & Interactions

| Interaction | Behaviour |
|---|---|
| Tab switch | `setTab(id)` — toggles `.active` on pill button + panel; updates `h1` text and heading icon |
| Project submenu | `toggleWorkspace(id)` — toggles `.ws-submenu.open` and rotates `.ws-chevron` 90° |
| Nav item hover | `background-color: #EEF2FF` via `.nav-item:hover` |
| Add datasource | `showAddDataSource()` — toggles `hidden` on `#add-ds-hint` |
| Dismiss datasource hint | Button inside hint adds `hidden` back |
| Create a project | `openNewProjectModal()` — placeholder; modal can be added |
| Datasource card hover | `box-shadow` + border color change via `.ds-card:hover` |

---

## Motion & Animation

| Element | Property | Duration | Easing |
|---|---|---|---|
| Nav item hover | `background-color` | 100ms | `ease` |
| Pill tab active | `background, color, box-shadow` | 120ms | `ease` |
| Workspace chevron | `transform: rotate(90deg)` | 150ms | `ease` |
| Datasource card hover | `box-shadow`, `border-color` | 120ms | `ease` |

---

## Design Principles

1. **Consistent shell** — sidebar and breadcrumb bar identical to all other views; Settings is the active nav item
2. **Pill tabs** — same pattern as recent-view filter tabs; active state uses white background + subtle border
3. **Card-based panels** — every settings group lives in a white card with `shadow-card` for clear visual grouping
4. **Dynamic heading** — page title and icon update on tab switch to reinforce context
5. **Neutral white sidebar** — sidebar background matches canvas (`#FFFFFF`) for a seamless, borderless feel
6. **Workspace tab consolidation** — billing, integrations, and user access are all workspace-level concerns; grouping them under the Workspace tab reduces cognitive overhead and tab count
7. **Role-based access** — Owner is badge-only (non-editable); Admin/Editor/Viewer use `<select>` dropdowns

---

## File Structure

```
settings-profile/
├── index.html      <- Settings page (single-file, Tailwind CDN)
└── README.md       <- This file
```

---

*Design language v1.3 — Aibii AI Business Intelligence SaaS · Settings, May 2026.*
