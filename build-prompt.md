# Aibii — Master UI Build Prompt
## SvelteKit · TypeScript Strict · CSR/SPA · shadcn-svelte · Plotly.js · Lucide Svelte

> **Give this entire file to the AI before building any screen.**
> It is the single source of truth for every architectural decision, design token,
> component contract, store shape, service pattern, and page structure.
> Never deviate from these rules without explicit instruction.

---

## PART 1 — TECH STACK (Locked)

| Concern | Choice | Notes |
|---|---|---|
| Framework | SvelteKit (latest) | CSR/SPA mode — `ssr = false` everywhere |
| Language | TypeScript **strict** | `"strict": true` in tsconfig, no `any` |
| Styling | Tailwind CSS v3 + `@tailwindcss/forms` | Use `style=""` only for hex colors not in Tailwind |
| UI Primitives | shadcn-svelte | Button, Input, Card, Dialog, DropdownMenu, Tabs |
| Charts | Plotly.js (`plotly.js-dist-min`) | Dynamic import in `onMount` only — never SSR |
| Icons | `lucide-svelte` | Replace all Heroicons with Lucide equivalents |
| Font | Inter via Google Fonts | Weights 400–800, loaded in `app.html` |
| State | Svelte stores (`$lib/stores/`) | writable, derived, custom async factory |
| API | Service layer only | **Zero API calls inside `.svelte` files** |
| Routing | SvelteKit file-based | `src/routes/`, `+layout.ts` for CSR config |

### 1.1 Heroicons → Lucide Equivalents (no exceptions)

| Old Heroicon | Lucide component |
|---|---|
| `chart-bar` | `BarChart2` |
| `document-text` | `FileText` |
| `presentation-chart-bar` | `LayoutTemplate` |
| `chat-bubble-left` | `MessageSquare` |
| `cog-6-tooth` | `Settings` |
| `circle-stack` | `Database` |
| `clock` | `Clock` |
| `plus` | `Plus` |
| `x-mark` | `X` |
| `magnifying-glass` | `Search` |
| `chevron-right` | `ChevronRight` |
| `chevron-up-down` | `ChevronsUpDown` |
| `ellipsis-horizontal` | `MoreHorizontal` |
| `arrow-up-tray` | `Upload` |
| `bell` | `Bell` |
| `bars-3` | `Menu` |
| `arrow-left` | `ArrowLeft` |
| `arrow-right` | `ArrowRight` |
| `sparkles` | `Sparkles` |
| `paper-clip` | `Paperclip` |
| `paper-airplane` | `SendHorizontal` |
| `pin` | `Pin` |
| `link` | `Link2` |
| `check` | `Check` |
| `table-cells` | `Table2` |
| `squares-plus` | `LayoutDashboard` |

**Lucide rule:** Default `size={16}` (= `w-4 h-4`). Color always inherited via parent class (e.g. `class="text-gray-500"`) — never hardcoded on the icon component.

---

## PART 2 — PRODUCT OVERVIEW

**Aibii** is an AI-powered Business Intelligence SaaS. Users connect datasources (databases, files, APIs), chat with their data using AI, build dashboards, create reports and presentations, and collaborate in shared workspaces.

**Every screen shares one shell:** 220px fixed sidebar + main area (h-11 topbar + content zone). No full-page scroll — only individual content zones scroll internally.

**User identity (use everywhere):**
- Name: `Manish Kumar` · Email: `manish@aibii.com`
- Avatar: `w-7 h-7 rounded-full` · bg `#3B5BDB` · initial "M" `text-white font-bold text-[11px]`
- Workspace: `Manish kumar's Work…` · avatar bg `#3B5BDB`

---

## PART 3 — DESIGN TOKENS (Aibii Design System)

### 3.1 Color Tokens (`src/lib/tokens.ts`)

```typescript
export const colors = {
  primary:          '#5B63F6',   // buttons, active nav, focus rings
  secondary:        '#7C6FF7',   // gradient end
  workspaceBlue:    '#3B5BDB',   // user/workspace avatars

  base:             '#FFFFFF',
  hoverActive:      '#EEF2FF',   // nav hover + active fill
  canvas:           '#F3F4F6',   // editor canvas, tab containers
  badge:            '#EEF2FF',

  bannerBg:         '#E8EEFF',
  bannerIconBg:     '#C7D2FE',
  bannerIconColor:  '#4F6EF7',
  bannerLabel:      '#3B4ECC',
  bannerSub:        '#6B7ADE',

  textPrimary:      '#111827',
  textSecondary:    '#374151',
  textMuted:        '#6B7280',
  textPlaceholder:  '#9CA3AF',

  borderDefault:    '#E5E7EB',
  borderSubtle:     '#F3F4F6',

  green:            '#16A34A',  red:     '#DC2626',  amber:   '#D97706',
  greenBg:          '#D1FAE5',  redBg:   '#FEE2E2',  amberBg: '#FEF3C7',

  // Plotly chart trace colors (in order)
  chartPrimary:     '#5B63F6',
  chartSecondary:   '#7C6FF7',
  chartPurple:      '#A855F7',
  chartPink:        '#EC4899',
  chartAmber:       '#F59E0B',
  chartEmerald:     '#10B981',
  chartLightIndigo: '#A5B4FC',
} as const;
```

### 3.2 Tailwind Config (`tailwind.config.ts`)

```typescript
import type { Config } from 'tailwindcss';
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      fontFamily: { sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'] },
      colors: {
        brand:   { DEFAULT: '#5B63F6', secondary: '#7C6FF7', workspace: '#3B5BDB' },
        surface: { hover: '#EEF2FF', canvas: '#F3F4F6', badge: '#EEF2FF' },
        banner:  { bg: '#E8EEFF', iconBg: '#C7D2FE', icon: '#4F6EF7', label: '#3B4ECC', sub: '#6B7ADE' },
      },
      boxShadow: {
        card:          '0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)',
        'card-hover':  '0 4px 14px rgba(0,0,0,0.10), 0 2px 4px rgba(0,0,0,0.05)',
        modal:         '0 20px 60px rgba(0,0,0,0.18)',
        dropdown:      '0 8px 24px rgba(0,0,0,0.12), 0 2px 6px rgba(0,0,0,0.06)',
        'input-focus': '0 0 0 3px rgba(91,99,246,0.12)',
        'tab-active':  '0 1px 4px rgba(0,0,0,0.10)',
      },
    },
  },
  plugins: [require('@tailwindcss/forms')],
} satisfies Config;
```

### 3.3 Typography Scale

| Use case | Size | Weight | Color |
|---|---|---|---|
| Page title | `text-[28px]` | `font-extrabold` (800) | `text-gray-900` |
| Section heading | `text-[18px]`–`text-[19px]` | `font-bold` (700) | `text-gray-900` |
| Card title | `text-[16px]` | `font-semibold` (600) | `text-gray-800` |
| Body / nav label | `text-[14px]` / `text-sm` | `font-medium` (500) | `text-gray-700` |
| Small body | `text-[12px]`–`text-[12.5px]` | 400–500 | `text-gray-700` |
| Caption / timestamp | `text-[11px]`–`text-[12px]` | 400–500 | `text-gray-500` |
| Micro / badge | `text-[10px]`–`text-[11px]` | 500–600 | varies |

### 3.4 Spacing (base unit: 4px — only these values)

`2px · 4px · 8px · 10px · 12px · 16px · 20px · 24px · 32px`

### 3.5 Border Radius

| Value | Use |
|---|---|
| `rounded` (4px) | badges, micro labels |
| `rounded-lg` (8px) | toolbar buttons, icon chips, nav items, inputs, chart cards |
| `rounded-xl` (12px) | main cards, modals, explore banner (most pages) |
| `rounded-2xl` (16px) | large modals, chat input, popovers |
| `rounded-[20px]` | empty-state icon containers |
| `rounded-full` | pill tabs, avatars, scrollbar thumb |

> **Exception:** `datasource` explore banner uses `rounded-xl`; all other pages use `rounded-xl` for cards and `rounded-lg` for explore banner.

### 3.6 Scrollbar CSS (`app.css`)

```css
::-webkit-scrollbar-thumb  { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track  { background: transparent; }

.scrollbar-3px::-webkit-scrollbar { width: 3px; }   /* dashboard, presentation-builder */
.scrollbar-4px::-webkit-scrollbar { width: 4px; }   /* kpi-creator */
.scrollbar-5px::-webkit-scrollbar { width: 5px; }   /* chat, create-workspace, create-form */
.scrollbar-6px::-webkit-scrollbar { width: 6px; }   /* recent-view, document-builder, datasource, sovereign-capital-gate */
.scrollbar-1px::-webkit-scrollbar { width: 1px; }   /* settings global */
```

### 3.7 Animation Keyframes (`app.css`)

```css
@keyframes fadeUp   { from{opacity:0;transform:translateY(10px)} to{opacity:1;transform:translateY(0)} }
@keyframes bubbleIn { from{opacity:0;transform:translateY(6px) scale(0.97)} to{opacity:1;transform:translateY(0) scale(1)} }
@keyframes dotBounce{ 0%,100%{transform:translateY(0);opacity:.4} 50%{transform:translateY(-5px);opacity:1} }
@keyframes blink    { 0%,80%,100%{opacity:0} 40%{opacity:1} }
@keyframes wsModalIn{ from{opacity:0;transform:translateY(-8px) scale(0.98)} to{opacity:1;transform:translateY(0) scale(1)} }

.fade-up   { animation: fadeUp   0.30s ease-out forwards; }
.bubble-in { animation: bubbleIn 0.22s ease-out forwards; }
```

---

## PART 4 — FOLDER STRUCTURE (Complete)

