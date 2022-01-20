#!/bin/bash
#forma de utilizar los colores en echo
#echo -e "${rojo}Estes es el texto en rojo.${borra_colores"
#colores
rojo="\e[0;31m\033[1m" #rojo
verde="\e[;32m\033[1m" 
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
rosa="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
borra_colores="\033[0m\e[0m" #borra colores

# Toma el control al pulsar control + c
trap ctrl_c INT
function ctrl_c()
{
clear
rm /tmp/ipsactivas 2>/dev/null
echo -e "${borra_colores}"
echo ""
echo -e "${azul} ███████  █████  ██      ██ ███████ ███    ██ ██████   ██████ ${borra_colores}"
echo -e "${azul} ██      ██   ██ ██      ██ ██      ████   ██ ██   ██ ██    ██${borra_colores}"
echo -e "${azul} ███████ ███████ ██      ██ █████   ██ ██  ██ ██   ██ ██    ██${borra_colores}"
echo -e "${azul}      ██ ██   ██ ██      ██ ██      ██  ██ ██ ██   ██ ██    ██${borra_colores}"
echo -e "${azul} ███████ ██   ██ ███████ ██ ███████ ██   ████ ██████   ██████ ${borra_colores}"
echo ""
echo -e "${azul}      ██████  ██████   █████   ██████ ██  █████  ███████${borra_colores}"
echo -e "${azul}     ██       ██   ██ ██   ██ ██      ██ ██   ██ ██     ${borra_colores}"
echo -e "${azul}     ██   ███ ██████  ███████ ██      ██ ███████ ███████${borra_colores}"
echo -e "${azul}     ██    ██ ██   ██ ██   ██ ██      ██ ██   ██      ██${borra_colores}"
echo -e "${azul}      ██████  ██   ██ ██   ██  ██████ ██ ██   ██ ███████${borra_colores}"
echo ""

exit
}

#empieza el script
clear
echo ""
echo -e "${azul} ███████  ██    ██  ██   ██  ██  ██████    ███████  ██   ██${borra_colores}"
echo -e "${azul} ██       ██    ██  ██  ██   ██  ██        ██        ██ ██ ${borra_colores}"
echo -e "${azul} ███████  ██    ██  █████    ██  ██   ███  ███████    ███  ${borra_colores}"
echo -e "${azul}      ██  ██    ██  ██  ██   ██  ██    ██       ██   ██ ██ ${borra_colores}"
echo -e "${azul} ███████   ██████   ██   ██  ██   ██████   ███████  ██   ██${borra_colores}"
echo ""
echo -e "${azul} Contacto:${amarillo} sukisx@reparaciondesistemas.com"
echo -e "           www.reparaciondesistemas.com${borra_colores}"
echo "-----------------------------------------------------------"
echo -e '\e[0;34m\033[1m Nombre del script --> \e[0;33m\033[1m  intrusos.sh \033[0m\e[0m'
echo ""
echo -e "${azul} Descripcion."
echo -e "${amarillo} Detecta intrusos en tu red.${borra_colores}"
echo ""
echo -e "${azul} Funcionamiento."
echo -e "${amarillo} Compara el fichero con las ip's permitidas (ipspermitidas).\n Para que pueda contrastar con las ip's activas de tu red.\n Y asi poder detectar los intrusos.${borra_colores}"
echo ""
echo -e "${amarillo}Comprobando software necesario...${borra_colores}"
#Comprueba si estan las aplicaciones instaladas en tu sistema

which fping 2>/dev/null 1>/dev/null 0>/dev/null
fping=$?
while [ $fping -gt 0 ]
do
echo -e "${rojo} Software necesario NO instalado.${borra_colores}"
echo -e "${amarillo} Instalando fping.${borra_colores}"
sleep 1
sudo apt install fping -y 2>/dev/null 1>/dev/null 0>/dev/null
which fping 2>/dev/null 1>/dev/null 0>/dev/null
fping=$?
done

which nmap 2>/dev/null 1>/dev/null 0>/dev/null
nmap=$?
while [ $nmap -gt 0 ]
do
echo -e "${rojo} Software necesario NO instalado.${borra_colores}"
echo -e "${amarillo} Instalando nmap.${borra_colores}"
sleep 1 
sudo apt install nmap -y 2>/dev/null 1>/dev/null 0>/dev/null
which nmap 2>/dev/null 1>/dev/null 0>/dev/null
nmap=$?
done

