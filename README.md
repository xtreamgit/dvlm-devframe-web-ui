# dvlm-devframe-web-ui

Develom AI Development Framework (DADF) Web UI

This repository contains the Web UI for the **Develom AI Development Framework**, a governed AI-assisted software delivery platform that combines:

- **Agentic Prompt Stack**
- **Secure AI Gateway**
- **Graph-RAG developer knowledge base**
- **Google ADK multi-agent orchestration**

The Web UI acts as the developer workbench for submitting software tasks, reviewing generated plans, visualizing prompt context, inspecting security and policy decisions, and tracking generated outputs across the software delivery lifecycle.

---

## Purpose

The purpose of this application is to provide a central interface where developers, architects, and product teams can interact with Develom’s AI development platform in a controlled, secure, and auditable way.

Through this UI, users can:

- submit development requests for new features, modules, and services
- select project, module, environment, and task type
- trigger multi-agent workflows
- inspect how prompts were prepared
- review retrieved Graph-RAG context
- view Secure AI Gateway validation results
- examine generated code plans and artifacts
- review tests, risks, and deployment notes
- track execution progress and outcomes

This repository focuses on the **frontend application layer** of the platform.

---

## Platform Capabilities

The Web UI is designed to support the following platform functions:

### 1. Developer Workbench
A central workspace for interacting with Develom’s AI development framework.

### 2. Prompt Visibility
Shows how agent-ready prompts are assembled from layered instructions, retrieved context, module definitions, and governance rules.

### 3. Workflow Orchestration View
Displays task flow across planner, architect, backend, frontend, infra, security, QA, and release agents.

### 4. Security and Governance Transparency
Presents policy decisions enforced by the Secure AI Gateway, including data screening, approval requirements, and execution controls.

### 5. Graph-RAG Context Inspection
Allows users to review the project memory and architecture knowledge used to ground the agent workflows.

### 6. Delivery Review
Provides visibility into generated code, file diffs, tests, findings, and release notes before downstream execution.

---

## Suggested Technology Stack

This Web UI is intended to be built with a modern cloud-native frontend stack such as:

- **Next.js**
- **TypeScript**
- **Tailwind CSS**
- **React**
- optional component libraries such as **shadcn/ui**

Recommended backend integration targets include:

- Develom orchestration API
- Secure AI Gateway API
- Graph-RAG retrieval service
- Google ADK multi-agent services
- GitHub integration services

---

## Recommended Repository Structure