```
src/
├── app.html                            # Inter font <link> weights 400–800
├── app.css                             # Tailwind directives + scrollbar + @keyframes
├── app.d.ts                            # Global TS declarations
│
├── routes/
│   ├── +layout.ts                      # ssr=false, prerender=false (GLOBAL CSR)
│   ├── +layout.svelte                  # imports app.css, wraps AppShell
│   ├── +page.svelte                    # redirect → /recent
│   ├── recent/+page.svelte
│   ├── sovereign-capital-gate/+page.svelte
│   ├── chat/+page.svelte
│   ├── dashboard/+page.svelte
│   ├── kpi-creator/+page.svelte
│   ├── document-builder/+page.svelte
│   ├── presentation-builder/+page.svelte
│   ├── datasource/+page.svelte         # internal SPA with 8 sub-views
│   ├── create-form/+page.svelte
│   ├── create-workspace/
│   │   ├── +layout.svelte              # standalone — NO sidebar
│   │   └── +page.svelte
│   └── settings/+page.svelte
│
└── lib/
    ├── components/
    │   ├── layout/
    │   │   ├── AppShell.svelte             # root shell: sidebar + main col
    │   │   ├── Sidebar.svelte              # 220px fixed — all 8 zones
    │   │   ├── Topbar.svelte               # h-11, breadcrumb slot + right slot
    │   │   └── WorkspaceSwitcherModal.svelte
    │   │
    │   ├── sidebar/
    │   │   ├── WorkspaceSwitcherBtn.svelte
    │   │   ├── PrimaryNav.svelte           # Recent · New Dashboard · AI Chat
    │   │   ├── ProjectsSection.svelte      # collapsible workspace sub-menus
    │   │   ├── ProjectSubItem.svelte       # single sub-item row
    │   │   ├── BottomNav.svelte            # Datasources + Settings
    │   │   └── ExploreBanner.svelte        # upgrade/explore banner
    │   │
    │   ├── ui/                             # shadcn-svelte + custom primitives
    │   │   ├── button/                     # shadcn-svelte
    │   │   ├── card/                       # shadcn-svelte
    │   │   ├── input/                      # shadcn-svelte
    │   │   ├── dialog/                     # shadcn-svelte (base for all modals)
    │   │   ├── dropdown-menu/              # shadcn-svelte
    │   │   ├── tabs/                       # shadcn-svelte
    │   │   ├── Badge.svelte                # custom: brand|draft|status
    │   │   ├── Avatar.svelte               # custom: user|workspace|ai-icon
    │   │   ├── PillTabs.svelte             # custom: rounded-full pill tabs
    │   │   ├── RoleToggle.svelte           # custom: Viewer|Editor|Admin
    │   │   ├── Toast.svelte                # custom: dark bg, auto-dismiss
    │   │   ├── StatusBadge.svelte          # connected|error|syncing
    │   │   └── LoadingDots.svelte          # dotBounce 3-dot animation
    │   │
    │   ├── charts/                         # Plotly.js wrapper layer
    │   │   ├── BaseChart.svelte            # core renderer (dynamic import Plotly)
    │   │   ├── LineChart.svelte
    │   │   ├── BarChart.svelte
    │   │   ├── AreaChart.svelte
    │   │   ├── PieChart.svelte
    │   │   ├── DoughnutChart.svelte
    │   │   ├── StackedBarChart.svelte
    │   │   ├── ScatterChart.svelte
    │   │   └── index.ts
    │   │
    │   └── shared/
    │       ├── PageHeader.svelte           # title + subtitle
    │       ├── ActionCard.svelte           # CTA card (recent, sovereign)
    │       ├── DocumentCard.svelte         # grid/list document card
    │       ├── StatCard.svelte             # KPI stat (dashboard)
    │       ├── EmptyState.svelte           # icon + text + chips
    │       ├── FilterBar.svelte            # toolbar filter row
    │       ├── DataTable.svelte            # table with sticky header + scoped scroll
    │       ├── InlineDataTable.svelte      # AI-rendered table in chat
    │       ├── TypingIndicator.svelte      # 3-dot blink
    │       └── GeneratingOverlay.svelte    # canvas overlay + dotBounce
    │
    ├── features/
    │   ├── recent/
    │   │   ├── components/RecentDocumentGrid.svelte
    │   │   ├── components/RecentDocumentList.svelte
    │   │   └── stores/recent.store.ts
    │   ├── chat/
    │   │   ├── components/MessageList.svelte
    │   │   ├── components/UserBubble.svelte
    │   │   ├── components/AiBubble.svelte
    │   │   ├── components/SourcePill.svelte
    │   │   ├── components/AiActionButtons.svelte
    │   │   ├── components/ChatInput.svelte
    │   │   ├── components/SourcesDrawer.svelte
    │   │   └── stores/chat.store.ts
    │   ├── dashboard/
    │   │   ├── components/DashboardToolbar.svelte
    │   │   ├── components/KpiStatGrid.svelte
    │   │   ├── components/ChartCard.svelte
    │   │   ├── components/DashboardGrid.svelte
    │   │   └── stores/dashboard.store.ts
    │   ├── kpi-creator/
    │   │   ├── components/KpiCanvas.svelte
    │   │   ├── components/KpiChatPanel.svelte
    │   │   ├── components/KpiChatBubble.svelte
    │   │   ├── components/KpiChatInput.svelte
    │   │   ├── components/SuggestionChips.svelte
    │   │   ├── components/SqlEditor.svelte
    │   │   └── stores/kpi-creator.store.ts
    │   ├── datasource/
    │   │   ├── components/DatasourceList.svelte
    │   │   ├── components/DatasourceDetail.svelte
    │   │   ├── components/ConnectorPicker.svelte
    │   │   ├── components/ConnectionWizard.svelte
    │   │   ├── components/RelationshipCanvas.svelte
    │   │   ├── components/LinkToWorkspace.svelte
    │   │   ├── components/LinkWorkspaceTables.svelte
    │   │   ├── components/LinkToProject.svelte
    │   │   └── stores/datasource.store.ts
    │   └── settings/
    │       ├── components/SettingsNav.svelte
    │       ├── components/ProfileTab.svelte
    │       ├── components/MembersTab.svelte
    │       ├── components/InviteMemberModal.svelte
    │       └── stores/settings.store.ts
    │
    ├── services/
    │   ├── http/client.ts              # base fetch wrapper
    │   ├── analytics.service.ts
    │   ├── chat.service.ts
    │   ├── datasource.service.ts
    │   ├── workspace.service.ts
    │   └── document.service.ts
    │
    ├── stores/
    │   ├── factory/async-store.factory.ts
    │   ├── ui.store.ts
    │   ├── workspace.store.ts
    │   └── index.ts
    │
    ├── types/
    │   ├── domain.types.ts             # Workspace, Document, Datasource, Message
    │   ├── api.types.ts                # ApiResponse<T>, ApiError
    │   ├── chart.types.ts              # Plotly prop interfaces
    │   └── index.ts
    │
    ├── utils/
    │   ├── formatters.ts               # numbers, dates, currency
    │   ├── chart-helpers.ts            # data → Plotly trace converters
    │   ├── cn.ts                       # shadcn class utility
    │   └── index.ts
    │
    ├── constants/
    │   ├── chart.constants.ts          # Plotly default layout/config/colors
    │   ├── navigation.constants.ts     # NAV_ITEMS, sidebar structure
    │   └── index.ts
    │
    ├── actions/
    │   └── autoGrow.ts                 # Svelte action for textarea auto-grow
    │
    └── tokens.ts                       # design token constants

```

---

## PART 5 — GLOBAL CSR SETUP

```typescript
// src/routes/+layout.ts
export const ssr = false;
export const prerender = false;
```

```svelte
<!-- src/routes/+layout.svelte -->
<script lang="ts">
  import '../app.css';
  import AppShell from '$lib/components/layout/AppShell.svelte';
</script>
<AppShell><slot /></AppShell>
```

```svelte
<!-- src/lib/components/layout/AppShell.svelte -->
<script lang="ts">
  import Sidebar from './Sidebar.svelte';
  import Toast from '$lib/components/ui/Toast.svelte';
  import WorkspaceSwitcherModal from './WorkspaceSwitcherModal.svelte';
  import { sidebarCollapsed } from '$lib/stores/ui.store';
</script>

<div class="font-sans bg-white text-gray-900 flex h-screen overflow-hidden">
  <Sidebar />
  <main class="flex-1 flex flex-col overflow-hidden">
    <slot />
  </main>
</div>
<WorkspaceSwitcherModal />
<Toast />
```

---

## PART 6 — GLOBAL STORES (Exact Shapes)

### 6.1 UI Store

```typescript
// src/lib/stores/ui.store.ts
import { writable } from 'svelte/store';

export type ActiveModal = 'workspace-switcher' | 'invite-member' | null;

function createUiStore() {
  const sidebarCollapsed = writable<boolean>(false);
  const activeModal = writable<ActiveModal>(null);
  const toast = writable<{ message: string; visible: boolean }>({ message: '', visible: false });

  function showToast(message: string, duration = 2500) {
    toast.set({ message, visible: true });
    setTimeout(() => toast.update(t => ({ ...t, visible: false })), duration);
  }
  return { sidebarCollapsed, activeModal, toast, showToast };
}

export const uiStore = createUiStore();
export const { sidebarCollapsed, activeModal, toast, showToast } = uiStore;
```

### 6.2 Workspace Store

```typescript
// src/lib/stores/workspace.store.ts
import { writable } from 'svelte/store';

export interface Workspace { id: string; name: string; avatar: string; avatarBg: string; }
export interface User      { name: string; email: string; avatar: string; avatarBg: string; }

export const user = writable<User>({
  name: 'Manish Kumar', email: 'manish@aibii.com', avatar: 'M', avatarBg: '#3B5BDB'
});
export const currentWorkspace = writable<Workspace>({
  id: 'ws-main', name: "Manish kumar's Work…", avatar: 'M', avatarBg: '#3B5BDB'
});
export const workspaceList = writable<Workspace[]>([
  { id: 'ws-main',      name: "Manish kumar's Work…",  avatar: 'M', avatarBg: '#3B5BDB' },
  { id: 'ws-sovereign', name: 'Sovereign Capital Gate', avatar: 'S', avatarBg: '#5B63F6' },
]);
```

### 6.3 Async Store Factory (use for ALL API-driven state)

```typescript
// src/lib/stores/factory/async-store.factory.ts
import { writable } from 'svelte/store';

export interface AsyncState<T> { data: T | null; loading: boolean; error: string | null; }

export function createAsyncStore<T>(fetcher: (...args: never[]) => Promise<T>) {
  const store = writable<AsyncState<T>>({ data: null, loading: false, error: null });
  let controller: AbortController | null = null;

  return {
    subscribe: store.subscribe,
    async load(...args: unknown[]) {
      controller?.abort();
      controller = new AbortController();
      store.update(s => ({ ...s, loading: true, error: null }));
      try {
        const data = await (fetcher as (...a: unknown[]) => Promise<T>)(...args, controller.signal);
        store.set({ data, loading: false, error: null });
      } catch (err: unknown) {
        if ((err as Error).name === 'AbortError') return;
        store.update(s => ({ ...s, loading: false, error: (err as { message?: string }).message ?? 'Error' }));
      }
    },
    reset() { controller?.abort(); store.set({ data: null, loading: false, error: null }); },
    setData(data: T) { store.update(s => ({ ...s, data })); }
  };
}
```

