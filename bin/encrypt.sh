INP="/tmp/input.txt"
OUTP="/tmp/output_`date -I`"
RCTP="someone@somewhere.tld"
gpg --armour --output ${OUTP}.asc --encrypt --recipient ${RCPT} ${INP}

