#!/usr/bin/env bash
# Native Windows build helper for pandoc-cli (Cabal).
#
# Prerequisites (install once):
#   • Git for Windows — provides this Bash environment and common Unix tools.
#     https://git-scm.com/download/win
#     Run this script from Git Bash, or from PowerShell via:
#       & "C:\Program Files\Git\bin\bash.exe" -lc "cd '.../pandoc' && bash build_x86_64_windows.sh"
#     Do not use C:\Windows\System32\bash.exe — that is the WSL stub, not Git Bash.
#
#   • GHCup (Windows) — installs GHC, Cabal, and other Haskell tools on PATH.
#     https://www.haskell.org/ghcup/#windows
#     After install, open a new terminal and check:  ghc --version   cabal --version
#
# Optional but often required if linking fails (zlib, pkg-config, Lua for -flua, etc.):
#   • MSYS2 — C toolchain and libraries Cabal links against on Windows.
#     https://www.msys2.org/
#     Install the UCRT64 (or MINGW64) environment and add packages as Cabal errors suggest
#     (e.g. pacman -S mingw-w64-ucrt-x86_64-pkg-config mingw-w64-ucrt-x86_64-zlib ...).
#
# Repo layout: expects a pandoc-cli directory next to this script (upstream pandoc layout).

#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT/pandoc-cli"

echo "Building pandoc-cli"

cabal update
cabal build pandoc-cli -f embed_data_files -flua