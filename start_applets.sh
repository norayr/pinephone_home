for i in wmwifi bubblemon shermans_applet wmcube
do
  echo $i
  j=`pgrep $i`
  kill -s CONT $j
done

