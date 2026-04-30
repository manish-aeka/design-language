# Dashboard — Design Language

**Version:** 1.0  
**File:** `dashboard/index.html`  
**Stack:** HTML · Tailwind CSS CDN · Chart.js 4.4.2 · Inter (Google Fonts) · Vanilla JS

---

## 1. Screen Anatomy

```
┌──────────────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)  │              MAIN CONTENT                    │
│                   │  ┌─────────────────────────────────────────┐ │
│  Workspace        │  │  TOP BAR  h-12                          │ │
│  switcher         │  │  [☰] [←] [→] | Sales Overview  [Draft] │ │
│                   │  │           [Publish][Edit…][⛶]  [Edit]  │ │
│  Primary nav      │  ├─────────────────────────────────────────┤ │
│  ─────────        │  │                                         │ │
│  Workspaces       │  │  DASHBOARD CANVAS (scrollable, bg-white)│ │
│  section          │  │                                         │ │
│                   │  │  ┌────────┐ ┌────────┐  ← Row 2 (4-col)│ │
│  ─────────        │  │  │ Line   │ │ Bar    │                  │ │
│  Bottom nav       │  │  └────────┘ └────────┘                  │ │
│  Explore banner   │  │  ┌────────┐ ┌──┐ ┌──┐  ← Row 3 (4-col)│ │
│                   │  │  │Stacked │ │Pie│ │Do│                  │ │
│                   │  │  └────────┘ └──┘ └──┘                  │ │
│                   │  │  ┌────────┐ ┌──┐ ┌──┐  ← Row 4 (4-col)│ │
│                   │  │  │MultiLn │ │HB│ │Sc│                  │ │
│                   │  │  └────────┘ └──┘ └──┘                  │ │
│                   │  │  ┌────────────────────┐  ← Row 5 (full)│ │
│                   │  │  │   Area (Growth)     │               │ │
│                   │  │  └────────────────────┘               │ │
└──────────────────────────────────────────────────────────────────┘
```

---

## 2. Color Palette

| Token | Hex | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav border, chart primary, CTA button, badges |
| `brand.secondary` | `#7C6FF7` | Chart secondary dataset, stacked bar layer 2 |
| `hover` | `#EEF2FF` | Active nav background, stat badges |
| `gray-50` | `#F9FAFB` | Toolbar button hover, main area bg |
| `gray-100` | `#F3F4F6` | Border separators, Draft badge bg |
| `gray-200` | `#E5E7EB` | Card borders, toolbar button borders |
| `gray-400` | `#9CA3AF` | Chart tick labels, meta text, icon color |
| `gray-500` | `#6B7280` | Draft badge text, toolbar icons |
| `gray-700` | `#374151` | Chart card titles, toolbar button text |
| `gray-900` | `#111827` | Page title, nav text |
| `#A5B4FC` | Indigo-300 | Stacked bar layer 3, horizontal bar gradient end |
| `#A855F7` | Purple-500 | Chart accent 2 (region/product B) |
| `#EC4899` | Pink-500 | Chart accent 3 (region/product C) |
| `#F59E0B` | Amber-500 | Chart accent 4 (region/product D) |
| `#10B981` | Emerald-500 | Growth/positive trend lines, area chart |
| `#EF4444` | Red-500 | Negative/churn trend indicators |
| `#16A34A` | Green-600 | Positive KPI trend text |
| `#3B5BDB` | Indigo-700 | Workspace avatar background |

---

## 3. Typography

