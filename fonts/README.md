# fonts/ — 自备字体目录

**只有当某个字体命令无法渲染生僻字时，才需要用到本目录。**

做法是：找一个支持生僻字的字体文件，放到本目录下，并按下面表格里的文件名重命名。
模板编译时会自动优先使用它，论文源码不用改任何一行。

## 文件名

文件名即用途，与命令一一对应：

| 命令 | 自备文件名 | 建议使用的字体 |
| --- | --- | --- |
| `\songti`（含**正文主字体**） | `songti.ttf` | `simsun.ttc`（中易宋体）——覆盖最全，见下方说明 |
| `\heiti` | `heiti.ttf` | `simhei.ttf`（中易黑体） |
| `\kaishu` | `kaishu.ttf` | `simkai.ttf`（中易楷体） |
| `\fangsong` | `fangsong.ttf` | `simfang.ttf`（中易仿宋） |
| `\lishu` | `lishu.ttf` | `simli.ttf`（中易隶书） |

`\kaishu` 也接受旧习惯的 `kaiti.ttf` 作文件名，两者同时存在时 `kaishu.ttf` 优先。

文件名必须**精确等于**上表的基名（`songti.ttf` 可以，`my-songti.ttf`、
`songti-regular.ttf` 不行）；扩展名 `.ttf`、`.TTF`、`.otf`、`.OTF`、`.ttc`、`.TTC`
都会尝试，按此顺序取第一个命中的。Windows 上大小写不敏感（`Songti.ttf` 同样有效）。

`.ttc`（字体集合）可直接放入，如 `C:\Windows\Fonts\simsun.ttc` 改名成 `songti.ttc` 即可，
无需转成单个字体文件。模板取集合中的**第一个字族**——`simsun.ttc` 的第一个正是 SimSun，
所以无需额外处理；若你用的 `.ttc` 第一个字族不是想要的那个，请先自行拆分或用其它字体。

本目录里存在 `songti.ttf` 时，**正文主字体**（不带任何字体命令的文字）也一并换成它，
因此裸文本同样可以显示生僻字。

> 文件名只是「这个字体供哪条命令使用」的标记，与字体本体的名称无关：
> 把 `STSONG.TTF` 改名成 `songti.ttf` 完全没有问题，这也是上表建议的做法。

## 是否需要自备

**多数情况不需要。** 模板按以下顺序解析每个字体，命中即用：

1. 本目录下的自备文件（即上表）
2. 本机系统字体（Windows 自带的 `SimSun`、`SimHei`、`KaiTi`、`FangSong`、`LiSu` 等；macOS 自带对应字体）
3. ctex 默认中文字体（TeX 发行版自带，通常是 Fandol）

在 Windows 上装好 TeX 发行版后一般能直接落到第 2 步，输出与过去的版本完全一致，
无需下载任何字体。

只有落到第 3 步（如 Linux 或 Overleaf、TexPage 等在线平台）时，才需要考虑自备：
Fandol 不含生僻字，「垚」「瑄」「喆」「堃」「赟」「珺」这类字会缺字，编译日志会给出
`Class zufe Warning`，指明是哪一种字体缺失。**日志里有几条警告，就说明有几种字体需要自备**。

## 获取方式

字体文件从本机 `C:\Windows\Fonts` 复制，按上表改名即可。**优先选中易（`sim*.ttf`）那一套**，
不要用华文宋体/华文楷体（`STSONG.TTF`、`STKAITI.TTF`）。

实测（Windows 10 自带版本，统计字体 cmap 覆盖）中易各款的覆盖都**不低于**华文款：

| 字体 | 基本区 U+4E00–9FFF | 扩展 A U+3400–4DBF |
| --- | --- | --- |
| SimSun | 20992 | 6592 |
| SimHei / KaiTi / FangSong | 20902 | 6582 |
| LiSu | 20902 | **0** |
| STSong / STKaiti | 20902 | **0** |

华文宋体、华文楷体、隶书都不含扩展 A 区，像「䶮」（U+4DAE）这类字会缺字；SimSun 与
SimHei/KaiTi/FangSong 都含。实际编译验证：同一篇含「垚瑄喆堃赟珺䶮」的文档，用
`simsun.ttc`、`simkai.ttf` 只缺「𠀀」（扩展 B 区，这几款都不含），用 `STSONG`、`STKAITI`
则「䶮」也缺。旧版 README 称华文款覆盖更全，与实测不符。

模板样张 `chapters/1_introduction.tex` 里用的生僻字示例是「垚瑄喆堃赟珺」——六个字都满足
**Fandol 缺、五个系统字体全有**，因此既能测出字体差异，又不会在某个字体下变成缺字。
「鑫」「淼」「焱」这类字 Fandol 也有，用来验证看不出区别；「䶮」则隶书缺，也不适合。

> `C:\Windows\Fonts\simsun.ttc` 是 `.ttc`（字体集合），改名为 `songti.ttc` 放入本目录即可，
> 无需转格式，详见上文「文件名」一节。改成 `songti.ttf` 也可以——XeTeX 按文件内容识别，
> 不依赖扩展名，但两种写法里 `.ttc` 更不容易让人误解。

> 这些字体随系统或 Office 授权给你个人使用，复制到本目录仅用于本机编译。
> **请勿**把本目录提交到公开仓库、随论文源码打包分发，或通过任何渠道再分发字体文件。
> `.gitignore` 已排除本目录下的字体文件。

## 未自备时的表现

模板不会因此编译失败。缺失的字体会回退到 ctex 默认字体（`\lishu` 回退为黑体），
并在编译日志中给出 `Class zufe Warning`，说明是哪一种字体、影响如何。
