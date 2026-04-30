# Aibii — AI Business Intelligence SaaS · UI Prompt

> Paste this file into a UI generation tool (e.g. Google Stitch) to regenerate or extend any screen.

---

## Product Overview

**Aibii** is an AI-powered Business Intelligence SaaS. Users connect data sources, generate AI-driven reports and insights, build dashboards, and collaborate with their team on analytical work.

**Screens in this design language:**

| # | Screen | Path |
|---|---|---|
| 1 | Sovereign Capital Gate | `sovereign-capital-gate/` |
| 2 | Recent View | `recent-view/` |
| 3 | Settings › Profile | `settings-profile/` |
| 4 | Chat (AI data chat) | `chat/` |
| 5 | Dashboard (BI) | `dashboard/` |

---

## Design System

### Colors

```
-- Backgrounds --
Page:              #FFFFFF
Sidebar:           #FFFFFF
Canvas (dashboard):#FFFFFF
Hover / active bg: #EEF2FF
Card:              #FFFFFF
Input (editable):  #FFFFFF
Input (read-only): #F9FAFB
Tab container:     #F3F4F6
Placeholder:       #F3F4F6

-- Brand --
Primary:           #5B63F6
Secondary:         #7C6FF7
Gradient:          linear-gradient(135deg, #4F6EF7, #8B5CF6)

-- Text --
Primary:           #111827
Secondary:         #6B7280
Tertiary:          #9CA3AF
Brand / link:      #5B63F6
Upgrade:           #7C3AED

-- Borders --
Default:           #E5E7EB
Subtle:            #F3F4F6    (gray-100)
Focus:             #5B63F6

-- Status --
Positive:          #16A34A   (green-600)
Negative:          #EF4444   (red-500)
Positive bg:       #D1FAE5
Negative bg:       #FEE2E2

-- Accent palette (charts) --
Purple:            #A855F7
Pink:              #EC4899
Amber:             #F59E0B
Emerald:           #10B981

-- Surfaces --
Scrollbar thumb:   #CBD5E1
```

### Typography

```
Font: Inter, system-ui, -apple-system, sans-serif
Weights loaded: 400 · 500 · 600 · 700 · 800

Display:          22–28px / 700 / lh 1.2  — page & section titles
Subtitle:         14px   / 400 / lh 1.5  — page descriptions
Section label:    14px   / 600 / lh 1.3  — section headings
Field label:      13px   / 500 / lh 1.3  — form labels
Nav item:         14px   / 400–500        — sidebar nav
Sub-nav item:     13px   / 400            — workspace sub-items
Chart card title: 12px   / 600 / uppercase / letter-spacing 0.04em
Chart card meta:  11px   / 400 / #9CA3AF
Toolbar button:   12px   / 500
Timestamp:        12px   / 400 / #6B7280
Caption:          11px   / 400 / #9CA3AF
Badge:            10–11px / 500–600
```

### Spacing

```
Base unit: 4px
Scale: 2 · 4 · 6 · 8 · 10 · 12 · 14 · 16 · 20 · 24 · 28 · 32 · 40 · 48
```

### Border Radius

```
4px   — small badges
8px   — inputs, toolbar buttons, icon backgrounds, nav items, chart cards
12px  — cards, action cards, explore banner
16px  — modals
9999px — pill tabs, avatars, view-toggle container, tag pills
```

### Shadows

```
Card:        0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)
Card hover:  0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)
Chart card:  0 1px 2px rgba(0,0,0,0.04)
Input focus: 0 0 0 3px rgba(91,99,246,0.15)
Button:      0 1px 2px rgba(0,0,0,0.06)
Tab active:  0 1px 4px rgba(0,0,0,0.10)
```

### Scrollbar

```css
::-webkit-scrollbar        { width: 5px; }
::-webkit-scrollbar-thumb  { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track  { background: transparent; }
```

---

## Shared Component: Sidebar (220px)

Used on all 5 screens. `bg-white`, `border-r: 1px solid #F3F4F6`, full height, `overflow-y: auto`.

