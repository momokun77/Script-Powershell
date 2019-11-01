param([string]$fichier, [int]$date)

Get-ChildItem ($fichier) -File | Where CreationTime -lt (Get-Date).AddDays(-$date) | Remove-Item -Force