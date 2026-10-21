# Wagyu Knowledge Base

A public, English-language knowledge repository for documenting software engineering study, production lessons, and raw code examples. Obsidian is the editor, GitHub is the source of truth, and polished long-form articles are published separately on Medium.

## Structure

```text
.
├── .obsidian/                 Obsidian vault configuration
├── _meta/                     Repository conventions and tag vocabulary
├── _templates/                Shared Learning Post templates
├── _tools/                    Local tooling (algo: build/run/test/debug C++ and Rust solutions)
└── content/
    ├── developer/
    ├── cloud-engineer/
    ├── devops/
    ├── infrastructure-engineer/
    ├── network/
    ├── database/
    ├── languages/
    ├── algorithms/
    ├── data-structures/
    └── data-science/
```

Every Markdown file is a Learning Post. There are no separate journal, note, or article content models. Templates may provide different section prompts, but they share the same frontmatter and publishing rules.

## Naming conventions

Use descriptive lowercase ASCII kebab-case names. The completion date belongs in frontmatter, not in the filename.

```text
tcp-three-way-handshake.md       Good
TCP Handshake.md                 Avoid spaces and uppercase letters
tcp_handshake.md                 Avoid underscores
2026-08-31-tcp-handshake.md      Avoid date prefixes
```

Use a single Markdown file when the topic needs no supporting files:

```text
content/database/transaction-isolation.md
```

Use a topic directory with `index.md` when the post owns images or raw source:

```text
content/algorithms/breadth-first-search/
├── index.md
├── implementation.py
└── implementation.go
```

Put language-specific topics below the language name:

```text
content/languages/typescript/type-narrowing.md
content/languages/python/context-managers.md
```

Name troubleshooting posts after the observable problem:

```text
content/devops/github-actions-cache-miss.md
content/database/postgresql-slow-index-scan.md
```

## Workflow

1. Open the repository root as an Obsidian vault.
2. Choose the area that best owns the topic.
3. Create a lowercase kebab-case Markdown path.
4. Apply a template from `_templates/`.
5. Use controlled tags from `_meta/tags.md`.
6. Add complete explanations, references, and raw source files where relevant.
7. Commit only work that is useful to a public reader.
8. Publish polished long-form writing on Medium and add its URL to `medium_url`.

## Examples

A general post:

```text
content/network/tcp-three-way-handshake.md
```

An algorithm with raw implementations:

```text
content/algorithms/breadth-first-search/
├── index.md
├── queue.py
└── queue.go
```

A language-specific post:

```text
content/languages/typescript/type-narrowing.md
```

Images stay beside their post:

```text
content/cloud-engineer/kubernetes-services/
├── index.md
└── assets/
    ├── cover.webp
    └── packet-flow.png
```

```markdown
![Kubernetes service packet flow](./assets/packet-flow.png "Traffic from a client to a pod")
```

## Problem solving (C++ / Rust)

`_tools/algo` builds, runs, tests and debugs single-file solutions in `content/algorithms/problem-solving/`, from Zed shortcuts or the terminal.

```bash
_tools/algo/install.sh                 # one-time setup per machine
algo new baekjoon 1000 a-plus-b        # create a problem folder
algo run 1000-a-plus-b.cpp             # or press ctrl-shift-r in Zed
```

Usage: `content/algorithms/problem-solving/README.md` · Tool details: `_tools/algo/README.md`.

## Authorship

Only my own study records are written without AI assistance: Learning Posts, my solutions to problems I actually solve, and the notes, diagrams, tags, and metadata that belong to them.

Everything that supports studying may use AI assistance: READMEs, templates, conventions, tooling (`_tools/`), editor configuration, and sample or example code such as `content/algorithms/problem-solving/examples/`.

## Rules

- Repository content is written in English.
- Discussion and planning may be in Korean.
- `main` contains completed, public-safe work only.
- Paths and tags use lowercase kebab-case.
- Use full vault-relative wikilinks, for example `[[content/network/tcp-three-way-handshake]]`.
- Raw source examples are allowed under `content/algorithms/` and `content/languages/`.
- Do not commit package manifests, dependencies, binaries, generated output, fixtures, or build artifacts with source examples.
- Do not commit private identifiers, phone numbers, private addresses, credentials, internal-only context, or unapproved media.
