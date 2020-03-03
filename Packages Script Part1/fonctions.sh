#!/bin/bash


function introduction(){
val=$(yad  --center --width 300  --title "Introduction" --image "dialog-info" --buttons-layout=center  --button=Retourner --text "\n \t\t\t\t\t\t\t\t\t\t\t\t 
  Notre application est conçue pour la gestion des paquets systemes. Cette application gere la mise à jour de tous les paquets, le nettoyage du cache du gestionnaire, la consultation des repos de paquets existants afin de verifier l'existance d'un paquet à installer et enfin, la consultation du cache du gestionnaire des paquets afin de verifier l'existence d'un paquet localement.\n
" );
load=$(yad --center --width=300 --height=300 --title "Introduction" --timeout=1 --timeout-indicator=top --text "Retour vers le menu principal ,Veuillez patienter" --text-align=center);
}

function update ()
{
load=$(yad --center --width=300 --height=300 --title "Mise a jour paquets" --timeout=3 --timeout-indicator=top --text "\nPreparation de mise a jour" --text-align=center);
  sudo apt-get upgrade 2>>fich | tee historique.txt
up=$(yad  --center --width 300   --gtk-palette --title "Mise a jour paquets" --image "dialog-info" --buttons-layout=center --button=Retourner --text "\n\t\tLes paquets sont a jour !" --text-center);
}

function clean ()
{
load=$(yad --center --width=300 --height=300 --title "Nettoyage du cache" --timeout=3 --timeout-indicator=top --text " entrain de nettoyer" --text-align=center)
  sudo apt autoclean 2>>histoclean.txt | date 2>>histoclean.txt 
  sudo apt clean 2>>histoclean.txt | date 2>>histoclean.txt
  cache=$(yad  --center --width 300   --gtk-palette --title "Nettoyage du cache" --image "dialog-info" --buttons-layout=center --button=Retourner --text "\n\t\tCache nettoyé!" --text-center);
ret=$?
if [[ $ret -eq 252 ]]; then
    echo "Application Closed"
    exit 0
fi
}

function search ()
{

load=$(yad --center --width=300 --height=300 --title "Recherche du paquets" --timeout=3 --timeout-indicator=top --text " Veuillez patienter" --text-align=center);

res=$( yad --center --title "Recherche" --entry --entry-label="Donner le nom de paquet a rechercher" );

rech=$(   yad --title"Resultats de recherche" read $res; apt-cache policy $res | yad --list --title"Resultat de recherche" --center --width=300 --height=300  --column "Paquet");
}
  


function verify()
{

load=$(yad --center --width=300 --height=300 --title "Verification du paquets" --timeout=3 --timeout-indicator=top --text " Veuillez patienter" --text-align=center);
nom=$( yad --center --title "Verifier" --entry --entry-label="Donner le nom de paquet a verifier" );
echo "Paquet a verif:"
dpkg -l | grep $nom 2>>fich | tee historique.txt


}



function WaitEnter() {
  echo -e "Veuillez s'il vous plait taper sur le bouton entrer pour continuer!"

}

function help1 ()
{
val=$(yad  --center --width 300  --title "Help" --image "dialog-info" --buttons-layout=center  --button=Retourner --text "\n*) -lm Pour Afficher l'introduction.\n
**) -clean Pour nettoyer le cache.
***) -search Pour consulter le repos des paquets existants.
****) -verify Pour consulter le cache du gestionnaire des paquets
*****) -history Pour afficher le fichier 'historique.txt' ou se trouvent les commandes tapées.");
load=$(yad --center --width=300 --height=300 --title "Help" --timeout=1 --timeout-indicator=top --text "Retour vers le menu principal ,Veuillez patienter" --text-align=center);
}