```
┌─────────────────────────────┐
│  [M] Manish kumar's Work ▾  │  workspace switcher · 14px semibold · avatar 28px bg #3B5BDB
├─────────────────────────────┤
│  PRIMARY NAV                │  px-3 py-2 space-y-0.5
│  🕐 Recent                  │
│  📊 New dashboard  ← ACTIVE │  bg #EEF2FF · border-left 2px #5B63F6 · pl 10px
│  💬 New chat                │
├─────────────────────────────┤  divider: border-t #F3F4F6
│  WORKSPACES          11px   │  uppercase · #9CA3AF · tracking-widest
│  ▶ Sovereign Capital Gate   │  collapsible; sub-items: Chat · Dashboard · Document
│  ▶ My private workspace     │  collapsible; sub-items: Q4 Strategy · Revenue Overview
│  +  Create a workspace      │
├─────────────────────────────┤  flex-1 spacer + divider
│  👥 Shared with me          │
│  ⚙  Settings               │  → settings-profile/
├─────────────────────────────┤
│  ✦ Explore free features    │  banner · bg #E8EEFF · rounded-xl · mx-3 mb-3
│     Credit left: 15         │  icon bg #C7D2FE · sparkle #4F6EF7
└─────────────────────────────┘
```

**Nav item spec:**
- Height: 36px · padding: 0 12px · border-radius: 8px
- Hover: `background: #EEF2FF`
- Active: `background: #EEF2FF` · `border-left: 2px solid #5B63F6` · `padding-left: 10px` · `font-weight: 500`
- Icon: 16px · color `#6B7280` (active: `#5B63F6`)

**Sub-nav items:** `pl-4 · h-8 · text-[13px] · gap-2` · icon 14px colored by type:
- Chat: `#5B63F6` · Dashboard: `#16A34A` · Document: `#F97316`

**Workspace toggle (JS):**
```js
function toggleWorkspace(id) {
  document.getElementById(id+'-sub').classList.toggle('open');
  document.getElementById(id+'-btn').classList.toggle('open');
}
// .ws-submenu { display:none } / .ws-submenu.open { display:block }
// .ws-chevron transitions rotate(90deg) when parent has .open
```

---

## Shared Component: Top Bar

Height `h-12` · `bg-white` · `border-b: 1px solid #E5E7EB` · `px-5` · `flex items-center justify-between`

**Left side:**
```
[☰ hamburger 18px]  [← back 16px]  [→ fwd 16px]  |  Page Title  [Badge]
```
- Divider: `w-px h-4 bg-gray-200`
- Title: `15px font-bold #111827`
- Badge examples: "Draft" `bg #F3F4F6 color #6B7280`; "Q4 Revenue Analysis" breadcrumb `text-gray-400 › text-gray-700`

**Right side (dashboard toolbar):**
```
[Publish] [Toggle Axis] [Comment] [Color Palette] [Add KPI] [⛶ Fullscreen] [Edit ●]
```

**`.toolbar-btn` spec:**
```css
height: 30px; padding: 0 10px; border-radius: 8px;
border: 1px solid #E5E7EB; background: #fff;
font-size: 12px; font-weight: 500; color: #374151;
gap: 6px; white-space: nowrap;
hover: background #F9FAFB;
```

**Edit (primary CTA):** `background #5B63F6` · `color #fff` · `font-weight 600` · `border-radius 8px` · `h-[30px] px-3`

---

## Shared Component: Action Cards Row

4 equal-width cards · `flex gap-4`

```
┌─────────────────────────────┐
│  ┌────┐  Title (14px/500)   │
│  │icon│  Description (13px) │
│  └────┘                     │
└─────────────────────────────┘
```
- Card: `bg #fff` · `border 1px #E5E7EB` · `border-radius 12px` · `padding 16px`
- Icon wrapper: `8px padding` · `bg rgba(91,99,246,0.08)` · `border-radius 8px` · icon `20px #5B63F6`
- Hover: `box-shadow card-hover` · `translateY(-1px)` · `transition 150ms ease-out`

---

## Shared Component: View Toggle + Type Filter

Right-aligned on the same row as tab/filter bars.

