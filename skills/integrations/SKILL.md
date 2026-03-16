---
name: integrations-engine
description: >
  Optional plugin detection and integration layer. Silently detects compatible
  claude-scientific-writer plugins at session start and routes to them when available,
  falling back to built-in capabilities when absent. No integration is ever required.
  Trigger phrases include: "check integrations", "list plugins", "detect plugins",
  "integration status", "what plugins are available".
version: 1.0.0
triggers:
  - check integrations
  - list plugins
  - detect plugins
  - integration status
---

# Integrations Engine

This skill manages detection and integration with optional external plugins from
the `claude-scientific-writer` ecosystem. All integrations are optional — the
scientific-paper-writer plugin is fully functional without any external plugins.

---

## 1. Design Principles

### Never Required

No external plugin is required for any feature. Every capability has a built-in
fallback. If a plugin is absent, the built-in path activates silently.

### Silent Detection

Plugin detection happens automatically on first command invocation. The user is
never prompted to install plugins. Detection results are cached for the session.

### No Hard Coupling

This plugin never imports, requires, or depends on external plugin code. It only
checks for the presence of plugin SKILL.md files and uses their advertised
capabilities if found.

### User Override

The user can explicitly disable integrations via PAPER_CONTEXT.md:
```yaml
Integrations: none
```
or selectively enable/disable specific integrations:
```yaml
Integrations:
  research-lookup: enabled
  scientific-schematics: disabled
```

---

## 2. Detection Mechanism

On first command invocation, the integrations engine runs the following sequence:

### Step 1 — Check PAPER_CONTEXT.md

Read PAPER_CONTEXT.md (if it exists) and check the `Integrations` field:

- If `Integrations: none` → skip all detection, use built-in fallbacks for everything
- If `Integrations` lists specific skills → only detect those
- If `Integrations` is absent or empty → proceed to full detection

### Step 2 — Scan for Plugin Files

Use `Glob` to search for installed plugin skills:

```
Pattern: ~/.claude/plugins/cache/claude-plugins-official/claude-scientific-writer/*/skills/*/SKILL.md
```

This pattern matches the standard Claude plugin cache directory structure where
official plugins are stored.

### Step 3 — Parse Detected Skills

For each matched SKILL.md file:
1. Extract the directory name (skill name) from the file path
2. Read the frontmatter to get `name`, `description`, `version`, and `triggers`
3. Record the skill as available

### Step 4 — Cache Results

Store the detection results in memory for the current session. Detection is not
re-run unless the user explicitly requests it (e.g., "check integrations").

---

## 3. Integration Routing

When a writing command is invoked, the integrations engine checks whether a
detected plugin can enhance the operation. The routing logic is:

1. Determine which built-in skill is handling the command
2. Check the integration map (see `references/detected-plugins.md`) for applicable plugins
3. If a matching plugin is detected and not disabled:
   - Route the sub-task to the external plugin
   - Validate the result before incorporating it
4. If no matching plugin is detected:
   - Use the built-in fallback silently
   - No warning or notification to the user

### Validation of External Results

Results from external plugins are validated before use:
- Citation data: verified against the same pipeline as built-in citations
- Figure output: checked for file existence and format
- Prose output: checked against core engine conventions (tense, voice, no fabrication)
- Search results: deduplicated against built-in search results

---

## 4. Session Status Report

When the user invokes "check integrations" or "integration status":

### Output Format

```
Integration Status
==================

Detected plugins: [N] / Possible: 8
Session: active / PAPER_CONTEXT override: [none/partial/full]

| Plugin | Status | Version | Fallback |
|--------|--------|---------|----------|
| research-lookup | detected / not found | 1.x.x | Built-in PubMed + WebSearch |
| literature-review | detected / not found | 1.x.x | Manual PubMed search |
| citation-management | detected / not found | 1.x.x | Built-in citation pipeline |
| scientific-schematics | detected / not found | 1.x.x | Code SVGs / [FIGURE NEEDED] |
| generate-image | detected / not found | 1.x.x | [FIGURE NEEDED] |
| venue-templates | detected / not found | 1.x.x | Built-in templates |
| scientific-writing | detected / not found | 1.x.x | Built-in workflow |
| parallel-web | detected / not found | 1.x.x | WebSearch / WebFetch |
```

---

## 5. Error Handling

| Error Condition | Action |
|---|---|
| Glob pattern returns no matches | Treat all plugins as absent; use built-in fallbacks silently |
| SKILL.md file found but unreadable | Skip that plugin; log as unavailable |
| Plugin returns malformed output | Fall back to built-in capability; do not surface error to user |
| Plugin version incompatible | Skip that plugin; use built-in fallback |
| PAPER_CONTEXT.md has invalid Integrations field | Treat as "no override"; proceed with full detection |
| Plugin cache directory does not exist | Treat all plugins as absent; use built-in fallbacks silently |

---

## References

- `references/detected-plugins.md` — Full integration map with fallback details
