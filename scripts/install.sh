#!/usr/bin/env bash
# Skill工厂 安装脚本
# 用法：
#   bash scripts/install.sh                    # 安装 skill工厂 本身
#   bash scripts/install.sh code-reviewer      # 安装指定示例
#   bash scripts/install.sh all                # 安装所有示例
#   bash scripts/install.sh --list             # 列出可用示例

set -e

SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# 颜色
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()    { echo -e "${BLUE}[info]${NC} $1"; }
success() { echo -e "${GREEN}[ok]${NC} $1"; }
warn()    { echo -e "${YELLOW}[warn]${NC} $1"; }

install_skill() {
  local src="$1"
  local name="$2"
  local dest="$SKILLS_DIR/$name"

  mkdir -p "$dest"
  cp "$src/SKILL.md" "$dest/SKILL.md"

  # 如果有 references 目录，一并复制
  if [ -d "$src/references" ]; then
    cp -r "$src/references" "$dest/"
  fi

  success "已安装：$name → $dest/SKILL.md"
}

list_examples() {
  echo ""
  echo "可用示例："
  for dir in "$ROOT_DIR/examples"/*/; do
    name=$(basename "$dir")
    desc=$(grep -m1 'description:' "$dir/SKILL.md" 2>/dev/null | sed 's/description://' | tr -d ' |')
    # 从 SKILL.md 第一行注释提取简介
    summary=$(sed -n '3p' "$dir/SKILL.md" 2>/dev/null | sed 's/^[[:space:]]*//')
    echo "  • $name"
    [ -n "$summary" ] && echo "    $summary"
  done
  echo ""
}

# 参数处理
case "${1:-}" in
  --list|-l)
    list_examples
    exit 0
    ;;
  all)
    info "安装 skill工厂..."
    install_skill "$ROOT_DIR" "skill-factory"

    info "安装所有示例..."
    for dir in "$ROOT_DIR/examples"/*/; do
      name=$(basename "$dir")
      install_skill "$dir" "$name"
    done

    echo ""
    success "全部安装完成！在 Claude Code 中试试："
    echo "  「帮我造个XX的skill」"
    echo "  「review一下这段代码」（需要 code-reviewer）"
    echo "  「帮我优化这个SQL」（需要 sql-expert）"
    echo "  「/commit」（需要 git-workflow）"
    ;;
  "")
    info "安装 skill工厂..."
    install_skill "$ROOT_DIR" "skill-factory"
    echo ""
    success "安装完成！在 Claude Code 中说："
    echo "  「帮我造个SQL专家skill」"
    echo "  「我需要一个代码审查的skill」"
    echo "  「做个自动生成周报的skill」"
    ;;
  *)
    name="$1"
    src="$ROOT_DIR/examples/$name"
    if [ ! -d "$src" ]; then
      warn "示例不存在：$name"
      list_examples
      exit 1
    fi
    info "安装 $name..."
    install_skill "$src" "$name"
    echo ""
    success "安装完成！"
    ;;
esac
