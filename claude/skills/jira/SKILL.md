---
name: jira
description: Interacts with Jira tickets via CLI wrapper. Views issue details, adds comments, transitions status, assigns users, creates issues, edits fields, and links tickets. Use when user mentions Jira ticket IDs (KOOPA-123), asks about ticket status, wants to post updates, or manage issues.
allowed-tools: Bash
user-invocable: false
disable-model-invocation: false
---

# Jira CLI

---

## View Issue

```bash
jira issue view KOOPA-123
jira issue view KOOPA-123 --comments 5
jira issue view KOOPA-123 --plain
```

## List Issues

```bash
jira issue list -p KOOPA
jira issue list -p KOOPA -t"In Progress"
jira issue list -p KOOPA -a$(jira me)
```

## Add Comment

```bash
# One-line
jira issue comment add KOOPA-123 "Comment text"

# Multi-line (recommended)
echo 'h3. Status Update

*Summary*: Work completed

*Next Steps*:
• Item one
• Item two' | jira issue comment add KOOPA-123
```

## Transition Issue

```bash
jira issue move KOOPA-123 "To Do"
jira issue move KOOPA-123 "In Progress"
jira issue move KOOPA-123 "Review"
jira issue move KOOPA-123 "Resolved"
jira issue move KOOPA-123 "Blocked"
```

**KOOPA States:** Intake → Backlog → Refined → To Do → In Progress → Review → Testing → Ready to Ship → Shipping → Resolved

## Assign Issue

```bash
jira issue assign KOOPA-123 $(jira me)
```

## Create Issue

```bash
jira issue create -p KOOPA -tBug -s"Bug summary" --no-input
jira issue create -p KOOPA -tTask -s"Task title" -b"Description" --no-input
jira issue create -p KOOPA -tStory -s"Story title" -yHigh --no-input
```

**Flags:** `-t` type, `-s` summary, `-y` priority, `-l` label, `-b` body, `-p` project, `--no-input`

## Edit Issue

```bash
jira issue edit KOOPA-123 -s"New Summary" --no-input
jira issue edit KOOPA-123 -yHigh --no-input
jira issue edit KOOPA-456 --parent KOOPA-123 --no-input
```

## Link Issues

```bash
jira issue link KOOPA-456 KOOPA-123 "Blocks"
```

**Types:** Blocks, is blocked by, Relates to, Clones, Duplicate

## Epic Management

```bash
jira epic list -p KOOPA
jira epic create -n"Epic Name" -s"Summary" --no-input
```

---

## Rules

1. **Never WebFetch**: Do not use WebFetch for zendesk.atlassian.net URLs
2. **Use `--no-input`**: For non-interactive commands
3. **Comments**: Use `issue comment add` (no `-b` flag)
4. **Exact state names**: Case-sensitive
5. **Preview first**: Show user before posting

---

## Wiki Markup

| Syntax | Purpose |
|--------|---------|
| `h3.` | Heading |
| `*text*` | Bold |
| `•` | Bullet |
| `----` | Rule |

---

