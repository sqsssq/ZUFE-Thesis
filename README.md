<!-- ![](InitFile/schoolLogo.png) -->





<div algin=center><img src="InitFile/schoolLogo.png" width="20%"></div>




​        
![](https://img.shields.io/badge/ZUFE-Thesis-brightgreen)&nbsp;![](https://img.shields.io/badge/version-1.0.0-blue)

# ZUFE-Thesis

浙江财经大学本科生毕业论文（设计）模板，LaTeX / Word

## 项目结构

```
.
│  dtx-style.sty
│  LICENSE
│  main.tex
│  README.md
│  Reference.bib
│  simhei.ttf
│  STXIHEI.TTF
│  zufe.cls
│  楷体_GB2312.ttf
│  浙江财经大学软件工程专业 毕业设计（论文）指导手册（含模板）-2022届毕业生20221120.doc
│  
├─chapters
│      abstract.tex
│      chapter_1.tex
│      chapter_sample.tex
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
│      0_cover.tex
│      1_originality.tex
│      2_contents.tex
│      3_introduction.tex
│      4_conclusion.tex
│      5_reference.tex
│      5_simple_reference.tex
│      6_appendix.tex
│      7_acknowledgement.tex
│      
└─papperCode
        test.cpp
        test.jar
        test.py
```

## 编译

```
直接 用XeLaTeX 编译 main.tex
```

## 文件解释

| 文件/文件夹                 | 内容                                                         |
| --------------------------- | ------------------------------------------------------------ |
| main.tex                    | 主要 Tex 文件，论文入口                                      |
| Reference.bib               | 存放所有参考文献的 bib 格式数据（自行添加）                  |
| zufe.cls                    | 论文的初始设置                                               |
| *.ttf                       | .ttf 都是字体文件，不用修改                                  |
| chapters                    | 存放章节 Tex 文件                                            |
| chapters/chapter_sample.tex | 章节样例 Tex 文件，包括论文正文格式和图、表格、公式、代码、伪代码等格式的样例 |
| Images                      | 图片文件夹，存放论文图片                                     |
| InitFile                    | 初始设置用的资源，不用修改                                   |
| misc                        | 特殊章节 Tex 文件，包括 封面、声明、目录、引言、结论、参考文献、附录、致谢 |
| papperCode                  | 存放论文的代码                                               |



🚩 注意：

1. 目前版本的毕业设计论文已经按照浙江财经大学2018级（2022届）毕业论文模板进行了设计与排版的更新。
2. 仔细阅读 main.tex 和 chapter_sample.tex ，按照格式和要求撰写论文。
3. 最终论文中不能出现蓝字，一定要全部删除。
4. 祝大家论文顺利。

## 致谢
感谢 北京理工大学 模板
