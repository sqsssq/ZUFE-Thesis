



<div align=center><img src="InitFile/schoolLogo.png" width="20%"><br /><img src="https://img.shields.io/badge/Thesis-ZUFE-brightgreen">&nbsp;<img src="https://img.shields.io/badge/version-1.0.1-blue"></div>

# ZUFE-Thesis

浙江财经大学本科生毕业论文（设计）模板，LaTeX / Word

## 项目结构

```
.
│  LICENSE
│  main.pdf
│  main.tex
│  README.md
│  Reference.bib
│  simhei.ttf
│  stkaiti.ttf
│  stsong.ttf
│  zufe.cls
│  
├─chapters
│      1_introduction.tex
│      2_chapter_sample1.tex
│      3_chapter_sample2.tex
│      4_conclusion.tex
│      5_reference_sample.tex
│      abstract.tex
│      acknowledgement.tex
│      appendix.tex
│      basicinfo.tex
│      mainbody.tex
│      
├─Images
│      map.png
│      placeholder.png
│      
├─InitFile
│      schoolLogo.png
│      schoolName.png
│      
├─misc
│      cover.tex
│      originality.tex
│      reference.tex
│      
└─papperCode
        test.cpp
        test.jar
        test.py        
```

## 编译

```
用 XeLaTeX 编译 main.tex， 用 Biber 编译 bib文件 

or

overleaf模板，在线编辑LaTeX，也要用XeLateX编译
https://www.overleaf.com/latex/templates/zufe-thesis/ztbprkjkqzhm
```

## 文件解释

| 文件/文件夹                  | 内容                                                       |
| --------------------------- | ----------------------------------------------------------|
| main.tex                    | 主要 Tex 文件，论文入口，不用修改                            |
| zufe.cls                    | 论文的初始设置，不用修改                                     |
| *.ttf                       | .ttf 都是字体文件，不用修改                                  |
| Reference.bib               | 存放所有参考文献的 bib 格式数据                              |
| chapters                    | 存放章节 Tex 文件，包括正文mainbody、各章节样例、摘要、致谢等  |
| Images                      | 图片文件夹，存放论文图片                                     |
| papperCode                  | 存放论文的代码                                              |
| InitFile                    | 初始设置用的资源，不用修改                                   |
| misc                        | 特殊章节 Tex 文件，包括 封面、声明、参考文献，不用修改         |



注意：

1. 目前版本的毕业设计论文已经按照浙江财经大学2018级（2022届）毕业论文模板进行了设计与排版的更新。
2. 仔细阅读 main.pdf 和 chapter_sample.tex ，按照格式和要求撰写论文。
3. 最终论文中不能出现蓝字，一定要全部删除。
4. 祝大家论文顺利。

## 致谢
感谢 北京理工大学 模板

## 版本更新历史
20240925
1. 增加reportStyle变量（basicinfo.tex），用于指定文档类型（毕业论文/专业实践1/专业实践2），并且条件控制控制页眉、原创声明、致谢等内容。
2. 修改了项目的结构，目前仅Reference.bib文件和chapters目录下内容需要由用户修改，其他文件无特殊要求不用修改。
3. 使用定高的minipage控制标题内容，避免标题内容长短引起封面页布局变化。
4. 其他一些优化。

20240601
1. 支持生僻字，楷体和宋体分别使用\mystkaiti和\mystsong命令。测试中，TeXStudio+MiKTeX中默认的\songti命令本身支持生僻字，而Overleaf不支持，需要用\mystsong命令将生僻字括起来。注意命令的使用务必用花括号括起来，即{\mystsong{生僻字内容}}，如果缺少外部花括号，则字体命令会覆盖后续内容直至遇到新的字体命令。默认\songti和方正宋体\mystsong在外观上有微小差异。
2. 每章之间增加换页。
3. 修正封面Logo和校名位置。
4. 修正参考文献字号、缩进与行距。
5. 其他一些优化。