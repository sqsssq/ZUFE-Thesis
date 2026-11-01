% Zhejiang University of Finance & Economics
% This is file "zufe.cls".
% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{zufe}
    [2020/02/07 v1.0 ZUFE Thesis Proposal class]

% 学位类型（本科 / 硕士 / 博士），三者互斥，默认为本科
\newif\ifzufeBachelor
\newif\ifzufeMaster
\newif\ifzufeDoctor
\newif\ifzufe@degreeselected
\newif\ifanony
\newif\ifzufe@provenance
\zufe@provenancetrue

% 判断是否有副标题，默认没有
\newif\ifhaveSubTitle\haveSubTitlefalse
% 有副标题则将值设为true，显示副标题
\newcommand{\have@SubTitle}{}
\newcommand{\haveSub}[1]{\haveSubTitletrue\renewcommand{\have@SubTitle}{#1}}

% 字号----------------------------------------------------------------
\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{50.4pt}\selectfont}
\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{43.2pt}\selectfont}
\DeclareRobustCommand{\yihao}{\fontsize{26pt}{31.2pt}\selectfont}
\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{28.8pt}\selectfont}
\DeclareRobustCommand{\erhao}{\fontsize{22pt}{26.4pt}\selectfont}
\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{21.6pt}\selectfont}
\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{19.2pt}\selectfont}
\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{18pt}\selectfont}
\DeclareRobustCommand{\sihao}{\fontsize{14pt}{16.8pt}\selectfont}
\DeclareRobustCommand{\shisanbang}{\fontsize{13pt}{15.pt}\selectfont}
\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{14.4pt}\selectfont}
\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{12.6pt}\selectfont}
\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{10.8pt}\selectfont}
\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{7.8pt}\selectfont}
\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{6.6pt}\selectfont}
\DeclareRobustCommand{\bahao}{\fontsize{5pt}{6pt}\selectfont}
% 字号----------------------------------------------------------------