| Element | Size | Weight | Color | Transform |
|---|---|---|---|---|
| Page title (`Sales Overview`) | `15px` | `700` | `#111827` | — |
| Toolbar button labels | `12px` | `500` | `#374151` | — |
| Chart card title | `12px` | `600` | `#374151` | `uppercase`, `letter-spacing: 0.04em` |
| Chart card meta | `11px` | `400` | `#9CA3AF` | — |
| Draft badge | `11px` | `500` | `#6B7280` | — |
| Chart tick labels | `11px` | `400` | `#9CA3AF` | — |
| Chart legend labels | `10px` | `400` | `#9CA3AF` | — |
| Sidebar nav items | `14px` | `400/500` | `#374151` / `#111827` | — |
| Sidebar section labels | `11px` | `500` | `#9CA3AF` | `uppercase`, `tracking-widest` |
| Sub-nav items | `13px` | `400` | `#4B5563` | — |
| Workspace name | `14px` | `600` | `#111827` | — |
| Explore banner title | `12px` | `600` | `#3B4ECC` | — |
| Explore banner sub | `11px` | `400` | `#6B7ADE` | — |

**Font family:** `Inter, system-ui, -apple-system, sans-serif` (loaded via Google Fonts at weights 400/500/600/700/800)

---

## 4. Layout & Spacing

### Overall Shell

```
body: flex h-screen overflow-hidden bg-white
├── aside: 220px fixed width, bg-white, border-r border-gray-100
└── main: flex-1, flex flex-col, overflow-hidden, bg-[#F9FAFB]
    ├── top bar: h-12, flex-shrink-0
    └── canvas: flex-1, overflow-y-auto, bg-white, padding 12px 14px
```

### Dashboard Canvas Grid

The canvas uses a **4-column CSS grid** with `gap-2.5` (10px) between cards.

| Row | Grid | Description |
|---|---|---|
| Row 2 | `grid-cols-4 gap-2.5 mb-2.5` | Monthly Revenue `col-span-2` + Sales by Region `col-span-2` |
| Row 3 | `grid-cols-4 gap-2.5 mb-2.5` | Revenue by Channel `col-span-2` + Market Share `col-span-1` + Retention `col-span-1` |
| Row 4 | `grid-cols-4 gap-2.5 mb-2.5` | New vs Returning `col-span-2` + Top Products `col-span-1` + Marketing Spend `col-span-1` |
| Row 5 | `grid-cols-1 gap-2.5` | Cumulative Growth `col-span-1` (full width) |

---

## 5. Component: Sidebar

**Dimensions:** `w-[220px] min-w-[220px]`, full height, `bg-white`, `border-r border-gray-100`, `overflow-y-auto`

### Workspace Switcher

```
px-4 py-3 border-b border-gray-100
└── button: flex items-center gap-2 w-full
    ├── avatar: w-7 h-7 rounded-full bg-[#3B5BDB] text-white text-xs font-bold
    ├── name: text-sm font-semibold truncate flex-1
    └── chevron: w-4 h-4 text-gray-400
```

### Primary Nav Items

```
nav: px-3 py-2 space-y-0.5
└── a.nav-item: flex items-center gap-2.5 px-3 h-9 rounded-lg text-sm text-gray-700
    └── icon: w-4 h-4 text-gray-500
```

**Active item:**
```
background: #EEF2FF
border-left: 2px solid #5B63F6
padding-left: 10px
font-weight: 500
color: #111827
icon color: #5B63F6
```

### Workspaces Section

```
px-3 py-1
├── section label: text-[11px] font-medium text-gray-400 uppercase tracking-widest, h-7
└── workspace row: nav-item flex items-center gap-1 px-2 h-9 rounded-lg
    ├── toggle button: w-5 h-5 rounded hover:bg-gray-200
    │   └── chevron: .ws-chevron transitions 150ms, rotates 90deg when .open
    └── link: text-sm text-gray-700 truncate
```

**Sub-menu items:** `pl-4 mt-0.5 space-y-0.5`, hidden by default (`.ws-submenu`), shown as block when `.open`

Sub-item: `nav-item flex items-center gap-2 px-3 h-8 rounded-lg text-[13px] text-gray-600`  
Sub-item icon: `w-3.5 h-3.5` colored by type (Chat `#5B63F6`, Dashboard `#16A34A`, Document `#F97316`)

