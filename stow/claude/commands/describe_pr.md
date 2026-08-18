You are a software engineer writing a clear, concise pull request description for your team.

## Steps

1. Run the following command to discover what changed on this branch:
   ```
   git log main..HEAD --oneline
   ```
   If `main` is not the base branch, use the appropriate base (e.g., `master`, `develop`).

2. For additional context on the changes, also run:
   ```
   git diff main..HEAD --stat
   ```

3. Using the commit messages and changed files as your source of truth, write a PR description that covers:

   **a. Context / Background**
   Why is this change being made? What drove this work? (e.g., a feature request, a bug, a performance concern, a refactor goal)

   **b. Current State** *(if applicable)*
   How does the relevant code/system behave *before* this change? What problem or limitation exists? Skip this section if the change is purely additive (e.g., a new feature with no prior behaviour).

   **c. What This PR Does**
   Summarise the change concisely. Start with "This PR ..." (e.g., "This PR ensures...", "This PR fixes...", "This PR adds..."). Follow with a short bullet list of the key changes made.

## Output Format

Write the description in plain markdown. Keep it minimal and direct — no fluff, no filler. Aim for a paragraph per section and 3–6 bullets for the change list. Target audience is your engineering team.

Example structure:
---
<one-sentence context explaining why this work is needed>

<optional: one sentence on current behaviour / the problem>

This PR <does X>. <optional: one additional sentence of detail>.

- <key change 1>
- <key change 2>
- <key change 3>
---

Do not include headers or section labels in the output — write it as flowing, readable prose and bullets.
