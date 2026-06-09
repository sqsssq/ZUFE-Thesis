<div align=center><img src="InitFile/schoolLogo.png" width="20%"><br /><img src="https://img.shields.io/badge/Thesis-ZUFE-brightgreen">&nbsp;<img src="https://img.shields.io/badge/version-1.0.1-blue">&nbsp;<img src="https://img.shields.io/badge/engine-XeLaTeX-blueviolet">&nbsp;<img src="https://img.shields.io/badge/license-MIT-lightgrey"></div>

# ZUFE-Thesis

浙江财经大学本科生毕业论文（设计） $\LaTeX$ 模板，基于最新 Word 模板修订。使用本模板时，**仅 `Reference.bib` 文件和 `chapters` 目录**下内容需要由用户修改，其他文件无特殊要求不用修改。

本模板原作者石青，是软件工程专业 2022 届毕业生。

后续由信智学院陈伟锋老师维护。

如对本项目有任何建议或者问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

<div align=center>
  <a href="https://github.com/sqsssq/ZUFE-Thesis/stargazers">
    <img src="https://img.shields.io/badge/如果本模板对你有帮助-欢迎点亮%20Star-yellow?style=for-the-badge&logo=github">
  </a>
</div>

## 快速开始

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

推荐使用由我们另一位未来校友（周欣雷，目前大三）开发的 [Skills工具](https://github.com/SeraphinaGlacia/ZUFE-Thesis-Skill) 。该工具初衷“让 $\LaTeX$ 的好处先发生”，可以帮助你将 Word 文档中的内容（可以是未完全排版的）直接转换为 $\LaTeX$ 项目，并输出PDF成品，以惬意的方式体验 $\LaTeX$ 在文档排版中的专业性。

## PDF 元数据

模板默认会在生成的 PDF 元数据中写入 `ZUFE-Thesis` 信息。该信息不是页面水印，不会显示在正文页面中，也不影响论文排版。

若不希望写入该元数据，可使用：

```tex
\documentclass[bachelor,noprovenance]{zufe}
```

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
| `InitFile`      | 封面、Logo 等初始化资源，通常不用修改                       |
| `misc`          | 封面、原创性声明、参考文献等特殊页面，通常不用修改          |
| `docs`          | 学校指导手册等说明文档                                      |
| `LICENSE`       | 开源许可证                                                  |

注意：

1. 目前版本的毕业设计论文已经按照浙江财经大学 2018 级（2022 届）毕业论文模板进行了设计与排版的更新。
2. 仔细阅读 `main.pdf`（需编译生成）和 `chapters/2_chapter_sample1.tex`，按照格式和要求撰写论文。
3. 最终论文中不能出现蓝字，一定要全部删除。
4. 祝大家论文顺利。

## 常见问题

### 生僻字无法显示

部分系统或在线平台默认宋体不支持生僻字。可使用模板提供的 `\mystsong` 命令，例如：

```tex
{\mystsong{垚瑄}}
```

楷体环境默认使用随模板提供的华文楷体（STKaiti），对应命令为 `\mystkaiti`。

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

详见 [CHANGELOG.md](CHANGELOG.md)。
