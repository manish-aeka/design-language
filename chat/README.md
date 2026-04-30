# Chat — Design Language

**Version:** 1.0  
**File:** `chat/index.html`  
**Purpose:** AI-powered data chat interface for Aibii

---

## 1. Screen Anatomy

```
┌─────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)  │  TOP BAR (h-11)                     │
│                   ├─────────────────────────────────────│
│                   │                                     │
│                   │  MESSAGES AREA (flex-1, scroll)     │
│                   │                                     │
│                   │  · User bubble (right-aligned)      │
│                   │  · AI response (left-aligned)       │
│                   │  · Typing indicator                 │
│                   │                                     │
│                   ├─────────────────────────────────────│
│                   │  INPUT BAR                          │
└─────────────────────────────────────────────────────────┘
```

The layout is a full-height `flex` row (`h-screen overflow-hidden`) with a fixed sidebar and a fluid main column that itself is a `flex-col`.

---

## 2. Color System

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav indicator, AI icon bg tint, send button, bar chart fills |
| `brand.secondary` | `#7C6FF7` | Gradient end on AI icon |
| `hover` | `#EEF2FF` | Nav item hover, active nav background, AI icon container bg |
| `#F3F4F6` | — | User bubble background (light shade) |
| `#E8EEFF` | — | Explore banner background |
| `#C7D2FE` | — | Explore banner icon circle |
| `gray-100` | `#F3F4F6` | Border dividers, bar chart track |
| `gray-200` | `#E5E7EB` | Input bar border, button borders, table borders |
| `#16A34A` | — | Positive metric values (green) |
| `#EF4444` | — | Negative metric values (red) |
| `#0F9D58` | — | Google Sheets source pill dot |
| `#336791` | — | PostgreSQL/Analytics DB source pill dot |

---

## 3. Typography

| Element | Size | Weight | Color |
|---|---|---|---|
| Breadcrumb parent | `13px` | 400 | `gray-500` |
| Breadcrumb active | `13px` | 500 | `gray-700` |
| Message body | `14px` | 400 | `gray-900` / `#111827` |
| Message note / secondary | `13px` | 400 | `gray-600` |
| Table header | `11px` | 600 | `gray-400`, uppercase, `tracking-widest` |
| Table cell value | `13px` | 600 | `gray-900` |
| Table cell label | `13px` | 500 | `gray-700` |
| Bar chart label | `12px` | 500 | `gray-700` |
| Bar chart value | `12px` | 600 | `gray-900` |
| Source pill label | `11px` | 500 | `gray-600` |
| Action button label | `12px` | 500 | `gray-500` |
| Timestamp | `11px` | 400 | `gray-400` |
| Sidebar section header | `11px` | 500 | `gray-400`, uppercase, `tracking-widest` |
| Sidebar nav item | `14px` | 400/500 | `gray-700` / `gray-900` (active) |

**Font stack:** Inter → system-ui → -apple-system → sans-serif  
**Weights loaded:** 400, 500, 600, 700, 800 via Google Fonts

---

## 4. Spacing & Layout

| Zone | Spec |
|---|---|
| Sidebar width | `220px` fixed, `min-w-[220px]` |
| Top bar height | `h-11` (44px) |
| Messages area padding | `px-6 py-6` |
| Message gap | `space-y-6` (24px between messages) |
| Input bar padding | `px-6 pb-5` |
| Input bar inner padding | `px-4 py-3` |
| AI message gap (icon + content) | `gap-3` |
| Action button height | `h-7` (28px) |
| Source pill height | `h-6` (24px) |

---

## 5. Sidebar

Identical spec shared across all Aibii views. In this view **New chat** is the active item.

### Structure (top → bottom)

1. **Workspace switcher** — `px-4 py-3 border-b border-gray-100`. Avatar circle `w-7 h-7 rounded-full`, name `text-sm font-semibold`, chevron icon.
2. **Primary nav** — `px-3 py-2 space-y-0.5`. Three items: Recent, New dashboard, New chat.
3. **Divider** — `mx-3 my-1 border-t border-gray-100`
4. **Workspaces section** — Section label `text-[11px] uppercase tracking-widest text-gray-400`. Two collapsible workspace rows with chevron toggle + child items (Chat, Dashboard, Document colour-coded).
5. **Spacer** — `flex-1`
6. **Divider** — `mx-3 border-t border-gray-100`
7. **Bottom utility nav** — Shared with me + Settings (links to `../settings-profile/index.html`)
8. **Explore banner** — `rounded-xl bg-[#E8EEFF] px-3 py-2.5`

