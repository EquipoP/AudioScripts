#! /bin/bash

SINK=$(pactl list short sinks)

if [[ $SINK =~ .*analog-stereo.* ]]
then 
    echo analog detected
    pacmd set-card-profile 0 output:hdmi-stereo-extra1
    if [ $? == "0" ]
    then
        kdialog --msgbox "Salida de audio cambiada a HDMI" --title "SwapAudio"
    fi
elif [[ $SINK =~ .*hdmi-stereo-extra1.* ]]
then
    echo HDMI detected
    pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
    if [ $? == "0" ]
    then
        kdialog --msgbox "Salida de audio cambiada a Analog Duplex" --title "SwapAudio"
    fi
else 
    kdialog --msgbox "No se reconoce la salida de audio seleccionada" --title "SwapAudio"
fi

