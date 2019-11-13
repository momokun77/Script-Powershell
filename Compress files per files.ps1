#Ce mettre dans le répertoire où se trouve le script avec la commande [CD] pour l'exécuter.
# PS C:\Users\[name_user]\desktop> .\[name].ps1 "C:\Users\[name_user]\Desktop\Nouveau dossier" 20

param([string]$fichier, [int]$date)

$name = Get-ChildItem -Path ($fichier) -File | Select-Object -ExpandProperty Fullname | Where CreationTime -lt (Get-Date).AddDays(-$date)
# $name est la variable où se trouve les fichiers et ainsi que leur extensions de fichier. Il comprend leurs chemins d'accès entré en paramètre après le nom du script.
# Exemple : C:\Users\[name_user]\Desktop\files1.txt

ForEach ($PC in $name) {
   $PC2 = $PC | ForEach-Object {$_.split(".")[0]} 
   Compress-Archive -LiteralPath $PC -DestinationPath $PC2 
}
# On créé une boucle pour archiver chaque fichier qui se trouve dans le dossier.
# {$_.split(".")[0]} permet de se débarrasser de l'extension des fichiers. 
# $PC2 est ainsi un nom d'archive correcte (en incluent le chemin d'accès) pour chaque fichier à archiver.
# $PC2 correspond à l'exemple : C:\Users\[name_user]\Desktop\files1
# Compress-Archive -LiteralPath $PC -DestinationPath $PC2  compresse les fichier par fichier grâce au variable.
