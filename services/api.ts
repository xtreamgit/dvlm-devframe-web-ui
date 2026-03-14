const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000'

export const api = {
  async getProjects() {
    const response = await fetch(`${API_BASE_URL}/projects`)
    return response.json()
  },

  async getTasks(projectId: string) {
    const response = await fetch(`${API_BASE_URL}/projects/${projectId}/tasks`)
    return response.json()
  },

  async getWorkflows() {
    const response = await fetch(`${API_BASE_URL}/workflows`)
    return response.json()
  },

  async getArtifacts(taskId: string) {
    const response = await fetch(`${API_BASE_URL}/tasks/${taskId}/artifacts`)
    return response.json()
  },
}
