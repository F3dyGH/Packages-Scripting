
function sousmenusearch ()
{
val=$(yad  --center --width 300 --title "Sous menu search:" --image "dialog-info" --buttons-layout=center --entry --entry-label="donner votre choix" --text "\n \t\t\t\t\t\t\t\t\t\t\t\t
	 Tapez 1 : Si vous voulez chercher un paquet à travers son nom:
	Tapez 2 : Si vous voulez verifier l'existence d'un paquet quelconque:");

	case $val in
	1) search
sleep 6
clear
		;;
	2) verify
sleep 6
clear
		;;

esac

}
