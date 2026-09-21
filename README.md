# ComfyUI-aki-mirror

秋叶 AAaki ComfyUI 整合包（含绘世启动器）**公益镜像仓**，方便可以直接访问 GitHub 的用户下载，
不用再为了跑满宽带而去开百度网盘 / 夸克网盘会员。

> ⚠️ 本仓仅做公益分流，不拥有任何版权。整合包与启动器版权归原作者所有。
> 如原作者要求删除，本仓会立即删除相关文件。**严禁将本仓文件用于倒卖。**

## 原作者与出处

- 原作者：bilibili `@秋葉aaaki`，主页：https://space.bilibili.com/12566101
- 整合包说明动态（以原作者最新动态为准）：https://www.bilibili.com/opus/1159516886456598528
- 包内自带文件：`bilibili@秋葉aaaki.txt`、`用户协议.txt`、`使用教程+常见问题.txt`
- AI 绘画内核 `ComfyUI` 为开源项目，启动器【绘世】是完全免费的软件（见包内原文：“严禁倒卖。如有发现，请及时举报。”）

## 镜像版本

- 版本：`v3.2`（顶层目录 `ComfyUI-aki-v3.2`）
- 原包文件名：`ComfyUI-aki-v3.2.7z`
- 原包体积：2,996,610,271 字节（约 2858 MiB）
- 解包后：77,790 个文件 / 11,443 个文件夹，约 6,642,372,969 字节（约 6.19 GiB）
- 压缩格式：7z，Solid，`Delta ARM64 LZMA2:28 LZMA:20 BCJ2`，9 Blocks
- 是否加密：经 `7z l` 测试，**列表无需密码即可读取**（v3.2 包本身未加密；若解压时个别版本索要密码，请先试原作者常用密码 `bilibili-秋葉aaaki`，并以原作者动态为准）
- 包内容（解压后顶层）：
  - `绘世启动器.exe`（约 2MB，启动入口）
  - `ComfyUI/`（约 222MB，ComfyUI 本体 + 预装节点）
  - `python/`（约 5.5GB，已配好 torch/cuda 环境，最大头）
  - `git/`（约 66MB，便携 git）
  - `.launcher/`（约 75MB，启动器依赖：aria2c / micromamba / git2 / tensile-gfx*.extpack / zluda 等）
  - `.cache/`（约 23MB）
  - `.app_path`、`bilibili@秋葉aaaki.txt`、`使用教程+常见问题.txt`、`用户协议.txt`

## 下载与校验（v3.2）

GitHub 单个 Release 文件上限 2GB，而原包约 2.8GB，所以本仓把原包**原样切分**成 2 个分卷传到 Release：

- `ComfyUI-aki-v3.2.7z.part001`（1,992,294,400 字节 = 1900 MiB）
- `ComfyUI-aki-v3.2.7z.part002`（余下约 1,003,815,871 字节）

切分是纯二进制切割，**没有重新压缩**，合并后即得与原包逐字节一致的 `ComfyUI-aki-v3.2.7z`。

步骤（Windows）：

1. 从本仓右侧 **Releases → v3.2** 下载全部 `*.part00*` 到同一个空文件夹；
2. 双击运行本仓 `tools/merge.bat`（自动按顺序合并 + 自动 SHA256 校验）；
   或手动执行：`copy /B ComfyUI-aki-v3.2.7z.part001+ComfyUI-aki-v3.2.7z.part002 ComfyUI-aki-v3.2.7z`
3. 校验哈希（merge.bat 已自动做；手动命令）：`certutil -hashfile ComfyUI-aki-v3.2.7z SHA256`
4. 用 [7-Zip](https://www.7-zip.org/) 解压，运行 `绘世启动器.exe`。

步骤（Linux / macOS，仅合并校验；ComfyUI-aki 本体是 Windows 环境）：

```bash
cat ComfyUI-aki-v3.2.7z.part00* > ComfyUI-aki-v3.2.7z
sha256sum -c SHA256SUMS.txt
```

## 哈希

`SHA256SUMS.txt`（合并后的原包）：

```
F53864B14A28044ACCF7F94D57C84652103D2D6966F5496F281FCF30596A689D *ComfyUI-aki-v3.2.7z
```

MD5（备用）：`4F49D429155F775A56C0E35B221D2467`

> 分卷各自的哈希见 Release 页面 `SHA256SUMS.parts.txt`（T2 切分后补充）。

## 目录说明

- `tools/merge.bat`：Windows 一键合并 + 校验
- `tools/merge.sh`：Linux/macOS 合并 + 校验
- `SHA256SUMS.txt`：合并后原包哈希
- 本仓 **不直接存放** 3GB 大包（git 只存说明与脚本，大文件走 Release，避免把仓库撑爆）

## 常见问题

- 下载慢：GitHub Release 在大陆直连本就不快，本镜像主要服务“能直连 GH、但不想开网盘会员”的人；大陆用户仍建议走原作者夸克链接。
- 合并后哈希对不上：说明某个分卷没下全，请对照 Release 页体积重下对应分卷，不要用迅雷等可能改名的工具。
- 解压乱码：包内 `绘世启动器.exe` 在某些解包器列表里会显示为 `????.exe`（编码问题），用 7-Zip 正式版解压即正常。
- 启动报错：先看包内 `使用教程+常见问题.txt`，再用启动器内“疑难解答”扫描；Python 5.5GB，杀软误杀很常见，请加白。
- 要最新版不要 v3.2？v3.2 是手头这份；原作者 2026-01-19 已出新整合包（ComfyUI v0.9.2 / python 3.13.11 / torch 2.9.1+cu130），见置顶 opus 动态。本仓后续可按同样流程追加版本。

## 合规与致谢

1. 本仓为**公益镜像**，仅解决“网盘限速”问题，不做任何修改与二次打包；
2. 署名与原文（用户协议 / bilibili@秋葉aaaki.txt）均保留，原包逐字节一致；
3. **严禁倒卖**，违者请向原作者举报；
4. 若原作者或版权方要求下架，本仓将在第一时间删除 Release 文件与相关说明；
5. 感谢秋葉aaaki 长期维护免费整合包与绘世启动器，以及 ComfyUI 开源社区。

---

Release 命名：`v3.2`，标题 `ComfyUI-aki v3.2 公益镜像`。后续新版本按 `vX.Y` 追加，不覆盖旧版。
