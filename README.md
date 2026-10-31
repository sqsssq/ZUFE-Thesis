<div align=center><img src="InitFile/bachelor/schoolLogo.png" width="20%"><br /><img src="https://img.shields.io/badge/Thesis-ZUFE-brightgreen">&nbsp;<a href="https://github.com/sqsssq/ZUFE-Thesis/releases/latest"><img src="https://img.shields.io/badge/release-1.2.2-blue" alt="release"></a>&nbsp;<img src="https://img.shields.io/badge/engine-XeLaTeX-blueviolet">&nbsp;<img src="https://img.shields.io/badge/license-MIT-lightgrey">&nbsp;<a href="https://github.com/sqsssq/ZUFE-Thesis/stargazers"><img src="https://img.shields.io/github/stars/sqsssq/ZUFE-Thesis?color=yellow&label=Stars" alt="Stars"></a></div>

# ZUFE-Thesis

浙江财经大学本科 / 硕士 / 博士学位论文 $\LaTeX$ 模板，基于最新 Word 模板修订。使用本模板时，**仅 `Reference.bib` 文件和 `chapters` 目录**下内容需要由用户修改，其他文件无特殊要求不用修改。

学位类型通过 `main.tex` 的 `\documentclass` 选项指定，默认为本科：

```tex
\documentclass[bachelor]{zufe}   % 本科（默认）
\documentclass[master]{zufe}     % 硕士
\documentclass[doctor]{zufe}     % 博士（暂以硕士资源占位）
```

本科模板支持毕业论文与专业实践报告（由 `chapters/basicinfo.tex` 中的 `reportStyle` 控制），该变量**仅在本科下有效**；硕士、博士模板不使用 `reportStyle`。

匿名（盲审）版本可追加 `anony` 选项，例如 `\documentclass[master,anony]{zufe}`。该选项会一并处理以下内容，无需再手动组合 `noprovenance` 或删页：

- 校徽、中英文校名、学校代码替换为匿名占位（`XX大学` / `XX UNIVERSITY` / `XXXXX`）
- 本科封面的姓名、学号、指导教师、学院、专业、班级，硕士/博士封面的姓名、指导教师、专业、学院，均显示为“匿名”
- 硕士/博士封底整页不输出（该页为校名与联系方式，无法脱敏）
- 致谢页不输出（致谢通常包含导师、同门与课题组信息）
- PDF 元数据不再写入 `ZUFE-Thesis` 与学校英文全称（等价于同时指定 `noprovenance`）

匿名只作用于模板生成的页面。正文、摘要、附录中出现的学校、导师、基金项目、致谢对象等信息仍需作者自行检查；`misc/abstract.tex` 的摘要题目取自 `chapters/basicinfo.tex`，如题目本身含可识别信息也需一并调整。

> 关于专业与学院：这两项此前在匿名版本中保留，理由是学科方向属于评审需要的信息。由于学校尚未就盲审版封面给出统一规定，各学院要求也不一致，模板统一按“隐去可识别信息”处理。若所在学院明确要求保留，可在 `misc/<degree>/cover.tex` 中去掉对应字段的 `\ifanony` 分支。

> 说明：硕士模板已依据学校硕士论文封面、声明、中英文扉页、封底范例实现；博士模板暂按硕士模板提供占位资源，仅替换称谓（博士 / DOCTORAL），后续可按博士规范继续完善。

本模板原作者石青，是软件工程专业 2022 届毕业生。

后续由信智学院陈伟锋老师维护。

如对本项目有任何建议或者问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

<div align=center>
  <a href="https://github.com/sqsssq/ZUFE-Thesis/stargazers">
    <img src="https://img.shields.io/badge/如果本模板对你有帮助-欢迎点亮%20Star-yellow?style=for-the-badge&logo=github">
  </a>
</div>

## 快速开始

### 获取模板

