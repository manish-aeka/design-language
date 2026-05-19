# Chat — Design Language

**Version:** 2.0
**File:** `chat/index.html`
**Purpose:** AI-powered data chat interface for Aibii

---

## 1. Screen Anatomy

```
┌────────────────────────────────────────────────────────────┐
│  SIDEBAR (220px)   │  TOP BAR (h-11)                       │
│  id="sidebar"      ├────────────────────────────────────── │
│                    │                                       │
│                    │  MESSAGES AREA (flex-1, scroll)       │
│                    │                                       │
│                    │  · User bubble (right-aligned)        │
│                    │  · AI response (left-aligned)         │
│                    │  · Typing indicator                   │
│                    │                                       │
│                    ├────────────────────────────────────── │
│                    │  INPUT BAR (px-6 pb-5)                │
└────────────────────────────────────────────────────────────┘
```

Root element: `body.font-sans.bg-white.text-gray-900.flex.h-screen.overflow-hidden`

---

## 2. Color System

| Token | Value | Usage |
|---|---|---|
| `brand.primary` | `#5B63F6` | Active nav indicator, AI icon tint, send button, bar chart fills |
| `brand.secondary` | `#7C6FF7` | Bar chart secondary fill |
| `hover` | `#EEF2FF` | Nav hover, active nav bg, AI icon container |
| `#F3F4F6` | — | User bubble background |
| `#E8EEFF` | — | Explore banner background |
| `#C7D2FE` | — | Explore banner icon circle |
| `gray-100` | `#F3F4F6` | Border dividers, bar chart track |
| `gray-200` | `#E5E7EB` | Input bar border, button borders, table borders |
| `#16A34A` | — | Positive metric values |
| `#EF4444` | — | Negative metric values |
| `#0F9D58` | — | Google Sheets source pill dot |
| `#336791` | — | Analytics DB source pill dot |
| `#3B5BDB` | — | User avatar background |

---

## 3. Typography

| Element | Size | Weight | Color |
|---|---|---|---|
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
| Notification item | `13px` | 400 | `gray-900` |
| User dropdown name | `13px` | 600 | `gray-900` |
| User dropdown email | `11px` | 400 | `gray-400` |

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

Shared sidebar pattern across all Aibii views. **New Chat** is the active item on this page.

```
aside#sidebar  w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100
├── Workspace switcher   border-b border-gray-100  id="ws-switcher-wrapper"
├── Primary nav          px-3 py-2 space-y-0.5
├── Divider              mx-3 my-1 border-t border-gray-100
├── Projects section     px-3 py-1
│   ├── My Private Project (pinned, ws2)
│   │   └── 11 sub-items  id="ws2-sub"
│   └── Sovereign Capital Gate (ws1)
│       └── 9 sub-items   id="ws1-sub"
├── Spacer               flex-1
├── Divider              mx-3 border-t border-gray-100
├── Bottom nav           px-3 py-2 space-y-0.5
└── Explore banner       mx-3 mb-3 rounded-xl bg-[#E8EEFF]
```

### Workspace switcher button
```html
<button onclick="openWsModal()">
  <span id="ws-avatar">M</span>   <!-- w-7 h-7 rounded-full bg:#3B5BDB -->
  <span id="ws-name">Manish kumar's Work…</span>  <!-- text-sm font-semibold -->
  <svg><!-- up-down chevron --></svg>
</button>
```

### Primary nav items

| Item | State | href |
|---|---|---|
| Recent | plain | `../recent-view/index.html` |
| New Dashboard | plain | `#` |
| New Chat | **ACTIVE** | `#` |

### Active state (New Chat)
```css
background: #EEF2FF;
border-left: 2px solid #5B63F6;
padding-left: 10px;
font-weight: 500;
color: #111827;
```

### Projects section
Label: `text-[11px] uppercase tracking-widest text-gray-400` — "Projects"

Each workspace row:
```
div.nav-item flex items-center gap-1 px-2 h-9 rounded-lg
  button#ws{n}-btn  onclick="toggleWorkspace('ws{n}')"   → chevron toggle
  a                 workspace name
  svg               pin icon (ws2 only, color #5B63F6)
div#ws{n}-sub.ws-submenu pl-4 mt-0.5 space-y-0.5
  a × N             child items (chat/dashboard/document icons, colour-coded)
```