which nano 2>/dev/null 1>/dev/null 0>/dev/null
nano=$?
while [ $nano -gt 0 ]
do
echo -e "${rojo} Software necesario NO instalado.${borra_colores}"
echo -e "${amarillo} Instalando nano.${borra_colores}"
sleep 1
sudo apt install nano -y 2>/dev/null 1>/dev/null 0>/dev/null
which nano 2>/dev/null 1>/dev/null 0>/dev/null
nano=$?
done
echo -e "${amarillo}Todo el software ${verde}ok${borra_colores}"
sleep 2
while :
do
clear
echo ""
echo -e "${azul} ███████  ██    ██  ██   ██  ██  ██████    ███████  ██   ██${borra_colores}"
echo -e "${azul} ██       ██    ██  ██  ██   ██  ██        ██        ██ ██ ${borra_colores}"
echo -e "${azul} ███████  ██    ██  █████    ██  ██   ███  ███████    ███  ${borra_colores}"
echo -e "${azul}      ██  ██    ██  ██  ██   ██  ██    ██       ██   ██ ██ ${borra_colores}"
echo -e "${azul} ███████   ██████   ██   ██  ██   ██████   ███████  ██   ██${borra_colores}"
echo ""
echo -e "${azul} Contacto:${amarillo} sukisx@reparaciondesistemas.com"
echo -e "           www.reparaciondesistemas.com${borra_colores}"
echo "-----------------------------------------------------------"
echo -e '\e[0;34m\033[1m Nombre del script --> \e[0;33m\033[1m  intrusos.sh \033[0m\e[0m'
echo ""
echo -e "${azul} Descripcion."
echo -e "${amarillo} Detecta intrusos en tu red.${borra_colores}"
echo ""
echo -e "${azul} Funcionamiento."
echo -e "${amarillo} Compara el fichero con las ip's permitidas (ipspermitidas).\n Para que pueda contrastar con las ip's activas de tu red.\n Y asi poder detectar los intrusos.${borra_colores}"
echo ""

#creamos el menu

