. fonctions.sh

source SOUSMENUdpkg.sh

. SOUSMENUdpkg.sh

source SOUSMENUsearch.sh

. SOUSMENUsearch.sh

 while true;

do
val=$(yad  --center --width 300 --height=300 --title "Menu Principal" --image "dialog-home" --buttons-layout=center --entry --entry-label="donner votre choix" --text "\n \t\t\t\t\t\t\t\t\t\t\t\t
1- Introduction de l'application:
2- Mise a jour de tout les paquets du systeme:
3- Nettoyage du cache du gestionnaire des paquets:
4-Afficher le sous menu search ou se trouvent les fonctions de recherche et de verification:
5- Afficher le sous menu de dpkg:
6- Afficher l'aide:
tapez Q pour quitter\n\n");
ret=$? 
[[ $ret -eq 1 ]] && echo "Cancel clicked" && exit 0
if [[ $ret -eq 252 ]]; then
    echo "Application Closed"
    exit 0
fi


case $val in 
 
	1) introduction
			;;
		2) update
sleep 1
clear
			;;
		3) clean
sleep 1
clear
			;;
		4) sousmenusearch
sleep 1
clear
			;;
     

		5) sousmenudpkg
sleep 1
clear
			;;
		6) help1
sleep 1
clear
			;;



		"q") echo -e  "Merci beaucoup ! ";
		break
		  ;;
		*) echo "Faites attention! Vous avez fait le mauvais choix"
	esac
	
done
