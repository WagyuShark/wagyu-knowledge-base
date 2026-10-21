# algo

A bash script that builds, runs, tests and debugs single-file C++/Rust solutions.
Zed's shortcuts call it; you can call it from any terminal. Usage: `content/algorithms/problem-solving/README.md`.

## Commands

| Command | Does |
| --- | --- |
| `algo build <file>` | Compile (`clang++` or `rustc`, chosen by extension) |
| `algo run <file> [N]` | Compile, run with `inoutput/input_N.txt` (default 1), show time |
| `algo test <file>` | Compare every `input_N.txt` with `output_N.txt` |
| `algo debug <file> [N]` | Unoptimised build, open lldb with `input_N.txt` |
| `algo new <platform> <id> <slug>` | Create a problem folder |
| `algo sync` | Regenerate the local `Cargo.toml` |

## Build flags

| | Run / Test | Debug |
| --- | --- | --- |
| C++ | `-std=c++20 -O2`, ASan + UBSan | `-O0 -g` |
| Rust | edition 2021, `opt-level=2`, overflow checks | `opt-level=0 -g` |

`LOCAL` is defined in both (`#ifdef LOCAL` / `#[cfg(local)]`).

## Files

| Path | Purpose |
| --- | --- |
| `algo` | The script (linked as `~/.local/bin/algo`) |
| `install.sh` | One-shot setup for a new machine |
| `include/bits/stdc++.h` | Makes `#include <bits/stdc++.h>` work on macOS |
| `zed/*.json` | Copies of `~/.config/zed/` tasks, debug config, keymap |
| `/compile_flags.txt` | clangd settings (C++20, include path) |
| `problem-solving/Cargo.toml` | Generated, git-ignored; Zed and rust-analyzer need it for Rust |
| `/tmp/algo-build/` | All binaries; nothing is written beside the source |

`inoutput/`, `Cargo.toml`, `Cargo.lock`, `.cargo/` are git-ignored.

## New machine

```bash
git clone <this repo> && cd wagyu_knowledge_base
_tools/algo/install.sh
```

It checks `clang++`/`rustc` (prints the install command if missing), adds `rust-src`,
links `~/.local/bin/algo`, and copies the Zed files. Existing, different Zed files are kept;
add `--replace-zed` to back them up as `*.bak` and replace them. Safe to re-run.