echo -e "${azul} Opciones disponibles :${borra_colores}"
echo ""
echo -e " ${amarillo} 1)${borra_colores} Crear el fichero de Ip's permitidas."
echo -e " ${amarillo} 2)${borra_colores} Ver el fichero de ip's permitidas."
echo -e " ${amarillo} 3)${borra_colores} Borrar el fichero de ip's permitidas."
echo -e " ${amarillo} 4)${borra_colores} Editar/añadir fichero de ip's permitidas."
echo ""
echo -e " ${amarillo} 5)${borra_colores} Escanear la red."
echo ""
echo -e " ${amarillo} 6)${borra_colores} Instalar servicio en tu maquina (comprobacion automatica)."
echo ""
echo -e " ${amarillo} 7)${borra_colores} Borrado de datos."
echo ""
echo -e " ${amarillo} 8)${borra_colores} Ayuda."
echo ""
echo -e " ${amarillo}99)${borra_colores} Salir.${borra_colores}"
echo ""
echo -e "${rojo} Control + C -->> finalizar script.${borra_colores}"
echo ""
read -p " Introduce opcion -->> " opcion
case $opcion in
	1)	#crear el fichero ipspermitidas borrando el existente.
		clear
		echo -e "${amarillo}- Introducion de ip's permitidas en la Red. -${borra_colores}"
		echo ""
		echo -e "${rojo}--------------- CUIDADO ----------------"
		echo -e "${rojo}Se borrara la lista y se crea una nueva."
		read -p "Deseas continuar (S/N) -->> " SN
		if [ $SN = "S" ]
		then
            rm /home/$(whoami)/.ipspermitidas 2>/dev/null
            echo -e "${amarillo}Introduce las ip's de una en una y (enter).${borra_colores}"
            echo -e "${amarillo}Las ip's tienen que seguir este formato:${borra_colores}"
            echo -e "${verde}"
            hostname -I | awk '{ print $1 }'
            echo ""
            echo -e "${amarillo}Listado de tus ips activas en la red."
            echo -e "Por si quieres utilizar alguna. Un momento...${borra_colores}"
            echo -e "${verde}"
            rango_red=$(hostname -I | awk '{ print $1 }'); fping -g -a $rango_red/24 2>/dev/null | sort
            echo -e "${borra_colores}"
            for  (( ; ; ))
            do
        		read -p "Dime la ip permitida? (S = Salir) -->> " ips
        		if [[ $ips = "S" || $ips = "s" ]]
        		then
                		break
        		else
                		echo "$ips" >> /home/$(whoami)/.ipspermitidas
                		echo -e "${amarillo}$ips > ${verde}Añadida${borra_colores}"; sleep 1
                		echo ""
        		fi
            done
        else 
            echo -e "${borra_colores}"
		
        fi;;
        
		

	2)	#Ver el archivo de ip's permitidas
		clear
		if [ -f /home/$(whoami)/.ipspermitidas ]
		then
            echo -e "${amarillo}Listado de tus ips permitidas.${borra_colores}"
            echo -e "${verde}"
            cat /home/$(whoami)/.ipspermitidas
            echo -e "${borra_colores}"
            echo -e "${amarillo}"
            read -p "Pulsa una tecla para continuar." pause
            echo -e "${borra_colores}"
        else
            clear
            echo -e "${rojo}No existe el fichero ipspermitidas o esta vacio.${borra_colores}"
            echo ""
            echo -e "${amarillo}Crea el fichero primero.${borra_colores}"
            sleep 3
        fi;;

	3)	#Borrar el arivo de ip's permitidas
		clear
		if [ -f /home/$(whoami)/.ipspermitidas ]
		then
            echo -e "${rojo}Se va a proceder a borrar el fichero de ips permitidas.${borra_colores}"
            echo ""
            echo -e "${amarillo}Con este contenido de ips.${verde}"
            echo ""
            cat /home/$(whoami)/.ipspermitidas
            echo -e "${rojo}"
            read -p "¿ Quieres borrarlo ? (S/N) -->> " SN
            echo -e "${borra_colores}"
            if [ $SN = "S" ]
            then
                clear
                echo -e "${verde}Fichero borrado.${borra_colores}"
                rm /home/$(whoami)/.ipspermitidas
                sleep 3
            else
                clear
                echo -e "${verde}Perfecto... NO SE BORRA NADA...${borra_colores}"
                sleep 3
            fi
        else
            clear
            echo -e "${rojo}No existe el fichero ipspermitidas o esta vacio.${borra_colores}"
            echo ""
            echo -e "${amarillo}Crea el fichero primero.${borra_colores}"
            sleep 3
        fi;;

	4)	#editar añadir al fichero de ip's permitidas
		if [[ -f /home/$(whoami)/.ipspermitidas && -s /home/$(whoami)/.ipspermitidas ]]
		then
            echo -e "${amarillo}Editando el fichero ipspermitidas con nano.${borra_colores}"
            clear
            sleep 1
            nano /home/$(whoami)/.ipspermitidas
		else
            clear
            touch /home/$(whoami)/.ipspermitidas 2>/dev/null
            echo -e "${amarillo}Editando el fichero ipspermitidas con nano.${borra_colores}"
            clear
            sleep 1
            nano /home/$(whoami)/.ipspermitidas
		fi;;

	5)	#escanear la red
        #comprueba que exista el fichero ipspermitidas
        if [[ -f /home/$(whoami)/.ipspermitidas && -s /home/$(whoami)/.ipspermitidas ]]
        then
                echo ""
        else
                clear
                echo -e "${rojo}No dispone fichero con las ip's a comparar.${borra_colores}"
                echo -e "${rojo}O el fichero si existe, pero esta vacio.${borra_colores}"
                echo ""
                #crear el fichero ipspermitidas borrando el existente.
                rm /home/$(whoami)/.ipspermitidas 2>/dev/null
                echo -e "${amarillo}Introduce las ip's de una en una y (enter)."
                echo -e "Las ip's tienen que seguir este formato:${borra_colores}"
                echo ""
                hostname -I | awk '{ print $1 }'
                echo ""
                echo -e "${amarillo}Listado de tus ips activas en la red."
                echo -e "Por si quieres utilizar alguna. Un momento...${borra_colores}"
                echo -e "${verde}"
                rango_red=$(hostname -I | awk '{ print $1 }'); fping -g -a $rango_red/24 2>/dev/null | sort
                echo -e "${borra_colores}"
                for  (( ; ; ))
                do
                        read -p "Dime la ip permitida? (S = Salir) -->> " ips
                        if [[ $ips = "S" || $ips = "s" ]]
                        then
                                if [[ -f /home/$(whoami)/.ipspermitidas && -s /home/$(whoami)/.ipspermitidas ]]
                                then
                                    break
                                else
                                    echo -e "${rojo}El fichero esta vacio.....${borra_colores}"
                                    echo -e "${rojo}Introduce las ips....${borra_colores}"
                                    sleep 3
                                fi
                        else
                                echo "$ips" >> /home/$(whoami)/.ipspermitidas
                                echo -e "${amarillo}$ips > ${verde}Añadida${borra_colores}"; sleep 1
                                echo ""
                        fi
                done
        fi 


        #Detecta los rangos de tu red y los pone en el menu de seleccion
        clear
        echo -e "${azul}Escaneando tu red. Un momento por favor....${borra_colores}"
        echo ""
        rango_red=$(hostname -I | awk '{ print $1 }')

        #captura las ips que estas activas en el mopmento del escaneo y crea el fichero ipsactivas para compararlo con el ipslegales
        rm /tmp/ipsactivas 2>/dev/null
        fping -g $rango_red/24 2> /dev/null | grep alive | awk '{ print $1 }' | sort > /tmp/ipsactivas
        mv /home/$(whoami)/.ipspermitidas ips; cat ips | sort > /home/$(whoami)/.ipspermitidas; rm ips
        #realiza la comprobacion de los ficheros de ipslegales con ipsactivas
        echo -e "${azul}Comprobando las ip's activas con las ip's permitidas${borra_colores}"
        echo ""
        echo -e "${azul}Listado de Ip's Permitidas"
        echo -e "${verde}"
        cat /home/$(whoami)/.ipspermitidas
        diff /home/$(whoami)/.ipspermitidas /tmp/ipsactivas | grep ">" 1>/dev/null
        if [ $? = 0 ]
        then
                echo ""
                while :
                do
                echo -e "${rojo}Intruso's detectados en tu red${borra_colores}"
                echo -e "${rojo}"
                diff /home/$(whoami)/.ipspermitidas /tmp/ipsactivas | grep ">"
                echo -e "${borra_colores}"
                read -p "Saber mas del intruso's, ingresa su ip (99 = Atras) -->> " intruso
                if [ $intruso = 99 ]
                then
                        break
                else
                        nmap -sV  $intruso
                        echo ""
                        echo "Pulsa una tecla para continuar"
                        read pause
                        clear
                fi
                done
        else
                echo ""
                echo -e "${verde}No existen intrusos en tu red.${borra_colores}"
                sleep 5
        fi
        rm /tmp/ipsactivas 2>/dev/null;;

    6)  #instala el servicio, comprobacion automatica
        #comprobacion de ssmtp
        clear
        which msmtp 2>/dev/null 1>/dev/null 0>/dev/null
        msmtp=$?
        while [ $msmtp -gt 0 ]
        do
        echo -e "${rojo} Software necesario NO instalado.${borra_colores}"
        echo -e "${amarillo} Instalando msmtp.${borra_colores}"
        sleep 1
        sudo apt install msmtp msmtp-mta -y 2>/dev/null 1>/dev/null 0>/dev/null
        which msmtp 2>/dev/null 1>/dev/null 0>/dev/null
        msmtp=$?
        done

        clear 
        echo -e "${turquesa}-----------------------------${rojo} MUY IMPORTANTE ${turquesa}-----------------------------${borra_colores}"
        echo ""
        echo -e "${amarillo}Este codigo de script esta pensado para funcionar con una cuenta de google.${borra_colores}"
        echo -e ""
        echo -e "${verde}Si estas utilizando para enviar correos una cuenta SIN doble factor PERFECTO.${borra_colores}"
        echo -e ""
        echo -e "${amarillo}Si estas utilizando una cuenta de correo con el ${rojo}doble factor activado NO funcionara.${borra_colores}"
        echo -e ""
        echo -e "${amarillo}Tendras que crear una clave de aplicacion en dicha cuenta de correo."
        echo -e "es muy sencillo, te muestro los pasos:${borra_colores}"
        echo -e "${azul}"
        echo -e " 1- Entra a la configuracion de la cuenta.(gestionar tu cuenta de google)."
        echo -e " 2- Entra en seguridad. (esta al lado iz)."
        echo -e " 3- En la seccion central (inicio de sesion de google), entrar en (contraseñas de aplicacion)."
        echo -e " 4- Te pedira tus credenciales."
        echo -e " 5- Selecciona (seleccionar aplicacion) y selecciona (correo)."
        echo -e " 6- En (selecciona dispositivo) selecciona (otro) y le das un nombre, pj scripts_intrusos."
        echo -e " 7- Pulsas en generar."
        echo -e " 8- Te saldra una venta con tu contraseña en este formato (xxxx xxxx xxxx xxxx)."
        echo -e " 9- Copiala, y le das a listo. Esa es la contraseña que tienes que poner en el script."
        echo -e ""
        echo -e "${amarillo}Si no te quieres volverte loco y no hacer nada de lo anterior."
        echo -e "Create una cuenta de correo de google y listo, No le pongas segundo factor y ha funcionar.${borra_colores}"
        echo ""

        read -p "Direccion de correo que manda el mail? --> " emailorigen
        read -p "Contraseña del correo $emailorigen -->> " emailpassorigen
        read -p "Direccion a destino de los avisos -->> " emaildestino
        echo ""
        while :
        do
        clear
        echo -e "${azul}Tiempo de comprobacion de intrusos:${borra_colores}"
        echo ""
        echo -e "${azul}   1)${borra_colores} Comprueba cada 0.30 minutos."
        echo -e "${azul}   2)${borra_colores} Comprueba cada 2 horas"
        echo -e "${azul}   3)${borra_colores} Comprueba cada 10 horas"
        echo -e "${azul}   4)${borra_colores} Comprueba cada 24 horas"
        echo ""
        read -p "Dime opcion de tiempo (1,2,3 o 4) -->> " opcion
        case $opcion in
        1)  tiempo=30
            break;;
            
        2)  tiempo=2
            break;;
            
        3)  tiempo=10
            break;;
            
        4)  tiempo=24
            break;;
            
        *)  echo ""
            echo -e "${rojo}Opcion No disponible en el menu menu de tiempo.....${borra_colores}"
            echo -e "${amarillo}Pulsa una tecla para continuar o ( control + c ) salir.${borra_colores}"
            read pause;;
        esac
        done

        #configura el fichero
        rm /tmp/msmtprc 0>/dev/null 1>/dev/null 2>/dev/null

	echo "defaults" >> /tmp/msmtprc
	echo "auth           on" >> /tmp/msmtprc
	echo "tls            on" >> /tmp/msmtprc
	echo "tls_trust_file /etc/ssl/certs/ca-certificates.crt" >> /tmp/msmtprc
	echo "logfile        ~/.msmtp.log" >> /tmp/msmtprc
	echo "account        gmail" >> /tmp/msmtprc
	echo "host           smtp.gmail.com" >> /tmp/msmtprc
	echo "port           587" >> /tmp/msmtprc
	echo "from          root@raspi-buster" >> /tmp/msmtprc
	echo "user           $emailorigen" >> /tmp/msmtprc
	echo "password       $emailpassorigen" >> /tmp/msmtprc
	echo "account default : gmail" >> /tmp/msmtprc

        #cambia la configuracion del fichero ssmtp.conf
        sudo rm /etc/msmtprc 0>/dev/null 1>/dev/null 2>/dev/null
        sudo cp /tmp/msmtprc /etc/
        clear
        echo -e "${amarillo}Enviando correo de prueba...${borra_colores}"
        sleep 1
        echo -e "Subject:Correo de prueba de intrusos.sh\n\n\nEste correo es solo para comprobar que todo funciona.\nBorralo y no le respontas.\n\nContacto: sukigsx@reparaciondesistemas.com\n\nWeb: www.reparaciondesistemas.com\nGithub: www.github.com/sukigsx\n\nMUCHAS GRACIAS POR UTILIZAR MI SCRIPT. " | msmtp $emaildestino 1>/dev/null 
        if [ $? -ne 0 ]
        then
            echo ""
            echo -e "${rojo}El correo NO ha funcionado.${borra_colores}"
            sleep 3
            ctrl_c
        else
            echo ""
            echo -e "${verde}Correpto, el mail de prueba se ha enviado.${borra_colores}"
            echo -e ""
            echo -e "${azul}Estos son los datos de configuracion:${borra_colores}"
            echo ""
            echo -e "Direccion de corro que manda el mail             =${amarillo} $emailorigen  ${borra_colores}"
            echo -e "Direccion de destino, para el avisos de intrusos =${amarillo} $emaildestino  ${borra_colores}"
            echo -e "Tiempo de comprobacion de estado de intrusos     =${amarillo} $tiempo  ${borra_colores}"
            echo ""
            read -p "¿ Son correptos los datos (S/N) -->> " correpto
            if [[ $correpto = "S" || $correpto = "s" ]] 
            then
                echo -e "${verde}Ok... Continuamos con el proceso.${borra_colores}"
                sleep 2
            else
                ctrl_c
            fi
    
            #comprueba que existan los ficheros de ipsactivas
            if [[ -f /home/$(whoami)/.ipspermitidas && -s /home/$(whoami)/.ipspermitidas ]]
            then
                    echo ""
            else
                    clear
                    echo -e "${rojo}No dispone fichero con las ip's a comparar.${borra_colores}"
                    echo -e "${rojo}O el fichero si existe, pero esta vacio.${borra_colores}"
                    echo ""
                    #crear el fichero ipspermitidas borrando el existente.
                    rm /home/$(whoami)/.ipspermitidas 2>/dev/null
                    echo -e "${amarillo}Introduce las ip's de una en una y (enter)."
                    echo -e "Las ip's tienen que seguir este formato:${borra_colores}"
                    echo ""
                    hostname -I | awk '{ print $1 }'
                    echo ""
                    echo -e "${amarillo}Listado de tus ips activas en la red."
                    echo -e "Por si quieres utilizar alguna. Un momento...${borra_colores}"
                    echo -e "${verde}"
                    rango_red=$(hostname -I | awk '{ print $1 }'); fping -g -a $rango_red/24 2>/dev/null | sort
                    echo -e "${borra_colores}"
                    for  (( ; ; ))
                    do
                            read -p "Dime la ip permitida? (S = Salir) -->> " ips
                            if [[ $ips = "S" || $ips = "s" ]]
                            then
                                    if [[ -f /home/$(whoami)/.ipspermitidas && -s /home/$(whoami)/.ipspermitidas ]]
                                    then
                                        break
                                    else
                                        echo -e "${rojo}El fichero esta vacio.....${borra_colores}"
                                        echo -e "${rojo}Introduce las ips....${borra_colores}"
                                        sleep 3
                                    fi
                            else
                                    echo "$ips" >> /home/$(whoami)/.ipspermitidas
                                    echo -e "${amarillo}$ips > ${verde}Añadida${borra_colores}"; sleep 1
                                    echo ""
                            fi
                    done
        fi 
            
            #Crea el fichero para incluir en el servidor 
            rm /home/$(whoami)/.intrusos_automatico.sh 0>/dev/null 1>/dev/null 2>/dev/null
            echo "cd /home/$(whoami)/" >> /home/$(whoami)/.intrusos_automatico.sh
            
            sed -n 292,309p intrusos.sh >> /home/$(whoami)/.intrusos_automatico.sh
            echo "echo -e 'Subject:Se Ha Detectado Intruso o Intrusos En Tu Red.\n\nTu script de control de intrusos a detectado una o varias ip no registradas en tu red.\nEjecuta el script instrusos.sh y escanea para saber las ips detectadas.\n\nContacto: sukigsx@reparaciondesistemas.com\nWeb: www.reparaciondesistemas.com\nGithub: www.github.com/sukigsx\n\nMUCHAS GRACIAS POR UTILIZAR MI SCRIPT.' | msmtp $emaildestino" >> /home/$(whoami)/.intrusos_automatico.sh
            echo "else" >> /home/$(whoami)/.intrusos_automatico.sh
            echo "  echo" >> /home/$(whoami)/.intrusos_automatico.sh
            echo "fi" >> /home/$(whoami)/.intrusos_automatico.sh
            echo "rm /tmp/ipsactivas 0>/dev/null 1>/dev/null 2>/dev/null" >> /home/$(whoami)/.intrusos_automatico.sh
            
           
           
           echo -e "${amarillo}Configurando la tarea cron automatica.${borra_colores}"
            echo ""
            ####################
            if [ $tiempo = 30 ]
            then
                echo -e "${verde}Configurando en 30 minutos.${borra_colores}"
                echo ""
                echo -e "${verde}Cada 30m se comprobara la red en busca de intrusos.${borra_colores}"
                (crontab -l 2>/dev/null; echo "#Configuracion intrusos_automatico cada 30 minutos") | crontab -
                (crontab -l 2>/dev/null; echo "30 * * * * bash /home/$(whoami)/.intrusos_automatico.sh") | crontab -
                sleep 7
                ctrl_c
            else
                echo ""
            fi
            #############
            if [ $tiempo = 2 ]
            then
                echo -e "${verde}Configurando en 2 horas.${borra_colores}"
                echo ""
                echo -e "${verde}Cada 2 horas se comprobara la red en busca de intrusos.${borra_colores}" 
                (crontab -l 2>/dev/null; echo "#Configuracion intrusos_automatico cada 2 horas") | crontab -
                (crontab -l 2>/dev/null; echo "* */2 * * * bash /home/sukigsx/.intrusos_automatico.sh") | crontab -
                sleep 7
                ctrl_c
            else
                echo ""
            fi
            
            ################3
            if [ $tiempo = 10 ]
            then
                echo -e "${verde}Configurando en 10 horas.${borra_colores}"
                echo ""
                echo -e "${verde}Cada 10 horas se comprobara la red en busca de intrusos.${borra_colores}" 
                (crontab -l 2>/dev/null; echo "#Configuracion intrusos_automatico cada 10 horas") | crontab -
                (crontab -l 2>/dev/null; echo "* */10 * * * bash /home/sukigsx/.intrusos_automatico.sh") | crontab -
                sleep 7
                ctrl_c
            else
                echo ""
            fi
            
            ####################3
            if [ $tiempo = 24 ]
            then
                echo -e "${verde}Configurando en 24 horas.${borra_colores}"
                echo ""
                echo -e "${verde}Cada 24 horas se comprobara la red en busca de intrusos.${borra_colores}" 
                (crontab -l 2>/dev/null; echo "#Configuracion intrusos_automatico cada 24 horas") | crontab -
                (crontab -l 2>/dev/null; echo "* */24 * * * bash /home/sukigsx/.intrusos_automatico.sh") | crontab -
                sleep 7
                ctrl_c
            else
                echo ""
            fi
            
        fi;;

    7)  #borrado de datos
        clear
        echo -e ""
        echo -e "${rojo}-- Ojo, CUIDADO, Borrado de datos --${borra_colores}"
        echo ""
        echo -e "${amarillo}Se procedera al borrado de todos los ficheros creados por"
        echo -e "este script (intrusos.sh). Asi como la desistalacion del "
        echo -e "software instalado por el mismo. Y tambien se eliminara el "
        echo -e "contenido del fichero de crontab.${borra_colores}"
        echo -e ""
        echo -e "${amarillo}- ${rojo}Vaciado del fichero (crontab)."
        echo -e "${amarillo}- ${rojo}Borrado de los fichero (ipspermitidas)."
        echo -e "${amarillo}- ${rojo}Desistalacion de (Nmap, fping, ssmtp, mail)."
        echo ""
        read -p "¿ Seguro de borrar todo ? ( mays S/N ) -->> " sn
        if [ $sn = "S" ] 0>/dev/null 1>/dev/null 2>/dev/null
        then 
            echo ""
            echo -e "${rojo}Borrando......Un momento......${borra_colores}"
            rm /home/$(whoami)/.ipspermitidas 0>/dev/null 1>/dev/null 2>/dev/null
            rm /home/$(whoami)/.intrusos_automatico.sh 0>/dev/null 1>/dev/null 2>/dev/null
            sudo apt update 0>/dev/null 1>/dev/null 2>/dev/null
            sudo apt remove nmap fping ssmtp mailutils -y 0>/dev/null 1>/dev/null 2>/dev/null
            sudo apt purge nmap fping ssmtp mailutils -y 0>/dev/null 1>/dev/null 2>/dev/null
            sudo apt clean nmap fping ssmtp mailutils -y 0>/dev/null 1>/dev/null 2>/dev/null
            sudo rm /var/spool/cron/crontabs/$(whoami) 0>/dev/null 1>/dev/null 2>/dev/null
            echo ""
            echo -e "${verde}Ok... ¡¡ TODO BORRADO !!${borra_colores}"
            sleep 3
            ctrl_c
        else
            echo ""
            echo -e "${verde}OK.. No se borra nada.${borra_colores}"
            sleep 3
        fi;;
    
	8)	#ayuda
		clear
        echo ""
        echo -e "${azul} ███████  ██    ██  ██   ██  ██  ██████    ███████  ██   ██${borra_colores}"
        echo -e "${azul} ██       ██    ██  ██  ██   ██  ██        ██        ██ ██ ${borra_colores}"
        echo -e "${azul} ███████  ██    ██  █████    ██  ██   ███  ███████    ███  ${borra_colores}"
        echo -e "${azul}      ██  ██    ██  ██  ██   ██  ██    ██       ██   ██ ██ ${borra_colores}"
        echo -e "${azul} ███████   ██████   ██   ██  ██   ██████   ███████  ██   ██${borra_colores}"
        echo ""
        echo -e "${azul} Contacto:${amarillo} sukisx@reparaciondesistemas.com"
        echo -e "           www.reparaciondesistemas.com${borra_colores}"
        echo "-----------------------------------------------------------"
        echo -e '\e[0;34m\033[1m Nombre del script --> \e[0;33m\033[1m  intrusos.sh \033[0m\e[0m'
        echo ""
       	echo -e "${verde}- MENU AYUDA -${borra_colores}"
		echo ""
		echo -e "${verde}Notas a tener en cuenta:${borra_colores}"
		echo -e "${verde}Este escript le hacen falta algunos programas para su funcionamiento.${borra_colores}"
		echo -e "${verde}Que son los siguienetes:${borra_colores}"
		echo ""
		echo -e "${verde} 1- nmap  > para escanear a los intrusos.${borra_colores}"
		echo -e "${verde} 2- nano  > editor para poder modificar tus ip's permitidas.${borra_colores}"
		echo -e "${verde} 3- fping > Para escanear la red.${borra_colores}"
		echo -e "${verde} 3- ssmtp > Para configurar correo electronico.${borra_colores}"
		echo -e "${verde} 3- mail  > Para poder mandar correos electronicos.${borra_colores}"
		echo ""
		echo -e "${verde}El fichero que se crea con tus ips permitidas se aloja como${borra_colores}"
		echo -e "${verde}fichero oculto en tu home (/home/tu_usuario/.ipspermitidas).${borra_colores}"
		echo -e "${verde}Y tambien el fichero de tarea automatica (/home/tu_usuario/.intrusos_automatico.sh).${borra_colores}"
		echo ""
		echo -e "${verde}El fichero de ips activas en tu red, se aloja en el direcctorio${borra_colores}"
		echo -e "${verde}temporal de tu sistema, (/tmp) asi se borrara si no lo hace el script${borra_colores}"
		echo -e "${verde}por algun fallo, automaticamente cuando reinicies tu sistema.${borra_colores}"
		echo ""
		read -p "Pulsa una tecla para continuar" pause
		clear
		echo ""
        echo -e "${azul} ███████  ██    ██  ██   ██  ██  ██████    ███████  ██   ██${borra_colores}"
        echo -e "${azul} ██       ██    ██  ██  ██   ██  ██        ██        ██ ██ ${borra_colores}"
        echo -e "${azul} ███████  ██    ██  █████    ██  ██   ███  ███████    ███  ${borra_colores}"
        echo -e "${azul}      ██  ██    ██  ██  ██   ██  ██    ██       ██   ██ ██ ${borra_colores}"
        echo -e "${azul} ███████   ██████   ██   ██  ██   ██████   ███████  ██   ██${borra_colores}"
        echo ""
        echo -e "${azul} Contacto:${amarillo} sukisx@reparaciondesistemas.com"
        echo -e "           www.reparaciondesistemas.com${borra_colores}"
        echo "-----------------------------------------------------------"
        echo -e '\e[0;34m\033[1m Nombre del script --> \e[0;33m\033[1m  intrusos.sh \033[0m\e[0m'
        echo ""
		echo -e "${verde}-OPCIONES DEL SCRIPT -${borra_colores}"
		echo ""
		echo -e " ${amarillo} 1)${borra_colores} Crear el fichero de Ip's permitidas."
        echo -e "${verde}       Insertar las ips permitidas de tu red,${borra_colores}"
        echo -e "${verde}       para que no te las muestre como intruso.${borra_colores}"
        echo -e " ${amarillo} 2)${borra_colores} Ver el fichero de ip's permitidas."
        echo -e "${verde}       Te lista las ips permitidas que tienes activadas.${borra_colores}"
        echo -e " ${amarillo} 3)${borra_colores} Borrar el fichero de ip's permitidas."
        echo -e "${verde}       Borra el fichero completo de las ips que tienes permitidas.${borra_colores}"
        echo -e " ${amarillo} 4)${borra_colores} Editar/añadir fichero de ip's permitidas."
        echo -e "${verde}       Te permite editar el fichero, para que metas las ips${borra_colores}"
        echo -e "${verde}       manualmente o varias con corta y pega.${borra_colores}"
        echo -e " ${amarillo} 5)${borra_colores} Escanear la red."
        echo -e "${verde}       Comienza el escaneo de la red,${borra_colores}"
        echo -e "${verde}       y te da la posibilidad si hay intrusos poder escanearlos.${borra_colores}"
        echo -e " ${amarillo} 6)${borra_colores} Instalar servicio en tu maquina (comprobacion automatica)."
        echo -e "${verde}       Realiza la configuracion del correo electronico${borra_colores}"
        echo -e "${verde}       y configura el escaneo de la red de forma automatica.${borra_colores}"
        echo -e " ${amarillo} 7)${borra_colores} Borrado de datos."
        echo -e "${verde}       Realiza el borrado y desistalacion de los datos y software.${borra_colores}"
        echo -e "${verde}       Tambien realiza el vaciado del fichero de crontab.${borra_colores}"
        echo -e " ${amarillo} 8)${borra_colores} Ayuda."
        echo -e "${verde}       Sencillo, lo que estas viendo ahora.${borra_colores}"
        echo -e " ${amarillo}99)${borra_colores} Salir.${borra_colores}"
        echo -e "${verde}       Sencillo tambien, sale del script, borrando las ips activas.${borra_colores}"
		echo ""
		read -p "Pulsa una tecla para continuar" pause;;

	99)	#salir
		ctrl_c;;

	*)	#seleccion no valida
            echo ""
        	echo -e "${rojo}- Opcion No disponible en el menu principal.....${borra_colores}"
        	echo -e "${amarillo} Pulsa una tecla para continuar o ( control + c ) salir.${borra_colores}"
        	read pause;;
esac
done