### Active state (New chat)
```css
background: #EEF2FF;
border-left: 2px solid #5B63F6;
padding-left: 10px;
font-weight: 500;
color: #111827;
```

### Inactive hover state
```css
.nav-item:hover { background-color: #EEF2FF; }
transition: background-color 100ms ease;
```

### Workspace submenu
```css
.ws-submenu { display: none; }
.ws-submenu.open { display: block; }
.ws-chevron { transition: transform 150ms ease; }
.ws-item.open .ws-chevron { transform: rotate(90deg); }
```

---

## 6. Top Bar

Height `h-11`, `border-b border-gray-100`, `px-6`, `flex items-center justify-between`.

**Left side:**
- Hamburger icon (`w-[18px]`)
- Back / Forward navigation chevrons (`w-4 h-4 text-gray-400`)
- Breadcrumb: `"Chat"` (`text-[13px] text-gray-500`) → chevron (`text-gray-300`) → `"Q4 Revenue Analysis"` (`text-[13px] font-medium text-gray-700`)

**Right side (gap-1.5):**

| Button | Size | Style |
|---|---|---|
| `N sources` | `h-7 px-2.5 rounded-lg` | Border `gray-200`, icon `#0F9D58`, `text-[12px] text-gray-600` |
| Share | `h-7 px-2.5 rounded-lg` | Same |
| More (⋯) | `w-7 h-7 rounded-lg` | Square, same border |

All right-side buttons: `hover:bg-gray-50 transition-colors`

---

## 7. Messages Area

`flex-1 overflow-y-auto px-6 py-6 space-y-6`

Auto-scrolls to bottom on load and after each new message (`area.scrollTop = area.scrollHeight`).

---

## 8. Message Components

### 8a. User Bubble

```
.msg-user — flex justify-end
  └─ max-w-[68%] flex flex-col items-end gap-1
       ├─ .bubble — px-4 py-2.5 text-[14px] leading-relaxed
       │    background: #F3F4F6
       │    color: #111827
       │    border-radius: 18px 18px 4px 18px  ← bottom-right clipped
       └─ timestamp — text-[11px] text-gray-400
```

The **bottom-right** corner is clipped (`4px`) to indicate message origin.

---

### 8b. AI Response

```
.msg-ai — flex gap-3
  ├─ AI Icon — w-6 h-6 rounded-lg bg-[#EEF2FF], mt-1, flex-shrink-0
  │    Inner SVG: w-3.5 h-3.5 color:#5B63F6 (sparkle/AI icon)
  └─ flex-1 max-w-[78%] flex flex-col gap-2
       ├─ .bubble — px-4 py-3 text-[14px] leading-relaxed
       │    no background (transparent)
       │    color: #111827
       │    border-radius: 18px 18px 18px 4px  ← bottom-left clipped
       ├─ Source pills row
       └─ Action buttons row
```

The **bottom-left** corner is clipped (`4px`) to indicate AI origin. No background on AI bubble — content sits directly on the canvas white.

---

### 8c. Inline Data Table

Used inside AI bubbles to display structured metrics.

```
rounded-xl border border-gray-200 overflow-hidden bg-white
  ├─ Header row — bg-gray-50 border-b border-gray-100
  │    h-9, px-4, grid grid-cols-3
  │    text-[11px] font-semibold text-gray-400 uppercase tracking-widest
  └─ Data rows — divide-y divide-gray-100
       h-10, px-4, grid grid-cols-3, text-[13px]
       Positive change: color #16A34A
       Negative change: color #EF4444
       Neutral: text-gray-400
```

---

### 8d. Inline Bar Chart

Used inside AI bubbles to display segment comparisons.

```
space-y-2.5
  └─ each row:
       ├─ flex justify-between — label text-[12px] font-medium text-gray-700
       │                          value text-[12px] font-semibold text-gray-900
       └─ track: h-2 bg-gray-100 rounded-full overflow-hidden
            fill:  h-2 rounded-full
                   Primary:   background #5B63F6
                   Secondary: background #7C6FF7
                   Tertiary:  background #A5B4FC
                   Negative:  background #FCA5A5
```

---

### 8e. Source Pills

```
flex items-center gap-2 flex-wrap
  ├─ label: text-[11px] text-gray-400 "Sources:"
  └─ .source-pill — px-2.5 h-6 rounded-full border border-gray-200 bg-gray-50
       text-[11px] font-medium text-gray-600
       gap-1.5 with 2×2 colour dot (rounded-sm = sheets, rounded-full = DB)
       hover: background #E0E7FF
       transition: background-color 100ms ease
```

| Source | Dot colour | Dot shape |
|---|---|---|
| Google Sheets | `#0F9D58` | `rounded-sm` |
| Analytics DB | `#336791` | `rounded-full` |

