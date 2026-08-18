---
name: confluence
description: Interacts with Confluence pages via CLI wrapper. Views page content, searches with CQL, creates pages, updates content, manages labels and comments. Use when user mentions Confluence page IDs, page URLs, asks about documentation pages, or wants to manage wiki content.
allowed-tools: Bash
user-invocable: false
disable-model-invocation: false
---

# Confluence CLI

---

## Get Page

```bash
# By ID
atlas --type confluence --action getPage --id "123456789"

# By space and title
atlas --type confluence --action getPage --space "KOOPA" --title "Page Title"
```

## Search

```bash
# By title
atlas --type confluence --action search --cql 'title~"keyword"' --limit 10

# In specific space
atlas --type confluence --action search --cql 'space="KOOPA" AND title~"guide"' --limit 10

# Your pages
atlas --type confluence --action search --cql 'creator=currentUser()' --limit 20
```

## Search Users

```bash
atlas --type confluence --action searchUsers \
  --cql 'user.fullname~"john"' --limit 10
```

Output: `Account ID | Display Name | Email | Account Type`

## List Pages

```bash
atlas --type confluence --action listPages --space "KOOPA"
```

## Create Page

```bash
atlas --type confluence --action createPage \
  --space "KOOPA" \
  --title "New Page" \
  --body "<p>Content here</p>" \
  --parent "@home"
```

## Update Page

```bash
# Find and replace (body content only)
atlas --type confluence --action updatePage \
  --id "123456789" \
  --find "old text" \
  --replace "new text"

# Set entire body
atlas --type confluence --action setPageBody \
  --id "123456789" \
  --body "<p>New content</p>"

# Set body AND rename title
atlas --type confluence --action setPageBody \
  --id "123456789" \
  --title "New Page Title" \
  --body "<p>New content</p>"
```

**Note:** `--title` requires `--body`. To rename only, fetch existing body first.

## Labels & Comments

```bash
# Add labels
atlas --type confluence --action addLabel \
  --id "123456789" \
  --labels "tag1,tag2"

# Add comment
atlas --type confluence --action addComment \
  --id "123456789" \
  --body "Comment text"
```

## Attachments

```bash
# Upload attachment
atlas --type confluence --action addAttach \
  --id "123456789" \
  --file "/path/to/file.pdf"

# Download all attachments
atlas --type confluence --action downloadAttachments \
  --id "123456789"
```

## Archive Page

```bash
atlas --type confluence --action archivePage --id "123456789"
```

---

## CQL Quick Reference

| Field | Example |
|-------|---------|
| `title` | `title~"keyword"` or `title="Exact"` |
| `space` | `space="KOOPA"` |
| `creator` | `creator=currentUser()` |
| `label` | `label="documentation"` |
| `lastModified` | `lastModified > now("-7d")` |
| `user.fullname` | `user.fullname~"john"` (searchUsers only) |

**Operators:** `=` exact, `~` contains, `AND`, `OR`, `NOT`

---

## Output Format

All commands output a status prefix on first line: `SUCCESS:`, `FAILED:`, or `WARNING:`

```
SUCCESS: Retrieved page
  ID: 123456789
  Title: My Page
  Version: 5
  Labels: doc, guide
```

---

## Rules

1. **Never WebFetch**: Do not use WebFetch for zendesk.atlassian.net/wiki URLs
2. **Page ID from URL**: Extract ID from `?pageId=123456` or `/pages/123456/`
3. **HTML body format**: Use `<p>`, `<h1>`, etc. for content
4. **Use @home for root**: `--parent "@home"` creates page at space root
5. **Preview first**: Show user before creating/updating pages
6. **Parse output prefix**: Check first line for SUCCESS/FAILED/WARNING before parsing fields

---