### Bottom Nav

```
nav: px-3 py-2 space-y-0.5
└── a.nav-item: flex items-center gap-2.5 px-3 h-9 rounded-lg text-sm text-gray-600
    └── icon: w-4 h-4 text-gray-400
```

### Explore Banner

```
mx-3 mb-3 mt-1 rounded-xl px-3 py-2.5
background: #E8EEFF
└── icon container: w-8 h-8 rounded-full bg-[#C7D2FE]
    └── sparkle icon: w-4 h-4 color:#4F6EF7
└── text block:
    ├── "Explore free features": text-[12px] font-semibold color:#3B4ECC
    └── "Credit left: 15": text-[11px] color:#6B7ADE
```

---

## 6. Component: Top Bar

**Dimensions:** `h-12`, `flex items-center justify-between`, `px-5`, `border-b border-gray-200`, `bg-white`, `flex-shrink-0`

### Left Side

```
div#topbar-nav-btns: flex items-center gap-1
├── Hamburger button: text-gray-500, icon w-[18px]
├── Back button: text-gray-400, icon w-4
└── Forward button: text-gray-400, icon w-4

div#topbar-divider: w-px h-4 bg-gray-200 mx-1

h1: text-[15px] font-bold text-gray-900 — "Sales Overview"

span.badge: px-2 h-5 rounded-md text-[11px] font-medium
  background: #F3F4F6; color: #6B7280 — "Draft"
```

### Right Side — Toolbar

```
div#toolbar-btns: flex items-center gap-1.5
├── .toolbar-btn (Publish, Toggle Axis, Comment, Color Palette, Add KPI)
├── #btn-fullscreen .toolbar-btn px-2 (icon-only, expand/compress icons)
└── Edit button (primary filled)
```

### `.toolbar-btn` Spec

```css
display: flex; align-items: center; gap: 6px;
padding: 0 10px; height: 30px; border-radius: 8px;
border: 1px solid #E5E7EB; background: #fff;
font-size: 12px; font-weight: 500; color: #374151;
cursor: pointer; transition: background-color 100ms ease;
white-space: nowrap;
```
Hover: `background: #F9FAFB`

### Edit Button (Primary CTA)

```
flex items-center gap-1.5 px-3 h-[30px] rounded-lg
font-size: 12px; font-weight: 600; color: #fff;
background: #5B63F6; hover: opacity 0.9
icon: w-3.5 h-3.5
```

---

## 7. Component: Chart Card

### `.chart-card`

```css
background: #fff;
border: 1px solid #E5E7EB;
border-radius: 8px;
padding: 14px 16px;
box-shadow: 0 1px 2px rgba(0,0,0,0.04);
```

### `.chart-card-title`

```css
font-size: 12px; font-weight: 600; color: #374151;
text-transform: uppercase; letter-spacing: 0.04em;
margin-bottom: 4px;
```

### `.chart-card-meta`

```css
font-size: 11px; color: #9CA3AF; margin-bottom: 12px;
```

### Stat Badge (inline with title)

Used in Monthly Revenue and Cumulative Growth cards:

```
text-[11px] font-semibold px-2 h-5 rounded flex items-center
Positive: background #EEF2FF; color #5B63F6 (e.g. "+18.4%")
Very positive: background #D1FAE5; color #065F46 (e.g. "+430% YTD")
```

### Chart Heights

| Chart | Canvas height |
|---|---|
| All Row 2–4 charts | `h-[150px]` |
| Row 5 Cumulative Growth | `h-[120px]` |
| Pie / Doughnut container | `110px × 110px` fixed wrapper |

---

## 8. Charts — Specifications

### Shared Chart.js Defaults

```js
Chart.defaults.font.family = 'Inter, system-ui, sans-serif';
Chart.defaults.font.size   = 11;
Chart.defaults.color       = '#9CA3AF';
const gridColor = '#F3F4F6';
const tickColor = '#9CA3AF';
```