Sub-item icon colours: `#5B63F6` chat, `#16A34A` dashboard, `#F97316` document, `#8B5CF6` presentation, `#EC4899` list

### Bottom nav

| Item | Icon | href |
|---|---|---|
| Settings | gear | `../settings-profile/index.html` |

### Explore banner
```
div.mx-3.mb-3.mt-1.rounded-xl.px-3.py-2.5  bg:#E8EEFF
  div.w-8.h-8.rounded-full  bg:#C7D2FE  → sparkle SVG color:#4F6EF7
  p "Explore free features"  text-[12px] font-semibold color:#3B4ECC
  p "Credit left: 15"        text-[11px] color:#6B7ADE
```

### CSS
```css
.nav-item { transition: background-color 100ms ease; }
.nav-item:hover { background-color: #EEF2FF; }
.ws-submenu { display: none; }
.ws-submenu.open { display: block; }
.ws-chevron { transition: transform 150ms ease; }
#sidebar { transition: width 220ms ease, min-width 220ms ease, opacity 180ms ease; overflow: hidden; }
#sidebar.collapsed { width: 0 !important; min-width: 0 !important; opacity: 0; border-right: none; }
```

---

## 6. Workspace Switcher Modal

Triggered by `openWsModal()` from the workspace switcher button.

```
#ws-modal-backdrop  fixed inset-0 z-50  bg rgba(17,24,39,0.45) blur(2px)
  #ws-modal  bg-white rounded-lg max-w-lg  max-height:620px
    header
      h2  "Switch Workspace"  text-[15px] font-semibold text-gray-900
      p   "Select a workspace to switch to"  text-[12px] text-gray-400 mt-0.5
      button  "New Workspace"  bg:#5B63F6  hover:#4850e4  px-3 h-8 rounded-lg
    search  #ws-search  oninput="filterWsList()"
    list    #ws-modal-list  rendered by renderWsModalList()
```

```css
#ws-modal-backdrop { display: none; }
#ws-modal-backdrop.open { display: flex; }
```

### New Workspace modal
```
#new-ws-modal  hidden fixed inset-0 z-[60]  bg:#F3F4F6
  topbar  Aibii logo + close button
  form card  bg-white rounded-lg max-w-lg  px-7 py-8
    h2  "New workspace"  text-[17px] font-bold text-gray-900
    p   "A shared space for your team's work."  text-[12px] text-gray-400
    #ws-preview-avatar  w-11 h-11 rounded-xl  onclick="cycleWsColor()"  title="Click to change color"
    #ws-preview-name  text-[13px] font-semibold text-gray-800
    p   "Click avatar to change color"  text-[11px] text-gray-400
    label + input#new-ws-name   oninput="onWsNameInput(this.value)"  onkeydown Enter→createNewWs()
    label + textarea#new-ws-desc  (optional)
    Cancel + Create buttons  (Create: bg:#5B63F6 hover:#4850e4)
```

---

## 7. Top Bar

Height `h-11`, `px-4`, `border-b border-gray-100`, `flex items-center justify-between`.

**Left:** hamburger button `onclick="toggleSidebar()"` — `w-8 h-8 rounded-lg hover:bg-gray-100`

**Right (gap-1):**

| Element | ID | Detail |
|---|---|---|
| Notification bell | `#notif-wrapper` | `w-8 h-8 rounded-lg`, red dot `w-1.5 h-1.5 bg-red-500` |
| Notification dropdown | `#notif-dropdown` | `w-80 rounded-xl`, 5 items, "Mark all read" link |
| User avatar | `#user-menu-wrapper` | `w-7 h-7 rounded-full` bg `#3B5BDB`, initial "M" |
| User dropdown | `#user-dropdown` | `w-52 rounded-xl`, name + email + Logout button |

### Notification dropdown
```
#notif-dropdown  hidden absolute right-0 top-full mt-1 w-80
  header  "Notifications" + "Mark all read"
  5 items:
    Sara M.  → shared Revenue Overview   (avatar #5B63F6, unread dot)
    Riya K.  → commented on Q4 Strategy (avatar #16A34A, unread dot)
    Aibii AI → finished analyzing        (avatar #F97316)
    Priya N. → invited to SCG            (avatar #8B5CF6)
    Aibii AI → report-ready export done  (avatar #0EA5E9)
```