### 6.4 Datasource Store

```typescript
// src/lib/features/datasource/stores/datasource.store.ts
import { writable } from 'svelte/store';

export interface Datasource {
  id: string; name: string; connector: string;
  type: 'database' | 'file' | 'api';
  status: 'connected' | 'error' | 'syncing';
  tables: number; tablesList?: string[];
}
export type DatasourceView =
  | 'view-list' | 'view-detail' | 'view-add' | 'view-wizard'
  | 'view-create-relation' | 'view-link-ws' | 'view-link-ws-tables' | 'view-link-proj';

export const currentDsView = writable<DatasourceView>('view-list');
export const selectedDatasource = writable<Datasource | null>(null);

export const dsList = writable<Datasource[]>([
  { id:'ds1', name:'Production Postgres', connector:'Postgres', type:'database', status:'connected', tables:12 },
  { id:'ds2', name:'Analytics Warehouse', connector:'BigQuery', type:'database', status:'connected', tables:28 },
  { id:'ds3', name:'Sales CSV',           connector:'CSV',      type:'file',     status:'connected', tables:3  },
  { id:'ds4', name:'Stripe API',          connector:'REST API', type:'api',      status:'error',     tables:8  },
  { id:'ds5', name:'Internal MySQL',      connector:'MySQL',    type:'database', status:'connected', tables:19 },
]);

export const wsAssignments  = writable<Record<string, { assigned: boolean; tables: string[] | null }>>({});
export const projAssignments = writable<Record<string, Set<string>>>({});

export function showView(view: DatasourceView, ds?: Datasource) {
  if (ds) selectedDatasource.set(ds);
  currentDsView.set(view);
}
```

### 6.5 Chat Store

```typescript
// src/lib/features/chat/stores/chat.store.ts
import { writable, derived } from 'svelte/store';

export type MessageRole = 'user' | 'ai';
export interface ChatMessage {
  id: string; role: MessageRole; content: string; timestamp: string;
  sources?: string[]; hasTable?: boolean;
}

export const messages = writable<ChatMessage[]>([]);
export const isTyping  = writable<boolean>(false);
export const sourcesDrawerOpen = writable<boolean>(false);

export function addMessage(role: MessageRole, content: string, sources?: string[]) {
  const msg: ChatMessage = {
    id: crypto.randomUUID(), role, content,
    timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
    sources
  };
  messages.update(m => [...m, msg]);
  return msg.id;
}
export const sourceCount = derived(messages, $m => new Set($m.flatMap(m => m.sources ?? [])).size);
```

---

## PART 7 — SERVICE LAYER

Zero API calls inside any `.svelte` file. All network requests go through services.

```typescript
// src/lib/services/http/client.ts
const API_BASE = import.meta.env.VITE_API_BASE_URL as string;

async function request<T>(endpoint: string, options: {
  method?: 'GET'|'POST'|'PUT'|'DELETE'; body?: unknown; signal?: AbortSignal;
} = {}): Promise<T> {
  const { method = 'GET', body, signal } = options;
  const token = typeof localStorage !== 'undefined' ? localStorage.getItem('auth_token') : null;
  const res = await fetch(`${API_BASE}${endpoint}`, {
    method,
    headers: { 'Content-Type': 'application/json', ...(token ? { Authorization: `Bearer ${token}` } : {}) },
    body: body ? JSON.stringify(body) : undefined,
    signal
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    throw { message: err.message ?? 'Request failed', status: res.status };
  }
  return res.json() as Promise<T>;
}

export const http = {
  get:    <T>(url: string, s?: AbortSignal) => request<T>(url, { signal: s }),
  post:   <T>(url: string, body: unknown, s?: AbortSignal) => request<T>(url, { method: 'POST', body, signal: s }),
  put:    <T>(url: string, body: unknown, s?: AbortSignal) => request<T>(url, { method: 'PUT',  body, signal: s }),
  delete: <T>(url: string, s?: AbortSignal) => request<T>(url, { method: 'DELETE', signal: s }),
};
```

```typescript
// src/lib/services/chat.service.ts
import { http } from './http/client';
export interface ChatResponse { content: string; sources: string[]; hasTable: boolean; }

export async function sendChatMessage(message: string, workspaceId: string, signal?: AbortSignal) {
  return http.post<ChatResponse>('/chat/message', { message, workspaceId }, signal);
}
```

---

## PART 8 — CHART ARCHITECTURE (Plotly.js)

### 8.1 Chart Constants

```typescript
// src/lib/constants/chart.constants.ts
import type { Layout, Config } from 'plotly.js';

export const AIBII_COLORS = ['#5B63F6','#A855F7','#EC4899','#F59E0B','#10B981','#A5B4FC','#7C6FF7'];

export const DEFAULT_LAYOUT: Partial<Layout> = {
  paper_bgcolor: 'transparent', plot_bgcolor: 'transparent',
  margin: { t: 16, r: 16, b: 40, l: 48 },
  font: { family: 'Inter, system-ui, sans-serif', size: 11, color: '#9CA3AF' },
  showlegend: true,
  legend: { orientation: 'h', y: -0.20, font: { size: 11 } },
  xaxis: { gridcolor: '#F3F4F6', zeroline: false, tickfont: { size: 11, color: '#9CA3AF' } },
  yaxis: { gridcolor: '#F3F4F6', zeroline: false, tickfont: { size: 11, color: '#9CA3AF' } },
};

export const DEFAULT_CONFIG: Partial<Config> = {
  responsive: true, displayModeBar: false, scrollZoom: false
};
```

### 8.2 BaseChart.svelte

```svelte
<!-- src/lib/components/charts/BaseChart.svelte -->
<script lang="ts">
  import { onMount, onDestroy } from 'svelte';
  import type { Data, Layout, Config } from 'plotly.js';
  import { DEFAULT_LAYOUT, DEFAULT_CONFIG } from '$lib/constants/chart.constants';

  export let data: Data[] = [];
  export let layout: Partial<Layout> = {};
  export let config: Partial<Config> = {};
  export let height = 200;
  export let loading = false;

  let container: HTMLDivElement;
  let Plotly: typeof import('plotly.js-dist-min');

  $: mergedLayout = { ...DEFAULT_LAYOUT, ...layout, height };
  $: mergedConfig = { ...DEFAULT_CONFIG, ...config };

  onMount(async () => {
    // Dynamic import — NEVER runs on server (CSR-only)
    Plotly = (await import('plotly.js-dist-min')).default as typeof Plotly;
    if (container && data.length) Plotly.newPlot(container, data, mergedLayout, mergedConfig);
  });

  $: if (Plotly && container && data.length) {
    Plotly.react(container, data, mergedLayout, mergedConfig);
  }

  onDestroy(() => { if (Plotly && container) Plotly.purge(container); });
</script>

<div class="relative w-full" style="min-height:{height}px">
  {#if loading}
    <div class="absolute inset-0 z-10 flex items-center justify-center rounded-lg bg-white/60 backdrop-blur-sm">
      <!-- <LoadingDots /> -->
    </div>
  {:else}
    <div bind:this={container} class="w-full" />
  {/if}
</div>
```

### 8.3 Specialized Charts (pattern)

```svelte
<!-- LineChart.svelte -->
<script lang="ts">
  import BaseChart from './BaseChart.svelte';
  import type { Data } from 'plotly.js';
  import { AIBII_COLORS } from '$lib/constants/chart.constants';

  export let series: Array<{ name: string; x: (string|number)[]; y: number[]; color?: string }> = [];
  export let layout: Record<string, unknown> = {};
  export let height = 200;
  export let loading = false;

  $: traces = series.map<Data>((s, i) => ({
    type: 'scatter', mode: 'lines+markers', name: s.name, x: s.x, y: s.y,
    line:   { color: s.color ?? AIBII_COLORS[i % AIBII_COLORS.length], width: 2, shape: 'spline' },
    marker: { size: 4 }
  }));
</script>
<BaseChart data={traces} {layout} {height} {loading} />
```

**Dashboard chart grid layout (grid-cols-4):**
| Row | Spans | Chart type |
|---|---|---|
| Row 1 | `col-span-4` | KPI stat cards (nested grid-cols-4) |
| Row 2 | `2 + 2` | Monthly Revenue (line) · Sales by Region (bar) |
| Row 3 | `2 + 1 + 1` | Revenue by Channel (stacked) · Market Share (pie) · Retention (doughnut) |
| Row 4 | `2 + 1 + 1` | New vs Returning (multi-line) · Top Products (h-bar) · Marketing (scatter) |
| Row 5 | `col-span-4` | Cumulative Growth (area), height 120px |

---

## PART 9 — KEY COMPONENT CONTRACTS

### 9.1 Sidebar.svelte

```svelte
<script lang="ts">
  import { page } from '$app/state';
  import { sidebarCollapsed, activeModal } from '$lib/stores/ui.store';
  import WorkspaceSwitcherBtn from '../sidebar/WorkspaceSwitcherBtn.svelte';
  import PrimaryNav from '../sidebar/PrimaryNav.svelte';
  import ProjectsSection from '../sidebar/ProjectsSection.svelte';
  import BottomNav from '../sidebar/BottomNav.svelte';
  import ExploreBanner from '../sidebar/ExploreBanner.svelte';
  $: activePath = $page.url.pathname;
</script>

<aside
  class="w-[220px] min-w-[220px] h-full flex flex-col bg-white border-r border-gray-100
         overflow-y-auto scrollbar-6px
         transition-[width,min-width,opacity,border-right-width] duration-[220ms] ease-out"
  class:!w-0={$sidebarCollapsed}
  class:!min-w-0={$sidebarCollapsed}
  class:opacity-0={$sidebarCollapsed}
  class:border-r-0={$sidebarCollapsed}
>
  <WorkspaceSwitcherBtn on:click={() => activeModal.set('workspace-switcher')} />
  <PrimaryNav {activePath} />
  <div class="mx-3 my-1 border-t border-gray-100" />
  <ProjectsSection {activePath} />
  <div class="flex-1" />
  <div class="mx-3 border-t border-gray-100" />
  <BottomNav {activePath} />
  <ExploreBanner />
</aside>
```

