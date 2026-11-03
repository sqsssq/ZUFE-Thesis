# 更新历史

如有问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

本文件只记录**功能变化与升级要点**；实现细节、验证数据与逐条取舍见对应的 GitHub Release 说明与提交记录。

## v2.0.2（2026-11-03）

1. **修复中英文摘要标签与正文之间多出空格**（[#10](https://github.com/sqsssq/ZUFE-Thesis/issues/10)）：`摘要：`、`关键词：`、`Abstract:`、`Key words:` 四个标签后各多排了 1~2 个词间空格，其中 `Abstract:` 最宽，与 `Key words:` 明显不齐。现统一为紧接正文，与指导手册「后紧接摘要正文」「后紧接英文摘要正文」的要求一致。升级无需改动论文内容，但摘要页排版有细微变化，跨页位置可能随之改变。

## v2.0.1（2026-11-01）

1. **正文主字体重设时的 xeCJK 提示降为日志信息**：为了让不带字体命令的正文也用上探测到的宋体，模板会再次调用 `\setCJKmainfont`，xeCJK 因此每次报一条 `Redefining CJKfamily` 警告。该警告正是这段代码的目的，现降为 `info` 级别，`main.log` 中仍可查到，但不再计入警告数。**输出与 v2.0.0 逐页一致**，升级无需改动论文内容。
2. **更正 v2.0.0 升级说明**：补上同样被移除的 `\xihei`（→ `\heiti`），此前只提 `\mystsong`、`\mystkaiti`，用过 `\xihei` 的论文会漏改；更正「命中系统字体时输出与旧版逐字节一致」的说法与附件体积（zip 实测约 4.2 MB）。
3. README 致谢增加贡献者小节，记录 Issue #4–#9 的反馈者。

## v2.0.0（2026-11-01）

**这是破坏性变更版本。** 需要改源码的只有一处：用过 `\mystsong`、`\mystkaiti`、`\xihei` 的，分别改为 `\songti`、`\kaishu`、`\heiti`，否则编译报 `Undefined control sequence`。若在 `fonts/` 下手工放过字体文件，需按新规则改名。其余改动不必改源码，但**输出与 v1.2.4 有可见差异**：封面标题与图表标题改用系统字体，字形、字宽与分页都可能变化。

1. **不再随仓库与 Release 附件分发商业字体**：SimHei、STSong、STKaiti 随 Windows / Office 授权使用，许可条款不含再分发授权。模板改为按序解析每个字体，命中即用：`fonts/` 下用户自备文件 → 本机系统字体 → ctex 默认字体。落到第三步仍能编译，但字形与学校范例有差异，且 Fandol 不含生僻字，此时每种缺失的字体各给一条 `Class zufe Warning`。附件 zip 由约 25 MB 降至约 4.2 MB；直接 `git clone` 的体积同步下降。`v1.2.0`–`v1.2.4` 的 Release 附件仍含这些字体，已发布的产物保持原样。

2. **五个字体命令复用同一套系统字体探测**：`\songti`、`\heiti`、`\kaishu`、`\fangsong`、`\lishu` 先查 `fonts/` 自备文件，再按「中文名 → 英文名」探测系统字体；命中则以同名族重新定义该命令并开启合成加粗、倾斜，未命中时保持 ctex 原定义（`\lishu` 例外，回退 `\heiti`）。**正文主字体一并替换**，不带字体命令的正文也走同一套字体，不再有第二套规则。

   - 与 `\bfseries` 连用时**现在会真正加粗**：此前 ctex 的 `BoldFont` 只作用于正文主字体，不作用于这些显式字体族，`{\songti\bfseries …}` 几乎没有效果。
   - 加粗、斜体的模拟方式由「换成黑体 / 楷体字形」改为「合成描边 / 倾斜」，字形有细微差别。

3. **移除 `\mystsong`、`\mystkaiti`、`\xihei`**：生僻字已由 `\songti`、`\kaishu` 自身承担，前两个成为冗余；`\xihei` 与 `\heiti` 完全重复。

4. **自备字体改为按命令名命名**：`songti`、`heiti`、`kaishu`（也接受 `kaiti`）、`fangsong`、`lishu`，扩展名 `.ttf/.TTF/.otf/.OTF/.ttc/.TTC` 均可。旧的 `simsun`、`simhei`、`stsong` 等一律不再识别——不改名则这几种字体改由系统字体接管。新增的 `.ttc` 支持让 `simsun.ttc` 可直接改名使用。`fonts/README.md` 同步收敛为一条规则：某个字体命令不渲染生僻字时，把支持生僻字的字体放进 `fonts/` 并按该文件中的对照表改名。

5. `chapters/1_introduction.tex` 增补五种字体的常规 / 加粗对照示例。

## v1.2.4（2026-11-01）

1. **修复硕士 / 博士正文首行缩进丢失**：中英文扉页用 `\setlength{\parindent}{0pt}` 排自身版面，但两页是裸 `\input`、没有分组，设置一直泄漏到其后整个正文，使硕博论文所有段落首行缩进归零。现由 `\zufeMakeTitlePages` 以分组包住两页，出组即恢复。

   此问题自 v1.2.0 引入硕博模板起即存在；本科封面用的是 `titlepage` 环境，自带分组，不受影响。修复后硕博正文的换行位置与页数可能变化。

## v1.2.3（2026-10-31）

1. **附录改用 `\zufeAppendix` 入口**（[#8](https://github.com/sqsssq/ZUFE-Thesis/issues/8)）：此前附录基于 `\chapter*`，既不推进 `chapter` 计数器也不复位图、表、公式计数器，「附录 A」只是标题文字，其中的图、表、公式仍沿用正文编号。现在附录内图、表、公式为 `A1`、`B2`，小节为 `A.1`，多个附录依次为 A、B…。旧写法仍可编译，但编号不会切换。

2. **正文公式编号由 `2-1` 改为 `2.1`**，与图、表编号及指导手册「正文中的编号」一节一致。`\ref` 交叉引用自动跟随；手写的「式 3-1」一类文字需自行修改。

3. **修复摘要页重复罗马页码**（[#7](https://github.com/sqsssq/ZUFE-Thesis/issues/7)）：`misc/abstract.tex` 在中文、英文摘要处各重置了一次页码，中文摘要一旦跨页即输出 `I → II → I`。前置部分的页码现统一由 `\frontmatter` 连续推进。本科仍中英文同页，排版不变；硕博英文摘要另起一页，每篇多 1 页，目录中「Abstract」的页码随之变化。

4. **硕士 / 博士支持副标题**（[#9](https://github.com/sqsssq/ZUFE-Thesis/issues/9)）：封面「论文题目」栏与中英文扉页补上副标题输出，不再出现「摘要页有副标题、封面与扉页没有」的不一致。

5. **硕博封面、扉页排版调整**：扉页主标题行距 1.2 → 1.45，英文粗体标题换行时不再挤在一起；封面上下留白收紧，字段上方留白统一改为可压缩，主副标题合计 5 行以内都能单页排下；封面「论文题目」栏的下划线位置与标签对齐到与其它字段一致。

6. 修复 `chapters/5_reference_sample.tex` 全局改写 `\thechapter` 导致其后附录图表编号异常的问题。

## v1.2.2（2026-10-28）

1. **收紧 `anony`（匿名 / 盲审）的处理边界**：此前只替换校名、英文校名与校徽，仍保留可识别学校的信息。现学校代码改为 `XXXXX`，硕博封面的专业与所在学院改为“匿名”，硕博封底与致谢页整页不输出，`anony` 隐含 `noprovenance`、不再写入含学校英文全称的 PDF 元数据。

   **影响**：`anony` 版本页数减少（硕博少 2 页、本科少 1 页），依赖固定页码或依赖封底、致谢存在的下游工具需要适配；非匿名版本输出不变。

## v1.2.1（2026-10-23）

1. 修复仓库内 `main.pdf` 的版本元数据：该文件在版本号升至 1.2.0 之前编译，`Creator` 仍为 `v1.0.1`，现重新编译为 `v1.2.0` / `v1.2.1`。
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

1. 封面、Logo 等资源与专属页面按学位类型归档至 `InitFile/{bachelor,master,doctor}/`、`misc/{bachelor,master,doctor}/`，`misc/abstract.tex`、`misc/reference.tex` 各学位共用。
2. 新增**学位类型**支持：在 `main.tex` 中通过 `\documentclass[bachelor|master|doctor]{zufe}` 指定，默认为 `bachelor`。
3. 新增**硕士**论文模板（封面、原创性声明及使用授权书、中英文扉页、封底，依据学校范例），以及**博士**模板占位——资源暂按硕士提供，仅替换为博士称谓，后续继续完善。
4. `reportStyle` 收窄为**本科专用**；页眉、封面、声明页与致谢的包含逻辑改由 `zufe.cls` 按学位类型统一编排。
5. `chapters/basicinfo.tex` 新增 `\TodayEN`，用于英文扉页的完成日期。
6. 新增 `\lishu` 命令：按平台依次探测系统隶书（`LiSu`、`STLiti`、`Baoli SC` 等），均不可用时回退黑体，并支持与 `\bfseries` 连用产生合成加粗。

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

## 版本对应关系

本文件按日期分节记录改动，与 Git 标签 / GitHub Release 的对应关系如下：

| 版本 | 发布日期 | 对应分节 | 说明 |
| --- | --- | --- | --- |
| [v2.0.2](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v2.0.2)（当前稳定版） | 2026-11-03 | v2.0.2 | 修复摘要标签与正文间的多余空格（#10） |
| [v2.0.1](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v2.0.1) | 2026-11-01 | v2.0.1 | 补丁版，输出与 v2.0.0 逐页一致 |
| [v2.0.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v2.0.0) | 2026-11-01 | v2.0.0 | ⚠️ 破坏性：移除三个命令、不再分发字体 |
| [v1.2.4](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.4) | 2026-11-01 | v1.2.4 | 修复硕博正文首行缩进丢失 |
| [v1.2.3](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.3) | 2026-10-31 | v1.2.3 | ⚠️ 破坏性：公式编号、附录入口、硕博摘要分页 |
| [v1.2.2](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.2) | 2026-10-28 | v1.2.2 | ⚠️ 破坏性（仅 `anony`）：匿名范围收紧 |
| [v1.2.1](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.1) | 2026-10-23 | v1.2.1 | 文档与构建修订版，功能不变 |
| [v1.2.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.0) | 2026-09-13 | v1.2.0、20260913 | ⚠️ 破坏性：目录与文件名调整 |
| [v1.1.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.1.0) | 2022-03-26 | ——（本文件自 20240601 起记录，此前的改动无分项记录） | |
| [v1.0.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.0.0) | 2022-02-09 | —— | |

> 20240601 至 20260913 之间未单独打标签，这些改动均随 v1.2.0 一并发布。