### User dropdown
```
#user-dropdown  hidden absolute right-0 top-full mt-1 w-52
  Manish Kumar  (text-[13px] font-semibold)
  manish@aibii.com  (text-[11px] text-gray-400)
  Logout button  (text-[13px] text-red-500 hover:bg-red-50)
```

---

## 8. Messages Area

`#messages-area` — `flex-1 overflow-y-auto px-6 py-6 space-y-6`

Auto-scrolls to bottom on load (`scrollTop = 9999`) and after each new message.

---

## 9. Message Components

### 9a. User Bubble

```
.msg-user  flex justify-end
  div  max-w-[68%] flex flex-col items-end gap-1
    .bubble  px-4 py-2.5 text-[14px] leading-relaxed
      background: #F3F4F6
      color: #111827
      border-radius: 18px 18px 4px 18px   ← bottom-right clipped
    span  text-[11px] text-gray-400  (timestamp)
```

### 9b. AI Response

```
.msg-ai  flex gap-3
  div  w-6 h-6 rounded-lg bg-[#EEF2FF] flex-shrink-0 mt-1
    svg  w-3.5 h-3.5 color:#5B63F6  (sparkle icon)
  div  flex-1 max-w-[78%] flex flex-col gap-2
    .bubble  px-4 py-3 text-[14px] leading-relaxed
      no background (transparent canvas)
      color: #111827
      border-radius: 18px 18px 18px 4px   ← bottom-left clipped
    source pills row
    action buttons row
```

### 9c. Inline Data Table

```
div  rounded-xl border border-gray-200 overflow-hidden bg-white
  header row  grid grid-cols-3 px-4 h-9 bg-gray-50 border-b border-gray-100
    text-[11px] font-semibold text-gray-400 uppercase tracking-widest
  data rows  divide-y divide-gray-100
    h-10 px-4 grid grid-cols-3 text-[13px]
    Positive change: color #16A34A
    Negative change: color #EF4444
    Neutral: text-gray-400
```

### 9d. Inline Bar Chart

```
div  space-y-2.5
  each row:
    flex justify-between  label text-[12px] font-medium text-gray-700
                          value text-[12px] font-semibold text-gray-900
    track  h-2 bg-gray-100 rounded-full overflow-hidden
      fill  h-2 rounded-full
        Primary:   #5B63F6  (82% width example)
        Secondary: #7C6FF7
        Tertiary:  #A5B4FC
        Negative:  #FCA5A5
```

### 9e. Source Pills

```
div  flex items-center gap-2 flex-wrap
  span  text-[11px] text-gray-400  "Sources:"
  .source-pill  px-2.5 h-6 rounded-full border border-gray-200 bg-gray-50
    text-[11px] font-medium text-gray-600
    hover: background #E0E7FF  (transition 100ms)
```

| Source | Dot colour | Dot shape |
|---|---|---|
| Google Sheets | `#0F9D58` | `rounded-sm` (2×2) |
| Analytics DB | `#336791` | `rounded-full` (2×2) |

### 9f. AI Action Buttons

```css
.ai-action {
  display: flex; align-items: center; gap: 6px;
  padding: 0 10px; height: 28px; border-radius: 8px;
  font-size: 12px; font-weight: 500; color: #6B7280;
  transition: background-color 100ms, color 100ms;
}
.ai-action:hover { background: #E5E7EB; color: #374151; }
```

Actions: **Copy**, **Export**, **Regenerate**

### 9g. Typing Indicator

Hidden by default (`hidden`), shown while AI is responding.

```html
<div id="typing-indicator" class="msg-ai flex gap-3 hidden">
  <div class="bubble px-4 py-3 flex items-center gap-1">
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
  </div>
</div>
```

```css
@keyframes blink { 0%,80%,100% { opacity: 0; } 40% { opacity: 1; } }
.dot { width:6px; height:6px; border-radius:50%; background:#9CA3AF; animation: blink 1.2s infinite; }
.dot:nth-child(2) { animation-delay: 0.2s; }
.dot:nth-child(3) { animation-delay: 0.4s; }
```