**Sidebar zone layout (top → bottom):**
1. **WorkspaceSwitcherBtn** — `border-b border-gray-100 px-3 py-2.5` · `w-7 h-7 rounded-full bg-[#3B5BDB]` initial "M" + workspace name `text-sm font-semibold` + ChevronsUpDown icon
2. **PrimaryNav** — `px-3 py-2 space-y-0.5` · items: Recent · New Dashboard · AI Chat
3. **Divider** — `mx-3 my-1 border-t border-gray-100`
4. **ProjectsSection** — collapsible workspace sub-menus · sub-item icons colored by type: chat `#5B63F6`, dashboard `#16A34A`, document `#F97316`, presentation `#8B5CF6`, list `#EC4899`
5. **Spacer** — `flex-1`
6. **Divider** — `mx-3 border-t border-gray-100`
7. **BottomNav** — Datasources + Settings
8. **ExploreBanner** — `rounded-lg` (all pages) · `rounded-xl` datasource only

**Active NavItem rule:** Always use inline `style=` (not Tailwind classes):
```svelte
style="background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px;"
```

**Submenu toggle:**
```svelte
<!-- ProjectsSection.svelte -->
<script lang="ts">
  let openWorkspaces: Set<string> = new Set();
  function toggle(id: string) {
    openWorkspaces = openWorkspaces.has(id)
      ? (openWorkspaces.delete(id), new Set(openWorkspaces))
      : new Set([...openWorkspaces, id]);
  }
</script>

{#each workspaces as ws}
  <div class="nav-item flex items-center gap-1 px-2 h-9 rounded-lg">
    <button on:click={() => toggle(ws.id)} class="p-1">
      <ChevronRight size={14}
        class="text-gray-400 transition-transform duration-150"
        style={openWorkspaces.has(ws.id) ? 'transform:rotate(90deg)' : ''} />
    </button>
    <a href={ws.href} class="flex-1 text-[13px] text-gray-700">{ws.name}</a>
  </div>
  {#if openWorkspaces.has(ws.id)}
    <div class="pl-4 mt-0.5 space-y-0.5" transition:fly={{ y: -4, duration: 120 }}>
      {#each ws.items as item}
        <ProjectSubItem {item} {activePath} />
      {/each}
    </div>
  {/if}
{/each}
```

### 9.2 Topbar.svelte

```svelte
<script lang="ts">
  import { Menu, ArrowLeft, ArrowRight, Bell } from 'lucide-svelte';
  import { sidebarCollapsed } from '$lib/stores/ui.store';
  import { user } from '$lib/stores/workspace.store';
  export let padding = 'px-4';
</script>

<div class="flex items-center justify-between h-11 border-b border-gray-100
            bg-white flex-shrink-0 {padding}">
  <div class="flex items-center gap-1.5">
    <button class="w-7 h-7 flex items-center justify-center rounded-lg
                   text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-colors"
            on:click={() => sidebarCollapsed.update(v => !v)}>
      <Menu size={16} />
    </button>
    <button class="w-7 h-7 flex items-center justify-center rounded-lg
                   text-gray-400 hover:bg-gray-100 transition-colors">
      <ArrowLeft size={16} />
    </button>
    <button class="w-7 h-7 flex items-center justify-center rounded-lg
                   text-gray-400 hover:bg-gray-100 transition-colors">
      <ArrowRight size={16} />
    </button>
    <div class="w-px h-4 bg-gray-200 mx-1" />
    <slot name="breadcrumb" />
  </div>
  <div class="flex items-center gap-2">
    <slot name="right" />
    <button class="w-8 h-8 flex items-center justify-center rounded-lg
                   text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-colors">
      <Bell size={16} />
    </button>
    <div class="w-7 h-7 rounded-full flex items-center justify-center
                text-white text-[11px] font-bold flex-shrink-0"
         style="background:{$user.avatarBg}">{$user.avatar}</div>
    <span class="text-[13px] font-medium text-gray-900">{$user.name}</span>
  </div>
</div>
```

**Topbar padding by route:**

| Route | `padding=` prop | Scrollbar class |
|---|---|---|
| `/recent` | `px-8` | `scrollbar-6px` |
| `/sovereign-capital-gate` | `px-8` | `scrollbar-6px` |
| `/chat` | `px-4` | `scrollbar-5px` |
| `/dashboard` | `px-4` | `scrollbar-3px` |
| `/kpi-creator` | `px-4` | `scrollbar-4px` |
| `/document-builder` | `px-4` | `scrollbar-6px` |
| `/presentation-builder` | `px-5` | `scrollbar-3px` |
| `/datasource` | `px-4` | `scrollbar-6px` |
| `/create-form` | `px-8` | `scrollbar-5px` |
| `/settings` | `px-4` | `scrollbar-1px` |

### 9.3 WorkspaceSwitcherModal.svelte

```svelte
<script lang="ts">
  import { fade, fly } from 'svelte/transition';
  import { activeModal } from '$lib/stores/ui.store';
  import { X, Search } from 'lucide-svelte';
</script>

{#if $activeModal === 'workspace-switcher'}
  <div class="fixed inset-0 z-50 flex items-start justify-center pt-16"
       style="background:rgba(17,24,39,0.45); backdrop-filter:blur(2px);"
       on:click={() => activeModal.set(null)}
       transition:fade={{ duration: 150 }}>
    <div class="w-full max-w-lg max-h-[620px] bg-white rounded-lg overflow-hidden flex flex-col"
         style="box-shadow:0 20px 60px rgba(0,0,0,0.18);"
         on:click|stopPropagation
         transition:fly={{ y: -8, duration: 180 }}>
      <!-- header -->
      <div class="px-4 py-3 border-b border-gray-100 flex items-center gap-2">
        <Search size={16} class="text-gray-400 flex-shrink-0" />
        <input class="flex-1 text-[13px] placeholder-gray-400 focus:outline-none"
               placeholder="Search workspaces…" />
        <button on:click={() => activeModal.set(null)}><X size={16} class="text-gray-400" /></button>
      </div>
      <!-- workspace list: divide-y divide-gray-100, each row h-12 px-4 flex items-center gap-3 -->
      <div class="flex-1 overflow-y-auto divide-y divide-gray-100"><!-- rows --></div>
      <!-- footer -->
      <div class="px-4 py-3 border-t border-gray-100">
        <button class="w-full h-9 rounded-lg border border-dashed border-gray-300
                       text-[13px] font-medium text-gray-600 hover:bg-gray-50 transition-colors">
          + Create workspace
        </button>
      </div>
    </div>
  </div>
{/if}
```

> **Recent-view only:** Use large modal variant — `width:920px; height:580px; border-radius:16px` with grid/list view toggle and workspace cards. Use same backdrop/transition.

### 9.4 PillTabs.svelte (custom — NOT shadcn)

```svelte
<script lang="ts">
  import { createEventDispatcher } from 'svelte';
  export let tabs: string[];
  export let active: string = tabs[0];
  const dispatch = createEventDispatcher<{ change: string }>();
</script>

<div class="flex items-center bg-[#F3F4F6] rounded-full p-1">
  {#each tabs as tab}
    <button
      class="h-8 px-4 rounded-full text-[13px] font-medium transition-all duration-[120ms]"
      class:bg-white={active === tab}
      class:shadow-tab-active={active === tab}
      class:text-gray-900={active === tab}
      class:text-gray-500={active !== tab}
      on:click={() => { active = tab; dispatch('change', tab); }}
    >{tab}</button>
  {/each}
</div>
```

### 9.5 Toast.svelte

```svelte
<script lang="ts">
  import { fly } from 'svelte/transition';
  import { Check } from 'lucide-svelte';
  import { toast } from '$lib/stores/ui.store';
</script>

{#if $toast.visible}
  <div class="fixed bottom-6 right-6 z-[999]" transition:fly={{ y: 8, duration: 200 }}>
    <div class="flex items-center gap-2 px-4 py-3 rounded-lg bg-[#111827]
                text-white text-[13px] font-medium shadow-lg">
      <Check size={16} />
      {$toast.message}
    </div>
  </div>
{/if}
```

### 9.6 ExploreBanner.svelte

```svelte
<script lang="ts">
  import { Sparkles } from 'lucide-svelte';
  export let rounded: 'lg' | 'xl' = 'lg'; // pass rounded="xl" on /datasource only
</script>

<div class="mx-3 mb-3 mt-1 px-3 py-2.5 flex items-center gap-2.5 rounded-{rounded}"
     style="background:#E8EEFF;">
  <div class="w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0"
       style="background:#C7D2FE;">
    <Sparkles size={16} style="color:#4F6EF7" />
  </div>
  <div class="min-w-0 flex-1">
    <p class="text-[12px] font-semibold leading-tight" style="color:#3B4ECC">Explore free features</p>
    <p class="text-[11px] mt-0.5" style="color:#6B7ADE">Credit left: 15</p>
  </div>
</div>
```

### 9.7 ChatInput.svelte

```svelte
<script lang="ts">
  import { createEventDispatcher } from 'svelte';
  import { Paperclip, SendHorizontal } from 'lucide-svelte';
  import { autoGrow } from '$lib/actions/autoGrow';
  const dispatch = createEventDispatcher<{ send: string }>();
  let value = '';

  function send() { if (!value.trim()) return; dispatch('send', value.trim()); value = ''; }
  function handleKey(e: KeyboardEvent) { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); send(); } }
</script>

<div class="bg-white border border-gray-200 rounded-2xl overflow-hidden shadow-card
            transition-all focus-within:border-indigo-300 focus-within:shadow-input-focus">
  <div class="px-4 pt-3 pb-2">
    <textarea bind:value use:autoGrow on:keydown={handleKey} rows="1"
      class="w-full text-[14px] text-gray-900 placeholder-gray-400 resize-none
             max-h-[160px] overflow-y-auto focus:outline-none scrollbar-5px"
      placeholder="Ask anything about your data…" />
  </div>
  <div class="px-3 pb-2.5 flex items-center justify-between">
    <button class="text-gray-400 hover:text-gray-600 transition-colors"><Paperclip size={20} /></button>
    <div class="flex items-center gap-2">
      <button class="px-3 h-7 rounded-full border border-gray-200 text-[12px]
                     font-medium text-gray-600 hover:bg-gray-50 transition-colors">Search</button>
      <button on:click={send}
        class="w-8 h-8 rounded-xl flex items-center justify-center text-white
               hover:opacity-90 transition-opacity" style="background:#5B63F6">
        <SendHorizontal size={16} />
      </button>
    </div>
  </div>
</div>
```

### 9.8 Avatar.svelte

