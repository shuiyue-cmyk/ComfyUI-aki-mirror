$parts = @("D:\release-parts\ComfyUI-aki-v3.2.7z.part001", "D:\release-parts\ComfyUI-aki-v3.2.7z.part002")
$expect = "F53864B14A28044ACCF7F94D57C84652103D2D6966F5496F281FCF30596A689D"
$sha = [Security.Cryptography.SHA256]::Create()
$buf = New-Object byte[] (4MB)
foreach ($p in $parts) {
  $fs = [IO.File]::OpenRead($p)
  try {
    while (($n = $fs.Read($buf, 0, $buf.Length)) -gt 0) {
      $sha.TransformBlock($buf, 0, $n, $null, 0) | Out-Null
    }
  } finally { $fs.Close() }
}
$sha.TransformFinalBlock($buf, 0, 0) | Out-Null
$got = ($sha.Hash | ForEach-Object { $_.ToString("X2") }) -join ""
Write-Host "GOT:      $got"
Write-Host "EXPECTED: $expect"
if ($got -eq $expect) { Write-Host "VERIFY OK" } else { Write-Host "VERIFY FAIL"; exit 1 }
