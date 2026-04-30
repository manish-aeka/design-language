# Aibii — AI Business Intelligence SaaS · Google Stitch Prompt

> Paste this entire file into Google Stitch as your UI generation prompt.

---

## What to Build

Build **Aibii** — an **AI-powered Business Intelligence SaaS web application**. Users connect data sources, generate AI-driven reports and insights, build dashboards, and collaborate with their team on analytical work. It has a persistent left sidebar and a fluid content area. Generate the following 3 screens:

1. **Sovereign Capital Gate** — organisation-level insight & report grid
2. **Recent** — personal recent reports and analyses view
3. **Settings › Profile** — user profile settings form

---

## Design System

### Colors

```
Background page:        #FFFFFF
Background sidebar:     #F8F9FC
Background hover:       #EEF2FF
Background card:        #FFFFFF
Background placeholder: #F3F4F6
Background input:       #FFFFFF
Background input-ro:    #F9FAFB
Tab container:          #F3F4F6
Tab active:             #FFFFFF

Text primary:           #111827
Text secondary:         #6B7280
Text tertiary:          #9CA3AF
Text link / brand:      #5B63F6
Text upgrade:           #7C3AED

Border default:         #E5E7EB
Border subtle:          #F3F4F6
Border focus:           #5B63F6

Brand primary:          #5B63F6
Brand secondary:        #7C6FF7
Brand gradient:         linear-gradient(135deg, #4F6EF7, #8B5CF6)

Icon brand:             #5B63F6
Icon muted:             #D1D5DB

View toggle bg:         #12131F
View toggle active btn: #1C3A6E
Type filter bg:         #1A1A2A
Type filter text:       #E5E7EB

Scrollbar thumb:        #CBD5E1
```

### Typography

```
Font: Inter, system-ui, sans-serif

Display:        28px / 700 / lh 1.2   — page titles
Subtitle:       14px / 400 / lh 1.5   — page subtitles
Section label:  14px / 600 / lh 1.3   — section headings
Field label:    13px / 500 / lh 1.3   — form labels
Body md:        14px / 400 / lh 1.5   — card labels, nav
Body sm:        13px / 400 / lh 1.4   — descriptions
Card title:     14px / 500 / lh 1.4   — document titles
Tab label:      14px / 500 / lh 1.3   — tab text
Timestamp:      12px / 400 / lh 1.3   — "Edited 19 min ago"
Caption:        11px / 400 / lh 1.3   — helper text
```

### Spacing

```
Base unit: 4px
4px  8px  12px  16px  20px  24px  28px  32px  40px  48px
```

### Border Radius

```
4px   — badges
8px   — inputs, buttons, icon backgrounds, nav items
12px  — cards, action cards
16px  — modals
9999px — pill tabs, avatars, view toggle container
```

### Shadows

```
Card rest:  0 1px 3px rgba(0,0,0,0.07), 0 1px 2px rgba(0,0,0,0.04)
Card hover: 0 4px 12px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.06)
Tab active: 0 1px 4px rgba(0,0,0,0.10)
Input focus: 0 0 0 3px rgba(91,99,246,0.15)
Button:     0 1px 2px rgba(0,0,0,0.06)
Modal:      0 20px 60px rgba(0,0,0,0.18)
```

---

## Shared Component: Sidebar

The sidebar is **220px wide**, fixed, always visible. Background `#F8F9FC`.

```
┌─────────────────────────┐
│  [M] Manish kumar's Work ▾│  14px bold, org switcher chip
├─────────────────────────┤
│  ✦  Ask Aibii AI    ⌘K  │  14px, brand icon (AI query shortcut)
│  🕐 Recent              │  14px
│  📊 New report          │  14px
│  💬 Ask AI              │  14px
├─────────────────────────┤
│  PROJECTS          [👁] │  12px uppercase label, #6B7280
│  # Sovereign Capital Gate│  SELECTED: bg #EEF2FF, left border 2px #5B63F6
│  # My private project   │
│  +  Create a project    │
├─────────────────────────┤
│  🚀 Upgrade this workspace│  #7C3AED text
│  👤 Shared with me      │
│  🔗 Connect data        │
│  🗂  Templates          │
│  ⚙  Settings           │
├─────────────────────────┤
│  🔵 Explore free features│  bottom banner, small
│     2 generations of 15  │  #6B7280, 11px
└─────────────────────────┘
```

Nav item specs:
- Height: 36px, padding: 0 20px, border-radius: 8px
- Selected: bg `#EEF2FF`, left border `2px solid #5B63F6`
- Hover: bg `#EEF2FF` at 70% opacity
- Icon: 16px line icon, `#6B7280`

