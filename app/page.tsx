export default function Home() {
  return (
    <main className="min-h-screen p-8">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-4xl font-bold mb-4">
          Develom AI Development Framework
        </h1>
        <p className="text-lg text-gray-600 mb-8">
          Developer Workbench - Phase 1
        </p>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Workflow Orchestration</h2>
            <p className="text-gray-600">Submit and track multi-agent workflows</p>
          </div>
          
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Prompt Inspection</h2>
            <p className="text-gray-600">View layered prompt composition</p>
          </div>
          
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Graph-RAG Context</h2>
            <p className="text-gray-600">Explore knowledge base retrieval</p>
          </div>
          
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Security Gateway</h2>
            <p className="text-gray-600">Review policy decisions</p>
          </div>
          
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Artifacts Review</h2>
            <p className="text-gray-600">Examine generated code and tests</p>
          </div>
          
          <div className="p-6 border rounded-lg">
            <h2 className="text-xl font-semibold mb-2">Delivery Tracking</h2>
            <p className="text-gray-600">Monitor execution progress</p>
          </div>
        </div>
      </div>
    </main>
  )
}