**View Toggle:**
- Container: `bg #12131F` · `border-radius 9999px` · `padding 4px`
- Active (list): `bg #1C3A6E` · icon `#fff` · size `36×36px` · `border-radius 9999px`
- Inactive (grid): `bg transparent` · icon `#9CA3AF`

**Type Filter button:** `bg #1A1A2A` · `border 1px rgba(255,255,255,0.12)` · `border-radius 8px` · `padding 6px 12px` · label `13px/500 #E5E7EB`

---

## Screen 1: Sovereign Capital Gate

**Heading:**
```
Sovereign Capital Gate              (22px/700 #111827)
Analyse data and share insights with your team.  (14px #6B7280)
```

**Action cards (4):** New report · Ask AI · Connect data · Create dashboard

**Below action cards:**
- Left label: "Reports" `14px/600 #111827`
- Right: View Toggle + Type Filter

**Report grid:** 2 columns · `gap 16px`

Each card:
```
┌──────────────────────────────┐
│   bg #F3F4F6 · h-160px       │  preview zone · icon 32px #D1D5DB centered
├──────────────────────────────┤
│  Untitled               ···  │  14px/500 #111827 · ··· hidden, shows on hover
│  Updated 22 minutes ago      │  12px #6B7280
└──────────────────────────────┘
```
- Border: `1px solid #E5E7EB` · `border-radius 12px`
- Hover: border → `rgba(91,99,246,0.3)` · shadow card-hover

Show **2 report cards**.

---

## Screen 2: Recent View

**Breadcrumb bar** (44px · `border-bottom 1px #F3F4F6`):
```
☰  ←  →   Recent
```

**Heading:**
```
🕐 Recent                           (28px/700 #111827 · clock icon inline)
Your recent reports and insights are displayed here.
You can also create new reports and dashboards from here.  (14px #6B7280)
```

**Action cards (4):** New report · Create a workspace · Ask AI · Connect data

**Tab bar row:**
```
Left:  [ By me ]  By everyone  Shared with me   (pill tabs · bg #F3F4F6 · radius 9999px · p-1)
Right: View Toggle + Type Filter
```
- Active tab: `bg #fff` · `border 1px #E5E7EB` · shadow tab-active · `#111827`
- Inactive: `bg transparent` · `#6B7280`
- Each tab: `h-8 · px-4 · border-radius 9999px · 14px/500`

**Report grid:** 4 columns · `gap 16px` · `mt-6`

Show **8 cards** (4×2):
- Row 1: Untitled (19 min) · Untitled (20 min) · Untitled (20 min) · Untitled (1 hr)
- Row 2: Q1 Revenue Analysis (1 hr) · Untitled (1 hr) · Untitled (1 hr) · Untitled (1 hr)

Card preview icon: `BarChart2` 32px `#D1D5DB`

---

## Screen 3: Settings › Profile

**Breadcrumb bar:** `☰  ←  →   Settings`

**Heading:**
```
Profile                                (28px/700 #111827)
Manage your team and preferences here. (14px #6B7280)
```

**Tab bar:**
```
[ Profile ]  Workspace  Billing  Members  Integrations
```
Active: `bg #fff` · `border 1px #E5E7EB` · `border-radius 9999px` · `#111827`
Inactive: transparent · `#6B7280`

**Form** (max-width 600px):

**Picture section:**
```
[ 48px circle avatar ]   [ Upload a picture ]
```
- Upload button: `bg #fff` · `border 1px #E5E7EB` · `border-radius 8px` · `px-4 py-2` · `14px/500 #111827`

**Name row** (2 columns, gap 16px):
```
First name            Last name
[ Manish           ]  [ kumar            ]
```

**Email row** (1 column, read-only):
```
Email
[ manish7479dlp@gmail.com ]   ← bg #F9FAFB · color #9CA3AF · cursor default
```

**Input specs:**
- Editable: `h-10 · px-3.5 py-2.5 · bg #fff · border 1px #E5E7EB · border-radius 8px · 14px #111827`
- Focus: `border-color #5B63F6` · `box-shadow 0 0 0 3px rgba(91,99,246,0.15)`
- Read-only: `bg #F9FAFB · color #9CA3AF · cursor default`

