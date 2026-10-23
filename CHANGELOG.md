# 更新历史

如有问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

## 版本对应关系

本文件按日期分节记录改动，与 Git 标签 / GitHub Release 的对应关系如下：

| 版本 | 发布日期 | 对应分节 |
| --- | --- | --- |
| [v1.2.1](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.1)（当前稳定版） | 2026-10-23 | 20240601 ~ 20260913 |
| [v1.2.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.0) | 2026-09-13 | 20240601 ~ 20260913 |
| [v1.1.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.1.0) | 2022-03-26 | ——（本文件自 20240601 起记录，此前的改动无分项记录） |
| [v1.0.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.0.0) | 2022-02-09 | —— |

> 20240601 至 20260913 之间未单独打标签，这些改动均随 v1.2.0 一并发布。
> v1.2.1 为 v1.2.0 的文档与构建修订版，不涉及模板功能变更。

## v1.2.1（2026-10-23）

1. 修复仓库内 `main.pdf` 的版本元数据：该文件此前在版本号升至 1.2.0 之前编译，`Creator` 仍为 `v1.0.1`，现重新编译为 `v1.2.0` / `v1.2.1`。
2. 补充 v1.1.0 → v1.2.0 的迁移说明（见下文 v1.2.0 节），并新增版本对应关系表。
3. README 增加 Releases 下载入口与版本关联。

模板功能、文件结构、编译方式与 v1.2.0 完全一致，升级无需改动论文内容。

## v1.2.0（2026-09-13）

### 兼容性说明（从 v1.1.0 升级）

v1.2.0 对项目结构做了较大调整，**目录与文件名有破坏性变更**。若你的论文工程基于 v1.1.0，或你维护依赖本模板目录结构的下游工具，请按下表迁移：

| v1.1.0 | v1.2.0 | 说明 |
| --- | --- | --- |
| `main.tex` 内联全部元数据 | `chapters/basicinfo.tex` | 题目、副标题（`\haveSub`）、作者信息、摘要、关键词、`\Today` 均移入此文件；`\TodayEN` 为新增 |
| `misc/0_cover.tex` | `misc/bachelor/cover.tex` | 改由 `\zufeMakeCover` 按学位类型调用 |
| `misc/1_originality.tex` | `misc/bachelor/statement.tex` | 改由 `\zufeMakeStatement` 调用；文件已更名 |
| `misc/2_contents.tex` | —— | 目录设置内联到 `main.tex`（`\tableofcontents`） |
| `misc/3_introduction.tex` | `chapters/1_introduction.tex` | 移入 `chapters/` |
| `misc/4_conclusion.tex` | `chapters/4_conclusion.tex` | 移入 `chapters/` |
| `misc/5_reference.tex` | `chapters/5_reference_sample.tex` | 改为「参考文献格式示例」章节 |
| `misc/5_simple_reference.tex` | `misc/reference.tex` | 由简化版参考文献页重写而来 |
| `misc/6_appendix.tex` | `chapters/appendix.tex` | 移入 `chapters/` |
| `misc/7_acknowledgement.tex` | `chapters/acknowledgement.tex` | 移入 `chapters/` |
| `chapters/abstract.tex` | `misc/abstract.tex` + `chapters/basicinfo.tex` | 摘要**排版**在 `misc/abstract.tex`，摘要与关键词**内容**改由 `basicinfo.tex` 的 `\abstractCN`、`\keywordsCN`、`\abstractEN`、`\keywordsEN` 提供 |
| `chapters/chapter_sample.tex` | `chapters/2_chapter_sample1.tex` | 改名 |
| `chapters/chapter_1.tex` | `chapters/3_chapter_sample2.tex` | 改名 |
| —— | `chapters/mainbody.tex` | 新增：正文章节的编排入口，新增章节在此 `\input` |
| `InitFile/schoolLogo.png` | `InitFile/bachelor/schoolLogo.png` | 按学位类型归档 |
| 根目录 `simhei.ttf`、`stkaiti.ttf`、`stsong.ttf` | `fonts/` 下同名文件 | 字体目录化，`zufe.cls` 中以 `Path=fonts/` 加载；须在**仓库根目录**编译 |
| `STXIHEI.TTF`、`kaiti_GB2312.ttf` | —— | 已删除，相应命令改用 `\mystkaiti`、`\mystsong` |
| 根目录指导手册 `.doc` | `docs/` | 归档 |
| —— | `latexmkrc` | 新增：`latexmk -pdfxe main.tex` |
| `dtx-style.sty`、`.history/` | —— | 删除 |

命令层面的变化：

