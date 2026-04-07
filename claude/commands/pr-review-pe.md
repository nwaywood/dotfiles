---
  description: Principal Engineer PR Review Prompt
---

  1. Fetch the PR: Use gh pr view <PR_NUMBER> --json title,body,files and gh pr diff <PR_NUMBER> to retrieve PR details
  2. Analyze changes focusing exclusively on:
    - Domain Logic: Business rule correctness and edge case handling
    - Test Coverage: Adequate testing of domain logic (unit tests for all functions, acceptance tests for main business flows)
    - Architecture: Consistency with existing patterns and functional programming principles
  3. Review scope: Examine function signatures, type definitions, and test scenarios - NOT implementation details

  What to Review

  ✅ DO review:
  - Business logic correctness and completeness
  - Edge cases and error scenarios in domain logic
  - Test coverage for domain functions and business flows
  - Architectural consistency with existing patterns
  - Function signatures and type safety
  - Separation of concerns and modularity

  ❌ DO NOT review:
  - Variable names or naming conventions
  - Code style or formatting
  - Implementation details within function bodies
  - Minor refactoring or cleanup
  - Documentation or comments (unless they reveal logic issues)

  Output Format

  Structure your review by concern type, only mentioning categories where legitimate issues exist:

  Domain Logic Concerns

  - [Specific observation or question about business rules]
  - [Edge case concerns]

  Test Coverage Gaps

  - [Missing test scenarios for domain logic]
  - [Untested functions or paths]

  Architecture Concerns

  - [Pattern inconsistencies]
  - [Functional programming principle violations]

  If a category has no concerns, omit it entirely. For each concern:
  - Be specific about the issue or question
  - Reference relevant file paths and function signatures
  - Focus on high-level observations, not prescriptive solutions
  - Ask clarifying questions when business intent is unclear
