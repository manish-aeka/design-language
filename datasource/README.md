# Datasource Management

The **Datasource** page is the central hub for managing all data connections in Aibii. It is built as a single-file SPA (`index.html`) using Tailwind CSS and vanilla JS. All views are managed by a `showView(id)` function — only the `.active` view is rendered at a time.

---

## Layout

```
┌─────────────────────────────────────────────────────────────────┐
│  Sidebar 220px   │  Sub-topbar (title + back + actions)         │
│  (shared nav)    ├─────────────────────────────────────────────-│
│                  │  Active view (flex-1, overflow-hidden)        │
│                  │  view-list · view-detail · view-add           │
│                  │  view-create-relation                         │
│                  │  view-link-ws · view-link-ws-tables           │
│                  │  view-link-proj · view-wizard                 │
└─────────────────────────────────────────────────────────────────┘
```

- **Sidebar** — 220px fixed, identical to all other design-language pages. *Connect Datasource* is the active bottom-utility item (`#EEF2FF` bg + `2px solid #5B63F6` left border).
- **Sub-topbar** (`#sub-topbar`) — persistent bar below the main topbar showing the current view title, an optional back chevron (`subTopbarBack()`), and contextual action buttons (e.g. *Link Datasource*). Hidden on `view-detail` (which has its own inline header).
- **Main content** — `flex-1 overflow-hidden`. Exactly one view carries the `.active` class at any time.

---

## Views

| ID | Title | Purpose |
|---|---|---|
| `view-list` | Datasources | Main list — three scope tabs (Org / Workspace / Project) |
| `view-detail` | *(DS name)* | Detail panel for a single datasource |
| `view-create-relation` | Relationship | Full-width canvas for managing datasource relationships |
| `view-add` | Link Datasource | Connector picker grid |
| `view-wizard` | *(Connector name)* | 3-step connection wizard |
| `view-link-ws` | Link Datasource | Select an org DS to add to the current workspace |
| `view-link-ws-tables` | Configure Table Access | Pick which tables to expose after linking |
| `view-link-proj` | Link Datasource | Select a workspace DS to add to the current project |

---

## view-list — Datasource List

### Scope Tabs

Three tabs switch the visible scope: **Organization**, **Workspace**, **Project**.
Controlled by `_currentScope` and `switchDsScope(scope)`.

```
[ Organization ]  [ Workspace ]  [ Project ]
```

Each tab renders its own KPI bar and list/grid area inside a dedicated `#scope-org / #scope-ws / #scope-proj` container.

---

### Organization scope (`#scope-org`)

Displays all datasources across the entire org.

**Toolbar**

| Control | ID / Class | Behaviour |
|---|---|---|
| Category dropdown | `#ds-cat-dd-btn`, `#ds-cat-dd` | Filter by connector type (`setDsFilter(type)`) |
| Status pills | `.ds-spill` — All / Connected / Error | Filter by status (`setDsStatus(status)`) |
| Workspace dropdown | `#ds-ws-dd-btn`, `#ds-ws-dd` | Filter by workspace (`setWsFilter(ws)`) |
| Search | `#ds-search` | Live search, triggers `filterDsList()` → `renderDsList()` |
| View toggle | `#ds-view-list` / `#ds-view-grid` | `setDsView('list' \| 'grid')` |

**KPI bar** — Total Sources · Connected · Error · Tables
**Filter state** — `_dsCatFilter`, `_dsStatusFilter`, `_dsWsFilter`

**Cards (grid view)** — Connector icon thumbnail, name, connector badge, table count badge, status badge, overflow menu (⋯).
**Rows (list view)** — Icon, name + type + status badges, table count, last-updated, overflow menu.

Overflow menu: *Sync Now* · *Edit Connection* · *Relationship* · *Remove from Org*

---

### Workspace scope (`#scope-ws`)

Displays datasources assigned to the current workspace.

**Toolbar**

| Control | ID / Class | Behaviour |
|---|---|---|
| Category dropdown | `#ws-cat-dd-btn`, `#ws-cat-dd` | Filter by connector type (`setWsCatFilter(type)`) |
| Search | `#ws-search` | Live search, triggers `filterWsList()` → `renderWsScope()` |
| View toggle | `#ws-view-list` / `#ws-view-grid` | `setWsView('list' \| 'grid')` |

**KPI bar** — Total · Connected · Tables
**Filter state** — `_wsCatFilter`

