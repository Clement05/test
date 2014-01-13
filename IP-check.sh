#! /bin/bash
#envoi de l'adresse IP si elle a change

#recuperation de l'ancienne ip
adrip=$(grep [1-9] < /etc/ip.txt)

#recuperation de la nouvelle ip
adrip2=$(wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1)

#test de l'ip
if [ $adrip != $adrip2 ]
then
        echo $adrip2 | mail -s "nouvelle ip" mail@fai.com
fi

#mise a jour adresse dans le fichier
echo $adrip2 > /etc/ip.txt
