#!/bin/bash

#Variables de colores, ej. echo -e "${verde} Verificando software necesario.${borra_colores}"
rojo="\e[0;31m\033[1m" #rojo
verde="\e[;32m\033[1m" 
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
rosa="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
borra_colores="\033[0m\e[0m" #borra colores

##verificacion de conexion y tambien de fostware necesario
clear
echo -e ""
echo -e "${verde} Verificando software necesario.${borra_colores}"
echo -e ""
## Vericica conexion a internet
    if ping -c1 google.com &>/dev/null;
    then
        echo -e " [${verde}ok${borra_colores}] Conexion a internet."
        conexion="si" #sabemos si tenemos conexion a internet o no
    else
        echo -e " [${rojo}X${borra_colores}] Conexion a internet."
        conexion="no" #sabemos si tenemos conexion a internet o no
    fi
    
for paquete in wget git wmctrl figlet diff fping nano nmap #paquetes a instalar separado por espacios, principales (wget git wmctrl figlet diff)
do
    which $paquete 2>/dev/null 1>/dev/null 0>/dev/null #comprueba si esta el programa llamado programa
    sino=$? #recojemos el 0 o 1 del resultado de which
    contador="1" #ponemos la variable contador a 1
    while [ $sino -gt 0 ] #entra en el bicle si variable programa es 0, no lo ha encontrado which
    do
        if [ $contador = "4" ] || [ $conexion = "no" ] #si el contador es 4 entre en then y sino en else
        then #si entra en then es porque el contador es igual a 4 y no ha podido instalar o no hay conexion a internet
            echo ""
            echo -e " ${amarillo}NO se ha podido instalar ($paquete).${borra_colores}"
            echo -e " ${amarillo}Intentelo usted con la orden:${borra_colores}"
            echo -e " ${rojo}-- sudo apt install $paquete --${borra_colores}"
            echo -e ""
            echo -e " ${rojo}No se puede ejecutar el script.${borra_colores}"
            echo ""
            exit
        else #intenta instalar
            echo " Instalando $paquete. Intento $contador/3."
            sudo apt install $paquete -y 2>/dev/null 1>/dev/null 0>/dev/null
            let "contador=contador+1" #incrementa la variable contador en 1
            which $paquete 2>/dev/null 1>/dev/null 0>/dev/null #comprueba si esta el programa en tu sistema
            sino=$? ##recojemos el 0 o 1 del resultado de which
        fi
done
    echo -e " [${verde}ok${borra_colores}] $paquete."

done
echo -e ""
echo -e "${verde} Continuamos...${borra_colores}"
sleep 2

#comprueba actualiczacion del script
repositorio="https://github.com/sukigsx/Intrusos" #variable de la direccion del repositorio del script
if wget -S --spider $repositorio &>/dev/null; #comprueba que exista el repositorio
then
        if [ -e /usr/bin/$0 ] #comprueba si se ha instalado el script con el deb, comprobando el fichero /usr/bin/nombre_del_script.sh
        then
            ruta="/usr/bin"
            mkdir /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
            git clone $repositorio /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
            diff /tmp/com_update/codigo/$0 $ruta/$0 2>/dev/null 1>/dev/null 0>/dev/null
            if [ $? = "0" ] 2>/dev/null 1>/dev/null 0>/dev/null
            then
                echo -e " [${verde}ok${borra_colores}] script, esta actualizado."
            else
                echo -e " [${rojo}X${borra_colores}] ${amarillo}script NO actualizado, puedes actualizarlo en la opcion ( 0 ).${borra_colores}";sleep 2
            fi
            rm -r /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
        else
            ruta=$(pwd)
            mkdir /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
            git clone $repositorio /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
            diff /tmp/com_update/codigo/$0 $ruta/$0 2>/dev/null 1>/dev/null 0>/dev/null
            if [ $? = "0" ] 2>/dev/null 1>/dev/null 0>/dev/null
            then
                echo -e " [${verde}ok${borra_colores}] script, esta actualizado."
            else
                echo -e " [${rojo}X${borra_colores}] ${amarillo}script NO actualizado, puedes actualizarlo en la opcion ( 0 ).${borra_colores}";sleep 3
            fi
            rm -r /tmp/com_update 2>/dev/null 1>/dev/null 0>/dev/null
        fi
