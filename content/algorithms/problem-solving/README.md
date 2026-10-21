# Problem solving

C++ and Rust solutions. Tooling details: `_tools/algo/README.md`.

## Layout

```text
<platform>/<id>-<slug>/        baekjoon/1000-a-plus-b/
├── index.md
├── 1000-a-plus-b.cpp
├── 1000-a-plus-b.rs
└── inoutput/
    ├── input_1.txt            Run / Debug use case 1
    └── output_1.txt           add input_2 / output_2 … for more cases
```

New problem:

```bash
algo new baekjoon 1000 a-plus-b          # add --cpp or --rust for one language
```

Try everything first in `examples/bubble-sort/`.

## Keys (same for C++ and Rust)

| | Zed | Terminal |
| --- | --- | --- |
| Build | `ctrl-shift-b` | `algo build <file>` |
| Run | `ctrl-shift-r` | `algo run <file> [N]` |
| Test | `ctrl-shift-t` | `algo test <file>` |
| Debug | `F5` → PS: Debug current file | `algo debug <file> [N]` |

Debugger: `F9` breakpoint · `F10` over · `F11` into · `F5` continue · `shift-F5` stop.
The first output line shows the language: `── [C++] …` or `── [Rust] …`.

## If Rust breaks

Created a `.rs` file by hand? Run `algo sync`.
