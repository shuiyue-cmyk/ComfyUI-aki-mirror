$src = "D:\ComfyUI-aki-v3.2.7z"
$dstDir = "D:\release-parts"
$base = "ComfyUI-aki-v3.2.7z"
$partSize = 1992294400  # 1900 MiB, GitHub Release 单文件 2GB 上限留余量
New-Item -ItemType Directory -Force -Path $dstDir | Out-Null
$fs = [IO.File]::OpenRead($src)
try {
  $buf = New-Object byte[] (80MB)
  $partNo = 1
  $partBytes = 0
  $out = $null
  try {
    while (($read = $fs.Read($buf, 0, $buf.Length)) -gt 0) {
      $off = 0
      while ($read -gt 0) {
        if (($null -eq $out) -or ($partBytes -eq $partSize)) {
          if ($null -ne $out) { $out.Close() }
          $partFile = Join-Path $dstDir ("{0}.part{1:D3}" -f $base, $partNo)
          Write-Host "Writing $partFile"
          $out = [IO.File]::Create($partFile)
          $partNo++
          $partBytes = 0
        }
        $room = $partSize - $partBytes
        $take = [Math]::Min($read, $room)
        $out.Write($buf, $off, $take)
        $off += $take
        $read -= $take
        $partBytes += $take
      }
    }
  } finally {
    if ($null -ne $out) { $out.Close() }
  }
  Write-Host "Done, parts: $($partNo - 1)"
  Get-ChildItem $dstDir | Select-Object Name, Length
} finally {
  $fs.Close()
}
