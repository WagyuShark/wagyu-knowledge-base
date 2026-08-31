# Authoring Conventions

## One Learning Post model

Every knowledge document uses the same frontmatter:

```yaml
---
title: "Clear human-readable title"
date: "YYYY-MM-DD"
tags:
  - domain/software-engineering
  - format/concept
  - topic/example
aliases: []
medium_url: ""
---
```

Required fields:

- `title`: concise and specific.
- `date`: the completion date in `YYYY-MM-DD` format.
- `tags`: controlled tags from [[_meta/tags]].

Optional fields:

- `aliases`: alternate Obsidian link names.
- `medium_url`: the final HTTPS Medium URL after publication.

## Paths

- Choose exactly one top-level area under `content/`.
- Use lowercase ASCII kebab-case names.
- Use a single file for a focused topic: `content/network/tcp-handshake.md`.
- Use a topic directory when it owns images or raw source files: `content/algorithms/breadth-first-search/index.md`.
- Create language and topic directories only when real content exists.

## Links

Use full vault-relative paths to avoid ambiguous names:

```markdown
[[content/network/tcp-three-way-handshake]]
[[content/network/tcp-three-way-handshake#Connection teardown|TCP teardown]]
```

Use HTTPS for external references.

## Tags

A typical post uses:

- exactly one `domain/*` tag;
- exactly one `format/*` tag;
- two to five `topic/*` tags; and
- at most one optional `level/*` tag.

Prefer existing tags. Add a new controlled tag to [[_meta/tags]] before using it broadly.

## Sources and images

- Put raw source files beside algorithm or language posts.
- Identify programming languages by file extension.
- Keep image files in an adjacent `assets/` directory.
- Add meaningful image alt text and an optional caption.
- Prefer PNG, JPEG, WebP, or AVIF images under 2 MiB.
- Never commit dependencies, lockfiles, generated output, binaries, credentials, or private data.

## Completion standard

A committed Learning Post should:

- explain why the topic matters;
- state assumptions and prerequisites;
- develop the concept in the author's own words;
- include a concrete example;
- discuss edge cases or operational trade-offs;
- record what was learned;
- connect to related repository knowledge; and
- cite authoritative references.