**Cards** — Same thumbnail layout as org scope; clicking opens `view-detail`.
**Rows** — Name, type + status badges, table selection summary, *Edit tables* inline link, *Remove* button.

---

### Project scope (`#scope-proj`)

Displays datasources and artifacts associated with the selected project.

**Project picker** — Dropdown button (`#proj-picker-wrapper`) with an inline search input (`#proj-picker-search`). Selecting a project calls `selectProject(id)`.

**Toolbar**

| Control | ID / Class | Behaviour |
|---|---|---|
| Category dropdown | `#proj-cat-dd-btn`, `#proj-cat-dd` | Filter by connector type (`setProjCatFilter(type)`) |
| Status pills | `.proj-spill` — All / Connected / Error | Filter by status (`setProjStatus(status)`) |
| Search | `#proj-search` | Live search, triggers `renderProjScope()` |
| View toggle | `#proj-view-list` / `#proj-view-grid` | `setProjView('list' \| 'grid')` |

**KPI bar** — Total Sources · Connected · Error · Tables
**Filter state** — `_projCatFilter`, `_projStatusFilter`

**Cards / Rows** — Datasources in the project are highlighted (`border-indigo-100`); unassigned workspace DS shown dimmed with *+ Add* button. Clicking an in-project DS opens `view-detail`. Artifacts (Dashboard / Report / Chart) rendered below datasources.

Assignment toggled with `toggleProjAssign(dsId)`.

---

## view-detail — Datasource Detail

Replaces the list when a datasource card or row is clicked. Has its own inline header (sub-topbar is hidden for this view).

**Header** — Back arrow (`closeDetailPanel()`), connector icon, DS name, connector · type subtitle.

**Tabs**

| Tab | ID | Content |
|---|---|---|
| Overview | `#panel-overview` | Info card (status, type, schema count, owner) + Sync config card (frequency, connection details) |
| Tables | `#panel-tables-tab` | Searchable table list; inline table detail (Preview / Metadata sub-tabs); *Add Table* mode |
| Sync Log | `#panel-sync-tab` | Chronological sync event log |
| Settings | `#panel-settings-tab` | Display name input, alert toggle, *Remove Datasource*, *Save Settings* |

`readOnly` mode (`openDetailPanel(id, true)`) hides the Settings tab and shows the *Add Table* button in the Tables tab.

**Table detail sub-tabs**

| Sub-tab | ID | Content |
|---|---|---|
| Preview | `#tbl-pane-preview` | Row-level data preview table |
| Metadata | `#tbl-pane-columns` | Column schema with data type, description, column type, unit; KPI bar (avg null %, avg unique %, distinct values) |

---

## view-create-relation — Relationship Canvas

Full-width view for managing all relationships of a single datasource. Opened from the datasource overflow menu (*Relationship* item) via `openDsRelations(id)`.

**Toolbar row 1** — Datasource icon + name, total relationship count badge, *Add Relationship* button.

**Toolbar row 2** — Search input (`#cr-search`), list/card view toggle (`#cr-view-list-btn` / `#cr-view-card-btn`) pinned to the right.

**Canvas** (`#cr-relations-list`) — Rendered by `renderCrRelList()`.

| View | Layout |
|---|---|
| List (default) | Flat flex rows: source table → cardinality badge → target table, join condition + description, Edit / Delete buttons |
| Card | Responsive grid (`minmax(300px,1fr)`): source pill → cardinality badge → target pill, join condition, description, Edit / Delete buttons |

**Add / Edit modal** (`#cr-modal`) — Fixed overlay, `z-[200]`, dismissed by clicking backdrop or Cancel.

| Field | ID | Notes |
|---|---|---|
| Source table | `#cr-from` | Searchable dropdown (`#cr-from-dd`) |
| Cardinality | `.cr-card-btn` × 4 | One-to-Many (default) · Many-to-One · One-to-One · Many-to-Many |
| Target table | `#cr-with` | Searchable dropdown (`#cr-with-dd`) |
| Join condition | `#cr-on` | Auto-filled by `autofillCrOn()` when both tables are selected |
| Description | `#cr-desc` | Optional free text |

**State variables**

| Variable | Purpose |
|---|---|
| `_crDsId` | ID of the datasource whose relationships are being managed |
| `_crCardinality` | Currently selected cardinality (`'one-to-many'` default) |
| `_crEditTbl` | Table name being edited (`null` = add mode) |
| `_crEditIdx` | Relation index being edited (`-1` = add mode) |
| `_crRelView` | Current view mode — `'list'` (default) or `'card'` |

