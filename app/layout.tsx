import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Develom AI Development Framework',
  description: 'Developer workbench for AI-assisted software delivery',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