```svelte
<script lang="ts">
  export let initial: string;
  export let bg = '#3B5BDB';
  export let size: 'sm' | 'md' | 'lg' = 'md';   // sm=20px  md=24px  lg=28px
  export let variant: 'circle' | 'square' = 'circle';
</script>

<div class="flex items-center justify-center text-white font-bold flex-shrink-0"
     class:w-5={size==='sm'} class:h-5={size==='sm'} class:text-[9px]={size==='sm'}
     class:w-6={size==='md'} class:h-6={size==='md'} class:text-[10px]={size==='md'}
     class:w-7={size==='lg'} class:h-7={size==='lg'} class:text-[11px]={size==='lg'}
     class:rounded-full={variant==='circle'}
     class:rounded-lg={variant==='square'}
     style="background:{bg};">
  {initial}
</div>
```

### 9.9 Badge.svelte

```svelte
<script lang="ts">
  export let variant: 'brand' | 'draft' | 'positive' | 'negative' = 'brand';
  export let label = '';
</script>

{#if variant === 'brand'}
  <span class="text-[11px] font-semibold px-2 h-5 rounded flex items-center"
        style="background:#EEF2FF; color:#5B63F6;">{label}</span>
{:else if variant === 'draft'}
  <span class="px-1.5 h-[18px] rounded text-[10px] font-medium flex items-center"
        style="background:#F3F4F6; color:#6B7280;">Draft</span>
{:else if variant === 'positive'}
  <span class="text-[12px] font-semibold px-2 h-5 rounded flex items-center w-fit"
        style="background:#EEF2FF; color:#5B63F6;">{label}</span>
{/if}
```

### 9.10 StatusBadge.svelte

```svelte
<script lang="ts">
  export let status: 'connected' | 'error' | 'syncing';
  const map = {
    connected: { bg: '#D1FAE5', color: '#16A34A', label: 'Connected' },
    error:     { bg: '#FEE2E2', color: '#DC2626', label: 'Error'     },
    syncing:   { bg: '#FEF3C7', color: '#D97706', label: 'Syncing'   },
  };
  $: s = map[status];
</script>
<span class="px-2 h-5 rounded-full text-[11px] font-medium flex items-center gap-1"
      style="background:{s.bg}; color:{s.color};">● {s.label}</span>
```

### 9.11 Svelte Action: `$lib/actions/autoGrow.ts`

```typescript
export function autoGrow(node: HTMLTextAreaElement) {
  function resize() { node.style.height = 'auto'; node.style.height = Math.min(node.scrollHeight, 160) + 'px'; }
  node.addEventListener('input', resize);
  return { destroy() { node.removeEventListener('input', resize); } };
}
```

### 9.12 Svelte Transition Reference

| Effect | Directive |
|---|---|
| Modal backdrop | `transition:fade={{ duration: 150 }}` |
| Modal panel | `transition:fly={{ y: -8, duration: 180 }}` |
| Chat bubble | `transition:fly={{ y: 6, duration: 220 }}` |
| Toast | `transition:fly={{ y: 8, duration: 200 }}` |
| Sources drawer | CSS `transition-[width]` class binding (not Svelte transition) |
| Submenu open | `transition:fly={{ y: -4, duration: 120 }}` |
| Cards / outputs | `transition:fly={{ y: 10, duration: 300 }}` |
| Sidebar collapse | CSS class binding `class:!w-0` — NOT a Svelte transition |
| dotBounce / blink | Keep as `@keyframes` in `app.css` — cannot use Svelte transitions |

---

## PART 10 — PAGE ARCHITECTURE

### Rule: Every page follows this exact pattern

```svelte
<script lang="ts">
  import { onMount } from 'svelte';
  import Topbar from '$lib/components/layout/Topbar.svelte';
  // Feature imports — NEVER inline logic here
  // 1. onMount: call store load action
  // 2. All display state derived from stores
  // 3. Zero business logic in the page file
</script>

<!-- Topbar is INSIDE the page — not in the root layout -->
<Topbar padding="px-N">
  <svelte:fragment slot="breadcrumb">Page Name</svelte:fragment>
  <svelte:fragment slot="right"><!-- toolbar btns --></svelte:fragment>
</Topbar>

<!-- The ONLY scrolling zone on the page -->
<div class="flex-1 overflow-auto px-N py-6 scrollbar-Npx">
  <!-- feature components here -->
</div>
```

### Data flow (strictly enforced)

```
+page.svelte (onMount)
    ↓ calls
features/*/stores/*.store.ts (action function)
    ↓ calls
services/*.service.ts
    ↓ calls
services/http/client.ts
    ↓ returns
store (AsyncState<T>)
    ↓ subscribed by
features/*/components/*.svelte
    ↓ props to
components/shared/* + components/ui/* + components/charts/*
```

---

## PART 11 — PAGES (Design Specifications)

### 11.1 Recent View

**Route:** `/recent` · **Active nav:** Primary → Recent · **Topbar:** `px-8`

**Layout:**
```
TOPBAR (h-11 px-8)
CONTENT (overflow-auto px-8 py-6 scrollbar-6px)
  ├── PageHeader: "Recent" (28px/800) + subtitle
  ├── Action cards row: 4 cards flex gap-4 mt-6
  │     New report · Create a workspace · Ask AI · Connect data
  ├── Tab + view toggle row mt-6
  │     left: PillTabs ['By me', 'By everyone', 'Shared with me']
  │     right: grid/list toggle btns
  └── DocumentCard grid: grid-cols-4 gap-4 mt-4 (grid mode)
```

**Action card:** `bg-white border border-gray-200 rounded-xl p-4 flex items-center gap-3 hover:shadow-card-hover hover:-translate-y-0.5 transition-all cursor-pointer`
Icon wrapper: `w-10 h-10 rounded-lg bg-[#EEF2FF] flex items-center justify-center` icon `color:#5B63F6`

**DocumentCard:**
```svelte
<div class="group bg-white border border-gray-200 rounded-xl overflow-hidden
            shadow-card hover:shadow-card-hover transition-shadow cursor-pointer">
  <div class="h-[140px] bg-[#F0F1F4] flex items-center justify-center">
    <BarChart2 size={32} class="text-gray-300" />
  </div>
  <div class="px-4 py-3 flex items-center justify-between">
    <div>
      <p class="text-[14px] font-medium text-gray-900 truncate">Title</p>
      <p class="text-[12px] text-gray-400 mt-0.5">Updated 20 min ago</p>
    </div>
    <button class="opacity-0 group-hover:opacity-100 transition-opacity w-8 h-8
                   rounded-lg hover:bg-gray-100 flex items-center justify-center">
      <MoreHorizontal size={16} class="text-gray-400" />
    </button>
  </div>
</div>
```

**Workspace Switcher Modal:** Use LARGE variant (`width:920px; height:580px; border-radius:16px`) with grid/list view toggle — only on this page.

---

### 11.2 Sovereign Capital Gate

**Route:** `/sovereign-capital-gate` · **Active nav:** Projects → workspace item · **Topbar:** `px-8`

```
CONTENT (px-8 py-6 scrollbar-6px)
  ├── PageHeader: "Sovereign Capital Gate" + subtitle
  ├── Action cards row: New report · Ask AI · Connect data · Create dashboard
  ├── Section row: "Reports" (14px/600) left + view toggle right
  └── Report grid: grid-cols-2 gap-4 (2-column, not 4)
```

---

### 11.3 Chat (Full-page AI Chat)

**Route:** `/chat` · **Active nav:** Primary → AI Chat · **Topbar:** `px-4`

**Layout:**
```
TOPBAR (h-11 px-4)
  right slot: "Sources (3)" badge btn + Share btn + MoreHorizontal btn

CONTENT ROW (flex-1 flex overflow-hidden)
  ├── Chat column (flex-1 flex flex-col)
  │     ├── MessageList (flex-1 overflow-auto py-6 scrollbar-5px)
  │     │     └── #messages-inner  max-w-5xl mx-auto px-4 space-y-6
  │     └── ChatInput area (flex-shrink-0 px-4 pb-5 pt-2)
  │               max-w-5xl mx-auto
  └── SourcesDrawer (width:0 ↔ 320px, transition-[width] 280ms cubic-bezier(0.4,0,0.2,1))
```

**Sources drawer CSS:**
```css
/* in SourcesDrawer.svelte <style> or applied via class */
width: 0; overflow: hidden; border-left: 0 solid #F3F4F6;
transition: width 280ms cubic-bezier(0.4,0,0.2,1), border-left-width 280ms;
/* .open: width:320px; min-width:320px; border-left-width:1px */
```

**UserBubble:**
```svelte
<div class="flex justify-end">
  <div class="max-w-[68%] flex flex-col items-end gap-1">
    <div class="px-4 py-2.5 text-[14px] leading-relaxed"
         style="background:#F3F4F6; color:#111827; border-radius:18px 18px 4px 18px;">
      {message.content}
    </div>
    <span class="text-[11px] text-gray-400">{message.timestamp}</span>
  </div>
</div>
```

**AiBubble:**
```svelte
<div class="flex gap-3">
  <div class="w-6 h-6 rounded-lg flex items-center justify-center flex-shrink-0 mt-1"
       style="background:#EEF2FF;">
    <Sparkles size={14} style="color:#5B63F6" />
  </div>
  <div class="flex-1 max-w-[78%] flex flex-col gap-2">
    <div class="px-4 py-3 text-[14px] leading-relaxed"
         style="color:#111827; border-radius:18px 18px 18px 4px;">
      <!-- content — no background -->
    </div>
    <!-- SourcePill row -->
    <!-- AiActionButtons: Copy · Export · Regenerate -->
  </div>
</div>
```

**AiActionButtons:**
```css
/* .ai-action */
padding:0 10px; height:28px; border-radius:8px;
font-size:12px; font-weight:500; color:#6B7280;
transition:background-color 100ms;
/* hover: background:#E5E7EB; color:#374151 */
```

**TypingIndicator:**
```svelte
<!-- 3 dots with blink @keyframes: delays 0s / 0.2s / 0.4s -->
<!-- dot: w-[6px] h-[6px] rounded-full bg-[#9CA3AF] -->
```

**Send flow:**
```
dispatch('send') →
  addMessage('user', content) → scrollToBottom →
  isTyping.set(true) →
  setTimeout(1600ms) →
  isTyping.set(false) →
  addMessage('ai', response) → scrollToBottom
```

---

### 11.4 Dashboard (BI Dashboard)

**Route:** `/dashboard` · **Active nav:** Primary → New Dashboard · **Topbar:** `px-4`

