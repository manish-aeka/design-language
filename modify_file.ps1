$file = "c:\Users\manis\Desktop\Work\project\Aibii-Product\design-language\settings-profile\index.html"
$content = [System.IO.File]::ReadAllText($file)

$p1 = "text-indigo-600 hover:bg-indigo-50 transition-colors"
$p2 = "text-red-500 hover:bg-red-50 transition-colors"
$p3 = "> Delete</button>"
$p4 = "      Delete\r?\n                    </button>"

$m1 = [regex]::Matches($content, [regex]::Escape($p1)).Count
$m2 = [regex]::Matches($content, [regex]::Escape($p2)).Count
$m3 = [regex]::Matches($content, [regex]::Escape($p3)).Count
$m4 = [regex]::Matches($content, $p4).Count

Write-Host "Initial Counts: P1=$m1, P2=$m2, P3=$m3, P4=$m4"

$content = $content -replace [regex]::Escape($p1), "text-indigo-600 bg-indigo-50 hover:bg-indigo-100 transition-colors"
$content = $content -replace [regex]::Escape($p2), "text-red-500 bg-red-50 hover:bg-red-100 transition-colors"
$content = $content -replace [regex]::Escape($p3), "> Remove</button>"
$content = $content -replace $p4, "      Remove`r`n                    </button>"

[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Done"