---

## view-add — Connector Picker

Shown when *Link Datasource* is clicked from the org or project scope.

| Element | Behaviour |
|---|---|
| Search input | `filterConnectors(q)` — hides non-matching cards live |
| Type tabs | All · Database · File · API — `filterByType(type)` |
| Connector grid | 4-column grid; each card has icon, name, description; click → `openWizard(name)` |

**Connector groups**

| Group | Connectors |
|---|---|
| Database | Postgres, MySQL, MongoDB, SQL Server |
| File | Excel, CSV, JSON / JSONL |
| API | MCP, REST API, GraphQL |

---

## view-wizard — Connection Wizard

3-step flow launched from the connector picker.

**Step indicator** — 3 numbered circles + connecting lines; `updateStepIndicator(n)`.

| Step | Fields |
|---|---|
| 1 — General Info | Connection Name (required), Description (optional) |
| 2 — Connection Details | Host, Port, Database, Username, Password; *Test Connection* (`testConnection()`) shows idle / loading / success / error states; Continue unlocks after successful test. For file connectors: upload tab + URL tab (`switchFileTab(tab)`). |
| 3 — Select Tables | *Select All* toggle, searchable checkbox list (`filterTableList()`), *Finish* |

On finish: `finishWizard()` persists to `localStorage`, auto-assigns the new DS to the current workspace (and project if in project scope), shows a toast, then returns to `view-list`.

---

## view-link-ws — Link to Workspace

Shows all org datasources not yet assigned to the current workspace.

**Toolbar** — Category dropdown (`#lws-cat-dd-btn`) · Status pills (`.lws-spill` — All / Connected / Error) · Search (`#link-ws-search`)
**Filter state** — `_lwsCatFilter`, `_lwsStatusFilter`

Each row has a *Link* button → `linkWsDs(dsId)` → opens `view-link-ws-tables` for table selection.

---

## view-link-ws-tables — Table Access

After linking a DS to the workspace, configure which tables are accessible.

- Checkbox list of all tables in the DS
- *Select All* toggle
- *Confirm* → saves selection to `_wsAssignments[dsId].tables`, returns to `view-list`

---

## view-link-proj — Link to Project

Shows workspace-assigned datasources not yet in the current project.

Each row has an *Add to Project* button → `addDsToProj(dsId)`.

---

## Data Model

### Default datasources (`DEFAULT_DS`)

5 hardcoded entries (Production Postgres, Analytics Warehouse, Sales CSV, Stripe API, Internal MySQL). Each has: `id`, `name`, `connector`, `type`, `status`, `tables`, `tables_list`, `owner`, `schedule`, `updated`, `host?`, `port?`, `database?`.

### Added datasources

Persisted to `localStorage` key `aibii_added_datasources`. Merged with `DEFAULT_DS` by `loadDsList()` into `_dsList`.

### Assignment maps

| Variable | Type | Purpose |
|---|---|---|
| `_wsAssignments` | `{ [dsId]: { assigned: bool, tables: string[] \| null } }` | Workspace-level DS assignment + table selection |
| `_allProjAssignments` | `{ [projectId]: Set<dsId> }` | Per-project DS assignment |
| `_projAssignments` | Proxy → `_allProjAssignments[_currentProjectId]` | Current project's assignment set |

---

## Design Tokens

| Token | Value |
|---|---|
| Brand primary | `#5B63F6` |
| Brand indigo light | `#EEF2FF` |
| Active nav border | `2px solid #5B63F6` |
| Connected green | `#16A34A` |
| Error red | `#DC2626` |
| Pending amber | `#D97706` |
| Card shadow | `shadow-card` → `0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04)` |
| Input radius | `rounded-lg` |
| Dropdown shadow | `0 12px 30px rgba(0,0,0,0.12)` |
| Font | Inter, weights 400–800 |

---

## JavaScript Functions

### Navigation

| Function | Purpose |
|---|---|
| `showView(id)` | Activates a view, updates sub-topbar, triggers scope render |
| `updateSubTopbar(id)` | Sets title, description, back button visibility for the current view |
| `subTopbarBack()` | Navigates to the previous view defined in `VIEW_META` |
| `switchDsScope(scope)` | Switches between `'org'`, `'ws'`, `'proj'` scope tabs |

### Org scope

