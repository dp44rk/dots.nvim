# dots.nvim

개인용 Neovim 설정 저장소입니다.  
Lua 기반으로 구성되어 있고, 플러그인 관리는 `lazy.nvim`을 사용합니다.

## Requirements
- Neovim `>= 0.10`
- `git`
- 선택: `ripgrep`, `fd`, `prettier`/`prettierd`, `stylua`, `black`

## Quick Start
1. 저장소 클론
2. `~/.config/nvim`으로 연결(또는 복사)
3. Neovim 실행 후 플러그인 자동 설치

예시:

```bash
git clone https://github.com/dp44rk/dots.nvim.git ~/.config/nvim
nvim
```

## Load Order
초기 로딩 흐름:

1. `init.lua`
2. `lua/options.lua`
3. `lua/autocmd.lua`
4. `lua/keymaps.lua`
5. `lua/lazyplug.lua`
6. `lua/plugins/*`

## Project Structure
- `init.lua`: 엔트리 포인트
- `lua/`: 코어 설정 모듈
- `lua/plugins/`: 플러그인별 설정
- `lua/lsp/`: LSP 관련 로직
- `after/ftplugin/`: 파일타입별 설정
- `colors/`: 로컬 컬러스킴
- `css/`: markdown preview 자산
- `template/`: 템플릿 파일
- `docs/STRUCTURE.md`: 구조 상세 문서

## Notes
- `which-key`는 v3 스펙(`wk.add`) 기준으로 구성되어 있습니다.
- `conform.nvim`은 `stop_after_first` 문법 기준으로 구성되어 있습니다.

## Maintenance
- 문법 체크:

```bash
luac -p lua/plugins/init.lua
luac -p lua/plugins/which_key.lua
luac -p lua/plugins/conform.lua
```

- 구조 변경 시 `docs/STRUCTURE.md`를 같이 업데이트하세요.
