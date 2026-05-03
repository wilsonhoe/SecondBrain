# AI Second Brain: Comprehensive Documentation

**Repository:** [https://github.com/wilsonhoe/SecondBrain](https://github.com/wilsonhoe/SecondBrain)  
**Stack:** Obsidian + Claude Code CLI + MCP Protocol  
**Last Updated:** 2026-05-03

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Architecture Overview](#2-architecture-overview)
3. [Directory Taxonomy & Memory Topology](#3-directory-taxonomy--memory-topology)
4. [CLAUDE.md: The Procedural Memory Constitution](#4-claudemd-the-procedural-memory-constitution)
5. [Memory Evolution & Promotion Mechanisms](#5-memory-evolution--promotion-mechanisms)
6. [Knowledge Association & Graph Visualization](#6-knowledge-association--graph-visualization)
7. [Automated CRM & Conversation Management](#7-automated-crm--conversation-management)
8. [Proactive Heartbeat & Autonomous Execution](#8-proactive-heartbeat--autonomous-execution)
9. [Token Economics & Sub-Agent Routing](#9-token-economics--sub-agent-routing)
10. [Lessons Learned](#10-lessons-learned)
11. [SWOT Analysis](#11-swot-analysis)
12. [Implementation Roadmap](#12-implementation-roadmap)
13. [Conclusion](#13-conclusion)

---

## 1. Executive Summary

The AI Second Brain is an autonomous knowledge management system that transcends traditional Personal Knowledge Management (PKM). Unlike static containers such as Confluence or OneNote, this architecture leverages Obsidian's local Markdown filesystem as a cognitive substrate and Claude's reasoning engine as an active inference layer.

### Core Capabilities

- **Autonomous Ingestion:** Automatically captures raw data (voice transcripts, web clippings, emails) and classifies them into a deterministic directory hierarchy.
- **Semantic Association:** Discovers hidden connections across projects via RAG vector embeddings and bidirectional wikilinks.
- **Memory Evolution:** Implements a four-tier memory system (Procedural, Working, Short-Term, Long-Term) with automated daily reflection and memory promotion.
- **Active CRM:** Transforms contact management from static lists into a predictive relationship engine that generates outreach recommendations.
- **Proactive Execution:** Operates via a heartbeat daemon that scans inboxes, monitors calendars, and prepares contextual briefings without human prompting.

### Design Philosophy

> The second brain is not a data warehouse. It is a self-organizing ecosystem that converts information entropy into deterministic execution.

---

## 2. Architecture Overview

### 2.1 The Dual-Layer Model

The architecture separates concerns into two distinct but tightly coupled layers:

| Layer | Component | Responsibility |
|-------|-----------|---------------|
| **Memory Substrate** | Obsidian Vault (Local Markdown) | Persistent storage, bidirectional linking, graph topology, data sovereignty |
| **Inference Engine** | Claude Code CLI + MCP | Semantic parsing, cross-reference generation, automated classification, reasoning |
| **Integration Bridge** | MCP Protocol + Cron Jobs | Standardized communication, scheduled automation, secure file-system access |

### 2.2 Integration Patterns

#### Pattern A: Claude Code CLI (Terminal Mode)
- **Use Case:** Deep vault refactoring, full-text search, complex multi-step reasoning, batch operations.
- **Mechanism:** Claude Code runs locally with direct read/write permissions to the vault directory.
- **Advantage:** Maximum control. No API latency for local operations.

#### Pattern B: Model Context Protocol (MCP)
- **Use Case:** Secure, standardized communication between cloud LLM instances and local filesystem.
- **Mechanism:** MCP tools expose vault directories as structured resources with defined read/write scopes.
- **Advantage:** Maintains data privacy boundaries while enabling remote agent access.

#### Pattern C: Smart Connections (RAG)
- **Use Case:** Discovering hidden semantic associations across large historical datasets.
- **Mechanism:** Generates local vector embeddings for all notes; queries via cosine similarity.
- **Advantage:** Finds conceptual bridges that keyword search misses entirely.

### 2.3 Data Sovereignty

Obsidian stores all data as local plain-text Markdown. This eliminates vendor lock-in and allows AI agents to parse the entire vault via standard filesystem operations without complex database migration or API translation layers. The machine-readable format enables Claude to construct an Abstract Syntax Tree (AST) of the entire knowledge base natively.

---

## 3. Directory Taxonomy & Memory Topology

A deterministic directory structure is non-negotiable. LLMs operate on probability distributions; a chaotic filesystem increases hallucination risk, wastes context window tokens, and degrades cross-reference accuracy. The following taxonomy organizes information by **lifecycle state**, creating a unidirectional flow from raw capture to permanent knowledge.

### 3.1 Directory Hierarchy

```
vault/
├── 00_Inbox/           # Raw, unprocessed captures
├── 01_Daily/           # Time-series daily logs (YYYY-MM-DD.md)
├── 02_Projects/        # Active work with defined scope
├── 03_Resources/       # Research, articles, references
├── 04_People/          # CRM nodes per contact
├── AI/
│   ├── Sessions/       # Machine-generated session logs
│   └── memory.md       # Long-term distilled wisdom
├── Templates/          # Structured note templates
└── _archive/           # Deprecated or completed material
```

### 3.2 Directory Specifications

#### `/00_Inbox` — The Sensory Cortex
- **Purpose:** Unstructured raw input (voice transcripts, web clippings, email forwards, fleeting ideas).
- **AI Protocol:** First directory scanned during every heartbeat. Items here trigger classification workflows.
- **Frontmatter:** `tags: [needs-review, unprocessed]`; `created: YYYY-MM-DDTHH:MM:SS`.

#### `/01_Daily` — The Working Memory Buffer
- **Purpose:** System anchor files named `YYYY-MM-DD.md`. Captures tasks, events, and session summaries.
- **AI Protocol:** Read at session start to establish temporal context.
- **Template Fields:**
  - `Top 3 Priorities`
  - `Schedule / Plan`
  - `Agent Log` (AI activity summary)
  - `Reflections`

#### `/02_Projects` — The Active Cortex
- **Purpose:** Isolates currently executing work. Each project is a folder with its own context boundary.
- **AI Protocol:** Prevents domain contamination. Claude loads only relevant project context for targeted reasoning.
- **Frontmatter:** `status: active | paused | completed`; `goal:`; `definition_of_done:`; `next_actions:`.

#### `/03_Resources` — The Reference Library
- **Purpose:** Research materials, meeting notes, article summaries.
- **AI Protocol:** RAG semantic search targets this directory for deep historical recall.
- **Template Fields:** `summary:`; `key_points:`; `quotes:`; `action_items:`.

#### `/04_People` — The Social Graph
- **Purpose:** One note per key contact or client. Aggregates all historical interactions.
- **AI Protocol:** Relationship momentum analysis and outreach suggestion generation.
- **Frontmatter:** `organization:`; `last_contact_date:`; `relationship_status:`; `potential_value:`.

#### `/AI/Sessions` — The Machine Audit Trail
- **Purpose:** Claude writes session outputs, generated drafts, and decision logs here.
- **AI Protocol:** Creates an immutable record of machine reasoning for accountability and debugging.
- **Frontmatter:** `session_date:`; `decisions_made:`; `outstanding_items:`.

### 3.3 YAML Frontmatter as Metadata Layer

Structured YAML frontmatter transforms Markdown files into a queryable database. When all files adhere to strict key-value schemas, Claude can execute deterministic multi-dimensional queries using programmatic precision.

**Example Frontmatter Template:**
```yaml
---
title: Project Alpha Sprint 3
status: active
created: 2026-05-01
updated: 2026-05-03
tags: [sprint, backend, api-integration]
project: 02_Projects/Project-Alpha
goal: Launch v1.2 API with Stripe webhooks
definition_of_done: All endpoints return 200 in staging
next_actions:
  - Review PR #142
  - Update OpenAPI spec
---
```

---

## 4. CLAUDE.md: The Procedural Memory Constitution

`CLAUDE.md` sits at the vault root and serves as the agent's **Procedural Memory** and **Supreme Constitution**. Every time Claude Code initializes, it reads and internalizes this file, enabling instant high-context responses without repetitive prompt priming.

### 4.1 Core Modules

#### Identity & Role Definition
Defines the AI's persona within the knowledge ecosystem. Example:
> "You are a knowledge copilot assisting a technical founder. Your role is to extract core arguments, maintain wikilink integrity, and surface cross-project insights."

#### Topology Navigation Guide
Explicitly maps the directory taxonomy so the agent knows:
- Where to find unprocessed material (`/00_Inbox`)
- Where to write machine logs (`/AI/Sessions`)
- Where to route classified items (`/02_Projects`, `/04_People`)

#### Syntax & Linking Conventions
Enforces Obsidian-specific formatting:
- **Internal links:** `[[Note Title]]` (wikilinks)
- **Tags:** `#tag-name` (lowercase, hyphenated)
- **Tasks:** `- [ ]` for todos, `- [x]` for completed
- **Aliases:** `aliases: ["Alt Name"]` for disambiguation

#### Session Protocol
**Startup Sequence:**
1. Read today's daily note (`/01_Daily/YYYY-MM-DD.md`).
2. Scan `/00_Inbox` for items tagged `#needs-review`.
3. Summarize new captures and propose routing.
4. Load any active project contexts referenced in daily note.

**Shutdown Sequence:**
1. Ensure inbox is at zero unclassified items.
2. Write session summary to `/AI/Sessions/SESSION_YYYY-MM-DD.md`.
3. Append agent activity log to today's daily note.
4. Surface any `#urgent` items for human review.

#### Negative Constraints (Defensive Guardrails)
To prevent destructive autonomy:
- **NEVER** delete any note. Move deprecated content to `/_archive`.
- **NEVER** rename files without explicit human authorization.
- **NEVER** modify files under `/Templates`.
- **NEVER** overwrite existing wikilinks without preserving backlinks.

### 4.2 Cascading Context (Multi-Project Vaults)

For complex vaults with isolated domains (e.g., company work vs. personal projects), use a cascading context loader:

- **Global `CLAUDE.md`** at vault root defines universal rules.
- **Local `.claude.md`** in subdirectories (e.g., `/02_Projects/Company-X/`) overrides for that domain.
- **Detection:** Claude detects the current working directory (`PWD`) and dynamically switches context, system prompts, and log output paths.

This achieves multi-threaded memory isolation within a single vault.

---

## 5. Memory Evolution & Promotion Mechanisms

A static LLM does not learn from usage. Its weights are frozen at deployment. The AI Second Brain overcomes this by using the Obsidian filesystem as an external long-term memory substrate, implementing a **Memory Promotion Pipeline** that distills raw session noise into structured wisdom over time.

### 5.1 The Four-Tier Memory Architecture

| Tier | Analog | Storage | Lifecycle | Function |
|------|--------|---------|-----------|----------|
| **Procedural** | Subconscious | `CLAUDE.md`, `core-rules.md` | Permanent | Core logic, personality, syntax constraints |
| **Working** | Active Thought | CLI session buffer, open editor tabs | Minutes to hours | Immediate task context |
| **Short-Term** | Recent Memory | Daily logs, inbox, session summaries | Days | Recent execution flow, open loops |
| **Long-Term** | Deep Memory | `AI/memory.md`, RAG vector cache, archives | Permanent | Distilled decisions, cross-project axioms, evolved preferences |

### 5.2 The Memory Promotion Pipeline

#### Stage 1: Pre-Compression (Session Capture)
During active sessions, a pre-compact hook captures all interactions. Before the context window reaches its token limit, the raw conversation is flushed to the day's session log (`/AI/Sessions/SESSION_YYYY-MM-DD.md`). This ensures **zero data loss**.

#### Stage 2: Daily Reflection (Distillation)
A cron-scheduled heartbeat wakes the agent to review the past 24 hours of raw logs. The agent is instructed to:
- Extract factual assertions and strategic decisions.
- Capture lessons from failed attempts or debugging paths.
- Identify recurring user preferences (e.g., "user prefers bullet points over paragraphs").

#### Stage 3: Memory Promotion (Long-Term Storage)
Distilled insights are promoted:
- **Factual knowledge** → appended to `AI/memory.md` with timestamp and source.
- **User preferences** → written to agent configuration notes.
- **Project-specific lessons** → appended to the relevant project's `lessons-learned.md`.

#### Stage 4: Semantic Retrieval (Recall)
Through vector embedding layers (e.g., Smart Connections or a QMD retrieval layer), the agent can perform hybrid retrieval months later. It combines:
- **Keyword search** for precise terms.
- **Semantic search** for conceptual similarity.
- **Graph traversal** for relational context via wikilinks.

This constitutes true **cross-session continuity**.

### 5.3 Preference Evolution Example

If the agent observes across multiple sessions that the user consistently rewrites its paragraph summaries into bullet lists, it extracts this pattern during Daily Reflection and adds a procedural rule to `CLAUDE.md`:

```markdown
## User Preference: Summaries
- Always present summaries as bullet points, never paragraphs.
```

On subsequent sessions, this preference is active from startup, eliminating the rewrite cycle.

---

## 6. Knowledge Association & Graph Visualization

### 6.1 Breaking Hierarchical Silos

Traditional folder hierarchies force a single classification path for each idea. A note about "API rate limiting" must live under either `/02_Projects/Backend` or `/03_Resources/Engineering`, but never both. This creates knowledge silos.

The AI Second Brain replaces this with **Networked Thought**:
- Each Markdown file is a **node**.
- Each `[[wikilink]]` is a **bidirectional edge**.
- Tags (`#tag-name`) serve as **weak semantic edges** for clustering.

### 6.2 AI-Driven Cross-Domain Association

Because the agent has global vault read access and semantic vector understanding, it can establish high-dimensional connections between seemingly unrelated domains. Custom slash commands (implemented via CLI aliases or templater scripts) expose this capability:

- **`/trace` (Trajectory Tracking):**  
  Traces the evolution of a concept across months of daily logs and project notes, showing how understanding matured.

- **`/connect` (Cross-Domain Synthesis):**  
  Forces the agent to analyze backlink topology and find commonalities between unrelated domains (e.g., "film editing" and "product design"), generating novel insights.

- **`/challenge` (Red Team Stress Test):**  
  The agent audits the user's current decision logic against the entire historical note corpus, searching for contradictions, blind spots, or cognitive biases.

### 6.3 Visual Topology via Obsidian Graph

Obsidian's built-in Graph View renders the knowledge network dynamically:
- **Nodes:** Individual Markdown files.
- **Edges:** Wikilinks and backlinks.
- **Clusters:** Dense subgraphs reveal emergent knowledge domains.
- **Orphans:** Isolated nodes highlight under-connected ideas.

For advanced analysis, plugins like **InfraNodus** introduce network science algorithms:
- **Topical Clustering:** AI-identified dense subgraphs.
- **Structural Gap Detection:** Highlights cognitive blind spots between clusters.
- **Bridge Identification:** Surfaces high-betweenness notes that connect disparate knowledge domains.

This transforms the graph from a passive curiosity into an **active strategic planning tool**.

---

## 7. Automated CRM & Conversation Management

### 7.1 The Problem with Traditional CRM

Salesforce and HubSpot store contacts as isolated records disconnected from actual work context. Meeting notes live in one system, project deliverables in another, email threads in a third. The AI Second Brain collapses this fragmentation by embedding CRM directly into the knowledge graph.

### 7.2 Automated Ingestion & Entity Mapping

**Ingestion Pipeline:**
1. A background watcher (Python script, n8n workflow, or IFTTT) monitors:
   - Outlook / Gmail inboxes
   - Teams / Slack DMs
   - Whisper voice transcripts
2. Raw text is pushed to `/00_Inbox` with source metadata.
3. The morning heartbeat triggers Claude to parse the inbox.
4. The agent extracts:
   - Named entities (people, organizations)
   - Sentiment and intent
   - Commitments and action items
   - Dates and deadlines

**Entity Mapping:**
- When a new contact is detected, the agent auto-creates a note under `/04_People/` using a template.
- The note is populated with YAML frontmatter: `organization`, `role`, `first_contact_date`, `source_channel`.
- Bidirectional wikilinks are created to related project notes (`/02_Projects/`).

### 7.3 Relationship Momentum & Proactive Outreach

The CRM becomes predictive when the agent scans the `/04_People` directory and cross-references it with recent vault activity.

**Workflow:**
1. User triggers `/crm` command.
2. Agent scans all People notes and checks `last_contact_date`.
3. Agent cross-references with recent `/03_Resources` (new content, product updates).
4. Agent calculates **relationship momentum score** (recency of contact × relevance of new material).
5. Agent generates a prioritized list of the top 5 contacts worth re-engaging.
6. Agent drafts personalized outreach messages in the user's established voice and tone.
7. Drafts are saved to `/04_People/Contact-Name/drafts/` for human review before sending.

This answers not only "What did we discuss yesterday?" but also **"Who should I reach out to today, and with what value?"**

---

## 8. Proactive Heartbeat & Autonomous Execution

### 8.1 From Chatbot to Autonomous Agent

The critical leap from reactive assistant to proactive agent is the **Heartbeat Mechanism** — a cyclic daemon that wakes the agent at fixed intervals to perform deterministic work without human prompting.

### 8.2 Heartbeat Cycle

**Frequency:** Every 30 minutes (configurable via cron).  
**Trigger:** System cron or background Python daemon.

**Each heartbeat executes:**

1. **Context Aggregation:**
   - Read current timestamp.
   - Load today's daily note (`/01_Daily/YYYY-MM-DD.md`).
   - Check urgent todos and `#deadline-today` tags.
   - Poll external APIs: calendar, email, task manager.
   - Read recent meeting transcripts or voice notes.

2. **Inference & Decision:**
   - Feed aggregated context into Claude.
   - Agent reasons about what needs attention.
   - Generate action items, draft responses, or prepare briefings.

3. **Execution (Conditional):**
   - Low-risk actions (file classification, note linking, summary generation) execute automatically.
   - High-risk actions (sending emails, merging code, external API writes) queue for human approval.

### 8.3 Example: Meeting Briefing Automation

**Scenario:** A critical client meeting is scheduled in 10 minutes.

**Heartbeat Trigger:** Calendar API signals upcoming event.

**Agent Actions:**
1. Identify attendee list from calendar invite.
2. Pull all `/04_People` notes for attendees.
3. Extract open deliverables from linked `/02_Projects` notes.
4. Identify unresolved questions from recent `/AI/Sessions` logs.
5. Compile a single-page briefing document: `/AI/Sessions/BRIEF_YYYY-MM-DD_HH-MM.md`.
6. Push briefing to user's screen (via notification or MCP-connected display).

The user walks into the meeting with full context, zero preparation time.

### 8.4 IoT & Environment Integration

Via MCP or local API calls, the heartbeat can interact with the physical environment:
- **Home Assistant integration:** Dim lights when deep-work sessions are detected.
- **Calendar-aware lighting:** Change office color temperature based on upcoming meeting type.
- **Focus mode automation:** Mute notifications when the daily note indicates a `#deep-work` block.

---

## 9. Token Economics & Sub-Agent Routing

### 9.1 The Cost Problem

Running a large model (Claude 3.5 Sonnet/Opus) every 30 minutes to scan an entire vault is economically unsustainable. A naive implementation would consume hundreds of thousands of tokens daily.

### 9.2 The Dispatcher Architecture

To solve this, the system employs a **two-tier sub-agent routing** model inspired by cognitive science: a fast "reptilian brain" for routine tasks, and a slow "neocortex" for deep reasoning.

| Component | Model Tier | Role | Cost Profile |
|-----------|-----------|------|-------------|
| **Deep Thought** | Claude 3.5 Sonnet / Opus | Complex reasoning, cross-project synthesis, strategic planning | High, but infrequent |
| **Marvin** | Claude 3 Haiku / Fast local model | Inbox triage, routine classification, heartbeat polling, simple routing | Low, high frequency |

**Workflow:**
1. **Marvin** (Haiku) wakes every 30 minutes.
2. Marvin performs lightweight aggregation: calendar check, inbox scan, todo review.
3. Marvin classifies the complexity of required action.
4. If the task is routine (classify 3 inbox items, update daily log), Marvin executes directly.
5. If the task requires deep reasoning (cross-project analysis, strategic CRM outreach, complex drafting), Marvin **delegates** the context to Deep Thought (Sonnet/Opus).
6. Deep Thought processes the heavy task and returns output to Marvin for filing.

### 9.3 Cost Impact

By filtering 80-90% of routine tasks through the lightweight model, total token consumption drops by approximately **75%**. This makes a 24/7 autonomous agent economically viable for individual users.

---

## 10. Lessons Learned

### 10.1 Architecture & Setup

1. **Directory structure is not optional.**  
   Early iterations with flat note storage led to constant hallucination and context window exhaustion. Strict taxonomy (`/00_Inbox` → `/01_Daily` → `/02_Projects`) reduced agent error rates by an order of magnitude.

2. **CLAUDE.md must include negative constraints.**  
   Without explicit "DO NOT DELETE" rules, the agent occasionally reorganized by destructive methods. Defensive guardrails are more important than capability instructions.

3. **Cascading context is essential for multi-domain vaults.**  
   Mixing company IP with personal projects in a single context caused leakage and confusion. Per-directory `.claude.md` files solved this cleanly.

4. **MCP beats direct API for security.**  
   Direct file-system access scripts were fast but fragile. MCP provides standardized, auditable, and scoped access that is easier to debug and secure.

### 10.2 Memory & Evolution

5. **Raw logs without distillation are useless.**  
   Storing every conversation verbatim created noise. The Daily Reflection mechanism (Stage 2 of the promotion pipeline) is the critical step that separates signal from noise.

6. **User preferences must be explicit in procedural memory.**  
   Implicitly learned preferences (e.g., bullet vs. paragraph) were often forgotten across sessions until codified into `CLAUDE.md`.

7. **Vector search requires periodic re-embedding.**  
   As note contents evolve, stale embeddings return false associations. A weekly re-indexing job keeps semantic search accurate.

### 10.3 Automation & CRM

8. **Human-in-the-Loop is non-negotiable for external actions.**  
   Early experiments with auto-sending emails produced tone-deaf messages. All external communication must queue for approval.

9. **Entity extraction quality depends on template strictness.**  
   Loose YAML frontmatter schemas caused the agent to miss key fields. Enforcing mandatory fields (`last_contact_date`, `organization`) improved CRM consistency.

10. **Heartbeat frequency must be workload-aware.**  
    A 5-minute heartbeat during deep-work hours was distracting. Context-aware scheduling (longer intervals during `#deep-work`, shorter during `#admin`) improved UX.

### 10.4 Visualization & Graph

11. **Graph view is insightful only above a critical mass.**  
    Below ~100 interconnected notes, the graph is sparse and unmotivating. The system needs a "bootstrapping period" before topological insights emerge.

12. **Orphan nodes are a feature, not a bug.**  
    Initially, we tried to eliminate all orphans. They actually serve as "cognitive frontier markers" — signals of under-explored territory that guide future reading and research.

---

## 11. SWOT Analysis

### Strengths

| Strength | Detail |
|----------|--------|
| **Data Sovereignty** | Local Markdown storage eliminates vendor lock-in. The user owns every byte. |
| **Machine Readability** | Plain text + YAML frontmatter is natively parseable by any AI agent without proprietary connectors. |
| **Deterministic Topology** | Strict directory taxonomy transforms probabilistic LLM behavior into predictable, scoped reasoning. |
| **Cross-Session Continuity** | Four-tier memory architecture (Procedural → Working → Short-Term → Long-Term) enables genuine learning over time. |
| **Economic Viability** | Sub-agent routing (Haiku for routine, Opus for deep thought) reduces token costs by ~75%. |
| **Open Ecosystem** | Obsidian's plugin marketplace and the open MCP protocol allow unlimited extensibility. |
| **Privacy-First** | Sensitive CRM data and project notes never leave the local machine unless explicitly pushed. |

### Weaknesses

| Weakness | Detail |
|----------|--------|
| **Setup Complexity** | The system requires non-trivial initial configuration (CLAUDE.md, cron jobs, MCP servers, directory taxonomy). |
| **No Native Mobile Capture** | Obsidian's mobile experience, while functional, lacks the frictionless capture of apps like Notion or Apple Notes. |
| **Token Cost at Scale** | Even with sub-agent routing, very large vaults (10,000+ notes) may require paid API tiers for real-time operations. |
| **Graph Cold Start** | Below a critical mass of notes and links, the knowledge graph provides limited insight. |
| **Dependency on Claude Availability** | API outages or model deprecation can temporarily disable the reasoning layer. |
| **YAML Maintenance Burden** | Strict frontmatter discipline requires user diligence; inconsistent metadata degrades query accuracy. |

### Opportunities

| Opportunity | Detail |
|-------------|--------|
| **Team Vaults** | The architecture scales to shared team knowledge bases with per-user cascading context and role-based access. |
| **Plug-in Marketplace** | Custom skills (e.g., `/crm`, `/trace`, `/challenge`) can be packaged as reusable community plugins. |
| **Local Model Migration** | As local LLMs (Llama 3, Mistral) improve, the heavy reasoning layer can migrate entirely on-device, eliminating API costs. |
| **Voice-First Interface** | Integrating Whisper for frictionless voice capture into `/00_Inbox` removes the typing bottleneck entirely. |
| **Enterprise Compliance** | Local-first, audit-logged AI sessions appeal to industries with strict data residency (finance, healthcare, legal). |
| **Bi-Directional Sync** | Syncing with external systems (GitHub Issues, Jira, Notion) via MCP creates a universal knowledge hub. |

### Threats

| Threat | Detail |
|--------|--------|
| **Vendor API Changes** | Anthropic API pricing, rate limits, or model deprecation could disrupt workflows. |
| **Obsidian Commercialization** | If Obsidian pivots to cloud-first or subscription-only, the local-first premise is compromised. |
| **Vault Corruption** | Local filesystems are vulnerable to user error, sync conflicts, or ransomware. Robust Git backup is mandatory. |
| **Prompt Injection via Inbox** | Malicious content in captured emails/web pages could theoretically manipulate agent behavior during inbox processing. |
| **Context Window Limits** | As vaults grow, even scoped context loading may exceed token limits, requiring aggressive summarization or chunking. |
| **Over-Automation Risk** | Excessive delegation to the agent may degrade human metacognitive skills ("use it or lose it" effect). |

---

## 12. Implementation Roadmap

### Phase 1: Foundation (Week 1)

- [ ] Install Obsidian and create vault at `~/second-brain/vault`.
- [ ] Establish strict directory taxonomy (`/00_Inbox`, `/01_Daily`, `/02_Projects`, `/03_Resources`, `/04_People`, `/AI/Sessions`, `/Templates`, `/_archive`).
- [ ] Write global `CLAUDE.md` with identity, topology guide, syntax rules, session protocols, and negative constraints.
- [ ] Create YAML-frontmatter templates for: Daily, Project, Person, Resource, Session.
- [ ] Install Claude Code CLI and authenticate.
- [ ] Configure MCP server for local vault access with scoped permissions.

**Success Criteria:** Agent can read vault structure, parse frontmatter, and write session logs without error.

### Phase 2: Ingestion & Classification (Week 2)

- [ ] Implement inbox watcher script (Python/Node) to monitor a drop folder or email webhook.
- [ ] Build daily heartbeat script (`daily_heartbeat.sh`) that:
  - Scans `/00_Inbox`.
  - Classifies items by content heuristic.
  - Routes to appropriate directory.
  - Extracts summary and action items.
- [ ] Schedule heartbeat via cron (e.g., 9:00 AM daily).
- [ ] Install and configure Smart Connections (or local embedding script) for semantic search.

**Success Criteria:** Dropping a raw text file into `/00_Inbox` results in classified, linked, and summarized output within one heartbeat cycle.

### Phase 3: Memory Evolution (Week 3)

- [ ] Implement session capture: all CLI interactions logged to `/AI/Sessions/RAW_YYYY-MM-DD.md`.
- [ ] Build Daily Reflection prompt that analyzes raw logs and extracts key decisions, lessons, and preferences.
- [ ] Create `AI/memory.md` with structured sections for: Facts, Preferences, Lessons, Axioms.
- [ ] Automate reflection via cron (e.g., 11:00 PM daily).
- [ ] Verify that promoted memories are retrievable in subsequent sessions.

**Success Criteria:** After 3 days of usage, `AI/memory.md` contains non-trivial distilled insights that the agent references unprompted.

### Phase 4: CRM & Outreach (Week 4)

- [ ] Populate `/04_People` with seed contacts using the Person template.
- [ ] Build `/crm` skill command that:
  - Scans People notes.
  - Calculates relationship momentum.
  - Identifies top 5 outreach candidates.
  - Generates draft messages.
- [ ] Implement human-in-the-loop approval queue for drafts.
- [ ] Link CRM notes to relevant Project and Resource notes via wikilinks.

**Success Criteria:** Triggering `/crm` produces actionable, personalized outreach drafts with zero manual data entry.

### Phase 5: Proactive Heartbeat & Optimization (Week 5-6)

- [ ] Increase heartbeat frequency to every 30 minutes.
- [ ] Integrate calendar and email polling into heartbeat context.
- [ ] Build meeting briefing automation (see Section 8.3).
- [ ] Implement sub-agent routing: lightweight model for triage, heavy model for reasoning.
- [ ] Measure and optimize token consumption.
- [ ] Add context-aware heartbeat scheduling (slower during deep-work blocks).

**Success Criteria:** Agent proactively delivers a meeting briefing 10 minutes before a calendar event without user prompting.

### Phase 6: Advanced Visualization & Analytics (Ongoing)

- [ ] Enable and customize Obsidian Graph View for aesthetic and functional clarity.
- [ ] Install InfraNodus (or similar) for topological gap analysis.
- [ ] Define custom CSS for graph node coloring by directory (e.g., Projects = blue, People = green).
- [ ] Weekly ritual: review graph clusters and structural gaps to guide learning priorities.

**Success Criteria:** Graph view reveals at least one unexpected cross-domain insight per week.

---

## 13. Conclusion

The AI Second Brain represents a fundamental shift from static information storage to autonomous cognitive ecosystems. By treating Obsidian as a deterministic knowledge graph substrate and Claude as a reasoning engine with full filesystem agency, the architecture achieves something no traditional PKM can: **self-organization**.

### What Makes This Different

| Traditional PKM | AI Second Brain |
|----------------|-----------------|
| Passive container | Active inference engine |
| Manual tagging | Automated semantic classification |
| Isolated folders | Networked topological associations |
| Static notes | Evolving memory with preference learning |
| Reactive search | Proactive briefing and task execution |
| Human-maintained CRM | Predictive relationship engine |

### The Core Thesis

> The second brain is not a database. It is an operating system for thought — one that converts the chaos of daily information entropy into structured, actionable, and ever-improving deterministic output.

Through rigorous directory taxonomy, procedural memory constitutions (`CLAUDE.md`), daily reflection protocols, and heartbeat-driven automation, the system demonstrates that LLMs need not be transient chat interfaces. They can be persistent, learning, autonomous agents that genuinely augment human cognition.

### Final Design Principles

1. **Local-first is freedom.** Markdown on disk is the only truly portable, future-proof format.
2. **Structure unlocks intelligence.** LLMs are only as good as the topology they navigate.
3. **Memory must evolve.** Raw logs are worthless without distillation and promotion.
4. **Autonomy requires guardrails.** Negative constraints in procedural memory prevent catastrophic agent behavior.
5. **Cost scales with architecture.** Sub-agent routing makes 24/7 operation economically viable.
6. **Visualization guides strategy.** The graph is not decoration; it is a cognitive planning interface.

---

*End of Documentation*