推荐从 [Releases](https://github.com/sqsssq/ZUFE-Thesis/releases/latest) 下载**当前稳定版 `v1.2.2`**，附件说明如下：

| 附件 | 说明 |
| --- | --- |
| `ZUFE-Thesis-1.2.2.zip` | 完整模板（含字体），解压后在根目录编译即可 |
| `ZUFE-Thesis-1.2.2.pdf` | 该版本的编译结果预览，供对照格式使用 |

也可以直接克隆仓库（对应 `main` 分支的最新提交，可能包含未发布的改动）：

```bash
git clone https://github.com/sqsssq/ZUFE-Thesis.git
```

各版本引入的改动与兼容性说明见 [CHANGELOG.md](CHANGELOG.md)；从 v1.1.0 升级请先阅读其中的迁移对照表。

### 环境要求

- TeX Live 2023 及以上版本，或较新的 MiKTeX
- 使用 XeLaTeX 编译 `main.tex`
- 使用 Biber 编译参考文献

### 本地编译

仓库已提供 `latexmkrc`，可在项目根目录直接执行：

```bash
latexmk -pdfxe main.tex
```

该命令会自动调用 XeLaTeX 和 Biber，并生成 `main.pdf`。

### 在线编辑

[Overleaf 模板](https://www.overleaf.com/latex/templates/zufe-thesis/ztbprkjkqzhm) 版本较旧，无法实时同步本仓库更新，使用时可能需要额外修订。在线编辑时仍需选择 XeLaTeX 编译。

目前免费订阅的 Overleaf 对编译时间限制较多，也可以考虑 [TexPage](https://www.texpage.com/) 或 [LoongTeX](https://app.loongtex.com/workspace) 等平台。

仍然推荐本地部署配合 Git 版本管理，可使用 VSCode / TeXstudio + TeX Live / MiKTeX。

### 使用Skills

如果你是第一次听说或接触 $\LaTeX$，不过已经准备好完整的 Word 版本的论文内容，也正在使用或刚好对 AI agents、Skills 等相关工具感兴趣，那么也可以趁此机会一起尝试一下。

推荐使用由我们另一位未来校友（周欣雷，目前大四）开发的 [Skills工具](https://github.com/SeraphinaGlacia/ZUFE-Thesis-Skill) 。该工具初衷“让 $\LaTeX$ 的好处先发生”，可以帮助你将 Word 文档中的内容（可以是未完全排版的）直接转换为 $\LaTeX$ 项目，并输出PDF成品，以惬意的方式体验 $\LaTeX$ 在文档排版中的专业性。

## PDF 元数据

模板默认会在生成的 PDF 元数据中写入 `ZUFE-Thesis` 信息。该信息不是页面水印，不会显示在正文页面中，也不影响论文排版。

若不希望写入该元数据，可使用：

```tex
\documentclass[bachelor,noprovenance]{zufe}
```

`anony` 选项已隐含 `noprovenance`：匿名版本默认不写入上述元数据。

## 文件解释

| 文件/文件夹     | 内容                                                        |
| --------------- | ----------------------------------------------------------- |
| `main.tex`      | 论文入口文件，通常不用修改                                  |
| `zufe.cls`      | 模板样式与格式设置，通常不用修改                            |
| `latexmkrc`     | `latexmk` 编译配置，用于自动调用 XeLaTeX 和 Biber           |
| `Reference.bib` | 参考文献数据，需要按论文内容修改                            |
| `chapters`      | 正文章节、摘要、致谢、附录等内容，主要修改区域              |
| `Images`        | 论文图片目录                                                |
| `papperCode`    | 论文相关代码                                              |
| `fonts`         | 字体文件，包含华文宋体（STSong）、华文楷体（STKaiti）和黑体 |
| `InitFile`      | 封面、Logo 等初始化资源，按学位类型分目录（`bachelor/`、`master/`、`doctor/`），通常不用修改 |
| `misc`          | 封面、声明页、摘要、参考文献等特殊页面；`bachelor/`、`master/`、`doctor/` 存放各学位专属页面，`abstract.tex`、`reference.tex` 为各学位共用，通常不用修改 |
| `docs`          | 学校指导手册、论文格式范例等说明文档                        |
| `LICENSE`       | 开源许可证                                                  |

注意：

1. 本模板已按浙江财经大学最新的学位论文格式要求完成设计与排版更新，涵盖本科、硕士、博士三个层次（博士暂以硕士资源占位）。
2. 仔细阅读 `main.pdf`（本仓库中版本仅作展示，未必最新，内容以最新编译生成为准）和 `chapters/2_chapter_sample1.tex`，按照格式和要求撰写论文。
3. 最终论文中不能出现蓝字，一定要全部删除。
4. 祝大家论文顺利。

## 常见问题

### 生僻字无法显示

部分系统或在线平台默认宋体不支持生僻字。可使用模板提供的 `\mystsong` 命令，例如：

```tex
{\mystsong{垚瑄}}
```

楷体环境默认使用随模板提供的华文楷体（STKaiti），对应命令为 `\mystkaiti`。

黑体命令为 `\xihei`。隶书命令为 `\lishu`：按平台依次探测系统隶书（Windows 的 `LiSu`、华文隶书 `STLiti`、macOS 的 `Baoli SC` 等），均不可用时自动回退为模板自带黑体，因此可安全使用；该命令可与 `\bfseries` 连用产生合成加粗效果。

```tex
{\lishu{浙江财经大学}}
```

### 附录与图表公式编号

附录由 `\zufeAppendix{附录内容的名称}` 引入，它会自动输出「附录A」标题、切换为字母编号并复位计数器，**不要手写「附录A」字样**，否则编号不会切换。多个附录依次调用即可：

```tex
\zufeAppendix{程序清单}
% 附录 A 的内容……

\zufeAppendix{调研问卷}
% 附录 B 的内容……
```

编号规则依据本科指导手册「正文中的编号」1.7 节：正文为图 2.1、表 2.1、式 (2.1)，附录另行编号为图 A1、表 A1、式 (A1)。交叉引用请一律用 `\ref`，不要手写编号。不写附录时，把 `chapters/mainbody.tex` 中引入 `chapters/appendix` 的 `\input` 注释掉即可。

### 摘要的页码与分页

`misc/abstract.tex` 各学位共用，分页方式由 `\documentclass` 的学位选项决定，不需要自己改：

| 学位 | 中英文摘要排版 | 页码 |
| --- | --- | --- |
| 本科 | 同一页，中文在前、英文在后（指导手册「论文装订顺序」要求） | 前置部分统一用罗马数字，连续编号 |
| 硕士 / 博士 | 中文摘要、英文摘要各自另起一页 | 同上，摘要与目录连续（如中文 `I`、英文 `II`、目录 `III`） |

摘要正文再长也不必手动管理页码：模板不会在摘要内部重置页码，跨页时按顺序自动编号。若摘要在同一页内放不下，本科版会让英文摘要顺延到下一页，此时中文摘要末尾的页码与英文摘要的页码仍然连续，但英文摘要不再与中文摘要同页——这种情况通常说明摘要超出了指导手册的一页篇幅，建议压缩内容。

### 副标题

副标题由 `chapters/basicinfo.tex` 的 `\haveSub{}` 开关控制，中英文副标题分别写在 `\thesisSubTitle` 与 `\thesisSubTitleEN` 中。三个学位都会在下列页面输出副标题，写法统一为在主标题下方另起一行、以 `-----`（编译后为破折号）开头：

| 学位 | 输出副标题的页面 |
| --- | --- |
| 本科 | 封面，以及同一页内的中、英文摘要题目 |
| 硕士 / 博士 | 封面、中文扉页、英文扉页，以及中英文摘要页 |

不启用副标题时各页面排版与不加副标题功能时完全一致，不需要额外调整。封面上的副标题占用「论文题目」栏内的第二行。**建议主标题与副标题合计控制在 4 行以内**——字段上方的留白可自动压缩，合计 5 行以内仍能单页排下，但留白压得越满，版面越紧凑。

硕士、博士封面的题目行距已压到 3 号字行距的一半左右，题目自动换行与用 `\\` 手动断行使用同一行距，因此可以直接在 `\thesisTitle` 里用 `\\` 指定断点，效果与自动换行一致：

```tex
\newcommand{\thesisTitle}{海岛环境对武学宗师成长的影响机理\\与新时代武学教育体系重构研究}
```

学校目前提供的硕士范例文档只给出主标题的排法，未包含副标题示例，模板按与摘要页一致的层级（副标题字号小于主标题、破折号前缀）实现。若所在学院对副标题的字号或位置另有要求，可修改 `misc/<degree>/cover.tex` 与 `misc/<degree>/titlepage_cn.tex`、`titlepage_en.tex` 中对应的输出语句。

#### 题目过长导致封面溢出到第二页

封面字段上方的留白（`misc/<degree>/cover.tex` 中的 `\vspace{23mm plus 0pt minus 22mm}`）会随题目行数自动压缩，因此**主标题 + 副标题合计 5 行以内都能单页排下**。题目再长时，留白已压满，腾不出更多空间，此时只能压缩字段块自身的行距：

`misc/<degree>/cover.tex` 的字段 `tabular` 中，题目与其余字段之间、各字段之间的 5 处行分隔符都是 `\\[10mm]`：

```tex
\zufeCoverTitleField{论文题目}{…}\\[10mm]
\zufeCoverField{作者姓名}{…}\\[10mm]
…
\zufeCoverField{指导教师}{…}\\[10mm]
\zufeCoverField{完成日期}{\Today}
```

5 处全改成 `\\[8mm]` 可腾出 10mm。若只想为长题目让位、又不希望改动正常版式，可只改第一处（题目与「作者姓名」之间）为 `\\[6mm]`，单独省 4mm。对观感影响较小。

调整后请重新编译并逐页检查封面：`pdfinfo main.pdf | grep Pages` 的页数与改动前一致，且封面后紧接着的是声明页而非空白页。

### 参考文献没有显示

请确认已经运行 Biber。推荐直接使用：

```bash
latexmk -pdfxe main.tex
```

### 在线平台编译超时

可尝试切换到本地编译，或使用 TexPage、LoongTeX 等平台。在线平台使用时请确认编译器为 XeLaTeX。

## 致谢

感谢北京理工大学 $\LaTeX$ 模板项目。

## 更新历史

当前稳定版为 **v1.2.2**，发布于 2026-10-28。本次收紧 `anony`（匿名/盲审）的处理边界，**匿名版本的输出与页数会变化**，非匿名版本不受影响，详见 [Releases](https://github.com/sqsssq/ZUFE-Thesis/releases/tag/v1.2.2) 与 [CHANGELOG.md](CHANGELOG.md)。

- 各版本的改动说明：[GitHub Releases](https://github.com/sqsssq/ZUFE-Thesis/releases)
- 按日期记录的详细改动、版本对应关系及 v1.1.0 升级迁移表：[CHANGELOG.md](CHANGELOG.md)