```text
web-ui-dadf/
├── app/
├── components/
├── lib/
├── services/
├── public/
├── styles/
├── types/
├── hooks/
├── .env.local
├── package.json
├── tsconfig.json
└── README.md


# GitHub Organization Structure 
## Phase 1: Completed
## Phase 2: Future
## Phase 3: Future

For credibility, the Develom GitHub organization is structured around **platform capabilities**, not just code type.  
This approach makes the platform look intentional, productized, and enterprise-ready.

---

# Design Principles

This repository structure communicates:

- clear product boundaries
- modular platform engineering
- secure-by-design architecture
- AI-native development methodology
- room for future commercial packaging

The organization is divided into **six architectural domains**:

1. Experience Layer  
2. Control Plane  
3. Agentic Prompt Stack  
4. Knowledge / Graph-RAG  
5. Platform Operations  
6. Governance / Standards  

---

# Recommended Develom GitHub Organization Structure

## 1) Experience Layer

### `dvlm-devframe-web-ui`

**Purpose:** Main developer workbench UI for the platform.  

**Contains:**
- dashboards
- task intake
- prompt inspection
- workflow status
- artifact review
- security findings
- Graph-RAG context viewer

**Why it matters:**  
This becomes the visible face of the platform.

---

### `dvlm-devframe-api`

**Purpose:** Public-facing backend API for the Web UI and external integrations.

**Contains:**
- session APIs
- project/task APIs
- workflow submission
- artifact retrieval
- authentication integration endpoints

**Why it matters:**  
Separates frontend concerns from orchestration internals.

---

# 2) Control Plane

### `dvlm-devframe-gateway`

**Purpose:** Secure AI Gateway.

**Contains:**
- prompt filtering
- input/output policies
- model routing
- redaction rules
- tenant controls
- tool access enforcement
- Model Armor integration points

**Why it matters:**  
This is one of Develom’s most important differentiators.

---

### `dvlm-devframe-orchestrator`

**Purpose:** Central workflow controller for all AI development tasks.

**Contains:**
- task decomposition
- state tracking
- agent dispatch
- retries
- approval checkpoints
- workflow execution logic

**Why it matters:**  
This is the operational brain of the platform.

---

### `dvlm-devframe-executor`

**Purpose:** Controlled execution service for repo edits, test runs, code generation jobs, and automation tasks.

**Contains:**
- file-edit actions
- command sandboxing
- Git operations
- artifact creation
- execution adapters

**Why it matters:**  
Keeps orchestration separate from action execution.

---

# 3) Agentic Prompt Stack

### `dvlm-devframe-prompts`

**Purpose:** Core prompt repository for layered prompts, templates, patterns, and reusable agent instructions.

**Contains:**
- role layers
- platform layers
- architecture layers
- governance layers
- module prompts
- task prompts

**Why it matters:**  
This is the backbone of the **Prompt Architecture**.

---

### `dvlm-devframe-agents`

**Purpose:** Google ADK agent definitions and multi-agent workflow implementations.

**Contains:**
- planner agent
- architect agent
- backend agent
- frontend agent
- infra agent
- security agent
- QA agent
- release agent

**Why it matters:**  
This is where the actual agent specializations live.

---

### `dvlm-devframe-packets`

**Purpose:** Prompt packet schemas, request contracts, agent payload structures, and output format standards.

**Contains:**
- YAML/JSON schemas
- packet builders
- validation rules
- output contracts
- module/task metadata standards

**Why it matters:**  
Standardized prompt packets are a strong indicator of platform maturity.

---

# 4) Knowledge / Graph-RAG Layer

### `dvlm-devframe-graphrag`

**Purpose:** Graph-RAG knowledge services for development memory and retrieval grounding.

**Contains:**
- ingestion pipelines
- vector indexing
- graph relationships
- retrieval services
- context ranking

**Why it matters:**  
This gives the framework persistent engineering memory.

---

### `dvlm-devframe-corpus`

**Purpose:** Curated framework knowledge base and source documents.

**Contains:**
- architecture standards
- ADRs (Architecture Decision Records)
- security standards
- coding conventions
- platform patterns
- reusable implementation knowledge

**Why it matters:**  
Keeps knowledge assets versioned separately from retrieval engine code.

---

### `dvlm-devframe-evals`

**Purpose:** Evaluation suites for prompt quality, grounding quality, code quality, workflow outcomes, and agent performance.

**Contains:**
- benchmark tasks
- regression datasets
- hallucination checks
- prompt tests
- workflow scoring

**Why it matters:**  
Serious AI engineering platforms require measurable evaluation.

---

# 5) Platform Operations

### `dvlm-devframe-infra`

**Purpose:** Terraform and Infrastructure-as-Code for the platform.

**Contains:**
- Cloud Run
- networking
- IAM
- Artifact Registry
- Secret Manager
- storage
- service accounts
- monitoring resources

**Why it matters:**  
Essential for repeatable deployment and enterprise credibility.

---

### `dvlm-devframe-deploy`

**Purpose:** CI/CD, release automation, environment promotion, and operational scripts.

**Contains:**
- GitHub Actions
- Cloud Build configs
- deployment workflows
- release scripts
- rollback procedures

**Why it matters:**  
Keeps infrastructure definition separate from release mechanics.

---

### `dvlm-devframe-obs`

**Purpose:** Observability, audit, telemetry, and operational dashboards.

**Contains:**
- logging standards
- metrics pipelines
- tracing configuration
- audit event schemas
- alerting patterns
- dashboards

**Why it matters:**  
Provides visibility into agent behavior and governance.

---

# 6) Governance / Standards

### `dvlm-devframe-standards`

**Purpose:** Formal engineering, security, compliance, naming, architecture, and documentation standards for the platform.

**Contains:**
- repository naming standards
- prompt engineering standards
- secure coding rules
- AI policy mappings
- review procedures
- contribution guidelines

**Why it matters:**  
This makes the organization disciplined and enterprise-ready.

---

# Best-Practice Role of Each Repository

| Repository | Function | Primary Audience |
|-------------|----------|------------------|
| `dvlm-devframe-web-ui` | Developer workbench | frontend, product, users |
| `dvlm-devframe-api` | UI/API access layer | backend, integrations |
| `dvlm-devframe-gateway` | Secure AI Gateway | security, platform |
| `dvlm-devframe-orchestrator` | Workflow brain | platform, AI engineers |
| `dvlm-devframe-executor` | Controlled action runner | platform, DevOps |
| `dvlm-devframe-prompts` | Prompt architecture | AI engineers, architects |
| `dvlm-devframe-agents` | ADK agents | AI engineers |
| `dvlm-devframe-packets` | Prompt packet contracts | platform, agents |
| `dvlm-devframe-graphrag` | Knowledge retrieval engine | AI/ML, backend |
| `dvlm-devframe-corpus` | Knowledge assets | architects, standards owners |
| `dvlm-devframe-evals` | Quality and regression evaluation | AI/ML, QA |
| `dvlm-devframe-infra` | Terraform / IaC | cloud/platform engineers |
| `dvlm-devframe-deploy` | CI/CD and releases | DevOps/platform |
| `dvlm-devframe-obs` | Telemetry and audits | SRE, security, compliance |
| `dvlm-devframe-standards` | Governance and standards | leadership, architecture, compliance |

---

# Recommended Repository Grouping

## Core Product

- `dvlm-devframe-web-ui`
- `dvlm-devframe-api`
- `dvlm-devframe-gateway`
- `dvlm-devframe-orchestrator`

## AI Engineering

- `dvlm-devframe-prompts`
- `dvlm-devframe-agents`
- `dvlm-devframe-packets`
- `dvlm-devframe-evals`

## Knowledge Layer

- `dvlm-devframe-graphrag`
- `dvlm-devframe-corpus`

## Platform Engineering

- `dvlm-devframe-infra`
- `dvlm-devframe-deploy`
- `dvlm-devframe-obs`

## Governance

- `dvlm-devframe-standards`

## Runtime / Execution

- `dvlm-devframe-executor`

This grouping helps the organization appear like a **cohesive platform**, not a random collection of repositories.

---

# Architecture Mapping

## Agentic Prompt Stack

Supported by:

- `dvlm-devframe-prompts`
- `dvlm-devframe-agents`
- `dvlm-devframe-packets`
- `dvlm-devframe-evals`

---

## Secure AI Gateway

Supported by:

- `dvlm-devframe-gateway`
- `dvlm-devframe-obs`
- `dvlm-devframe-standards`

---

## Graph-RAG Developer Knowledge Base

Supported by:

- `dvlm-devframe-graphrag`
- `dvlm-devframe-corpus`

---

## Google ADK Multi-Agent Orchestration

Supported by:

- `dvlm-devframe-agents`
- `dvlm-devframe-orchestrator`
- `dvlm-devframe-executor`

---

## Cloud-Native Operational Backbone

Supported by:

- `dvlm-devframe-api`
- `dvlm-devframe-infra`
- `dvlm-devframe-deploy`
- `dvlm-devframe-obs`

---

# Recommended Order of Creation

Instead of creating all repositories at once, use a phased rollout.

## Phase 1 — Foundation

Create first:

1. `dvlm-devframe-web-ui`
2. `dvlm-devframe-api`
3. `dvlm-devframe-prompts`
4. `dvlm-devframe-agents`
5. `dvlm-devframe-infra`
6. `dvlm-devframe-standards`

---

## Phase 2 — Platform Control

Then add:

7. `dvlm-devframe-gateway`
8. `dvlm-devframe-orchestrator`
9. `dvlm-devframe-executor`
10. `dvlm-devframe-deploy`

---

## Phase 3 — Intelligence and Maturity

Then add:

11. `dvlm-devframe-graphrag`
12. `dvlm-devframe-corpus`
13. `dvlm-devframe-evals`
14. `dvlm-devframe-obs`
15. `dvlm-devframe-packets`

---

# Naming Observations

These repository names are intentionally:

- consistent
- product-branded
- enterprise-friendly
- easy to scan in GitHub
- aligned to platform boundaries

They also avoid weak names such as:

- `misc`
- `backend2`
- `playground`
- `test-repo`
- dated repository names

Maintaining naming discipline significantly improves **client confidence and platform credibility**.

---

# Flagship Repositories (Recommended Pinned Repos)

To immediately present the platform story, the top pinned repositories should be:

1. `dvlm-devframe-web-ui`
2. `dvlm-devframe-gateway`
3. `dvlm-devframe-orchestrator`
4. `dvlm-devframe-agents`
5. `dvlm-devframe-graphrag`
6. `dvlm-devframe-infra`

These repositories communicate the **core architecture of the Develom platform at a glance**.

---

# Final Recommended 15-Repository Structure

```text
dvlm-devframe-web-ui
dvlm-devframe-api
dvlm-devframe-gateway
dvlm-devframe-orchestrator
dvlm-devframe-executor
dvlm-devframe-prompts
dvlm-devframe-agents
dvlm-devframe-packets
dvlm-devframe-graphrag
dvlm-devframe-corpus
dvlm-devframe-evals
dvlm-devframe-infra
dvlm-devframe-deploy
dvlm-devframe-obs
dvlm-devframe-standards