| Function | Purpose |
|---|---|
| `renderDsList()` | Renders the org datasource list applying all active filters |
| `getFilteredList()` | Returns `_dsList` after applying `_dsCatFilter`, `_dsStatusFilter`, `_dsWsFilter`, search query |
| `setDsView(v)` | Toggles grid / list view |
| `setDsFilter(type)` | Sets category filter and re-renders |
| `setDsStatus(status)` | Sets status filter and re-renders |
| `setWsFilter(ws)` | Sets workspace filter and re-renders |
| `toggleDsCatDd()` | Opens / closes the category dropdown |
| `filterDsList()` | Search input handler → calls `renderDsList()` |
| `updateStats()` | Refreshes org-scope KPI counts |
| `syncDs(id)` | Simulates a sync operation with loading state |
| `deleteDs(id)` | Removes a datasource from `_dsList` and storage |

### Workspace scope

| Function | Purpose |
|---|---|
| `renderWsScope()` | Renders workspace list applying `_wsCatFilter` + search |
| `setWsCatFilter(type)` | Sets category filter and re-renders workspace list |
| `toggleWsCatDd()` | Opens / closes workspace category dropdown |
| `filterWsList()` | Search input handler → calls `renderWsScope()` |
| `setWsView(v)` | Toggles grid / list view for workspace scope |
| `linkWsDs(dsId)` | Assigns a DS to the workspace, opens `view-link-ws-tables` |
| `removeWsAssign(dsId)` | Unassigns a DS from the workspace |
| `confirmWsTableSel()` | Saves table selection and returns to `view-list` |
| `refreshWsDropdownList()` | Rebuilds the add-dropdown list of unassigned DS |

### Project scope

| Function | Purpose |
|---|---|
| `renderProjScope()` | Renders project DS + artifact list applying all active filters |
| `setProjCatFilter(type)` | Sets category filter and re-renders project list |
| `setProjStatus(status)` | Sets status filter and re-renders project list |
| `toggleProjCatDd()` | Opens / closes project category dropdown |
| `setProjView(v)` | Toggles grid / list view for project scope |
| `toggleProjAssign(dsId)` | Adds / removes a DS from the current project |
| `toggleProjPicker()` | Opens / closes the project selection dropdown |
| `renderProjPickerList(q)` | Renders filtered project list in the picker dropdown |
| `filterProjPicker()` | Search handler inside project picker |
| `selectProject(id)` | Sets `_currentProjectId` and re-renders project scope |

### Link Workspace view

| Function | Purpose |
|---|---|
| `renderLinkWsView()` | Renders unassigned DS list applying `_lwsCatFilter`, `_lwsStatusFilter`, search |
| `setLwsCatFilter(type)` | Sets category filter and re-renders |
| `setLwsStatus(status)` | Sets status filter and re-renders |
| `toggleLwsCatDd()` | Opens / closes link-ws category dropdown |
| `filterLinkWsList()` | Search input handler → calls `renderLinkWsView()` |

### Detail panel

| Function | Purpose |
|---|---|
| `openDetailPanel(id, readOnly?)` | Populates and shows `view-detail`; `readOnly=false` shows Settings tab |
| `closeDetailPanel()` | Returns to `view-list` and restores active scope |
| `setPanelTab(tab)` | Switches Overview / Tables / Sync Log / Settings tab |
| `renderPanelTables(filter?)` | Renders the table list inside the Tables tab |
| `openTblDetail(name)` | Opens inline table detail (Preview / Metadata sub-tabs) |
| `switchTblTab(tab)` | Switches Preview / Metadata sub-tab |
| `renderPanelSyncLog()` | Renders sync event entries |
| `enterAddTableMode()` | Switches Tables tab to add-table selection mode |
| `confirmInlineAddTables()` | Saves selected tables and exits add mode |

### Relationship canvas (`view-create-relation`)

| Function | Purpose |
|---|---|
| `openDsRelations(id)` | Opens `view-create-relation` for the given datasource; resets search + view mode |
| `renderCrRelList()` | Renders the relationship list/grid, applying search filter and `_crRelView` mode |
| `setCrRelView(v)` | Sets `_crRelView` to `'list'` or `'card'`, updates toggle button styles, re-renders |
| `openCrModal(tblName?, relIdx?)` | Opens the add/edit modal; populates fields for edit mode when args provided |
| `closeCrModal()` | Hides the modal and closes any open table dropdowns |
| `saveCreateRelation()` | Validates form and persists the relationship (add or edit); calls `renderCrRelList()` |
| `deleteCrRelation(tblName, relIdx)` | Removes a relationship entry and re-renders |
| `setCrCardinality(val)` | Updates the active cardinality selection in the modal |
| `renderCrTableDdList(listId, tables, q)` | Renders a filtered list of table rows inside a dropdown |
| `openCrTableDd(inputId, ddId)` | Shows a table dropdown and closes the other |
| `filterCrTableDd(inputId, ddId)` | Filters table dropdown rows on input |
| `selectCrTable(listId, name)` | Sets the table input value, closes dropdown, calls `autofillCrOn()` |
| `autofillCrOn()` | Auto-fills the join condition hint when both tables are selected |

