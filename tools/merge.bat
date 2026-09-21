@echo off
setlocal EnableDelayedExpansion
REM ComfyUI-aki v3.2 Windows 一键合并 + SHA256 校验
REM 把本脚本和全部 .part00* 放在同一目录后双击运行

set OUT=ComfyUI-aki-v3.2.7z
set EXPECT=F53864B14A28044ACCF7F94D57C84652103D2D6966F5496F281FCF30596A689D

if exist "%OUT%" (
  echo [INFO] 已存在 %OUT%，先校验现有文件...
  goto :verify
)

echo [1/2] 正在合并分卷...
copy /B ComfyUI-aki-v3.2.7z.part001+ComfyUI-aki-v3.2.7z.part002 "%OUT%"
if errorlevel 1 (
  echo [FAIL] 合并失败，请确认 part001/part002 与本脚本在同一目录。
  pause
  exit /b 1
)

:verify
echo [2/2] 正在校验 SHA256（3GB 文件 need 1-2 分钟）...
for /f "tokens=1" %%H in ('certutil -hashfile "%OUT%" SHA256 ^| findstr /R "^[0-9a-fA-F]*$"') do set GOT=%%H
echo 实际: !GOT!
echo 期望: %EXPECT%
if /I "!GOT!"=="%EXPECT%" (
  echo [OK] 校验通过，可以用 7-Zip 解压了，入口是 绘世启动器.exe
) else (
  echo [FAIL] 哈希不一致，说明分卷没下全或损坏，请重下缺失分卷后删除 %OUT% 重试。
  pause
  exit /b 1
)
pause