---

## 10. Input Bar

```
div  px-6 pb-5 flex-shrink-0
  div  flex items-end gap-3 bg-white border border-gray-200 rounded-2xl px-4 py-3
       shadow-card  focus-within: border-indigo-300 + ring rgba(91,99,246,0.12)
    button  attach icon  w-5 h-5 text-gray-400 hover:text-gray-600
    textarea#chat-input  flex-1 text-[14px] placeholder-gray-400
      resize:none  max-height:160px  overflow-y:auto
      oninput="autoGrow(this)"  onkeydown="handleKey(event)"
      placeholder "Ask anything about your data…"
    button#send-btn  onclick="sendMessage()"
      w-8 h-8 rounded-xl  background:#5B63F6
      send SVG  w-4 h-4 text-white
```

---

## 11. JS Functions

### Chat functions

| Function | Trigger | Behaviour |
|---|---|---|
| `autoGrow(el)` | `oninput` on textarea | Sets height to `scrollHeight`, capped at 160px |
| `handleKey(e)` | `onkeydown` on textarea | Enter → `sendMessage()`; Shift+Enter → newline |
| `sendMessage()` | Send button / Enter | Appends user bubble, shows typing indicator, appends AI response after 1.6s |
| `useSuggestion(btn)` | suggestion chip click | Fills textarea with chip text |
| `escapeHtml(s)` | internal | Escapes `& < > "` |
| `currentTime()` | internal | Returns `HH:MM` string |

AI responses rotate through a pool of 4 pre-built responses (`AI_RESPONSES` array, `responseIndex`).

### Sidebar & workspace functions

| Function | Behaviour |
|---|---|
| `toggleSidebar()` | Toggles `#sidebar.collapsed` |
| `toggleWorkspace(id)` | Toggles `#ws{id}-sub.open`, rotates chevron 90° |
| `openWsModal()` | Opens `#ws-modal-backdrop`, renders list, focuses search |
| `closeWsModal(e)` | Closes if click target is backdrop itself |
| `selectWorkspace(id)` | Marks workspace current, updates `#ws-avatar` + `#ws-name`, closes modal |
| `renderWsModalList(filter)` | Renders filtered workspace buttons into `#ws-modal-list` |
| `filterWsList()` | Reads `#ws-search` value, calls `renderWsModalList` |
| `openNewWsModal()` | Hides ws-modal-backdrop, shows `#new-ws-modal` |
| `closeNewWsModal()` | Hides `#new-ws-modal` |
| `cycleWsColor()` | Cycles through 8-colour palette on avatar click |
| `onWsNameInput(val)` | Updates preview avatar initial + name |
| `createNewWs()` | Creates new ws entry, pushes to `wsData`, calls `selectWorkspace` |

### Dropdown functions

| Function | Behaviour |
|---|---|
| `toggleNotifications()` | Closes `#user-dropdown`, toggles `#notif-dropdown` |
| `markAllRead()` | Sets all blue unread dots to `#D1D5DB` |
| `toggleUserMenu()` | Closes `#notif-dropdown`, toggles `#user-dropdown` |

Click-outside listener closes both `#notif-dropdown` and `#user-dropdown` when clicking outside their wrappers.

---

## 12. Workspace Data

```js
var wsData = [
  { id:'ws1', name:'Sovereign Capital Gate', initial:'S', color:'#5B63F6', current:false },
  { id:'ws2', name:'My Private Project',     initial:'M', color:'#3B5BDB', current:true  },
  { id:'ws3', name:'Product Team',           initial:'P', color:'#16A34A', current:false },
  { id:'ws4', name:'Growth & Marketing',     initial:'G', color:'#F97316', current:false },
  { id:'ws5', name:'Finance Ops',            initial:'F', color:'#8B5CF6', current:false },
  { id:'ws6', name:'Design System',          initial:'D', color:'#0EA5E9', current:false }
];
```

New workspace colour palette (cycled via `cycleWsColor()`):
`#5B63F6` · `#3B5BDB` · `#16A34A` · `#F97316` · `#8B5CF6` · `#0EA5E9` · `#EC4899` · `#EF4444`
