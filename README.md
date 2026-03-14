# web-ui-dadf

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