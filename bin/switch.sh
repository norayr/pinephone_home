#set -x
if [ "$1" == "ru" ]
then
#setxkbmap  -model ppkb "us(dvp), am, ru(phonetic)" -option "grp:lalt_shift_toggle"
#setxkbmap  -model ppkb "us(dvp), am, ru" -option "grp:lalt_shift_toggle"
setxkbmap  -model ppkb "us(dvp), am, ru(phonetic_dvorak)" -option "grp:lalt_shift_toggle"
elif [ "$1" == "eo" ]
then
	setxkbmap  -model ppkb "us(dvp), am" -option "esperanto:dvorak,grp:lalt_lshift_toggle,lv3:win_switch"
	#setxkbmap  -model ppkb "us(dvp), am" -option "esperanto:dvorak,grp:lalt_shift_toggle,lv3:ralt_switch"
	#setxkbmap  -model ppkb "us(dvp), am, epo(dvorak)" -option "grp:lalt_shift_toggle,lv3:ralt_switch" 
elif [ "$1" == "ge" ]
then
  setxkbmap  -model ppkb "us(dvp), am, ge" -option "grp:lalt_shift_toggle"
else
  #setxkbmap  -model ppkb "us(dvp), am" -option "grp:lalt_shift_toggle"
	setxkbmap  -model ppkb "us(dvp), am" -option "esperanto:dvorak,grp:lalt_lshift_toggle,lv3:win_switch"
fi