### Chart 1 — Monthly Revenue (Line)

| Property | Value |
|---|---|
| Type | `line` |
| ID | `chartLine` |
| Labels | Jan – Nov (12 months, last null) |
| Dataset color | `#5B63F6`, `borderWidth: 2` |
| Point | `radius: 3.5`, `hoverRadius: 5` |
| Tension | `0.3` |
| Fill | `false` |
| Y min | `100` |
| Tooltip | `$[value]K` |

### Chart 2 — Sales by Region (Bar)

| Property | Value |
|---|---|
| Type | `bar` |
| ID | `chartBar` |
| Labels | North America, Europe, Asia Pacific, Latin America |
| Colors | `['#5B63F6','#A855F7','#EC4899','#F59E0B']` |
| `borderRadius` | `5` |
| `borderSkipped` | `false` |
| X grid | hidden |
| Tick rotation | `35° / 20°` |

### Chart 3 — Market Share (Pie)

| Property | Value |
|---|---|
| Type | `pie` |
| ID | `chartPie` |
| Data | `[35, 25, 20, 15, 5]` |
| Colors | `['#5B63F6','#A855F7','#EC4899','#F59E0B','#10B981']` |
| Border | `2px #fff` |
| `hoverOffset` | `6` |
| Legend | Separate HTML legend (inline colored dots + labels) |

**Pie + Legend layout:**
```
flex items-center gap-3 h-[150px]
├── canvas wrapper: 110×110px flex-shrink-0
└── legend: space-y-1.5, text-[10px] text-gray-600
    └── row: w-2 h-2 rounded-sm swatch · label · ml-auto font-semibold value
```

### Chart 4 — Marketing Spend (Scatter)

| Property | Value |
|---|---|
| Type | `scatter` |
| ID | `chartScatter` |
| Points | 15 `{x, y}` pairs, linearly ascending |
| Color | `#5B63F6` |
| `pointRadius` | `4`, `pointHoverRadius: 6` |

### Chart 5 — Revenue by Channel (Stacked Bar)

| Property | Value |
|---|---|
| Type | `bar` (stacked) |
| ID | `chartStacked` |
| Labels | Q1 – Q4 |
| Datasets | Direct `#5B63F6`, Partner `#7C6FF7`, Self-serve `#A5B4FC` |
| Stack key | `'s'` |
| Top radius | `4` on last dataset only |
| Legend | `position: 'bottom'`, `boxWidth: 8`, `font.size: 10` |

### Chart 6 — Cumulative Growth (Area)

| Property | Value |
|---|---|
| Type | `line` |
| ID | `chartArea` |
| Data | Jan–Dec compounding: `[100,118,142,168,200,230,268,310,358,410,468,530]` |
| `borderColor` | `#10B981` |
| `backgroundColor` | `rgba(16,185,129,0.10)` |
| Fill | `true` |
| `pointRadius` | `0` |
| Tension | `0.4` |
| X grid | hidden |

### Chart 7 — Retention Rate (Doughnut)

| Property | Value |
|---|---|
| Type | `doughnut` |
| ID | `chartDoughnut` |
| Data | `[91, 9]` |
| Colors | `['#5B63F6', '#F3F4F6']` |
| `cutout` | `72%` |
| Center label | Absolutely positioned overlay: `18px bold` + `10px text-gray-400` |
| Legend | Hidden (replaced by center overlay) |

**Center label overlay:**
```
position:relative wrapper (110×110px)
└── absolute inset-0 flex flex-col items-center justify-center
    ├── span: text-[18px] font-bold text-gray-900 — "91%"
    └── span: text-[10px] text-gray-400 — "retained"
```

### Chart 8 — Top Products (Horizontal Bar)

