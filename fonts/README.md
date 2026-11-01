# fonts/ — 自备字体目录

本模板排版需要以下三种中文字体，它们都是**商业字体**，随 Windows / Office 授权使用，
但**不包含再分发授权**，因此本仓库不提供这些字体文件。

| 用途 | 字体 | 模板命令 | 自备文件名（放在本目录） |
| --- | --- | --- | --- |
| 宋体 | SimSun / 中易宋体 | `\songti`、**正文主字体** | `simsun.ttf` |
| 黑体 | SimHei / 中易黑体 | `\heiti`、标题与封面标签 | `simhei.ttf` |
| 楷体 | KaiTi / 中易楷体 | `\kaishu` | `simkai.ttf` |
| 仿宋 | FangSong / 中易仿宋 | `\fangsong` | `simfang.ttf` |
| 隶书 | LiSu / 中易隶书 | `\lishu` | `simli.ttf` |
| 宋体（生僻字） | STSong / 华文宋体 | `\mystsong` | `stsong.ttf` |
| 楷体（生僻字） | STKaiti / 华文楷体 | `\mystkaiti` | `stkaiti.ttf` |

文件名必须**精确等于**上表的基名（`simhei.ttf` 可以，`mysimhei.ttf`、`simhei-regular.ttf` 不行）；
扩展名 `.ttf`、`.TTF`、`.otf`、`.OTF` 都会被尝试，按此顺序取第一个命中的。
Windows 上大小写不敏感（`SimHei.ttf` 同样有效）。

本目录里存在 `simsun.ttf` 时，**正文主字体**（不带任何字体命令的文字）也一并换成它，
因此裸文本同样可以显示生僻字；不存在时正文仍由 ctex 决定。正文的加粗与斜体跟随
`\songti` 的设置，用 `AutoFakeBold`/`AutoFakeSlant` 合成。

文件名大小写均可（`.ttf`、`.TTF`、`.otf`、`.OTF` 都会被尝试）。

## 是否需要自备

**多数情况不需要。** 模板按以下顺序解析每个字体，命中即用：

1. 本目录下的自备文件（即上表）
2. 本机系统字体（Windows 自带的 `SimHei`、`STSong`、`STKaiti`、`LiSu`；macOS 自带对应字体）
3. ctex 默认中文字体（TeX 发行版自带，通常是 Fandol 或系统字体）

在 Windows 上装好 TeX 发行版后一般能直接落到第 2 步，输出与过去的版本完全一致，
无需下载任何字体。

以下情形建议自备字体：

- 在 Linux / 在线平台（Overleaf、TexPage）编译，且本机或平台没有中文字体，
  此时会落到第 3 步：可以编译，但字形与学校范例略有差异；
- 需要显示**生僻字**（如「垚」「瑄」）。Fandol 不含生僻字，落到第 3 步时
  `\mystsong`、`\mystkaiti` 的生僻字能力会失效，编译日志会给出警告。

## 获取方式

字体文件可从本机 `C:\Windows\Fonts` 复制（`STSONG.TTF`、`STKAITI.TTF`、`simhei.ttf`），
复制后改名为上表对应的小写文件名即可。

> 这些字体随系统或 Office 授权给你个人使用，复制到本目录仅用于本机编译。
> **请勿**把本目录提交到公开仓库、随论文源码打包分发，或通过任何渠道再分发字体文件。
> `.gitignore` 已排除本目录下的字体文件。

## 未自备时的表现

模板不会因此编译失败。缺失的字体会回退到 ctex 默认字体，并在编译日志中给出
`Class zufe Warning`，说明是哪一种字体回退、以及影响（如生僻字可能无法显示）。
