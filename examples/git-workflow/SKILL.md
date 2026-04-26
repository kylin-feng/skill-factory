---
name: git-workflow
description: |
  Git 提交工作流助手。规范化提交信息、生成变更日志、创建 PR 描述。
  触发词：「/commit」「帮我写提交信息」「commit message」「生成PR描述」
  「/changelog」「帮我总结改动」「提交前」
  场景：每次 git commit 前、创建 PR 时、发布版本时
  不触发：git 命令学习、分支策略讨论
---

# Git 提交工作流助手

> 好的提交信息，是给未来的你写的信件。

## 触发条件

**明确触发**：
- 用户说「帮我写提交信息」「commit message」
- 用户使用 `/commit`

**前置动作**（激活后自动执行）：
```bash
git diff --staged  # 查看已暂存的变更
git status         # 查看工作区状态
```

如果没有已暂存的文件，提示：
```
没有已暂存的文件。请先用 git add 添加要提交的文件，或者把代码粘贴给我。
```

## Commit Message 生成

### Step 1: 分析变更

读取 `git diff --staged` 输出，理解：
- 修改了什么文件
- 变更的主要内容（新增/修改/删除了什么）
- 变更的目的（从内容推断）

### Step 2: 生成 Commit Message

遵循 Conventional Commits 规范：

```
<type>(<scope>): <subject>

[body - 可选，解释 WHY 而非 WHAT]

[footer - 可选，Breaking changes / Issue 关联]
```

**type 选择规则**：

| type | 使用场景 |
|------|---------|
| `feat` | 新功能 |
| `fix` | Bug 修复 |
| `docs` | 文档变更 |
| `style` | 格式变更（不影响功能） |
| `refactor` | 重构（不新增功能，不修 Bug） |
| `perf` | 性能优化 |
| `test` | 测试相关 |
| `chore` | 构建工具、依赖管理等 |
| `ci` | CI/CD 配置变更 |
| `revert` | 回滚 |

**subject 写作原则**：
- 动词开头，用祈使句（add / fix / update，不用 added / fixed）
- 不超过 50 字符
- 不加句号
- 说清楚做了什么，而不只是「update file」

**body 写作原则**（变更复杂时才写）：
- 解释为什么这样改，而不是改了什么
- 如果有取舍，说明为什么选这个方案

### Step 3: 输出

```markdown
## 建议的 Commit Message

```
feat(auth): add JWT refresh token support

Implement sliding window refresh tokens to improve UX.
Previous implementation required users to re-login every hour.

Closes #123
```

**执行命令**：
```bash
git commit -m "feat(auth): add JWT refresh token support" -m "Implement sliding window refresh tokens to improve UX.
Previous implementation required users to re-login every hour.

Closes #123"
```

---
**备选（更简洁）**：`feat(auth): add JWT refresh token`
```

用户说「就这个」或「好」→ 直接执行 git commit 命令

## PR 描述生成

触发：用户说「生成PR描述」「帮我写PR」

### Step 1: 收集信息

```bash
git log main..HEAD --oneline  # 当前分支的提交历史
git diff main...HEAD          # 与主分支的完整差异
```

### Step 2: 生成 PR 描述

```markdown
## Summary
- [变更点1]
- [变更点2]
- [变更点3]

## Changes
- `[文件/模块]`: [说明]
- `[文件/模块]`: [说明]

## Test Plan
- [ ] [测试点1]
- [ ] [测试点2]

## Screenshots (if applicable)
[如果是 UI 变更，提醒用户添加截图]

## Breaking Changes
[如有，列出；如无，写 None]
```

## Changelog 生成

触发：用户说「生成changelog」「发布版本」「/changelog」

```bash
git log [上个tag]..HEAD --pretty=format:"%h %s" --no-merges
```

按类型分组，生成标准 CHANGELOG：

```markdown
## [版本号] - [日期]

### Added
- [feat commits]

### Fixed
- [fix commits]

### Changed
- [refactor/perf commits]

### Security
- [security-related fixes]
```

## 诚实边界

- Commit message 基于代码变更推断，可能误判意图——生成后请核对
- 不会自动执行 git push（只帮你生成命令）
- 项目如有特定的提交规范，请告知以覆盖默认规则

---

> 本 Skill 由 [Skill工厂](https://github.com/your-repo/skill-factory) 生成