---

## Shared Component: Action Cards Row

Four equal-width cards in a flex row with `gap: 16px`. Each card:

```
┌────────────────────────────────┐
│  ┌────┐  Title (14px/500)      │
│  │icon│  Description (13px)    │
│  └────┘                        │
└────────────────────────────────┘
```

- Background: `#FFFFFF`, border: `1px solid #E5E7EB`, radius: 12px, padding: 16px
- Icon wrapper: 8px padding, `rgba(91,99,246,0.08)` bg, radius 8px, icon 20px `#5B63F6`
- Hover: `box-shadow: 0 4px 12px rgba(0,0,0,0.10)`, `translateY(-1px)`, transition 150ms ease-out

---

## Shared Component: View Toggle + Type Filter

Placed **right-aligned on the same row as the tab/filter bar**.

**View Toggle:**
- Container: bg `#12131F`, radius `9999px`, padding `4px`
- Two buttons `36×36px`, radius `9999px`
- Left button (list view — active): bg `#1C3A6E`, icon `#FFFFFF` — icon: checkmark + lines
- Right button (grid view — inactive): bg `transparent`, icon `#9CA3AF` — icon: 2×2 grid dots

**Type Filter:**
- Button: bg `#1A1A2A`, border `1px solid rgba(255,255,255,0.12)`, radius 8px, padding `6px 12px`
- Label: "Type", 13px, 500, `#E5E7EB` + `ChevronDown` icon 12px `#9CA3AF`
- Dropdown panel: bg `#1A1A2A`, border `1px solid rgba(255,255,255,0.10)`, radius 12px, shadow `0 8px 24px rgba(0,0,0,0.40)`
- Items: 36px height, `flex + gap 10px`, label 13px `#E5E7EB`, coloured square icon 20px
**Type filter dropdown item list** (AI BI context):
- Reports, Dashboards, Datasets, Queries, KPIs, Charts, Spreadsheets, Presentations, PDFs, Videos, Forms, Archives, Audio, Drawings, Shortcuts

---

## Screen 1: Sovereign Capital Gate (Organisation View)

**Page heading:**
```
# Sovereign Capital Gate
Analyse data and share business insights with your team.    (14px #6B7280)
```

**Action cards row** (4 cards):
1. Icon `BarChart2`, Title "New report", Desc "Build from +100 templates"
2. Icon `Sparkles`, Title "Ask AI", Desc "Generate insights from a prompt"
3. Icon `Database`, Title "Connect data", Desc "Chat with your data sources"
4. Icon `LayoutDashboard`, Title "Create dashboard", Desc "Organise your insights"

**Below action cards:**

Row with: left-aligned label "Reports" (14px/600 `#111827`) + right-aligned **View Toggle** + **Type Filter**

**Report grid:** 2 columns (or 3 on wider screens), `gap: 16px`

Each report card:
```
┌──────────────────────────────────┐
│                                  │
│          [  📊  ]                │  ← bg #F3F4F6, height 160px, icon 32px #D1D5DB centered
│                                  │
├──────────────────────────────────┤
│  Untitled                    ⋯  │  ← 14px/500 #111827 + MoreHorizontal icon (show on hover)
│  Updated 22 minutes ago          │  ← 12px #6B7280
└──────────────────────────────────┘
```

Card: border `1px solid #E5E7EB`, radius 12px, bg `#FFFFFF`
Card hover: border transitions to `rgba(91,99,246,0.3)`, shadow `0 4px 12px rgba(0,0,0,0.10)`

Show **2 report cards** in the grid (both "Untitled").

---

## Screen 2: Recent View

**Breadcrumb bar** (top strip, 44px, border-bottom `1px solid #F3F4F6`):
```
≡   ‹   ›   Recent
```
(hamburger 18px, chevrons 16px `#9CA3AF`, "Recent" 13px `#6B7280`)

**Page heading:**
```
🕐  Recent                          (28px/700 #111827, clock icon inline)
    Your recent reports and insights are displayed here.
    You can also create new reports and dashboards from here.   (14px #6B7280)
```

**Action cards row** (4 cards):
1. Icon `BarChart2`, Title "New report", Desc "Build from +100 templates"
2. Icon `Hash`, Title "Create a workspace", Desc "Group your reports"
3. Icon `Sparkles`, Title "Ask AI", Desc "Generate insights from a prompt"
4. Icon `Database`, Title "Connect data", Desc "Chat with your data sources"

**Filter tab bar + View Toggle + Type Filter on the same row:**

