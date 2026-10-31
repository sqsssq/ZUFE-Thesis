# 更新历史

如有问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

## 未发布

1. 修复附录编号（[#8](https://github.com/sqsssq/ZUFE-Thesis/issues/8)）：此前附录用 `\unnumchapter` 引入，而它基于 `\chapter*`，既不推进 `chapter` 计数器也不复位图、表、公式计数器，「附录 A」只是标题文字，其中的图、表、公式仍沿用正文编号（实测附录中第一条公式为 `3-5`、第一幅图为 `3.3`）。
   - 新增 `\zufeAppendix{附录内容的名称}` 作为附录入口：进入附录时切换为字母编号并复位相关计数器，附录中的图、表、公式为 `A1`、`B2` 形式，与正文另行编号。
   - 附录序号使用独立计数器，与正文的章数无关，第一个附录恒为 A；多个附录依次调用即可生成附录 A、附录 B。
   - 附录内的小节编号同步为 `A.1`、子节为 `A.1.1`。结论与致谢用 `\ctexset` 全局改写了 `section` 的编号格式，`\zufeAppendix` 会在进入附录时恢复，其后的致谢不受影响。
   - `\unnumchapter` 行为不变，摘要、结论、参考文献、致谢等仍使用它。

2. 修复 `chapters/5_reference_sample.tex` 全局改写 `\thechapter` 的副作用：该文件此前用 `\renewcommand{\thechapter}{参考文献格式示例}`，会使其后附录中的图、表编号展开为「参考文献格式示例.1」。现已删除该行，输出标题本就是 `\unnumchapter` 的职责。

3. **正文公式编号由 `2-1` 调整为 `2.1`**，与图、表编号及本科指导手册「正文中的编号」1.7 节的「式6.7」一致；附录编号依据同节「图A1、表B2、文献[A3]」的另行编号规则。交叉引用（`\ref`）自动跟随，无需改动。

   影响：论文中公式的显示编号会变化，若手工写了「式 3-1」这类文字（而非 `\ref`）需要一并修改。已有论文的 `chapters/appendix.tex` 若仍用 `\unnumchapter{附录A~~~~…}`，编译不受影响，但附录编号不会切换，需改为 `\zufeAppendix{附录内容的名称}`。

4. 修复摘要页重复罗马页码（[#7](https://github.com/sqsssq/ZUFE-Thesis/issues/7)）：`misc/abstract.tex` 在中文摘要、英文摘要处各写了一次 `\setcounter{page}{1}`。`main.tex` 已经通过 `\frontmatter` 统一初始化罗马页码，这两次重置使页码倒退——中文摘要一旦跨页，实测输出为 `I → II → I`，英文摘要与中文摘要页码重复。

   - 删除两处 `\setcounter{page}{1}`，前置部分（摘要、目录）的罗马页码统一由 `\frontmatter` 初始化并连续推进。
   - **本科保持现状**：中英文摘要仍在同一页，中文在前、英文在后（本科指导手册「论文装订顺序」的要求），排版不变。
   - **硕士/博士**：中文摘要、英文摘要各自另起一页，页码连续（如中文 `I`、英文 `II`、目录 `III`）。此前英文摘要紧接在中文摘要之后同页排，与研究生院的扉页范例不一致。

   影响：非本科的摘要页数会增加（每篇论文多 1 页），目录中「Abstract」指向的页码随之变化。如果论文中手工写了「摘要见第 I 页」这类页码，需要一并核对。

5. 硕士、博士模板支持副标题（[#9](https://github.com/sqsssq/ZUFE-Thesis/issues/9)）：`\haveSub{}`、`\thesisSubTitle`、`\thesisSubTitleEN` 此前只被本科封面与共享摘要读取，硕博封面、中英文扉页仍只输出主标题，启用副标题后出现「摘要页有副标题、封面与扉页没有」的不一致。
   - 封面：「论文题目」一栏的取值框内，主标题下方另起一行输出 `-----副标题`（楷体小四），下划线随两行内容一起下移。为此新增按取值块实际高度画下划线的 `\zufeCoverMultiField`——原来的 `\underline` 只取首行基线，副标题会落到线下。
   - 中文扉页：主标题下方输出 `-----中文副标题`（黑体三号）；英文扉页同样处理，输出 `-----英文副标题`（加粗三号）。
   - 封面字段与上方标题之间的留白改为可压缩（`23mm plus 0pt minus 16mm`）：副标题或较长的题目多占的行数由这段留白吸收，字段块整体上移，不会把「完成日期」挤到第二页。
   - **硕博封面的题目行距减半**：`\zufeCoverMultiField` 内主标题行距由 3 号字默认的 25.05pt 压到 14pt。自动换行与手动 `\\` 断行走同一行距，便于按版面自行选择断点。本科封面与各学位扉页不受影响。
   - 博士模板与硕士同构，一并支持。

   影响：不启用副标题时，**本科**封面与扉页排版逐像素不变（16 页全页一致）。硕士/博士封面第 1 页因题目行距调整而变化（即本次需求），其余页不变。启用副标题后封面仍为 1 页、扉页仍各为 1 页，页数不变；副标题的字号与位置以学校现有范例的标题层级为准，范例文档本身未给出副标题排法，若学院另有规定需据其调整 `misc/<degree>/titlepage_*.tex`。

6. 松开硕士、博士中英文扉页主标题的行距：扉页题目此前在 `spacing{1.2}` 内排版，`\zihao{-1}`（24bp）对应行距仅 34.7pt，比字面高多出约 2.7pt，英文粗体标题换行时两行几乎贴在一起、中文长题目同样偏紧。现改为 `spacing{1.45}`（约 42pt），行间空隙与正文观感一致。副标题的 4mm 间距保持不变。

   影响：仅在主标题换行时可见。单行标题与不启用副标题的页面位置不变；两行标题的题目块整体下移约 4mm，页面仍为 1 页，页数不变。

7. 硕士、博士封面收紧上半部分留白，并让所有情况都能压缩字段上方留白：
   - 校徽校名段前后的留白由 `14mm`/`11mm` 收到 `8mm`/`7mm`，「学位论文」与英文论文类型两段由 `10mm`/`4mm` 收到 `6mm`/`3mm`，封面整体更紧凑。
   - 字段上方留白由「仅启用副标题时可压缩（`minus 16mm`）」改为「无论有无副标题统一 `23mm plus 0pt minus 22mm`」。此前不启用副标题时题目换行会直接把「完成日期」挤到第二页。
   - 效果：主标题 + 副标题合计 5 行以内都能单页排下（实测 3/4/5 行主标题，有无副标题共 6 种组合均完整），此前 3 行无副标题、4 行有副标题即溢出。

   影响：硕士、博士封面第 1 页排版变化（即本次需求），页数不变。本科封面未改动。

8. README 补充封面题目的行数限制与溢出后的调参指引：建议主标题与副标题合计 4 行以内，5 行以内仍可单页排下；超出后留白已压满，此时通过压缩字段 `tabular` 的 `\\[10mm]` 行距腾出空间。

9. 修正硕士、博士封面「论文题目」栏与其它字段的相对位置不一致。该栏由 `\zufeCoverMultiField` 单独实现，早期有两个问题：

   - **下划线到文字的距离偏大**：早期版本自行用 `\rule` 画线，并为多行补了 2pt 余量，实测该距离为 2.29mm，而「作者姓名」「专业」「所在学院」「指导教师」「完成日期」均为 0.59~0.68mm。改为让该栏复用 `\underline`，与普通字段走同一条取线规则。
   - **标签相对取值的位置偏低**：`\underline` 会在取值块下方额外占一条线的高度，取值块的视觉重心因此偏下。只按两盒子中心差抬高标签时，「论文题目」标签比取值低 1.99mm，而普通字段只低 0.30mm。现从抬高量中再减去 4.5pt（新增 `\zufe@coverlabelshift`），两者拉平。

   实测结果：题目栏「标签 − 取值」偏移由 −1.99mm 变为 −0.25mm，普通字段为 −0.30mm，相差 0.05mm（不到 1 像素）；下划线到文字的距离与其它字段同为 0.59~0.68mm。

   影响：硕士、博士封面「论文题目」栏的下划线上移约 1.6mm、标签相对取值上移约 5.6pt，与其余字段对齐。本科封面不使用该宏，不受影响；各学位页数不变。

## v1.2.2（2026-10-28）

1. 明确并收紧 `anony`（匿名/盲审）的处理边界，此前仅替换校名、英文校名与校徽，仍会保留可识别学校的信息：
   - 学校代码 `11482` 改为匿名占位 `XXXXX`（硕士/博士封面右上角）。
   - 硕士/博士封面的专业、所在学院改为“匿名”。
   - 硕士/博士封底整页不再输出：该页为校名、地址、邮编、电话与研究生院网址，无法脱敏。
   - 致谢页不再输出：致谢普遍包含导师、同门与课题组信息。
   - `anony` 隐含 `noprovenance`：默认 PDF 元数据中的 `Keywords` 与 `Subject` 含学校英文全称，匿名版本不再写入。

   > 硕士/博士封面的专业与学院此前保留是有意为之，理由是学科方向属于评审需要的信息，且此前未见学校对盲审版封面的明确规定。考虑到模板无法替用户判断各学院的具体要求，且 `anony` 其余字段已按“隐去可识别信息”处理，本次统一改为隐去，以免出现“姓名匿名、专业学院仍可见”这类不一致的中间状态。若所在学院明确要求保留学科信息，可在 `misc/<degree>/cover.tex` 中去掉对应字段的 `\ifanony` 分支。

   影响：`anony` 版本页数会减少（硕士/博士少 2 页、本科少 1 页）；依赖固定页码或依赖 `anony` 保留封底/致谢的下游工具需要适配。非匿名版本不受影响。

## 版本对应关系

本文件按日期分节记录改动，与 Git 标签 / GitHub Release 的对应关系如下：

| 版本 | 发布日期 | 对应分节 |
| --- | --- | --- |
| [v1.2.2](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.2)（当前稳定版） | 2026-10-28 | v1.2.2 |
| [v1.2.1](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.1) | 2026-10-23 | 20240601 ~ 20260913 |
| [v1.2.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.0) | 2026-09-13 | 20240601 ~ 20260913 |
| [v1.1.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.1.0) | 2022-03-26 | ——（本文件自 20240601 起记录，此前的改动无分项记录） |
| [v1.0.0](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.0.0) | 2022-02-09 | —— |

> 20240601 至 20260913 之间未单独打标签，这些改动均随 v1.2.0 一并发布。
> v1.2.1 为 v1.2.0 的文档与构建修订版，不涉及模板功能变更。
> v1.2.2 为**有破坏性变更**的功能版本：仅影响 `anony` 版本的输出内容与页数，非匿名版本输出不变。详见该节说明。

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
