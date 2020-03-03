function install1 ()
{
	echo -e "Veuillez donner le nom du paquet à installer!"
	read a
	sudo dpkg -i $a 2>>fich | tee historique.txt
}

function remove ()
{
	echo -e "Veuillez donner le nom du paquet à supprimer!"
	read b
	sudo apt dpkg -r $b 2>>fich | tee historique.txt
}

function listcount()
{
count=`dpkg -l | wc -l ` 
echo "Vous avez $count paquets installés sur votre machine!"
}

function sousmenudpkg ()
{

val=$(yad  --center --width 300 --title "Sous Menu dpkg:" --image "dialog-info" --buttons-layout=center --entry --entry-label="donner votre choix" --text "\n \t\t\t\t\t\t\t\t\t\t\t\t
	Tapez 1 : Si vous voulez installer des paquets.
	Tapez 2 : Si vous voulez supprimer des paquets.
	Tapez 3 : Si vous voulez voir combien de paquets installés sur votre machine.");
ret=$? 
if [[ $ret -eq 252 ]]; then
    echo "Application Closed"
    exit 0
fi
	
case $val in
	1) install1
		;;
	2) remove
		;;
	3)  listcount
sleep 8
clear
		;;
esac

}