else
        echo ""
        echo -e " ${amarillo}El repositorio (${rojo} $repositorio ${amarillo}), NO esta accesible.${borra_colores}"
        echo -e " ${amarillo}Imposible la comprobacion de actualizaciones del script.${borra_colores}"
        echo ""
fi
sleep 2

#maximiza la terminal.
wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz

while :
do
clear
#maximiza la terminal.
wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
echo -e "${rosa}"; figlet -c sukigsx; echo -e "${borra_colores}"
echo ""
echo -e "${verde} Diseñado por sukigsx / Contacto:   sukigsx.mbsistemas@gmail.com${borra_colores}"
echo -e "${verde}                                    https://mbsistemas.ddns.net${borra_colores}"
echo ""
echo -e "${verde} Nombre del script < $0 > Comprueba tu red lan/wifi de Intrusos.  ${borra_colores}"
echo ""
echo -e "     0. ${azul}Actualiza este scripts.${borra_colores}"
echo -e ""
echo -e "     1. ${azul}Actualizacion de sistema con update.${borra_colores}"
echo -e "     2. ${azul}Actualizacion de sistema con upgrade.${borra_colores}"
echo -e "     3. ${azul}Actualizar sistema completo con update y upgrade.${borra_colores}"
echo -e "     4. ${azul}Actualizar completo. ( Solo valido para kde ).${borra_colores}"
echo -e "     5. ${azul}Instalar repositorios y actualizar.${borra_colores}"
echo ""
echo -e "     6. ${azul}Instalar software de repositorios.${borra_colores}"
echo -e "     7. ${azul}Instalar software externo.${borra_colores}"
echo ""
echo -e "     8. ${azul}Buscar equipos en la red.${borra_colores}"
echo -e "     9. ${azul}Conectar a equipo de red.${borra_colores}"
echo ""
echo -e "    40. ${azul}Instalar scripts de sukigsx.${borra_colores}"
echo ""
echo -e "    90. ${azul}Ayuda.${borra_colores}"
echo -e "    99. ${azul}Salir.${borra_colores}"
echo ""
echo -n " Seleccione una opcion del menu --->>> "
read opcion
case $opcion in
    
    0) #actualiza el script
        if [ -e /usr/bin/$0 ] #comprueba si se ha instalado el script con el deb, comprobando el fichero /usr/bin/inicio.sukigsx.sh
        then
            ruta="/usr/bin"
            cd /tmp
            mkdir temporal_update
            git clone $repositorio /tmp/temporal_update
            cd /tmp/temporal_update/codigo/
            sudo chmod +x $ruta/*.sukigsx.sh
            sudo cp -r /tmp/temporal_update/codigo/* $ruta
            sudo rm -r /tmp/temporal_update
            clear
            echo "";
            echo -e "${verde} Script actualizado. Tienes que reiniciar el script para ver los cambios.${borra_colores}";
            echo "";
            read -p " Pulsa una tecla para continuar." pause
            ctrl_c;
        else
            ruta=$(pwd)
            cd /tmp
            mkdir temporal_update
            git clone $repositorio /tmp/temporal_update
            cd /tmp/temporal_update/codigo/
            sudo chmod +x $ruta/*.sukigsx.sh
            sudo cp -r /tmp/temporal_update/codigo/* $ruta
            sudo rm -r /tmp/temporal_update
            clear
            echo "";
            echo -e "${verde} Script actualizado. Tienes que reiniciar el script para ver los cambios.${borra_colores}";
            echo "";
            read -p " Pulsa una tecla para continuar." pause
            ctrl_c;
        fi;; 
        
    90) #ayuda
        ayuda;;
                
    99) #salida
        ctrl_c;;

    *)  #se activa cuando se introduce una opcion no controlada del menu
        echo "";
        echo -e " ${amarillo}OPCION NO DISPONIBLE EN EL MENU.    Seleccion 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 40, 90 o 99 ${borra_colores}";
        echo -e " ${amarillo}PRESIONA ENTER PARA CONTINUAR ........${borra_colores}";
        echo "";
        read pause;;
esac
done
