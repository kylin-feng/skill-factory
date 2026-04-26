# Skill工厂

> 从需求到可运行的 Claude Code Skill，一键生成。

受 [女娲造人（nuwa-skill）](https://github.com/alchaincyf/nuwa-skill) 启发，女娲只造人（人物视角 Skill），Skill工厂造一切。

## 支持的 Skill 类型

| 类型 | 描述 | 典型用例 |
|------|------|---------|
| 🧠 **人物视角** | 蒸馏某人的思维框架 | 费曼教学法、芒格多元模型 |
| ⚙️ **工作流** | 自动化多步骤重复操作 | PR Review流程、部署流程 |
| 🔬 **领域专家** | 深度领域知识的交互顾问 | SQL优化专家、安全审计 |
| 📏 **代码规范** | 检查并强制执行代码标准 | 团队规范卫士 |
| ✍️ **内容创作** | 特定格式/风格的内容生成 | 周报、技术文档、邮件 |
| 🔌 **工具集成** | 连接外部服务的操作桥梁 | GitHub助手、Linear工单 |

## 使用方式

### 方式1：使用 Skill工厂 生成（推荐）

将 `SKILL.md` 安装到你的 Claude Code：

```bash
# 克隆仓库
git clone https://github.com/your-repo/skill-factory
cd skill-factory

# 安装 skill工厂 本身
mkdir -p ~/.claude/skills/skill-factory
cp SKILL.md ~/.claude/skills/skill-factory/
```

然后在 Claude Code 中说：
- 「帮我做个SQL专家skill」
- 「造个代码审查的skill」
- 「我需要一个自动生成周报的skill」

### 方式2：直接使用示例 Skill

```bash
# 安装代码审查 Skill
mkdir -p ~/.claude/skills/code-reviewer
cp examples/code-reviewer/SKILL.md ~/.claude/skills/code-reviewer/

# 安装 SQL 专家 Skill
mkdir -p ~/.claude/skills/sql-expert
cp examples/sql-expert/SKILL.md ~/.claude/skills/sql-expert/

# 安装 Git 工作流 Skill
mkdir -p ~/.claude/skills/git-workflow
cp examples/git-workflow/SKILL.md ~/.claude/skills/git-workflow/
```

## 与 nuwa-skill 的对比

| | nuwa-skill | Skill工厂 |
|---|---|---|
| **Skill类型** | 人物视角（1种） | 6种类型 |
| **定位** | 思维框架蒸馏 | 通用 Skill 生成器 |
| **模板系统** | 单一模板 | 按类型的专属模板 |
| **示例** | 人物视角示例 | 每种类型都有示例 |
| **组合能力** | 无 | 支持 Skill 组合 |

## 文件结构

```
skill-factory/
├── SKILL.md                        # 主技能：skill工厂本身
├── README.md
├── templates/                      # 6种类型的生成模板
│   ├── person-perspective.md       # 人物视角模板
│   ├── workflow.md                 # 工作流模板
│   ├── domain-expert.md            # 领域专家模板
│   ├── code-pattern.md             # 代码规范模板
│   ├── content-creator.md          # 内容创作模板
│   └── tool-integrator.md          # 工具集成模板
└── examples/                       # 开箱即用的示例 Skill
    ├── code-reviewer/SKILL.md      # 代码审查
    ├── sql-expert/SKILL.md         # SQL专家
    └── git-workflow/SKILL.md       # Git工作流
```

## 什么是好的 Skill

- **触发精准**：用户 3 秒内知道什么时候用它
- **流程可预测**：执行路径清晰，有检查点
- **边界诚实**：明确说做不到什么
- **产出可验证**：用户能判断结果是否正确

## 贡献

欢迎提交你用 Skill工厂 生成的 Skill 到 `examples/` 目录。

---

灵感来源：[女娲造人（nuwa-skill）](https://github.com/alchaincyf/nuwa-skill) by [@AlchainHust](https://x.com/AlchainHust)