```
TOPBAR (h-11 px-4)
  right: Publish · Comment · Add KPI · Edit (primary)

TOOLBAR BAR (h-12 px-5 border-b border-gray-100 bg-white flex-shrink-0)
  left: date range + filter dropdowns
  right: view mode pills + action toolbar-btns (large variant: h-9 px-3 text-[13px])

TAB PILLS (bg-[#F3F4F6] rounded-full p-1)
  Overview | Revenue | Customers | Products

CONTENT (flex-1 overflow-auto p-4 scrollbar-3px)
  └── DashboardGrid (grid grid-cols-4 gap-3)
        ├── KpiStatGrid (col-span-4, nested grid-cols-4)
        └── ChartCards (per layout table in Part 8.3)
```

**KpiStatCard:**
```svelte
<div class="bg-white border border-gray-200 rounded-xl p-5 shadow-card">
  <p class="text-[12px] font-semibold text-gray-500 uppercase tracking-wide">{label}</p>
  <p class="text-[28px] font-bold text-gray-900 mt-1">{value}</p>
  <Badge variant="brand" label={change} />
</div>
```

**Dashboard toolbar-btn is LARGE variant:** `height:36px; padding:0 12px; font-size:13px`

All charts rendered via `ChartCard.svelte` → `BaseChart.svelte` → Plotly.js dynamic import.

---

### 11.5 KPI Creator

**Route:** `/kpi-creator` · **Topbar:** `px-4`

```
TOPBAR (h-11 px-4)
  breadcrumb: Sales Overview › New KPI + Draft badge

TOOLBAR TABS ROW (h-11 border-b border-gray-100)
  left: [Visualize] [Write SQL] — active tab: border-bottom 2.5px #5B63F6
  right: toolbar-btns standard (30px)

SPLIT VIEW (flex-1 flex overflow-hidden)
  ├── KpiCanvas (flex-1 overflow-auto bg-[#fcfdff] scrollbar-4px)
  │     · EmptyState: icon w-[72px] h-[72px] rounded-2xl bg-[#EEF2FF] border-[1.5px] border-[#C7D2FE]
  │     · SuggestionChips: grid-cols-2, .sugg-chip style (see below)
  │     · GeneratingOverlay: absolute inset-0 bg-[#F8F9FC]/70 backdrop-blur-[1px] + dotBounce
  │     · chart-output: max-w-[860px] fade-up card bg-gray-50 border rounded-xl
  └── KpiChatPanel (w-[300px] border-l border-gray-100 bg-white flex flex-col)
        ├── Messages (flex-1 overflow-y-auto px-3 py-4 space-y-3 scrollbar-4px)
        └── KpiChatInput (px-3 pb-3 pt-2.5 border-t border-gray-100)
```

**KPI chat panel — DIFFERENT bubbles from full-page chat:**
```css
/* User: brand blue */
.kpi-bubble-user { background:#5B63F6; color:white; border-radius:16px 16px 4px 16px;
                   padding:9px 12px; font-size:12.5px; max-width:208px; }
/* AI: light gray */
.kpi-bubble-ai   { background:#F3F4F6; color:#374151; border-radius:16px 16px 16px 4px;
                   padding:9px 12px; font-size:12.5px; max-width:208px; }
```

**Suggestion chips:**
```css
.sugg-chip { width:100%; text-align:left; display:flex; align-items:center; gap:8px;
             padding:7px 10px; border-radius:10px; border:1px solid #E5E7EB;
             background:#F3F4F6; font-size:11.5px; font-weight:500; color:#4B5563;
             transition:all 130ms ease; }
.sugg-chip:hover { background:#EEF2FF; border-color:#C7D2FE; color:#4338CA; }
```

**KpiChatInput box:**
```css
border-radius:12px; border:1.5px solid #E5E7EB; background:white; overflow:hidden;
/* focus-within: border-color:#5B63F6; box-shadow:0 0 0 3px rgba(91,99,246,0.09) */
/* toolbar row inside: background:#FAFAFA; border-top:1px solid #E5E7EB; padding:8px 10px */
/* send btn: h-[22px] px-2.5 rounded-md bg-[#5B63F6] text-[11px] font-semibold text-white */
```

**Write SQL tab** (replaces canvas area only):
```
SQL file tab bar (h-[42px], .sql-file-tab active border-bottom 2.5px #5B63F6)
  → CodeMirror 5 editor (flex-1)
  → Result tab bar (Table + viz tabs + Run Query btn bg-[#5B63F6])
  → Results panel (flex-1 overflow-auto)
```

---

### 11.6 Document Builder

**Route:** `/document-builder` · **Topbar:** `px-4`

```
TOPBAR (h-11 px-4) · breadcrumb: My Private Project › Untitled + Draft

FORMATTING TOOLBAR (h-10 border-b px-4)
  Bold · Italic · Underline · H1/H2 · List · Quote · Link · Table · Image · AI Assist
  right: zoom display

SPLIT VIEW (flex-1 flex overflow-hidden)
  ├── Editor canvas (flex-1 overflow-auto bg-white scrollbar-6px)
  │     max-w-[720px] mx-auto px-12 py-10
  │     contenteditable div
  └── Properties panel (w-[260px] border-l border-gray-100 bg-white)
        word count · AI suggestions
```

Toolbar-btn: **standard 30px** variant.

---

### 11.7 Presentation Builder

**Route:** `/presentation-builder` · **Topbar:** `px-5` (unique)

```
TOPBAR (h-11 px-5) · breadcrumb: My Private Project › Q4 Strategy Deck + Draft

CONTENT (flex-1 flex overflow-hidden)
  ├── Slide panel (w-[200px] border-r overflow-y-auto scrollbar-3px)
  │     numbered thumbnails list + Add Slide btn
  └── Main area (flex-1 flex flex-col)
        ├── Toolbar (h-10 border-b px-4)
        └── Slide canvas (flex-1 overflow-auto bg-[#F4F5F8] scrollbar-3px)
              centered slide: aspect-ratio 16/9 bg-white shadow-modal
```

---

### 11.8 Datasource (SPA — 8 internal views)

**Route:** `/datasource` · **Active nav:** Bottom → Datasource · **Explore banner:** `rounded="xl"`

8 views, controlled by `currentDsView` store, rendered with `{#if}`:

```svelte
<!-- datasource/+page.svelte -->
{#if $currentDsView === 'view-list'}      <DatasourceList />
{:else if $currentDsView === 'view-detail'} <DatasourceDetail />
{:else if $currentDsView === 'view-add'}    <ConnectorPicker />
{:else if $currentDsView === 'view-wizard'} <ConnectionWizard />
{:else if $currentDsView === 'view-create-relation'} <RelationshipCanvas />
{:else if $currentDsView === 'view-link-ws'} <LinkToWorkspace />
{:else if $currentDsView === 'view-link-ws-tables'} <LinkWorkspaceTables />
{:else if $currentDsView === 'view-link-proj'} <LinkToProject />
{/if}
```

**Sub-topbar** (below main topbar, persistent): shows view title + back ChevronLeft + action btns. Hidden on `view-detail` (has own inline header).

**Connector type colors:**
| Type | Icon bg | Icon color |
|---|---|---|
| Database | `#EEF2FF` | `#5B63F6` |
| File | `#FFF7ED` | `#F97316` |
| API | `#F0FDF4` | `#22C55E` |

**Connection wizard:** 3-step · step circles + connecting lines · `updateStepIndicator(n)` · Step 2 has Test Connection with idle / loading / success / error states.

**Scrollbar:** global 6px + `.scrollbar-thin` 4px scoped (thumb `#E2E8F0`).

---

### 11.9 Create Form

**Route:** `/create-form` · **Topbar:** `px-8`

```
CONTENT (overflow-auto scrollbar-5px)
  centered: max-w-xl mx-auto py-10 px-6
  Form fields + AI textarea with gradient send button
  Cancel (secondary) + Submit (primary bg-[#5B63F6])
```

**AI send button gradient:**
```css
background: linear-gradient(135deg, #5B63F6, #7C6FF7);
```

---

### 11.10 Create Workspace

**Route:** `/create-workspace` · **NO sidebar** (standalone `+layout.svelte`)

```svelte
<!-- create-workspace/+layout.svelte -->
<div class="font-sans bg-white h-screen flex items-center justify-center">
  <slot />
</div>
```

Wizard card: `max-w-[520px] w-full mx-auto p-8 rounded-2xl border border-gray-200 shadow-card`
3-step wizard: step circles + connecting lines. Scrollbar: 5px.

---

### 11.11 Settings & Profile

**Route:** `/settings` · **Active nav:** Bottom → Settings · **Topbar:** `px-4`

```
TOPBAR (h-11 px-4)

CONTENT (flex-1 overflow-hidden flex)
  ├── Settings left rail (w-[220px] border-r overflow-y-auto px-3 py-4 scrollbar-1px)
  │     nav: Profile · Workspace · Billing · Members · Integrations · Datasources
  └── Main panel (flex-1 flex flex-col overflow-hidden)
        ├── Panel header (px-8 py-5 border-b): "Profile" 28px/800 + subtitle
        ├── PillTabs (px-8 pt-4)
        └── Panel content (flex-1 overflow-auto px-8 py-6 scrollbar-1px)
```

**Profile tab form (max-w-[600px]):**
- Avatar: `w-12 h-12 rounded-full bg-[#3B5BDB]` + Upload button
- `grid grid-cols-2 gap-4`: First name + Last name
- Email: `bg-[#F9FAFB] text-gray-400 cursor-default` (read-only)
- Save: `h-9 px-4 bg-[#5B63F6]`

**Members tab — scoped scroll (critical flex chain):**
```
content-wrapper (overflow-hidden flex flex-col)
  → settings-panel.active (flex flex-col flex-1 min-h-0)
    → panel-card (flex flex-col flex-1 min-h-0)
      → table-wrapper (flex-1 min-h-0 overflow-y-auto scrollbar-1px)
        → table.w-full.text-[13px].table-fixed
          → thead.sticky.top-0.z-10 (bg-gray-50 border-b)
          → tbody (divide-y divide-gray-100)
```

**Invite modal (shadcn Dialog):** email + RoleToggle (Viewer/Editor/Admin) + optional textarea.

---

## PART 12 — NAVIGATION & ROUTING FLOW (All Pages)

### Sidebar (persistent across all pages)
```
[hamburger btn]               → sidebarCollapsed.update(v => !v)  (CSS collapse, no transition)
[workspace avatar/name btn]   → activeModal.set('workspace-switcher')  → WorkspaceSwitcherModal opens
[Recent]                      → navigate('/recent')
[New Dashboard]               → navigate('/dashboard')
[AI Chat]                     → navigate('/chat')
[Projects workspace toggle]   → toggle open/close submenu (local state, fly transition)
[Projects sub-item]           → navigate to that document's route
[Datasources]                 → navigate('/datasource')
[Settings]                    → navigate('/settings')
[ExploreBanner]               → no navigation (static)
```

