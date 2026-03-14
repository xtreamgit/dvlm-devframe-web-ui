export interface Project {
  id: string
  name: string
  description: string
  createdAt: string
}

export interface Task {
  id: string
  projectId: string
  type: string
  status: string
  createdAt: string
}

export interface Workflow {
  id: string
  taskId: string
  agents: Agent[]
  status: string
}

export interface Agent {
  name: string
  role: string
  status: string
}

export interface PromptLayer {
  type: 'role' | 'platform' | 'architecture' | 'governance'
  content: string
}

export interface GraphRAGContext {
  documents: string[]
  embeddings: number[][]
  metadata: Record<string, unknown>
}
