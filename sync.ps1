Set-Location "C:\Users\naoka\Desktop\kdp-lab"

# 新規ファイルを全て検知して追加
git add -A

# 変更がある場合のみ送信
$status = git status --porcelain
if ($status) {
    git commit -m "Auto Sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    git push origin main
    Write-Host "--- GitHubへの送信に成功しました ---" -ForegroundColor Green
} else {
    Write-Host "--- 送信する変更はありません ---" -ForegroundColor Yellow
}

Write-Host "5秒後に自動で閉じます..."
Start-Sleep -Seconds 5