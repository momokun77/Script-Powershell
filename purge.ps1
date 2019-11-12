param([string]$fichier, [int]$date)

Get-ChildItem ($fichier) -File | Where CreationTime -lt (Get-Date).AddDays(-$date) | Remove-Item -Force

#PS C:\Users\[name_user]\desktop> .\purge.ps1 "C:\Users\[name_user]\Desktop\Nouveau dossier" 20
#Ce mettre dans le répertoire où se trouve le script avec la commande [CD] pour l'exécuter.

#La commande Param([type]$variable), cette commande permet d'identifier la partie contenant les paramètres, et d'envoyer au script certaines données
#Get-ChildItem ($fichier) -File Affiche le contenu du dossier entré en paramètre après le script
# Where CreationTime -lt (Get-Date).AddDays(-$date) Cherche un fichier plus vieux de X jours, entré en paramètre secondaire après le script
#Remove-Item -Force Supprime le fichier concerné