---

### /recent — Recent View
```
PAGE LOAD
  onMount → recent.store.load()

WORKSPACE SWITCHER MODAL (large variant 920×580px)
  [workspace avatar/name in topbar or sidebar] → activeModal.set('workspace-switcher')
  [workspace row in modal]    → currentWorkspace.set(selected) + close modal
  [+ Create workspace btn]    → navigate('/create-workspace') + close modal
  [X btn / backdrop click]    → activeModal.set(null)

ACTION CARDS
  [New report]                → navigate('/create-form')
  [Create a workspace]        → navigate('/create-workspace')
  [Ask AI]                    → navigate('/chat')
  [Connect data]              → navigate('/datasource')

TAB & VIEW
  [By me / By everyone / Shared with me] → PillTabs change → filter documents list
  [grid icon btn]             → viewMode = 'grid'  (grid-cols-4)
  [list icon btn]             → viewMode = 'list'  (single column rows)

DOCUMENT CARDS
  [card click]                → navigate to document route (e.g. /dashboard, /document-builder)
  [··· btn (group-hover)]     → DropdownMenu: Rename · Duplicate · Move to · Delete
  [Rename]                    → inline edit on card title
  [Delete]                    → confirm dialog → remove from list
```

---

### /sovereign-capital-gate — Project View
```
PAGE LOAD
  onMount → recent.store.load() filtered by workspaceId

ACTION CARDS
  [New report]                → navigate('/create-form')
  [Ask AI]                    → navigate('/chat')
  [Connect data]              → navigate('/datasource')
  [Create dashboard]          → navigate('/dashboard')

VIEW TOGGLE
  [grid / list btn]           → viewMode toggle (same as /recent)

REPORT CARDS
  [card click]                → navigate to /document-builder or /dashboard
  [··· btn]                   → DropdownMenu: Rename · Duplicate · Delete
```

---

### /chat — Full-Page AI Chat
```
PAGE LOAD
  onMount → messages pre-populated (or empty new chat)

TOPBAR
  [Sources (N) btn]           → sourcesDrawerOpen.update(v => !v)
                                  width 0 ↔ 320px  transition 280ms cubic-bezier(0.4,0,0.2,1)
  [Share btn]                 → copy link toast ("Link copied")
  [··· btn]                   → DropdownMenu: Export · Clear chat · Settings

MESSAGE SEND FLOW
  [user types + Enter / Send] → addMessage('user', text) → scroll to bottom
                              → isTyping.set(true)  → TypingIndicator appears (bubbleIn)
                              → chat.service.sendChatMessage()
                              → isTyping.set(false) → addMessage('ai', response)
                              → AI bubble animates in (fly y:6 220ms) → scroll to bottom

AI BUBBLE ACTIONS
  [Copy btn]                  → navigator.clipboard.writeText(content) → showToast('Copied')
  [Export btn]                → DropdownMenu: Export as CSV · Export as PDF
  [Regenerate btn]            → isTyping.set(true) → re-call service → replace last AI msg

SOURCE PILL
  [pill click]                → sourcesDrawerOpen.set(true)  (drawer slides open)

SOURCES DRAWER
  [source item click]         → open preview or external link
  [X btn]                     → sourcesDrawerOpen.set(false)

INPUT AREA
  [Paperclip btn]             → file picker (attach context file)
  [Search pill]               → toggle web-search mode on input
  [Send btn / Enter]          → same as message send flow above
  [Shift+Enter]               → newline in textarea (autoGrow action fires)
```

---

### /dashboard — BI Dashboard
```
PAGE LOAD
  onMount → dashboard.store.load()

TOPBAR
  [Publish btn]               → publish modal / toast
  [Comment btn]               → comments sidebar panel (future)
  [Add KPI btn]               → navigate('/kpi-creator')
  [Edit btn]                  → editMode.set(true) → cards become draggable

TOOLBAR BAR
  [Date range dropdown]       → DateRangePicker popover → filter charts
  [Filter dropdown]           → multi-select filter popover → filter charts
  [View mode pills]           → switch chart density (compact / standard / wide)
  [toolbar-btn: Download]     → export dashboard PDF
  [toolbar-btn: Refresh]      → dashboard.store.load() (re-fetch all chart data)
  [toolbar-btn: Share]        → copy shareable link toast

TAB PILLS
  [Overview / Revenue / Customers / Products]
    → activeDashboardTab.set(tab)
    → DashboardGrid re-renders with tab-specific chart data

KPI STAT CARDS
  [card click]                → navigate('/kpi-creator') with pre-selected KPI

CHART CARDS
  [chart hover]               → Plotly built-in hover tooltip
  [··· btn on chart card]     → DropdownMenu: Edit · Export CSV · Fullscreen · Delete
  [Edit]                      → navigate('/kpi-creator') with chart id pre-loaded
  [Fullscreen]                → expand chart to full viewport overlay
  [Export CSV]                → download chart data as .csv
```

---

### /kpi-creator — KPI Creator
```
PAGE LOAD
  onMount → kpiCreator.store.load(chartId?)  (chartId from query param if editing)

TOPBAR TABS (Visualize / Write SQL)
  [Visualize tab]             → activeKpiTab.set('visualize')  → show canvas + chat panel
  [Write SQL tab]             → activeKpiTab.set('sql')        → show SQL editor + results

RIGHT TOOLBAR
  [Save btn]                  → kpiCreator.store.save() → showToast('KPI saved')
  [Export btn]                → DropdownMenu: Export PNG · Export SVG · Export CSV
  [Back arrow]                → navigate('/dashboard')

CANVAS (Visualize tab)
  [Suggestion chip click]     → kpiChatInput.set(chip.text) → auto-send message
  [chart-output area]         → shows Plotly chart; hover = Plotly tooltip
  [chart card ··· btn]        → DropdownMenu: Change chart type · Edit colors · Fullscreen

KPI CHAT PANEL (right)
  [send message / Enter]      → addKpiMessage('user', text)
                              → isGenerating.set(true) → GeneratingOverlay on canvas
                              → kpiCreator.service.generate(prompt)
                              → isGenerating.set(false) → chart renders (fade-up)
                              → addKpiMessage('ai', response)
  [Paperclip btn]             → attach datasource or file reference
  [send btn (h-[22px])]       → same as Enter

SQL EDITOR (Write SQL tab)
  [sql file tab +]            → create new SQL tab
  [sql file tab ×]            → close tab (confirm if unsaved)
  [Run Query btn]             → sqlEditor.store.runQuery() → results panel populates
  [Table tab in results]      → show DataTable
  [Viz tab in results]        → show chart from query result
  [Save btn]                  → save query to workspace
```

---

### /document-builder — Document Builder
```
PAGE LOAD
  onMount → document.store.load(docId)

TOPBAR
  [breadcrumb workspace name] → navigate('/sovereign-capital-gate') or /recent
  [Draft badge]               → DropdownMenu: Publish · Schedule · Archive
  [Share btn]                 → invite modal (shadcn Dialog)
  [··· btn]                   → DropdownMenu: Export PDF · Duplicate · Delete

FORMATTING TOOLBAR
  [Bold / Italic / Underline] → execCommand on contenteditable (or ProseMirror)
  [H1 / H2 dropdown]          → set heading level
  [List btn]                  → toggle bullet list
  [Quote btn]                 → wrap in blockquote
  [Link btn]                  → link input popover
  [Table btn]                 → insert InlineDataTable
  [Image btn]                 → file picker → upload image
  [AI Assist btn]             → open AI suggestions panel in properties panel
  [Zoom input]                → change editor zoom level

EDITOR CANVAS
  [click to edit]             → focus contenteditable → cursor appears
  [type]                      → document.store.setContent(content) (debounced 500ms)
  [Cmd/Ctrl+S]                → document.store.save() → showToast('Saved')
  [/ command]                 → slash command popover (insert block types)

PROPERTIES PANEL
  [Word count]                → live derived count from store
  [AI suggestion chip]        → insert suggestion at cursor
```

---

### /presentation-builder — Presentation Builder
```
PAGE LOAD
  onMount → presentation.store.load(deckId)

TOPBAR
  [breadcrumb]                → navigate back to project
  [Draft badge]               → same as document-builder
  [Present btn]               → fullscreen presentation mode
  [Share btn]                 → invite/share modal

SLIDE PANEL (left, 200px)
  [slide thumbnail click]     → currentSlide.set(index) → canvas updates
  [+ Add Slide btn]           → presentation.store.addSlide() → new blank slide → select it
  [slide drag-reorder]        → presentation.store.reorderSlides(from, to)
  [slide right-click]         → ContextMenu: Duplicate · Delete · Add after

FORMATTING TOOLBAR
  [same as document-builder formatting] → apply to current slide text/element

SLIDE CANVAS
  [click text block]          → select element → show resize handles
  [double-click text]         → enter edit mode (contenteditable)
  [drag element]              → move element on slide
  [click outside]             → deselect element
  [Cmd/Ctrl+S]                → presentation.store.save() → showToast('Saved')
```

---

