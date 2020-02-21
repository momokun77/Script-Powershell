#Se mettre dans le répertoire où se trouve le script avec la commande [CD] pour l'exécuter.
# PS C:\Users\[name_user]\desktop> .\[name].ps1 "C:\Users\[name_user]\Desktop\Nouveau dossier" 20

param([string]$fichier, [int]$date)

$name = Get-ChildItem -Path ($fichier) -File | Select-Object -ExpandProperty Fullname | Where CreationTime -lt (Get-Date).AddDays(-$date)
# $name est la variable où se trouve les fichiers et ainsi que leurs extensions de fichier. Il comprend leurs chemins d'accès entré en paramètre après le nom du script.
# Exemple d'exécution : C:\Users\[name_user]\Desktop\files1.txt

ForEach ($PC in $name) {
   $PC2 = $PC | ForEach-Object {$_.split(".")[0]} 
   Compress-Archive -LiteralPath $PC -DestinationPath $PC2
   #Compact -LiteralPath $PC -DestinationPath $PC2 #Windows Server
}
# On créé une boucle pour archiver chaque fichiers qui se trouvent dans le dossier.
# {$_.split(".")[0]} permet de se débarrasser de l'extension des fichiers. 
# $PC2 est ainsi un nom d'archive correcte (en incluent le chemin d'accès) pour chaque fichier à archiver.
# $PC2 correspond à l'exemple : C:\Users\[name_user]\Desktop\files1
# Compress-Archive -LiteralPath $PC -DestinationPath $PC2 compresse les fichiers par fichier grâce aux variables

#Windows server 2012r2 remplacer le Compress-Achive par Compact
# Compact -LiteralPath $PC -DestinationPath $PC2 compresse les fichiers par fichier grâce aux variables