---

## Screen 4: Chat (AI Data Chat)

**Top bar:** `h-11` · breadcrumb: `Chat › Q4 Revenue Analysis` · right: sources badge + Share + More

**Messages area:** `flex-1 overflow-y-auto · px-6 py-6 · space-y-6`

**User message:**
```
                            ┌───────────────────────────────┐
                            │  What were our top revenue... │  bg #F3F4F6 · color #111827
                            └───────────────────────────────┘
```
- Bubble: `bg #F3F4F6` · `color #111827` · `border-radius 18px 18px 4px 18px` · `px-4 py-2.5 · text-sm`
- Aligned right (`msg-user flex justify-end`)

**AI message:**
```
[✦]  ┌──────────────────────────────────────────────┐
     │  Here's a summary of Q4 revenue...           │  no bg · color #111827
     │  [table or bullet list]                      │
     └──────────────────────────────────────────────┘
     [source pill] [source pill]
     [Copy] [Export] [Regenerate]
```
- AI icon: `w-6 h-6 · border-radius 8px · bg #EEF2FF · mt-1 flex-shrink-0` · sparkle SVG `w-3.5 h-3.5 color #5B63F6`
- Bubble: no background · `color #111827` · `border-radius 18px 18px 18px 4px`
- Max width: `78%`

**Source pills:** `px-2.5 h-6 · border-radius 9999px · border 1px #E5E7EB · bg #F9FAFB · text-[11px]` · hover `bg #E0E7FF`

**Action buttons:** `px-2.5 h-7 · border-radius 8px · text-[12px] · color #6B7280` · hover `bg #E5E7EB color #374151`

**Typing indicator:** 3 animated dots · `@keyframes blink { 0%,80%,100%{opacity:0.2} 40%{opacity:1} }` · each dot 150ms delay stagger

**Input bar:** `px-6 pb-5`
```
┌─────────────────────────────────────────────────────────┐
│  [📎]  Ask anything about your data...         [▶ send] │
└─────────────────────────────────────────────────────────┘
```
- Container: `border 1px #E5E7EB · border-radius 16px · px-4 py-3 · shadow card`
- Focus: `border-color #A5B4FC · shadow input`
- Send button: `w-8 h-8 · border-radius 10px · bg #5B63F6`
- Textarea: `resize:none · max-height 160px · auto-grow via JS`

**Dummy AI response pool (cycle on send):**
1. Revenue summary table — Total Revenue $3.1M +9.7%, New Customers 214 +22%, Churn 2.3%
2. Segment bar chart — Enterprise / Mid-Market / SMB
3. Bullet metrics — MRR $1.04M, ACV +14%, top 10 accounts 38%, renewal 91.2%
4. Monthly trend table — Oct / Nov / Dec with MoM deltas

**JS send flow:**
```
sendMessage() →
  append user bubble → scrollToBottom →
  show typing indicator →
  setTimeout(1600ms) →
  hide typing → append AI response (icon + bubble + pills + actions) → scrollToBottom
```

---

## Screen 5: Dashboard (BI)

**Top bar:** `h-12` · title: `Sales Overview` · badge: `Draft`

**Canvas:** `flex-1 overflow-y-auto · bg-white · padding 12px 14px`

**Grid layout** — 4-column base (`grid-cols-4 gap-2.5`):

| Row | Spans | Charts |
|---|---|---|
| Row 2 | `col-span-2` + `col-span-2` | Monthly Revenue (Line) · Sales by Region (Bar) |
| Row 3 | `col-span-2` + `col-span-1` + `col-span-1` | Revenue by Channel (Stacked Bar) · Market Share (Pie) · Retention Rate (Doughnut) |
| Row 4 | `col-span-2` + `col-span-1` + `col-span-1` | New vs Returning (Multi-line) · Top Products (H-Bar) · Marketing Spend (Scatter) |
| Row 5 | `col-span-4` | Cumulative Revenue Growth (Area) |