### /datasource — Datasource (SPA, 8 views)
```
PAGE LOAD (view-list)
  onMount → datasource.store.loadAll() → populates dsList

── view-list ─────────────────────────────────────────────────────────────
  [+ Add datasource btn]       → showView('view-add')
  [datasource row click]       → showView('view-detail', ds)
  [Create relation btn]        → showView('view-create-relation')
  [Link to workspace btn]      → showView('view-link-ws')
  [Link to project btn]        → showView('view-link-proj')
  [status badge (Error)]       → showView('view-detail', ds)  → wizard step 2 pre-opened

── view-detail ───────────────────────────────────────────────────────────
  [← back chevron]             → showView('view-list')
  [Edit connection btn]        → showView('view-wizard', ds)  (pre-fill wizard)
  [Test connection btn]        → datasource.service.testConnection(ds.id)
                                   idle → loading → success/error state
  [Sync now btn]               → datasource.service.sync(ds.id) → status = 'syncing'
  [table row click]            → expand table schema accordion
  [Delete btn]                 → confirm dialog → remove from dsList → showView('view-list')

── view-add (ConnectorPicker) ────────────────────────────────────────────
  [← back chevron]             → showView('view-list')
  [connector card click]       → selectedConnectorType.set(connector) → showView('view-wizard')

── view-wizard (ConnectionWizard, 3 steps) ───────────────────────────────
  [← back chevron]             → showView('view-add')
  [Step 1 Next btn]            → validate fields → updateStepIndicator(2)
  [Step 2 Test Connection btn] → idle → loading (dotBounce) → success (green) / error (red)
  [Step 2 Next btn]            → (only enabled after test success) → updateStepIndicator(3)
  [Step 3 Connect btn]         → datasource.service.create(form) → dsList update
                                  → showToast('Connected!') → showView('view-detail', newDs)
  [Cancel btn]                 → showView('view-list')

── view-create-relation (RelationshipCanvas) ─────────────────────────────
  [← back]                     → showView('view-list')
  [table node drag]            → reposition node on canvas
  [draw join line]             → create relation between two table columns
  [Save relations btn]         → datasource.service.saveRelations() → showToast

── view-link-ws (LinkToWorkspace) ────────────────────────────────────────
  [← back]                     → showView('view-list')
  [workspace toggle]           → wsAssignments.update() → toggle assigned
  [Choose tables btn]          → showView('view-link-ws-tables')
  [Save btn]                   → datasource.service.linkWorkspaces() → showToast

── view-link-ws-tables (LinkWorkspaceTables) ─────────────────────────────
  [← back]                     → showView('view-link-ws')
  [table checkbox]             → wsAssignments[wsId].tables toggle
  [Save btn]                   → save + showView('view-link-ws')

── view-link-proj (LinkToProject) ────────────────────────────────────────
  [← back]                     → showView('view-list')
  [project checkbox]           → projAssignments.update()
  [Save btn]                   → datasource.service.linkProjects() → showToast
```

---

### /create-form — Create Form
```
PAGE LOAD
  fresh form (no pre-load needed)

FORM
  [field inputs]              → local reactive variables (no store needed)
  [AI textarea]               → autoGrow action fires on input
  [gradient send btn]         → POST intent to AI → response fills form fields (future)
  [Cancel btn]                → navigate('/recent') or history.back()
  [Submit btn]                → createForm.service.submit(form) → navigate('/sovereign-capital-gate')
```

---

### /create-workspace — Create Workspace (standalone, no sidebar)
```
PAGE LOAD
  step = 1  (wizard starts at step 1)

WIZARD STEPS
  Step 1 — Name & avatar
    [input workspace name]    → workspaceName reactive var
    [color swatch click]      → selectedColor.set(color) → avatar preview updates
    [Next btn]                → validate name → step = 2 (step circle animation)

  Step 2 — Invite members
    [email input + Add btn]   → inviteList.update(l => [...l, email])
    [invited chip × btn]      → remove from inviteList
    [Skip btn]                → step = 3
    [Next btn]                → step = 3

  Step 3 — Connect datasource
    [connector card click]    → selectedConnector.set(type)
    [Skip btn]                → submit workspace (no datasource)
    [Create Workspace btn]    → workspace.service.create(form)
                                → navigate('/recent') with new workspace active
```

---

### /settings — Settings & Profile
```
PAGE LOAD
  onMount → settings.store.load()
  default: activeTab = 'profile', activeSettingsNav = 'Profile'

SETTINGS LEFT RAIL
  [Profile]                   → activeSettingsNav.set('Profile')
  [Workspace]                 → activeSettingsNav.set('Workspace')
  [Billing]                   → activeSettingsNav.set('Billing')
  [Members]                   → activeSettingsNav.set('Members')
  [Integrations]              → activeSettingsNav.set('Integrations')
  [Datasources]               → navigate('/datasource')  (leaves settings)

PROFILE TAB
  [Upload avatar btn]         → file picker → preview update
  [First/Last name input]     → local reactive vars
  [Save btn]                  → settings.service.updateProfile(form)
                                → showToast('Profile updated')
  [Account / Security tabs]   → PillTabs change → show account or security form

MEMBERS TAB
  [Invite member btn]         → activeModal.set('invite-member')  → InviteMemberModal opens

  INVITE MODAL (shadcn Dialog)
    [email input]             → reactive var
    [Viewer / Editor / Admin] → RoleToggle → selectedRole.set(role)
    [optional note textarea]  → reactive var
    [Send invite btn]         → settings.service.inviteMember(email, role, note)
                                → showToast('Invite sent') → close modal
    [Cancel / X btn]          → activeModal.set(null)

  [member row ··· btn]        → DropdownMenu: Change role · Remove member
  [Change role]               → RoleToggle inline → settings.service.updateRole()
  [Remove member]             → confirm dialog → settings.service.removeMember()
```

---

## PART 13 — INTERACTION RULES (Locked)

| Interaction | Spec |
|---|---|
| Card hover lift | `hover:-translate-y-0.5 hover:shadow-card-hover transition-all duration-150` |
| Overflow `···` btn | `opacity-0 group-hover:opacity-100 transition-opacity duration-100` |
| Nav item hover | `hover:bg-[#EEF2FF] transition-colors duration-100` |
| Input focus | `focus:border-indigo-400 focus:shadow-input-focus` |
| Tab switch | `120ms ease-in-out` |
| Modal open | `transition:fade` backdrop + `transition:fly={{ y:-8 }}` panel |
| Sidebar collapse | CSS class binding `class:!w-0` — NOT Svelte transition |
| Chat send flow | user bubble → scroll → TypingIndicator → 1600ms → AI response → scroll |
| Generating overlay | `GeneratingOverlay.svelte` absolute inset-0 + dotBounce dots |
| Sources drawer | `transition-[width] duration-[280ms] ease-[cubic-bezier(0.4,0,0.2,1)]` |
| Toast auto-dismiss | 2500ms |
| Submenu chevron | `transition-transform duration-150`, `rotate-90` when open |
| Dropdown close | `on:mousedown` on `document`, `stopPropagation` on panel |
| Chat bubbles | `transition:fly={{ y:6, duration:220 }}` on each new message |

---

## PART 14 — SHADCN-SVELTE vs CUSTOM

### Use shadcn-svelte for:
- `Button` — restyle: primary variant uses `style="background:#5B63F6"`
- `Input` — add `focus:border-indigo-400 focus:shadow-input-focus`
- `Card`, `CardHeader`, `CardContent`
- `Dialog` — base for workspace switcher modal, invite modal
- `DropdownMenu` — overflow menus, filter dropdowns
- `Tabs` — Settings left rail, KPI creator toolbar tabs

### Build custom (NOT shadcn):
- `PillTabs.svelte` — rounded-full pill design
- `NavItem` / `WorkspaceSwitcherBtn` / `ExploreBanner` — sidebar-specific
- `ChatInput.svelte` — auto-grow + action row
- `UserBubble` / `AiBubble` — chat-specific styles
- `KpiChatBubble` — different color scheme from chat page
- `StatCard` / `ChartCard` — dashboard-specific
- `StatusBadge` — datasource status pills
- `Toast.svelte` — dark bg, auto-dismiss (shadcn toast is different)
- `RoleToggle.svelte` — 3-button group selector
- All `charts/` components (BaseChart + specialized wrappers)
- `TypingIndicator` / `GeneratingOverlay` / `LoadingDots`

---

## PART 15 — BUILD ORDER

Build in this exact order (each depends on the previous):

```
1.  app.html                       ← Inter font link (400–800)
2.  app.css                        ← @tailwind directives + scrollbar CSS + @keyframes
3.  tailwind.config.ts             ← custom tokens (shadows, colors)
4.  src/lib/tokens.ts              ← design token constants
5.  src/lib/types/                 ← all TypeScript interfaces
6.  src/routes/+layout.ts          ← ssr=false, prerender=false
7.  src/lib/stores/ui.store.ts     ← sidebar, modal, toast
8.  src/lib/stores/workspace.store.ts
9.  src/lib/stores/factory/async-store.factory.ts
10. src/lib/actions/autoGrow.ts
11. shadcn-svelte init             ← button, input, card, dialog, dropdown-menu, tabs
12. src/lib/components/ui/         ← custom primitives (Badge, Avatar, PillTabs, Toast…)
13. src/lib/components/layout/     ← AppShell, Sidebar, Topbar, WorkspaceSwitcherModal
14. src/lib/components/charts/     ← BaseChart + specialized charts (Plotly)
15. src/lib/services/              ← http client + feature services
16. Feature stores + components    ← per feature (chat, dashboard, datasource…)
17. src/routes/+layout.svelte      ← AppShell wrapper
18. Pages                          ← thin orchestrators, onMount calls stores
```

---

## PART 16 — CHECKLIST (run before shipping any screen)

- [ ] `ssr = false` in `src/routes/+layout.ts`
- [ ] `font-sans bg-white text-gray-900 flex h-screen overflow-hidden` on root div in AppShell
- [ ] Sidebar: 220px, all 8 zones in correct order, correct active item for this route
- [ ] Topbar: correct `padding=` prop per the route table in Part 9.2
- [ ] `overflow-hidden` on `<main>`, `overflow-auto` ONLY on the content zone div
- [ ] Correct scrollbar class on the scrolling container (see route table)
- [ ] `ExploreBanner rounded="xl"` on `/datasource`, `rounded="lg"` everywhere else
- [ ] Bottom nav always shows: **Datasources** + **Settings** (not "Shared with me")
- [ ] No API calls inside any `.svelte` file — all via service layer
- [ ] No store subscriptions in `components/shared/` or `components/charts/` — props only
- [ ] `lucide-svelte` icons used (NOT inline Heroicons SVG)
- [ ] Lucide icons: `size={16}` default, color via class not `style=`
- [ ] Plotly.js imported dynamically inside `onMount` only — never at module level
- [ ] `style=""` used only for hex colors not representable as Tailwind classes
- [ ] Active nav item: inline `style="background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px;"` (not Tailwind)
- [ ] TypeScript `strict: true` — no `any`, all props typed
- [ ] Inter font loaded: weights 400, 500, 600, 700, 800 in `app.html`
- [ ] `@keyframes` in `app.css` (fadeUp · bubbleIn · dotBounce · blink · wsModalIn)
- [ ] WorkspaceSwitcherModal closes on backdrop click
- [ ] Sidebar collapse toggles on hamburger click (updates `sidebarCollapsed` store)
- [ ] KPI Creator chat panel uses **blue** user bubble (`#5B63F6`) — NOT gray like full chat page
- [ ] Dashboard toolbar-btns use **large** variant (h-9 / 36px) — NOT standard 30px
- [ ] Datasource page renders 8 sub-views via `{#if $currentDsView === …}` (not routing)
- [ ] `create-workspace` route has its own `+layout.svelte` with NO sidebar