### Table relationship modal (table-level, inside detail panel)

| Function | Purpose |
|---|---|
| `openRelModal(idx)` | Opens the per-table relationship add / edit modal |
| `saveRel()` | Persists or updates a table-level relationship |
| `deleteRel(idx)` | Removes a table-level relationship |
| `renderTblRels()` | Re-renders the relationship list inside the table detail panel |

### Wizard

| Function | Purpose |
|---|---|
| `openWizard(name)` | Configures wizard for the selected connector, shows `view-wizard` |
| `goStep(n, silent?)` | Advances / retreats wizard step |
| `updateStepIndicator(n)` | Updates step circle styles |
| `testConnection()` | Simulates a connection test (idle → loading → success / error) |
| `toggleAllTables(master)` | Select / deselect all table checkboxes in step 3 |
| `finishWizard()` | Persists DS, assigns to workspace + project if applicable, shows toast |
| `validateStep1()` | Enables / disables the Continue button based on name input |
| `switchFileTab(tab)` | Switches between upload and URL tabs for file connectors |

### Utilities

| Function | Purpose |
|---|---|
| `openTblDescModal(name)` | Opens the table description edit modal |
| `openColDescModal(idx, colName)` | Opens the column description edit modal |
| `openTablePreview(name, catOverride?)` | Opens the floating table data preview modal |
| `toggleDsCardMenu(e, id)` | Opens the per-card overflow context menu |
| `showToast(msg)` | Shows the bottom-right success toast for 2.5 s |
| `connectorIcon(connector, size)` | Returns an inline SVG for the given connector name |
| `connectorPalette(connector)` | Returns `{ bg, color }` brand colours for a connector |
| `statusBadgeHtml(status)` | Returns a coloured inline badge span |
| `loadDsList()` | Merges `DEFAULT_DS` with `localStorage` additions into `_dsList` |
| `updateScopeCounts()` | Refreshes the DS count shown on each scope tab button |

---

## Sidebar

Shared across all design-language pages.

### Primary nav
| Item | Notes |
|---|---|
| Recent | `href="../recent-view/index.html"` |
| Create Dashboard | — |
| AI Chat | — |

### Projects section
| Item | Notes |
|---|---|
| My Private Project | Pinned; 11 sub-items (Q4 Strategy, Revenue Overview, …) |
| Sovereign Capital Gate | 3 sub-items (Chat, Dashboard, Document) |
| + Create a project | `openNewProjectModal()` |

### Bottom utility nav
| Item | State |
|---|---|
| Datasource | **Active** — `#EEF2FF` bg, `2px solid #5B63F6` left border |
| Settings | `href="../settings-profile/index.html"` |

### Explore banner
```
div.mx-3.mb-3.mt-1.rounded-xl.px-3.py-2.5  bg:#E8EEFF
  div.w-8.h-8.rounded-full  bg:#C7D2FE  → sparkle SVG color:#4F6EF7
  p "Explore free features"  text-[12px] font-semibold color:#3B4ECC
  p "Credit left: 15"        text-[11px] color:#6B7ADE
```
> Note: This page uses `rounded-xl` — all other pages use `rounded-lg`.

---

## Scrollbar

```css
/* Global */
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 9999px; }
::-webkit-scrollbar-track { background: transparent; }

/* Scoped thin variant (.scrollbar-thin) */
.scrollbar-thin::-webkit-scrollbar { width: 4px; height: 4px; }
.scrollbar-thin::-webkit-scrollbar-thumb { background: #E2E8F0; border-radius: 9999px; }
.scrollbar-thin::-webkit-scrollbar-thumb:hover { background: #CBD5E1; }
.scrollbar-thin::-webkit-scrollbar-track { background: transparent; }
```

---

## File Structure

```
datasource/
  index.html   — Single-file SPA (sidebar + 8 views + all JS inline)
  README.md    — This file
```