Left side — pill tabs container (bg `#F3F4F6`, radius `9999px`, padding `4px`):
```
[ By me ]   By everyone   Shared with me
```
- Active tab "By me": bg `#FFFFFF`, border `1px solid #E5E7EB`, shadow `0 1px 4px rgba(0,0,0,0.10)`, text `#111827`
- Inactive tabs: transparent bg, text `#6B7280`
- Each tab: height 32px, padding `8px 16px`, radius `9999px`, font 14px/500

Right side — **View Toggle** + **Type Filter** (as described above)

**Report grid:** 4 columns, `gap: 16px`, margin-top 24px from tab bar

Show **8 report cards** in a 4×2 grid:
- Row 1: "Untitled" (19 min), "Untitled" (20 min), "Untitled" (20 min), "Untitled" (1 hr)
- Row 2: "Q1 Revenue Analysis" (1 hr), "Untitled" (1 hr), "Untitled" (1 hr), "Untitled" (1 hr)

Each card uses `BarChart2` icon 32px `#D1D5DB` in the preview zone instead of a file icon.

Scrollbar on right: 6px width, thumb `#CBD5E1`, radius pill, visible only on overflow.

---

## Screen 3: Settings › Profile

**Breadcrumb bar** (44px, border-bottom `1px solid #F3F4F6`):
```
≡   ‹   ›   Settings
```

**Page heading:**
```
Profile                              (28px/700 #111827)
Manage your team and preferences here.   (14px #6B7280)
```

**Settings tab bar** — same row, right side has **View Toggle** + **Type Filter**:
```
[ Profile ]   Workspace   Billing   Members   Integrations
```
- Active "Profile": bg `#FFFFFF`, border `1px solid #E5E7EB`, radius `9999px`, text `#111827`
- Inactive: transparent, text `#6B7280`, radius `9999px`
- Tab height 34px, padding `6px 16px`

**Form content** (max-width 600px):

**Section: Picture** (14px/600 `#111827`, margin-bottom 16px)

```
[ Avatar photo, 48×48px circle, border 2px #E5E7EB ]   [ Upload a picture ]
```
- Avatar: round (radius 9999px), user photo
- Button: bg `#FFFFFF`, border `1px solid #E5E7EB`, radius 8px, padding `8px 16px`, 14px/500 `#111827`, shadow `0 1px 2px rgba(0,0,0,0.06)`

**Field labels** (13px/500 `#6B7280`, margin-bottom 8px)

**Two-column name row** (gap 16px):
```
First name                   Last name
┌─────────────────────┐     ┌─────────────────────┐
│  Manish             │     │  kumar               │
└─────────────────────┘     └─────────────────────┘
```

**Single-column email row:**
```
Email
┌──────────────────────────────────────┐
│  manish7479dlp@gmail.com             │  ← dimmed, read-only
└──────────────────────────────────────┘
```

Input specs:
- Editable: height 40px, padding `10px 14px`, bg `#FFFFFF`, border `1px solid #E5E7EB`, radius 8px, text `#111827` 14px
- Focus: border `#5B63F6`, shadow `0 0 0 3px rgba(91,99,246,0.15)`
- Read-only email: bg `#F9FAFB`, text `#9CA3AF`, same border/radius, `cursor: default`

---

## Interaction Notes for All Screens

- Cards lift on hover: `translateY(-1px)` + stronger shadow, transition 150ms ease-out
- `⋯` overflow button hidden by default, appears on card hover (opacity 0→1, 100ms)
- Tab switches: bg-color + color transition 120ms ease-in-out
- Input focus ring appears immediately (no delay) — accessibility requirement
- View toggle buttons: bg-color transition 120ms ease
- Type filter dropdown: opens below trigger, items highlight on hover 80ms

---

## Layout Skeleton (All Screens)

```
┌──────────────────────────────────────────────────────────────┐
│ SIDEBAR 220px fixed  │  CONTENT AREA fluid                   │
│ bg #F8F9FC           │  bg #FFFFFF                           │
│                      │  padding: 0 32px                      │
│  [nav items]         │                                       │
│                      │  [breadcrumb bar — Screen 2 & 3 only] │
│                      │                                       │
│                      │  [page heading]                       │
│                      │                                       │
│                      │  [action cards row]                   │
│                      │                                       │
│                      │  [tabs/filter row]  [toggle][type▾]  │
│                      │                                       │
│                      │  [document grid OR form]              │
│                      │                                       │
└──────────────────────────────────────────────────────────────┘
```

---

*Generate all 3 screens. Use the exact hex values, spacing, and component specs above. The overall feel is: clean, minimal, data-focused, with a blue-violet brand accent. Light mode only. This is an AI Business Intelligence SaaS — all content language should reflect analytics, reports, insights, and data work — not document editing.*
