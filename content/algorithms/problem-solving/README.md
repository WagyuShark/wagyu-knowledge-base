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

## 문제를 푼 뒤 Git에 추가하기

아래 Git 명령은 **저장소 루트**에서 실행한다. 문제 폴더에는 풀이 코드,
`index.md` 해설, `inoutput/input_N.txt`와 `output_N.txt` 테스트를 함께 보관한다.
테스트도 Git으로 공유하므로 다른 노트북에서 그대로 검증할 수 있다.

```bash
cd "$(git rev-parse --show-toplevel)"
algo test content/algorithms/problem-solving/baekjoon/1000-a-plus-b/1000-a-plus-b.cpp
# Rust 풀이도 같은 방식으로 .rs 파일을 테스트한다.
git status --short
git add content/algorithms/problem-solving/baekjoon/1000-a-plus-b/
git diff --cached
git commit -m "solve: baekjoon 1000 A+B"
git push
```

여러 문제를 한 번에 추가하려면 `git add content/algorithms/problem-solving/`을 쓴다.
저장소의 다른 노트까지 의도적으로 모두 추가할 때만 루트에서 `git add -A`를 쓴다.
`git status --short`의 첫 번째 열은 스테이징된 변경, 두 번째 열은 미스테이징된
변경이며 `??`는 아직 추적하지 않는 파일이다. `git add`는 파일을 삭제하지 않고
커밋 대상으로 올린다. 일반 `git status`에서는 보통 빨간색이 초록색으로 바뀌며,
커밋까지 해야 작업 트리가 깨끗해진다. 다른 노트북에 전달하려면 push도 필요하다.

빌드 결과물과 자동 생성되는 `Cargo.toml`, `Cargo.lock`, `.cargo/`는 추가하지 않는다.
비밀번호·토큰·개인 입력 데이터는 커밋 전에 반드시 확인한다.

## 다른 노트북에서 이어 하기

macOS 기준으로 Git, Xcode Command Line Tools(`xcode-select --install`),
Rust 도구 체인(rustup), Zed를 준비한다. 설치 스크립트는 컴파일러가 없으면
설치 안내와 함께 중단하므로 해당 도구를 설치한 뒤 다시 실행한다.

```bash
git clone <저장소-URL> wagyu_knowledge_base
cd wagyu_knowledge_base
_tools/algo/install.sh
export PATH="$HOME/.local/bin:$PATH"
algo test content/algorithms/problem-solving/examples/bubble-sort/bubble-sort.cpp
algo test content/algorithms/problem-solving/examples/bubble-sort/bubble-sort.rs
```

PATH 설정은 `~/.zshrc`에도 넣고 터미널과 Zed를 다시 시작한다.
설치 스크립트가 `algo` 연결, Zed 설정 복사, `rust-src` 설치와 `algo sync`를 수행한다.
기존 Zed 설정이 다르면 덮어쓰지 않으므로 출력된 안내에 따라 병합한다.

이미 clone한 노트북에서는 로컬 변경을 먼저 커밋하고 `git pull --ff-only` 후
`algo sync`를 실행한다. 도구 설정까지 바뀌었다면 `_tools/algo/install.sh`도 다시 실행한다.
작업을 마칠 때 commit과 push까지 해 두어야 다른 노트북에서 이어 받을 수 있다.