\DeclareOption{bachelor}{\zufe@degreeselectedtrue\zufeBachelortrue\zufeMasterfalse\zufeDoctorfalse}
\DeclareOption{master}{\zufe@degreeselectedtrue\zufeMastertrue\zufeBachelorfalse\zufeDoctorfalse}
\DeclareOption{doctor}{\zufe@degreeselectedtrue\zufeDoctortrue\zufeBachelorfalse\zufeMasterfalse}
% 匿名版本同时关闭模板 provenance：默认元数据含 “ZUFE” 与
% “Zhejiang University of Finance and Economics”，会暴露学校信息
\DeclareOption{anony}{\anonytrue\zufe@provenancefalse}
\DeclareOption{noprovenance}{\zufe@provenancefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ProcessOptions\relax

% 未显式指定学位类型时默认为本科
\ifzufe@degreeselected\else\zufeBachelortrue\fi


\LoadClass[UTF8,zihao=-4,oneside,openany]{ctexbook}

\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=3.5cm,bottom=2.5cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{titletoc}
  % \RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{caption}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\hypersetup{
  hypertexnames=false,
}

\newcommand{\zufeTemplateName}{ZUFE-Thesis}
\newcommand{\zufeTemplateVersion}{1.2.4}
\newcommand{\zufeTemplateSignature}{ZUFE-Thesis LaTeX Template v\zufeTemplateVersion}

\AtBeginDocument{%
  \ifzufe@provenance
    \special{pdf:docinfo <<
      /Creator (\zufeTemplateSignature)
      /Producer (\zufeTemplateName)
      /Subject (Generated with the ZUFE-Thesis LaTeX template)
      /Keywords (ZUFE-Thesis, ZUFE, LaTeX thesis template, Zhejiang University of Finance and Economics)
    >>}%
    \hypersetup{
      pdfcreator={\zufeTemplateSignature},
      pdfproducer={\zufeTemplateName},
      pdfsubject={Generated with the ZUFE-Thesis LaTeX template},
      pdfkeywords={ZUFE-Thesis, ZUFE, LaTeX thesis template, Zhejiang University of Finance and Economics}
    }%
  \fi
}

\RequirePackage[
  backend=biber,
  style=gb7714-2015,
  gbalign=gb7714-2015,
  gbnamefmt=lowercase,
  gbpub=false,
  doi=false,
  url=false,
  eprint=false,
  isbn=false,
]{biblatex}

% 参考文献
% \addbibresource{./Reference.bib}


\IfFontExistsTF{Times New Roman}
  {\setmainfont{Times New Roman}}
  {\setmainfont{TeX Gyre Termes}}

% 中文字体解析------------------------------------------------------------------
% 华文宋体（STSong）、华文楷体（STKaiti）、黑体（SimHei）均为商业字体，随 Windows /
% Office 授权使用，但**不含再分发授权**，因此本模板不再随仓库分发这三个字体文件。
% 各字体按以下顺序解析，任一命中即可正常编译：
%   1. fonts/ 目录下用户自备的字体文件（已被 .gitignore 排除，仅在本机生效）
%   2. 本机系统字体（Windows 随系统安装、macOS 自带等）
%   3. ctex 默认中文字体（TeX 发行版自带，通常为 Fandol 或系统字体）
% 命中 1、2 时与旧版输出一致；落到 3 时仍可编译，但字体形态略有差异，
% 且 Fandol 不含生僻字，\mystsong / \mystkaiti 的生僻字能力随之失效（日志会给出警告）。
% 自备字体的文件名见 fonts/README.md。
%
% 除 \mystsong / \mystkaiti 外，ctex 的 \songti、\heiti、\kaishu、\fangsong 也按同一
% 顺序解析：探测命中就把该命令重定向到模板自己的字体族（带 AutoFakeBold），
% 未命中则**保持 ctex 的原定义不动**，因此不会比不处理更差。
\def\zufe@fontdir{fonts/}
\newif\ifzufe@fontresolved

% \zufe@uselocalfont{<族名>}{<基名>}：fonts/<基名>.{ttf,TTF,otf,OTF} 存在则用该文件
% 命中时与 \zufe@usesysfont 一样记下字体名与选项（\zufe@<族名>fontname / fontopts），
% 否则正文主字体那条路径拿不到自备字体，裸文本仍会缺生僻字。
\newcommand{\zufe@uselocalfont}[2]{%
  \zufe@fontresolvedfalse
  \@for\zufe@fext:=ttf,TTF,otf,OTF\do{%
    \ifzufe@fontresolved\else
      \IfFileExists{\zufe@fontdir#2.\zufe@fext}{%
        \setCJKfamilyfont{#1}[Path=\zufe@fontdir,Extension=.\zufe@fext,AutoFakeBold,AutoFakeSlant]{#2}%
        \expandafter\edef\csname zufe@#1fontname\endcsname{#2}%
        \expandafter\edef\csname zufe@#1fontopts\endcsname{Path=\zufe@fontdir,Extension=.\zufe@fext,AutoFakeBold,AutoFakeSlant}%
        \zufe@fontresolvedtrue
      }{}%
    \fi}}

% \zufe@usesysfont{<族名>}{<候选字体名，逗号分隔且不写空格>}：取第一个存在的系统字体
% 命中时把字体名记入 \zufe@<族名>fontname，供后面重设正文主字体使用。
\newcommand{\zufe@usesysfont}[2]{%
  \zufe@fontresolvedfalse
  \@for\zufe@fname:=#2\do{%
    \ifzufe@fontresolved\else
      \IfFontExistsTF{\zufe@fname}{%
        \edef\zufe@fchosen{\zufe@fname}%
        \setCJKfamilyfont{#1}[AutoFakeBold,AutoFakeSlant]{\zufe@fchosen}%
        \expandafter\edef\csname zufe@#1fontname\endcsname{\zufe@fchosen}%
        \expandafter\def\csname zufe@#1fontopts\endcsname{AutoFakeBold,AutoFakeSlant}%
        \zufe@fontresolvedtrue
      }{}%
    \fi}}

% 宋体 / 楷体 / 仿宋 / 黑体 / 隶书：五个字体命令按同一方式解析。
% 每个命令先查 fonts/ 下的自备文件，再按「中文名 -> 英文名」依次探测系统字体；
% 命中则以模板自己的字体族重新定义该命令，字体族名与命令同名（\songti 用族名
% songti，\kaishu 用族名 kaiti，等等），并开启 AutoFakeBold,AutoFakeSlant，
% 因此可与 \bfseries 连用产生合成加粗。
% 探测失败时保持 ctex 的原定义不动，不设回退——ctex 的这几个命令本来可用，
% 不作改动即不会比现状更差；\lishu 是例外，fandol 字体集下 ctex 并未定义它，
% 故探测失败时回退为黑体，保证命令始终可用。
% 注：ctex 的 windows 字体集里 \bfseries 会切到黑体（BoldFont=simhei.ttf），
% 换成自定义字体族后加粗改为 AutoFakeBold 合成，两种方式字形略有差别。
\zufe@uselocalfont{songti}{simsun}
\ifzufe@fontresolved\else\zufe@usesysfont{songti}{宋体,SimSun,Songti SC}\fi
\ifzufe@fontresolved
  \providecommand{\songti}{}
  \renewcommand{\songti}{\CJKfamily{songti}}
\fi

\zufe@uselocalfont{kaiti}{simkai}
\ifzufe@fontresolved\else\zufe@usesysfont{kaiti}{楷体,KaiTi,Kaiti SC}\fi
\ifzufe@fontresolved
  \providecommand{\kaishu}{}
  \renewcommand{\kaishu}{\CJKfamily{kaiti}}
\fi

\zufe@uselocalfont{fangsong}{simfang}
\ifzufe@fontresolved\else\zufe@usesysfont{fangsong}{仿宋,FangSong,STFangsong}\fi
\ifzufe@fontresolved
  \providecommand{\fangsong}{}
  \renewcommand{\fangsong}{\CJKfamily{fangsong}}
\fi

\zufe@uselocalfont{heiti}{simhei}
\ifzufe@fontresolved\else\zufe@usesysfont{heiti}{黑体,SimHei,STXihei,Heiti SC}\fi
\ifzufe@fontresolved
  \providecommand{\heiti}{}
  \renewcommand{\heiti}{\CJKfamily{heiti}}
\fi

\zufe@uselocalfont{lishu}{simli}
\ifzufe@fontresolved\else\zufe@usesysfont{lishu}{隶书,LiSu,STLiti,华文隶书,Baoli SC}\fi
\providecommand{\lishu}{}
\ifzufe@fontresolved
  \renewcommand{\lishu}{\CJKfamily{lishu}}
\else
  % ctex 未提供 \lishu（如 fandol 字体集）且系统无隶书：回退为黑体。
  \renewcommand{\lishu}{\heiti}
\fi

% 正文主字体：使用与 \songti 完全相同的字体名与选项。
% ctex 用 \setCJKmainfont 装配正文主字体（即 \CJKrmdefault 族），这条路径不经过
% \songti 命令。若只重定义命令，不带字体命令的正文仍落在 ctex 选定的字体上
% （fandol 下即不含生僻字的 FandolSong），自备字体也救不了裸文本。
% 这里用上面为 \songti 解析出的同一份「字体名 + 选项」重新声明主字体族：字体、
% AutoFakeBold、AutoFakeSlant 全部一致，正文的常规、加粗、斜体表现与显式写
% \songti 完全相同，不再有第二套规则。\songti 未解析成功时不动主字体。
\ifcsname zufe@songtifontname\endcsname
  \edef\zufe@mainfont{\csname zufe@songtifontname\endcsname}%
  \edef\zufe@mainfontopts{\csname zufe@songtifontopts\endcsname}%
  \expandafter\setCJKmainfont\expandafter[\expandafter{\zufe@mainfontopts}]{\zufe@mainfont}%
\fi

%因不支持生僻字，使用mystkaiti代替
%\setCJKfamilyfont{kaitigb}[AutoFakeBold,AutoFakeSlant]{[kaiti_GB2312.TTF]}
%\newcommand{\kaitigb}{\CJKfamily{kaitigb}}

% 宋体（生僻字）：华文宋体 STSong / 系统宋体
\zufe@uselocalfont{mystsong}{stsong}
\ifzufe@fontresolved\else\zufe@usesysfont{mystsong}{STSong,SimSun,Songti SC}\fi
\ifzufe@fontresolved
  \newcommand{\mystsong}{\CJKfamily{mystsong}}
\else
  \ClassWarningNoLine{zufe}{未找到 STSong / SimSun / Songti SC，\string\mystsong 回退为 ctex 默认宋体；\MessageBreak
    该字体可能不含生僻字，如需显示生僻字请按 fonts/README.md 自备字体}%
  \newcommand{\mystsong}{\songti}
\fi

% 楷体（生僻字）：华文楷体 STKaiti / 系统楷体
\zufe@uselocalfont{mystkaiti}{stkaiti}
\ifzufe@fontresolved\else\zufe@usesysfont{mystkaiti}{STKaiti,KaiTi,Kaiti SC}\fi
\ifzufe@fontresolved
  \newcommand{\mystkaiti}{\CJKfamily{mystkaiti}}
\else
  \ClassWarningNoLine{zufe}{未找到 STKaiti / KaiTi / Kaiti SC，\string\mystkaiti 回退为 ctex 默认楷体；\MessageBreak
    该字体可能不含生僻字，如需显示生僻字请按 fonts/README.md 自备字体}%
  \newcommand{\mystkaiti}{\kaishu}
\fi
% 中文字体解析------------------------------------------------------------------

\pdfstringdefDisableCommands{%
  \def\textcolor#1#2{#2}%
  \def\underline#1{#1}%
  \def\ziju#1{}%
  \def\mystsong{}%
  \def\mystkaiti{}%
  \def\heiti{}%
  \def\lishu{}%
}

\newcommand{\schoolName}{浙江财经大学}
\newcommand{\schoolNameEN}{ZHEJIANG UNIVERSITY OF FINANCE AND ECONOMICS}
\newcommand{\schoolCode}{11482}
% 匿名（盲审）版本：凡是能识别出学校的信息都替换为占位符。
% 个人信息的隐藏由各封面自行处理（姓名、学号、导师、学院、专业、班级）。
\ifanony
  \renewcommand{\schoolName}{XX大学}
  \renewcommand{\schoolNameEN}{XX UNIVERSITY}
  \renewcommand{\schoolCode}{XXXXX}
\fi

% 学位类型对应的资源目录与称谓
\newcommand{\zufeDegreeDir}{bachelor}
\newcommand{\zufeDegreeName}{本科}
\newcommand{\zufeThesisLabelEN}{}
\ifzufeMaster
  \renewcommand{\zufeDegreeDir}{master}
  \renewcommand{\zufeDegreeName}{硕士}
  \renewcommand{\zufeThesisLabelEN}{MASTER\ \ THESIS}
\fi
\ifzufeDoctor
  \renewcommand{\zufeDegreeDir}{doctor}
  \renewcommand{\zufeDegreeName}{博士}
  \renewcommand{\zufeThesisLabelEN}{DOCTORAL\ THESIS}
\fi

% 学位类型对应的图片资源目录
\newcommand{\zufeLogoDir}{InitFile/bachelor}
\ifzufeMaster\renewcommand{\zufeLogoDir}{InitFile/master}\fi
\ifzufeDoctor\renewcommand{\zufeLogoDir}{InitFile/doctor}\fi

% 本科封面使用「校徽+校名」合并图
\newcommand{\schoolLogoPath}{\zufeLogoDir/schoolLogo.png}
% 硕士/博士封面使用独立的校徽与校名书法图
\newcommand{\schoolEmblemPath}{\zufeLogoDir/emblem.png}
\newcommand{\schoolNameImagePath}{\zufeLogoDir/schoolName.png}
% 匿名时是否显示校名书法图
\newif\ifzufeShowNameImage
\zufeShowNameImagetrue

\ifzufeBachelor
  \renewcommand{\schoolEmblemPath}{\schoolLogoPath}
\fi
\ifanony
  \ifzufeBachelor
    \renewcommand{\schoolLogoPath}{\zufeLogoDir/anonyLogo.png}
    \renewcommand{\schoolEmblemPath}{\schoolLogoPath}
  \else
    \renewcommand{\schoolEmblemPath}{\zufeLogoDir/anonyEmblem.png}
    \zufeShowNameImagefalse
  \fi
\fi

% 封面字段下划线（本科、硕士、博士封面共用）
\newcommand\dunderline[3][-1pt]{{%
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}}

% 学位论文封面字段：黑体标签 + 楷体下划线取值（硕士/博士封面共用）
\newcommand{\zufeCoverField}[2]{%
  \makebox[26mm][l]{\heiti\bfseries\zihao{3}#1}%
  \underline{\parbox[b]{84mm}{\centering\mystkaiti\zihao{3}#2}}%
}

% 论文题目一栏：封面题目统一走多行版本，
% 使题目自动换行与用 \\ 手动断行走同一个行距，便于按版面手动选择断点。
\newcommand{\zufeCoverTitleField}[2]{%
  \zufeCoverMultiField{#1}{#2}%
}

% 封面题目的行距：原为 3 号字行距 25.05pt，这里压到近一半的 14pt。
% 主标题无论自动换行还是用 \\ 手动断行，走的都是这个行距，二者一致，
% 便于按版面手动选断点；再小（如 12.5pt）则末行深度不足，下划线会切到字脚。
\newlength{\zufe@titlebaseline}
\setlength{\zufe@titlebaseline}{14pt}

% 多行封面字段：取值可换行，标签相对整个取值块垂直居中，下划线贴末行文字。
% 下划线交给 \underline 处理——它与 \zufeCoverField 用的是同一条规则，
% 于是两类字段的下划线到文字距离一致（实测单行 0.63mm、多行 0.76mm）。
% 早期版本自己用 \rule 画线，并为多行补了 2pt 余量，结果题目栏的下划线比其它字段
% 低 2.29mm，单行题目时尤其明显；改用 \underline 后该差异消失。
\newbox\zufe@coverfieldbox
\newbox\zufe@coverlabelbox

% 标签基线的附加偏移。\underline 会在取值块下方额外占一条线的高度，
% 使取值块整体视觉重心偏下；若只按两盒子中心差抬高标签，题目栏的
% 「标签相对取值」会比普通字段低约 1.7mm（普通字段实测 -0.30mm，题目栏 -1.99mm）。
% 这里再从抬高量中减去 4.5pt，把两者的相对位置拉平（实测 -0.25mm）。
\newlength{\zufe@coverlabelshift}
\setlength{\zufe@coverlabelshift}{4.5pt}

\newcommand{\zufeCoverMultiField}[2]{%
  % 先量取值块尺寸，用于计算标签的抬高量
  \setbox\zufe@coverfieldbox=\hbox{\parbox[b]{84mm}{\centering
    \mystkaiti\fontsize{16.06pt}{\zufe@titlebaseline}\selectfont#2}}%
  \setbox\zufe@coverlabelbox=\hbox{\heiti\bfseries\zihao{3}#1}%
  % 抬高量按两盒子的垂直中心差计算，再减去 \zufe@coverlabelshift；
  % [0pt][0pt] 让标签不参与行高，字段行高始终由取值块决定
  \makebox[26mm][l]{\raisebox{\dimexpr 0.5\dimexpr\ht\zufe@coverfieldbox
    -\dp\zufe@coverfieldbox-\ht\zufe@coverlabelbox+\dp\zufe@coverlabelbox\relax
    -\zufe@coverlabelshift\relax}[0pt][0pt]%
    {\box\zufe@coverlabelbox}}%
  \underline{\parbox[b]{84mm}{\centering
    \mystkaiti\fontsize{16.06pt}{\zufe@titlebaseline}\selectfont#2}}%
}

% 封面字段内的副标题行：楷体小四，破折号前缀。
% 五个连字符经 TeX 连字展开为「——」，与本科封面、摘要页的副标题前缀一致。
% 副标题与末行主标题的基线距离取 \zufe@titlebaseline，与主标题自身换行的行距一致：
% 先排副标题，再按「目标基线距 - 末行主标题深度 - 副标题行高」补足竖向间距。
\newbox\zufe@subtitlebox
\newcommand{\zufeCoverSubField}[1]{%
  \par
  \setbox\zufe@subtitlebox\hbox{\mystkaiti\zihao{-4}-----#1}%
  \vspace{\dimexpr\zufe@titlebaseline-\prevdepth-\ht\zufe@subtitlebox\relax}%
  \centerline{\box\zufe@subtitlebox}%
}

\fancypagestyle{ZUFEThesis}{
  % 页眉高度
  \setlength{\headheight}{20pt}
  % 页码高度（不完美，比规定稍微靠下 2mm）
  \setlength{\footskip}{14pt}

  \fancyhf{}
  % 定义页眉、页码
  \ifzufeBachelor
    \ifnum\reportStyle=0
      \fancyhead[C]{\xiaowu\ziju{0.08}\songti{\schoolName 本科生毕业论文（设计）}}
    \else
      \fancyhead[C]{\xiaowu\ziju{0.08}\songti{\schoolName 本科生专业实践报告（专业实践{\reportStyle}）}}
    \fi
  \else
    \fancyhead[C]{\xiaowu\ziju{0.08}\songti{\schoolName\zufeDegreeName 学位论文}}
  \fi
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  % 页眉分割线稍微粗一些
  \renewcommand{\headrulewidth}{0.4pt}
}


\ctexset{chapter={
    name = {},
    number = {\arabic{chapter}},
    format = {\heiti \bfseries \centering \zihao{3}},
    aftername = \hspace{9bp},
    pagestyle = ZUFEThesis,
    beforeskip = 32bp,
    afterskip = 32bp,
    fixskip = true,
    % 防止 chapter 换页
    % break = {}
  }
}

\ctexset{section={
    number = {\thechapter.\hspace{4bp}\arabic{section}},
    format = {\heiti \raggedright \bfseries \zihao{4}},
    aftername = \hspace{8bp},
    beforeskip = 20bp plus 1ex minus .2ex,
    afterskip = 18bp plus .2ex,
    fixskip = true,
  }
}

\ctexset{subsection={
    number = {\thechapter.\hspace{3bp}\arabic{section}.\hspace{3bp}\arabic{subsection}},
    format = {\heiti \bfseries \raggedright \zihao{-4}},
    aftername = \hspace{7bp},
    beforeskip = 17bp plus 1ex minus .2ex,
    afterskip = 14bp plus .2ex,
    fixskip = true,
  }
}

\addtocontents{toc}{\protect\hypersetup{hidelinks}}

\renewcommand{\contentsname}{
  \fontsize{16pt}{\baselineskip}
  \normalfont\heiti{目~~~~录}
  \vspace{-8pt}
}
\titlecontents{chapter}[0pt]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\renewcommand{\frontmatter}{
  \pagenumbering{Roman}
  \pagestyle{ZUFEThesis}
}

\renewcommand{\mainmatter}{
  \pagenumbering{arabic}
  \pagestyle{ZUFEThesis}
}

\setlength{\abovecaptionskip}{11pt}
\setlength{\belowcaptionskip}{9pt}

\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\DeclareCaptionFont{mystkaiti}{\mystkaiti}
\captionsetup[figure]{font=mystkaiti,labelsep=quad}

\renewcommand{\thetable}{\thechapter.\arabic{table}}
\DeclareCaptionFont{mystkaiti}{\mystkaiti}
\captionsetup[table]{font={mystkaiti},labelsep=quad,skip=2pt}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

\newcommand{\unnumchapter}[1]{
  \chapter*{\vskip 10bp\textmd{#1} \vskip -6bp}
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}
  \setcounter{section}{0}
}

% 附录入口：让附录中的图、表、公式改用字母编号，与正文分开另行编号。
% \unnumchapter 用 \chapter*，不推进 chapter 也不复位计数器；若拿它当附录入口，
% 图、表、公式会继续沿用正文的编号（issue #8）。因此附录需要专用入口，
% 参考文献、致谢、结论等仍用 \unnumchapter。附录序号用独立计数器，与正文的
% chapter 计数无关：无论正文有几章，第一个附录都是 A。
% 编号规则（依据本科指导手册「正文中的编号」1.7 节）：
%   附录标题：附录A、附录B……
%   图、表：  A1、B2……（字母与数字之间不分隔）
%   公式：    A1、B2……（与图、表一致，与正文的 "章.序号" 不同）
\newcounter{zufe@appendix}
\newcommand{\zufeAppendix}[1]{%
  \stepcounter{zufe@appendix}%            附录序号 A、B、C……
  \renewcommand{\thechapter}{\Alph{zufe@appendix}}%
  \renewcommand{\thefigure}{\thechapter\arabic{figure}}%
  \renewcommand{\thetable}{\thechapter\arabic{table}}%
  \renewcommand{\theequation}{\thechapter\arabic{equation}}%
  % 结论、致谢用 \ctexset{section/number = \arabic{section}} 改写的是全局格式，
  % 若不在附录入口恢复，附录小节会显示为 1、2，与其子节的 A.1.1 不一致。
  \ctexset{section={number={\thechapter.\hspace{4bp}\arabic{section}}}}%
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \chapter*{\vskip 10bp\textmd{附录\thechapter~~~~#1} \vskip -6bp}%
  \phantomsection
  \addcontentsline{toc}{chapter}{附录\thechapter~~~~#1}%
}

% 学位相关的页面编排入口（供 main.tex 调用，使 main.tex 与学位类型无关）---------
% 封面：按学位类型选择 misc/<degree>/cover.tex
\newcommand{\zufeMakeCover}{\input{misc/\zufeDegreeDir/cover}}

% 声明/授权页：本科仅在毕业论文（reportStyle=0）时输出，其余学位均输出
\newcommand{\zufeMakeStatement}{%
  \ifzufeBachelor
    \ifnum\reportStyle=0 \input{misc/bachelor/statement}\fi
  \else
    \input{misc/\zufeDegreeDir/statement}%
  \fi}

% 中英文扉页：仅硕士/博士
% 扉页文件内以 \setlength{\parindent}{0pt} 排自身版面，而这些文件是裸的 \input，
% 没有 titlepage 环境那样的分组，设置会泄漏到后续正文，把整篇论文的首行缩进清零。
% 这里用 \begingroup/\endgroup 把两页整体包住，扉页内部照常生效、出组即恢复。
\newcommand{\zufeMakeTitlePages}{%
  \ifzufeBachelor\else
    \begingroup
      \input{misc/\zufeDegreeDir/titlepage_cn}%
      \input{misc/\zufeDegreeDir/titlepage_en}%
    \endgroup
  \fi}

% 封底：仅硕士/博士，且匿名（盲审）版本不输出
% 封底整页为校名与联系方式，匿名时无法脱敏，直接不生成该页
\newcommand{\zufeMakeBackCover}{%
  \ifanony\else
    \ifzufeBachelor\else
      \input{misc/\zufeDegreeDir/backcover}%
    \fi
  \fi}

% 是否输出致谢：本科专业实践报告（reportStyle!=0）与匿名（盲审）版本不输出，其余均输出
% 致谢普遍包含导师、同门与课题组信息，盲审版按惯例隐去
\newif\ifzufeIncludeAcknowledgement
\AtBeginDocument{%
  \ifanony
    \zufeIncludeAcknowledgementfalse
  \else
    \ifzufeBachelor
      \ifnum\reportStyle=0
        \zufeIncludeAcknowledgementtrue
      \else
        \zufeIncludeAcknowledgementfalse
      \fi
    \else
      \zufeIncludeAcknowledgementtrue
    \fi
  \fi
}
% 学位相关的页面编排入口--------------------------------------------------------------



\RequirePackage{algorithm,algpseudocode,float}
\RequirePackage{lipsum}

% 伪代码跨页-----------------------------------------------------------------------
\makeatletter
\renewcommand{\ALG@name}{算法}
\newenvironment{breakablealgorithm}
  {% \begin{breakablealgorithm}
   \begin{center}
     \refstepcounter{algorithm}% New algorithm
     \hrule height.8pt depth0pt \kern2pt% \@fs@pre for \@fs@ruled
     \renewcommand{\caption}[2][\relax]{% Make a new \caption
       {\raggedright\textbf{\ALG@name~\thealgorithm} ##2\par}%
       \ifx\relax##1\relax % #1 is \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
       \else % #1 is not \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
       \fi
       \kern2pt\hrule\kern2pt
     }
  }{% \end{breakablealgorithm}
     \kern2pt\hrule\relax% \@fs@post for \@fs@ruled
   \end{center}
  }
\makeatother
% 伪代码跨页-----------------------------------------------------------------------

\RequirePackage{listings}
% 用来设置附录中代码的样式
\renewcommand\lstlistingname{代码}
\lstset{
    basicstyle          =   \sffamily,          % 基本代码风格
    keywordstyle        =   \bfseries,          % 关键字风格
    commentstyle        =   \rmfamily\itshape,  % 注释的风格，斜体
    stringstyle         =   \ttfamily,  % 字符串风格
    flexiblecolumns,                % 别问为什么，加上这个
    numbers             =   left,   % 行号的位置在左边
    showspaces          =   false,  % 是否显示空格，显示了有点乱，所以不现实了
    numberstyle         =   \zihao{-5}\ttfamily,    % 行号的样式，小五号，tt等宽字体
    showstringspaces    =   false,
    captionpos          =   t,      % 这段代码的名字所呈现的位置，t指的是top上面
    frame               =   lrtb,   % 显示边框
}

\lstdefinestyle{Python}{
    language        =   Python, % 语言选Python
    basicstyle      =   \zihao{-5}\ttfamily,
    numberstyle     =   \zihao{-5}\ttfamily,
    keywordstyle    =   \color{blue},
    keywordstyle    =   [2] \color{teal},
    stringstyle     =   \color{magenta},
    commentstyle    =   \color{red}\ttfamily,
    breaklines      =   true,   % 自动换行，建议不要写太长的行
    columns         =   fixed,  % 如果不加这一句，字间距就不固定，很丑，必须加
    basewidth       =   0.5em,
}

\lstdefinestyle{Java}{
    language        =   [AspectJ]Java, % 语言选Java
    basicstyle      =   \zihao{-5}\ttfamily,
    numberstyle     =   \zihao{-5}\ttfamily,
    keywordstyle    =   \color{blue},
    keywordstyle    =   [2] \color{teal},
    stringstyle     =   \color{magenta},
    commentstyle    =   \color{red}\ttfamily,
    breaklines      =   true,   % 自动换行，建议不要写太长的行
    columns         =   fixed,  % 如果不加这一句，字间距就不固定，很丑，必须加
    basewidth       =   0.5em,
}

\lstdefinestyle{C++}{
    language        =   c++, % 语言选Python
    basicstyle      =   \zihao{-5}\ttfamily,
    numberstyle     =   \zihao{-5}\ttfamily,
    keywordstyle    =   \color{blue},
    keywordstyle    =   [2] \color{teal},
    stringstyle     =   \color{magenta},
    commentstyle    =   \color{red}\ttfamily,
    breaklines      =   true,   % 自动换行，建议不要写太长的行
    columns         =   fixed,  % 如果不加这一句，字间距就不固定，很丑，必须加
    basewidth       =   0.5em,
}

\endinput
%%
%% End of file `zufe.cls'.
