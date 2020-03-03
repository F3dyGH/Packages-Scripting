source fonctions.sh
source SOUSMENUdpkg.sh
source SOUSMENUsearch.sh

if  [[ $# = 0 ]]; then 
	. menu.sh

fi

case $1 in 
 
 "-up") update
        ;;

 "-clean") clean
       ;;

 "-search") search
    ;;

 "-verify") verify
;;


  "-help") help1
;;

"-lm")
introduction
;;
"-in")
install1
;;
"-rm")
remove
;;
"-lac")
listcount
;;

*) echo "Vous avez fait le mauvais choix! Veuillez consulter l'aide!"
   esac