| Property | Value |
|---|---|
| Type | `bar` |
| ID | `chartHBar` |
| `indexAxis` | `'y'` |
| Labels | Analytics Pro, Data Bridge, Insight Hub, QuickReport, AutoSync |
| Colors | Blue gradient `['#5B63F6','#7C6FF7','#A5B4FC','#C7D2FE','#E0E7FF']` |
| `borderRadius` | `4` |
| Y grid | hidden |
| Label font | `10px` |

### Chart 9 — New vs Returning (Multi-line)

| Property | Value |
|---|---|
| Type | `line` |
| ID | `chartMultiLine` |
| Datasets | New `#5B63F6`, Returning `#10B981` |
| `pointRadius` | `0` |
| Tension | `0.3` |
| Tooltip mode | `'index'`, `intersect: false` |
| Legend | `position: 'bottom'`, `boxWidth: 8`, `font.size: 10` |

---

## 9. Fullscreen Mode

Triggered by clicking the expand button (`#btn-fullscreen`) in the toolbar.

### Enters Fullscreen

```js
document.documentElement.requestFullscreen()
```

**Elements hidden:**
- `aside` — sidebar
- All `#toolbar-btns` children **except** `#btn-fullscreen`
- `#topbar-nav-btns` — hamburger + back/fwd buttons
- `#topbar-divider` — vertical rule before title
- `#dashboard-canvas` padding set to `0`

**Icons swapped:**
- `#icon-expand` → `.hidden`
- `#icon-compress` → visible

### Exits Fullscreen

On button click or `Esc` key (`fullscreenchange` event listener):

All hidden elements restored, padding restored to `12px 14px`, icons swapped back.

---

## 10. Scrollbar

```css
::-webkit-scrollbar { width: 5px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## 11. Shadows & Borders

| Token | Value | Used on |
|---|---|---|
| Card shadow | `0 1px 2px rgba(0,0,0,0.04)` | `.chart-card`, `.kpi-card` |
| Card border | `1px solid #E5E7EB` | All chart cards |
| Sidebar border | `1px solid #F3F4F6` (gray-100) | `aside` right edge, section dividers |
| Topbar border | `1px solid #E5E7EB` (gray-200) | `.border-b` on top bar |
| Toolbar btn border | `1px solid #E5E7EB` | All `.toolbar-btn` |

---

## 12. Sidebar — Workspace Toggle (JS)

```js
function toggleWorkspace(id) {
  const sub = document.getElementById(id + '-sub');
  const btn = document.getElementById(id + '-btn');
  sub.classList.toggle('open');   // shows/hides submenu via .ws-submenu.open { display: block }
  btn.classList.toggle('open');   // rotates chevron via .ws-item.open .ws-chevron { transform: rotate(90deg) }
}
```

---

## 13. Design Principles

| Principle | Implementation |
|---|---|
| **Data density** | 9 charts in 5 rows using mixed 2-col / 1-col spans to maximize information per screen |
| **Visual hierarchy** | Uppercase small-caps card titles + gray meta text separates label layer from data layer |
| **Consistent palette** | Brand indigo `#5B63F6` anchors primary data; accent colors (purple, pink, amber, emerald) used consistently across all charts |
| **Minimal chrome** | White card backgrounds on white canvas — borders and subtle shadows carry separation without heavy UI noise |
| **Focused fullscreen** | Entering fullscreen hides all navigation and tool chrome, leaving only the title, charts, and exit button |
| **Compact controls** | `30px` toolbar buttons keep the top bar thin (`h-12`) so chart space dominates |

---

## 14. File Structure

```
dashboard/
├── index.html   — Dashboard view (all-in-one: HTML + Tailwind + Chart.js + JS)
└── README.md    — This design language document
```

**External dependencies (CDN only):**

| Library | Version | URL |
|---|---|---|
| Tailwind CSS | latest | `https://cdn.tailwindcss.com` |
| Chart.js | 4.4.2 | `https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js` |
| Inter font | — | `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800` |