---

### 8f. AI Action Buttons

```
.ai-action — flex items-center gap-1.5 px-2.5 h-7 rounded-lg
  text-[12px] font-medium text-gray-500
  hover: background #E5E7EB, color #374151
  transition: background-color 100ms ease, color 100ms ease
```

Actions: **Copy**, **Export**, **Regenerate**

---

### 8g. Typing Indicator

Hidden by default (`hidden`), shown while AI response is loading.

```
#typing-indicator — .msg-ai flex gap-3
  └─ .bubble px-4 py-3 flex items-center gap-1
       └─ 3× .dot
```

```css
.dot {
  width: 6px; height: 6px;
  border-radius: 50%;
  background: #9CA3AF;
  animation: blink 1.2s infinite;
}
.dot:nth-child(2) { animation-delay: 0.2s; }
.dot:nth-child(3) { animation-delay: 0.4s; }

@keyframes blink { 0%,80%,100% { opacity: 0; } 40% { opacity: 1; } }
```

---

## 9. Input Bar

```
px-6 pb-5
└─ flex items-end gap-3
   border border-gray-200 rounded-2xl px-4 py-3
   shadow: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)
   focus-within: border-indigo-300 + ring 0 0 0 3px rgba(91,99,246,0.12)
   transition: all
   ├─ Attach button — w-5 h-5 text-gray-400 hover:text-gray-600
   ├─ #chat-input textarea — flex-1 text-[14px] text-gray-900
   │    placeholder: text-gray-400
   │    resize: none; max-height: 160px; overflow-y: auto
   │    auto-grows via oninput → autoGrow(this)
   │    Enter = send, Shift+Enter = newline
   └─ Send button — w-8 h-8 rounded-xl background:#5B63F6
        icon: paper-plane SVG w-4 h-4 text-white
```

---

## 10. Scrollbar

```css
::-webkit-scrollbar { width: 5px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }
```

---

## 11. Shadows

| Token | Value | Used on |
|---|---|---|
| `card` | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` | Input bar |
| `card-hover` | `0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)` | Reserved |
| `input` | `0 0 0 3px rgba(91,99,246,0.12)` | Input bar focus ring |

---

## 12. Borders & Radius

| Element | Radius |
|---|---|
| Input bar container | `rounded-2xl` (16px) |
| User bubble | `18px 18px 4px 18px` |
| AI bubble | `18px 18px 18px 4px` |
| AI icon | `rounded-lg` (8px) |
| Action buttons | `rounded-lg` (8px) |
| Source pills | `rounded-full` |
| Inline data table | `rounded-xl` (12px) |
| Bar chart track + fill | `rounded-full` |
| Send button | `rounded-xl` (12px) |
| Sidebar nav items | `rounded-lg` (8px) |
| Explore banner | `rounded-xl` (12px) |

---

## 13. JavaScript Behaviour

| Function | Purpose |
|---|---|
| `toggleWorkspace(id)` | Toggle `.open` on workspace submenu + chevron button |
| `autoGrow(el)` | Expand textarea height up to `160px` max |
| `handleKey(e)` | `Enter` → `sendMessage()`, `Shift+Enter` → newline |
| `sendMessage()` | Appends user bubble → shows typing indicator → after 1.6s appends AI response from `AI_RESPONSES` pool |
| `escapeHtml(s)` | XSS-safe string escaping for user input |
| `currentTime()` | Returns `HH:MM AM/PM` timestamp string |

### AI Response Pool

`AI_RESPONSES` is an array of 4 objects, each with `text`, `extra` (inline HTML: table or bar chart), and `note`. The pool cycles via `responseIndex % AI_RESPONSES.length`, so responses rotate on each send.

---

## 14. Design Principles

1. **Conversation-first** — The chat canvas is white with no backgrounds on AI bubbles; content breathes without visual noise.
2. **Directional corners** — User bubbles clip bottom-right; AI bubbles clip bottom-left. The clipped corner points toward the origin.
3. **Data inline** — Tables and bar charts are embedded directly in bubbles, not in modal overlays, keeping the conversation context intact.
4. **Minimal chrome** — No footer text, no model badges in the input bar. The input bar itself is the only affordance needed.
5. **Consistent sidebar** — The sidebar is pixel-identical across all Aibii views. Only the active item changes.

---

## 15. File Structure

```
chat/
├── index.html   — single-file prototype (HTML + Tailwind CDN + vanilla JS)
└── README.md    — this design language document
```

**External dependencies (CDN only):**
- `https://cdn.tailwindcss.com` — utility CSS
- `https://fonts.googleapis.com` — Inter typeface
