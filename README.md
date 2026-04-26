<div align="center">

# Skill工厂

> *"从需求到可运行的 Claude Code Skill，一键生成。"*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)
[![Skills: 6 types](https://img.shields.io/badge/Skill%20Types-6-orange)](templates/)

<br>

**受 nuwa-skill 启发，女娲只造人，Skill工厂造一切。**

<br>

支持 6 种 Skill 类型，内置多 Agent 并行调研 + 交叉验证流水线，<br>
已生成：罗振宇、王坚、李诞、马云、史玉柱、周鸿祎 6 个人物视角 Skill。

[支持的类型](#支持的类型) · [安装](#安装) · [工作流](#工作流) · [调研方法](#调研方法) · [示例 Skill](#示例-skill)

</div>

---

## 支持的类型

```json
{
  "person-perspective": "蒸馏某人的思维框架和认知操作系统",
  "workflow": "自动化多步骤重复操作，带检查点和错误处理",
  "domain-expert": "深度领域知识的交互顾问，问题分类 + 专业建议",
  "code-pattern": "检查并强制执行代码规范，P0-P3 严重级别",
  "content-creator": "特定格式和风格的内容生成，变量系统",
  "tool-integrator": "连接外部服务的操作桥梁，含认证和安全守卫"
}
```

---

## 安装

```bash
mkdir -p ~/.claude/skills/skill-factory
curl -o ~/.claude/skills/skill-factory/SKILL.md \
  https://raw.githubusercontent.com/kylin-feng/skill-factory/master/SKILL.md
```

然后在 Claude Code 中说：

```
帮我造个SQL专家的skill
造个代码审查的skill
我需要一个自动生成周报的skill
帮我蒸馏一下费曼的思维框架
```

---

## 工作流

Skill工厂内部分 5 个阶段执行：

```
Phase 0: 类型检测
  → 判断要生成哪种类型的 Skill

Phase 1: 并行调研 (4个 Agent 同时运行)
  → Agent A: 核心方法论 / 一手资料
  → Agent B: 批评与反例
  → Agent C: 应用场景
  → Agent D: 竞品 / 对比分析

Phase 2: 交叉验证
  → 4个 Agent 结论互相检验
  → 标记「仅一个来源」的内容

Phase 3: 提炼 + 构建
  → 选对应类型模板
  → 填入调研结论

Phase 4: 质量验证
  → 检查触发词精准性
  → 验证示例对话质量
  → 输出 SKILL.md
```

---

## 调研方法

### 人物视角 Skill 的调研来源要求

生成人物视角 Skill 时，调研必须覆盖以下两类来源：

**一手来源（Primary Sources）**

| 来源类型 | 说明 |
|---------|------|
| 本人著作/演讲 | 书籍、公开演讲、采访的直接引用 |
| 官方记录 | 公司文件、官方声明、年报 |
| 本人采访 | 主流媒体的深度访谈 |
| 行为记录 | 可观察的商业决策，不依赖本人解释 |

**外部批评来源（Critical Sources）**

| 来源类型 | 说明 |
|---------|------|
| 媒体批评 | 负面报道、争议事件分析 |
| 前员工/合作方 | 第三方视角的评价 |
| 学术研究 | 独立的案例分析 |
| 监管/法律记录 | 诉讼、处罚、调查文件 |

**原则**：调研结论必须有来源标注。「仅一个来源」的内容在 Skill 中会降权处理。内在矛盾和批评要保留，不做美化。

### 已生成 Skill 的调研来源

```json
{
  "罗振宇": {
    "primary": ["罗辑思维历年文章", "历年跨年演讲全文", "得到App产品逻辑", "36Kr采访"],
    "critical": ["贩卖焦虑媒体分析", "得到月活下滑行业报道", "知识付费竞争格局分析"]
  },
  "王坚": {
    "primary": ["《在线》（王坚著）", "外滩大会演讲", "城市大脑项目报告", "中国工程院材料"],
    "critical": ["城市大脑隐私争议", "天涯2012批评帖", "阿里云员工流失报道"]
  },
  "李诞": {
    "primary": ["《脱口秀工作手册》", "小红书直播数据", "澎湃/GQ深度访谈"],
    "critical": ["笑果2022风波报道", "前员工评价", "游戏化直播消费保护争议"]
  },
  "马云": {
    "primary": ["阿里历年股东信", "湖畔大学分享", "历年演讲", "2019年卸任声明", "2025年回归报道"],
    "critical": ["蚂蚁金服IPO中止分析", "阿里反垄断调查", "前员工评价"]
  },
  "史玉柱": {
    "primary": ["《史玉柱自述》", "脑白金营销案例", "CCTV年度经济人物访谈", "财新采访"],
    "critical": ["洗脑广告媒体批评", "征途网游消费者投诉", "保健品行业监管报告"]
  },
  "周鸿祎": {
    "primary": ["《周鸿祎自述》", "3Q大战法院文件", "外滩大会演讲", "奇虎360上市材料"],
    "critical": ["3721软件流氓报道", "3Q大战法律分析", "360商业下滑行业分析"]
  }
}
```

---

## 示例 Skill

### 人物视角

| 人物 | 核心框架 | 仓库 |
|------|---------|------|
| 罗振宇 | 时间战场论、连接者定位、攀岩模式 | [luozhenyu-skill](https://github.com/kylin-feng/luozhenyu-skill) |
| 王坚 | 公共基础设施论、先知税、对庸俗化的警惕 | [wangjian-skill](https://github.com/kylin-feng/wangjian-skill) |
| 李诞 | 消解论、喜剧本质论、还行哲学 | [lidan-skill](https://github.com/kylin-feng/lidan-skill) |
| 马云 | 客户第一、与其更好不如不同、使命即商业模式 | [mayun-skill](https://github.com/kylin-feng/mayun-skill) |
| 史玉柱 | 消费者至上、单一诉求原则、现金流偏执 | [shiyuzhu-skill](https://github.com/kylin-feng/shiyuzhu-skill) |
| 周鸿祎 | 免费战略武器、三级火箭、弱势者反叛论 | [zhouhongyi-skill](https://github.com/kylin-feng/zhouhongyi-skill) |

### 工具类

| Skill | 说明 | 路径 |
|-------|------|------|
| code-reviewer | P0-P3 严重级别的代码审查 | [examples/code-reviewer](examples/code-reviewer/) |
| sql-expert | 查询优化、索引策略、执行计划 | [examples/sql-expert](examples/sql-expert/) |
| git-workflow | Commit 消息 + PR 描述 + Changelog | [examples/git-workflow](examples/git-workflow/) |
| weekly-report | 从 git log 或自由文本生成周报 | [examples/weekly-report](examples/weekly-report/) |

---

## 与 nuwa-skill 的对比

| | nuwa-skill | Skill工厂 |
|---|---|---|
| Skill类型 | 人物视角（1种） | 6种类型 |
| 调研流程 | 6个并行 Agent | 4个并行 Agent + 交叉验证 |
| 批评来源 | 不强制 | 强制双来源验证 |
| 模板系统 | 单一模板 | 按类型的专属模板 |
| 组合能力 | 无 | 支持 Skill 组合 |

---

## 文件结构

```
skill-factory/
├── SKILL.md                        # 主技能：skill工厂本身
├── README.md
├── templates/                      # 6种类型的生成模板
│   ├── person-perspective.md
│   ├── workflow.md
│   ├── domain-expert.md
│   ├── code-pattern.md
│   ├── content-creator.md
│   └── tool-integrator.md
└── examples/                       # 开箱即用的示例 Skill
    ├── luozhenyu-perspective/
    ├── wangjian-perspective/
    ├── lidan-perspective/
    ├── mayun-perspective/
    ├── shiyuzhu-perspective/
    ├── zhouhongyi-perspective/
    ├── code-reviewer/
    ├── sql-expert/
    ├── git-workflow/
    └── weekly-report/
```

---

## 什么是好的 Skill

- 触发精准：用户 3 秒内知道什么时候用它
- 流程可预测：执行路径清晰，有检查点
- 边界诚实：明确说做不到什么
- 产出可验证：用户能判断结果是否正确

---

## 作者

**麒哥 OPC** — AI Native 独立开发者

| 平台 | 链接 |
|------|------|
| 官网 | [aigcland.cn](https://aigcland.cn) |
| B站 | [bilibili](https://b23.tv/7HGB6fP) |
| 抖音 | [抖音主页](https://v.douyin.com/0ucUwBLYbpo/) |
| 小红书 | [小红书主页](https://xhslink.com/m/48fGHdAmJTe) |
| 公众号/视频号 | 微信搜「麒哥OPC」 |

---

灵感来源：[女娲造人（nuwa-skill）](https://github.com/alchaincyf/nuwa-skill)

MIT License
