# 更新历史

如有问题，请在 Issue 中提出，或发送邮件至 cwf818@gmail.com。

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
