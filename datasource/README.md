# Datasource — Connect Data

The **Connect Data** view is a multi-step screen within Aibii that lets users browse, connect, and configure data sources for their workspace. It is built as a single-file SPA (`index.html`) with three views managed by a `showView()` function.

---

## Layout

```
┌──────────────────────────────────────────────────────────┐
│  Sidebar 220px  │  Main content (flex-1)                 │
│  (shared nav)   │  View 1 / View 2 / View 3              │
└──────────────────────────────────────────────────────────┘
```

- **Sidebar** — 220px fixed, matches `recent-view` sidebar exactly. This sidebar structure is the **canonical reference** shared by all pages in the design-language project (chat, dashboard, create-form, settings-profile, sovereign-capital-gate). **Connect Datasource** is the active nav item in the bottom utility section (`#EEF2FF` bg + `2px solid #5B63F6` left border). Primary nav contains plain links (Recent, Create Dashboard, AI Chat).
- **Main** — `flex-1`, `overflow-hidden`. One of three views is `.active` at a time.

---

## Views

### View 1 — Connect Your Data (`#view-connect`)

Landing page shown on first load.

| Element | Description |
|---|---|
| Page icon + title | Chain-link connector icon in `#EEF2FF` tile, 26px bold heading |
| Subtitle | Descriptor text below heading |
| Info banner | Brand-bordered `#5B63F6` banner with info icon |
| Three Steps to Insights | 3-column card grid explaining the onboarding flow (Select → Secure → Ask) |
| Ready to unlock your data? | CTA card with "Get Started" button → navigates to View 2 |
| Connected Datasources | Searchable, filterable table of existing connections |

**Connected Datasources table**

- Search input (`rounded-lg`, matches recent-view)
- Type ▾ dropdown (fixed `120px` width, `right-0` aligned to prevent overflow)
  - All (list icon) · Database (indigo) · File (orange) · API (green)
- Table: `table-fixed`, sticky header, `max-height: 320px` with vertical scroll
- Columns: Name · Type (colored badge) · Status (dot indicator) · Tables

Sample data (5 rows): Production Postgres, Analytics Warehouse, Sales CSV Export, Stripe API, Google Sheets.

---

### View 2 — Add Datasource (`#view-add`)

Connector picker page.

| Element | Description |
|---|---|
| Top bar | Breadcrumb with back chevron → View 1, "Add Datasource" label |
| Back button | Chevron-left in heading row → View 1 |
| Search input | Full-width `rounded-lg` input, filters connector cards live |
| Type ▾ dropdown | Fixed-width 120px, right-aligned, filters by group |
| Connector grid | 4-column grid, grouped by type |

**Connector groups**

| Group | Connectors |
|---|---|
| **Database** | Postgres, MySQL, MongoDB, SQL Server |
| **File** | Excel, CSV, JSON / JSONL |
| **API** | MCP, REST API, GraphQL |

Each connector card has: custom SVG icon · name (13px semibold) · short description (11px gray).  
Clicking any card calls `openWizard(name)` → navigates to View 3.

---

### View 3 — Add [Connector] Wizard (`#view-wizard`)

3-step configuration wizard.

| Element | Description |
|---|---|
| Top bar | Back chevron → View 2, connector name label |
| Back button | Chevron-left in heading row → View 2 |
| Step indicator | 3 numbered circles + connecting lines, updates state as user progresses |
| Step content | One `step-pane` visible at a time |

**Step 1 — General Information**

- Connection Name (required, validates on input)
- Description (optional textarea)
- "Continue" button — disabled until name is filled

**Step 2 — Connection Details**

- Host, Port, Database Name, Username, Password fields
- "Test Connection" button — shows idle / loading spinner / success / error states
- "Back" + "Continue" buttons (Continue enabled after successful test)

**Step 3 — Select Tables**

- "Select All" toggle row
- Scrollable list of 8 tables with checkboxes
- "Back" + "Finish" buttons
- On Finish → shows toast notification "Datasource connected successfully", returns to View 1

---

## Sidebar Structure

The shared sidebar is identical across all pages. Key sections:

### Primary Nav
| Item | State | Notes |
|---|---|---|
| Recent | plain link | `href="../recent-view/index.html"` |
| Create Dashboard | plain link | |
| AI Chat | plain link | |

On page-specific views the relevant item receives the active style (`background:#EEF2FF; border-left:2px solid #5B63F6; padding-left:10px`).

### Projects Section

Label: `Projects` (`text-[11px] uppercase tracking-widest text-gray-400`) with eye/search icon. Container: `id="projects-list"`.

| Project | Notes |
|---|---|
| **My Private Project** | Pinned (blue pin icon `#5B63F6`), `id="ws2-btn"`, 11 sub-items: Q4 Strategy, Revenue Overview, Project Brief, Investor Update, Meeting Notes, KPI Tracker, Product Feedback, User Analytics, Sprint Planning, Roadmap 2026, API Docs |
| **Sovereign Capital Gate** | `id="ws1-btn"`, 3 sub-items: Chat, Dashboard, Document |
| + Create a project | `onclick="event.preventDefault();openNewProjectModal()"` |

### Bottom Utility Nav
| Item | State | Notes |
|---|---|---|
| Connect Datasource | **ACTIVE** on this page | `href="../datasource/index.html"`, icon color `#5B63F6` |
| Shared with me | plain | |
| Settings | plain | `href="../settings-profile/index.html"` |

---

## Design Tokens

| Token | Value |
|---|---|
| Brand primary | `#5B63F6` |
| Brand secondary | `#7C6FF7` |
| Active nav bg | `#EEF2FF` |
| Active nav border | `2px solid #5B63F6` |
| Card border | `#E5E7EB` |
| Card shadow | `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` |
| Section title | `text-[15px] font-semibold text-gray-900` (matches sovereign-capital-gate "All items") |
| Input radius | `rounded-lg` (matches recent-view) |
| Font | Inter, weights 400–800 |

---

## JavaScript Functions

| Function | Purpose |
|---|---|
| `showView(id)` | Switches the active view |
| `toggleTypeDropdown()` | Opens/closes the View 2 Type filter dropdown |
| `filterByType(type)` | Filters connector grid by group (all / database / file / api) |
| `filterConnectors(q)` | Filters connector cards by text search |
| `openWizard(name)` | Sets wizard connector name and navigates to View 3 |
| `goStep(n)` | Advances or retreats the wizard step indicator |
| `testConnection()` | Simulates connection test with loading state |
| `toggleAllTables(cb)` | Selects/deselects all table checkboxes |
| `finishWizard()` | Shows success toast, resets wizard, returns to View 1 |
| `renderDsTable()` | Renders the Connected Datasources table rows |
| `filterDatasources()` | Re-renders table on search input |
| `filterDsType(type)` | Filters table by type and updates dropdown label |
| `toggleDsTypeDropdown()` | Opens/closes the View 1 Type filter dropdown |
| `toggleWorkspace(id)` | Expands/collapses sidebar workspace submenus |
| `openNewProjectModal()` | Placeholder for new-project modal (wired to "Create a project" link) |

---

## File Structure

```
datasource/
  index.html   — Single-file SPA (sidebar + 3 views + all JS)
  README.md    — This file
```
