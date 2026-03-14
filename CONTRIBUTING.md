# Contributing to dvlm-devframe-web-ui

Thank you for your interest in contributing to the Develom AI Development Framework Web UI!

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/dvlm-devframe-web-ui.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests and linting
6. Commit your changes following our commit message conventions
7. Push to your fork
8. Submit a Pull Request

## Development Workflow

### Branch Strategy

- `main` - Production-ready code
- `develop` - Integration branch for features
- `feature/*` - Feature branches
- `bugfix/*` - Bug fix branches
- `hotfix/*` - Emergency fixes for production

### Setting Up Your Development Environment

```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Run linting
npm run lint

# Build for production
npm run build
```

## Code Standards

### TypeScript

- Use TypeScript for all new files
- Ensure proper typing (avoid `any` where possible)
- Use interfaces for component props
- Follow existing code structure

### React Components

- Use functional components with hooks
- Keep components small and focused
- Extract reusable logic into custom hooks
- Place components in the `/components` directory

### Styling

- Use Tailwind CSS utility classes
- Follow mobile-first responsive design
- Maintain consistent spacing and colors
- Reference the design system

### File Organization

```
app/          - Next.js app directory
components/   - Reusable React components
services/     - API and external service integration
hooks/        - Custom React hooks
lib/          - Utility functions and helpers
types/        - TypeScript type definitions
styles/       - Global styles and Tailwind config
public/       - Static assets
```

## Commit Message Format

Follow the Conventional Commits specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Example

```
feat(components): add prompt inspection panel

Implement new component for displaying layered prompt composition
including role, platform, architecture, and governance layers.

Closes #123
```

## Pull Request Process

1. Update documentation for any user-facing changes
2. Ensure all tests pass
3. Update CHANGELOG.md with your changes
4. Request review from at least one maintainer
5. Address review feedback
6. Squash commits if requested

## Testing Guidelines

- Write unit tests for utility functions
- Write component tests for React components
- Ensure adequate test coverage
- Mock external dependencies

## Code Review

- Be respectful and constructive
- Focus on code quality and maintainability
- Consider security implications
- Verify adherence to platform standards

## Questions?

Contact the platform team or open an issue for discussion.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