**`.chart-card` spec:**
```css
background: #fff;
border: 1px solid #E5E7EB;
border-radius: 8px;
padding: 14px 16px;
box-shadow: 0 1px 2px rgba(0,0,0,0.04);
```

**Chart title:** `12px · 600 · #374151 · uppercase · letter-spacing 0.04em · mb-4px`
**Chart meta:** `11px · #9CA3AF · mb-12px`
**Chart canvas height:** Row 2–4: `h-[150px]` · Row 5: `h-[120px]`

**Stat badge (on card header):**
- Positive: `bg #EEF2FF · color #5B63F6` — e.g. "+18.4%"
- Very positive: `bg #D1FAE5 · color #065F46` — e.g. "+430% YTD"

**Chart.js shared defaults:**
```js
Chart.defaults.font.family = 'Inter, system-ui, sans-serif';
Chart.defaults.font.size   = 11;
Chart.defaults.color       = '#9CA3AF';
const gridColor = '#F3F4F6';
const tickColor = '#9CA3AF';
```

**Chart color assignments:**
```
Primary line/bars:  #5B63F6
Secondary:          #7C6FF7 / #A5B4FC
Purple accent:      #A855F7
Pink accent:        #EC4899
Amber accent:       #F59E0B
Growth / positive:  #10B981
Doughnut empty:     #F3F4F6
```

**Fullscreen mode (JS):**
```js
// On enter: requestFullscreen, hide sidebar (aside), hide toolbar buttons
// except #btn-fullscreen, hide #topbar-nav-btns, hide #topbar-divider,
// set canvas padding to 0.
// On exit (button or Esc): restore all above.
```

---

## Layout Skeleton (All Screens)

```
┌──────────────────────────────────────────────────────────────────────┐
│  SIDEBAR 220px                │  MAIN CONTENT (flex-1)               │
│  bg #fff                      │  bg #fff (or #F9FAFB for shell)      │
│  border-r #F3F4F6             │                                      │
│                               │  ┌── TOP BAR h-11/h-12 ──────────┐  │
│  workspace switcher           │  │ nav btns | title [badge] | CTA │  │
│  primary nav                  │  └──────────────────────────────── ┘  │
│  ─────────                    │                                      │
│  workspaces section           │  ┌── CONTENT AREA ────────────────┐  │
│  ─────────                    │  │  [page heading]                │  │
│  bottom nav                   │  │  [action cards row]            │  │
│  explore banner               │  │  [tab/filter row] [toggle][▾] │  │
│                               │  │  [grid / messages / form]      │  │
│                               │  └────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Interaction Specs

| Interaction | Spec |
|---|---|
| Card hover lift | `translateY(-2px)` · shadow card-hover · `transition 150ms ease-out` |
| `···` overflow btn | `opacity 0` by default → `opacity 1` on card hover · `100ms` |
| Tab switch | bg + color `transition 120ms ease-in-out` |
| Input focus ring | `border-color #5B63F6` · `box-shadow 0 0 0 3px rgba(91,99,246,0.15)` · immediate |
| Nav hover | `background #EEF2FF` · `100ms ease` |
| Workspace chevron | `transform rotate(90deg)` on open · `transition 150ms` |
| Toolbar btn hover | `background #F9FAFB` · `100ms ease` |
| Fullscreen toggle | icon swap expand ↔ compress · sidebar + toolbar hide/restore |
| AI typing indicator | 3-dot blink loop · 1.6s delay before response |
| Chat auto-scroll | `scrollTop = scrollHeight` after user message AND after AI response |

---

## Tech Stack

| Layer | Choice |
|---|---|
| Styling | Tailwind CSS CDN (custom config) |
| Charts | Chart.js 4.4.2 (CDN) |
| Font | Inter via Google Fonts (400/500/600/700/800) |
| JS | Vanilla — no framework |
| Icons | Heroicons SVG (inline, `stroke-width 1.5`) |

---

*Light mode only. Clean, minimal, data-focused aesthetic with blue-violet brand accent (`#5B63F6`). All copy reflects analytics, reports, insights, and data work — not document editing.*
