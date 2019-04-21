#! /bin/bash


CHOICES=$(kdialog --menu "Seleccione la salida de audio:" 1 "HDMI" 2 "Analog Duplex" --title "RotAudio")

if [ $? == "1" ]
then 
    echo Well... Nevermind
elif [ $CHOICES == "1" ]
then
        pacmd set-card-profile 0 output:hdmi-stereo-extra1
        if [ $? == "0" ]
        then
            kdialog --msgbox "Salida de audio cambiada a HDMI" --title "RotAudio"
        fi
elif [ $CHOICES == "2" ]
then
        pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
        if [ $? == "0" ]
        then
            kdialog --msgbox "Salida de audio cambiada a Analog Duplex" --title "RotAudio"
        fi
else 
        kdialog --msgbox "Error de entrada"
fi