- `\kaitigb`（v1.1.0 的中文摘要字体命令）已移除，改用 `\mystkaiti`；宋体生僻字用 `\mystsong`。
- 新增 `\lishu`（隶书），系统无隶书时自动回退黑体。
- 参考文献改用 `gb7714-2015` 样式，字号（小四）与行距（1.53）同步调整，**排版结果会与 v1.1.0 不同**。
- `\documentclass[...]{zufe}` 新增 `master` / `doctor` / `anony` / `noprovenance` 选项，默认仍为 `bachelor`；旧的 `\documentclass[bachelor]{zufe}` 写法保持有效。
- `reportStyle` 为**新增**变量（v1.1.0 无此变量），且仅在本科下有效。

### 20260913

1. 封面、Logo 等资源按学位类型归档，为后续扩展硕士、博士模板做准备：
   - 初始化资源迁移至 `InitFile/bachelor/`（原 `InitFile/schoolLogo.png`、`InitFile/anonyLogo.png`）；
   - 封面、原创性声明页迁移至 `misc/bachelor/`（原 `misc/cover.tex`、`misc/originality.tex`，后者更名为 `statement.tex`）。
2. 本次仅调整目录结构，本科模板的功能与使用方式不变。
3. 新增**学位类型**支持：在 `main.tex` 中通过 `\documentclass[bachelor|master|doctor]{zufe}` 指定，默认为 `bachelor`。
4. 新增**硕士**论文模板：封面、原创性声明及使用授权书、中英文扉页、封底（依据学校硕士论文封面封底、声明、中英文扉页范例）。
5. 新增**博士**论文模板占位：封面、声明页、中英文扉页、封底及图片资源暂按硕士模板提供，仅替换为博士称谓（博士 / DOCTORAL），后续可继续完善。
6. `reportStyle` 收窄为**本科专用**：仅在 `bachelor` 下定义并生效；页眉、封面、声明页与致谢的包含逻辑改由类文件按学位类型统一编排，不再全局引用 `reportStyle`。
7. 资产按学位类型分目录：`InitFile/bachelor|master|doctor/`、`misc/bachelor|master|doctor/`；`misc/abstract.tex`、`misc/reference.tex` 为各学位共用。
8. `chapters/basicinfo.tex` 新增 `\TodayEN`，用于英文扉页的完成日期。
9. 新增 `\lishu`（隶书）命令：按平台依次探测系统隶书（`LiSu`、`STLiti`、`Baoli SC` 等），均不可用时自动回退为模板自带黑体，并支持与 `\bfseries` 连用产生合成加粗；硕士/博士封面的「硕士/博士学位论文」使用该字体。

## 20260519

1. 删除文件 `chapters/abstract.tex`、`InitFile/schoolName.png`，合并原 `schoolName` 和 `schoolLogo` 为一个文件，简化封面设计。
2. Introduction 增加中文、英文引号的正确使用说明。
3. 中文论文题目分成两个变量，封面题目 `thesisTitle` 和摘要页题目 `thesisTitleAbs`（可选），以适应不同的换行要求。
4. 增加匿名模板支持，使用方法：`main.tex` 中使用 `\documentclass[bachelor,anony]{zufe}` 声明。

## 20251010

1. 修复目录页码缺失问题。
2. 修复新的 maketfm 字体加载机制变化导致的字体加载问题。
3. 修订摘要内容。
4. 其他一些优化。

## 20240925

1. 增加 `reportStyle` 变量（`basicinfo.tex`），用于指定文档类型（毕业论文/专业实践1/专业实践2），并且条件控制页眉、原创声明、致谢等内容。
2. 修改了项目的结构，目前**仅 `Reference.bib` 文件和 `chapters` 目录**下内容需要由用户修改，其他文件无特殊要求不用修改。
3. 使用定高的 `minipage` 控制标题内容，避免标题内容长短引起封面页布局变化。
4. 其他一些优化。

## 20240601

1. 支持生僻字，楷体和宋体分别使用 `\mystkaiti` 和 `\mystsong` 命令。测试中，TeXStudio + MiKTeX 中默认的 `\songti` 命令本身支持生僻字，而 Overleaf 不支持，需要用 `\mystsong` 命令将生僻字括起来。注意命令的使用务必用花括号括起来，即 `{\mystsong{生僻字内容}}`，如果缺少外部花括号，则字体命令会覆盖后续内容直至遇到新的字体命令。默认 `\songti` 和随模板提供的华文宋体（STSong）`\mystsong` 在外观上有微小差异。
2. 每章之间增加换页。
3. 修正封面 Logo 和校名位置。
4. 修正参考文献字号、缩进与行距。
5. 其他一些优化。
