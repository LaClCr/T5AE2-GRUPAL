
#!/bin/bash 
# Inicializar la matriz del juego  
check_win() { 

  player=$1 

  if [ ${board[0]} == $player ] && [ ${board[1]} == $player ] && [ ${board[2]} == $player ]; then 

    echo "$player GANA!" 
     write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[3]} == $player ] && [ ${board[4]} == $player ] && [ ${board[5]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[6]} == $player ] && [ ${board[7]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[0]} == $player ] && [ ${board[3]} == $player ] && [ ${board[6]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[1]} == $player ] && [ ${board[4]} == $player ] && [ ${board[7]} == $player ]; then 

    echo "$player GANA!"
    write_log "¡Jugador $player gana!" 

    return 0 

  elif [ ${board[2]} == $player ] && [ ${board[5]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[0]} == $player ] && [ ${board[4]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  elif [ ${board[2]} == $player ] && [ ${board[4]} == $player ] && [ ${board[6]} == $player ]; then 

    echo "$player GANA!" 
    write_log "¡Jugador $player gana!"

    return 0 

  else 

    return 1 

  fi 

} 
reiniciar() { 
    board=(. . . . . . . . .) 
} 
 
check_used(){
    move=$1
    if [ ${board[$move]} == . ]; then
    return 0
    else
    return 1
    fi

}

escogePlayer(){

    while [ true ]
    do

      read -p 'Escoge tu ficha ( X , O ): ' ficha

      if [ $ficha == "X" ] || [ $ficha == "x" ]
      then
            ficha=1;
            break;
      fi
      if [ $ficha == "O" ] || [ $ficha == "o" ]
      then
            ficha=0;
            break;
      fi

    done

    echo $ficha;
}


#Devuelve 0 si el jugador gana con el movimiento indicado y 1 en caso contrario
check_move(){

  player=$1;
  movimiento=$2;
  value=1;

  case $movimiento in

    0)
    if [ ${board[1]} == $player ] && [ ${board[2]} == $player ]; then 
      value=0
    elif [ ${board[3]} == $player ] && [ ${board[6]} == $player ]; then 
      value=0
    elif [ ${board[4]} == $player ] && [ ${board[8]} == $player ]; then 
      value=0 
    fi
    ;;
    1)
    if [ ${board[0]} == $player ] && [ ${board[2]} == $player ]; then 
      value=0 
    elif [ ${board[4]} == $player ] && [ ${board[7]} == $player ]; then 
      value=0
    fi
    ;;
    2)
    if [ ${board[0]} == $player ] && [ ${board[1]} == $player ]; then 
      value=0 
    elif [ ${board[5]} == $player ] && [ ${board[8]} == $player ]; then 
      value=0
    elif [ ${board[4]} == $player ] && [ ${board[6]} == $player ]; then 
      value=0 
    fi
    ;;
    3)
    if [ ${board[4]} == $player ] && [ ${board[5]} == $player ]; then 
      value=0 
    elif [ ${board[0]} == $player ] && [ ${board[6]} == $player ]; then 
      value=0
    fi
    ;;
    4)
    if [ ${board[3]} == $player ] && [ ${board[5]} == $player ]; then 
      value=0 
    elif [ ${board[1]} == $player ] && [ ${board[7]} == $player ]; then 
      value=0
    fi
    ;;
    5)
    if [ ${board[3]} == $player ] && [ ${board[4]} == $player ]; then 
      value=0 
    elif [ ${board[2]} == $player ] && [ ${board[8]} == $player ]; then 
      value=0
    fi
    ;;
    6)
    if [ ${board[7]} == $player ] && [ ${board[8]} == $player ]; then 
      value=0
    elif [ ${board[0]} == $player ] && [ ${board[3]} == $player ]; then
      value=0
    elif [ ${board[2]} == $player ] && [ ${board[4]} == $player ]; then
      value=0
    fi
    ;;
    7)
    if [ ${board[6]} == $player ] && [ ${board[8]} == $player ]; then 
      value=0 
    elif [ ${board[1]} == $player ] && [ ${board[4]} == $player ]; then 
      value=0
    fi
    ;;
    8)
    if [ ${board[6]} == $player ] && [ ${board[7]} == $player ]; then 
      value=0
    elif [ ${board[2]} == $player ] && [ ${board[5]} == $player ]; then
      value=0
    elif [ ${board[0]} == $player ] && [ ${board[4]} == $player ]; then
      value=0
    fi
    ;;
  esac

  echo $value;
}



unJugador() {


echo "Bienvenido al juego 3 en raya vs IA!";

jugador=`escogePlayer`;
maquina="";

if [ $jugador -eq 1 ]
then
    jugador="X";
    maquina="O";
else
    jugador="O";
    maquina="X";
fi


mov=0 
actual="X";
turn=0

  

while [ $turn -lt 9 ]; do 
  clear
  ./pruebatablero.sh 
  echo ""
  print_board
  echo ""

if [ $actual == $jugador ]
then
m=1;
while [ $m -eq 1 ]
do

  clear
  ./pruebatablero.sh
  echo ""
  print_board
  echo ""
  echo "Turno de $jugador. ¿Dónde quieres mover? (0-8)" 

  read mov

  if [ $mov -ge 0 ] && [ $mov -le 8 ]
  then
    
        if check_used $mov; then
        m=0;
        mark $jugador $mov;
            if check_win $jugador; then
              exit 0; 

            fi

        else
        echo "La celda esta ocupada"
        read kks
        fi
        
  else 
  echo "EL NUMERO DE CASILLA NO ES VÁLIDO."
  read jjj
  fi

done
else #Turno de la máquina

  read -p "Va a jugar $maquina ... (pulsa enter) ";
  marcado=0;
  #Primero comprueba si gana con algún movimiento
  for (( i=0; i<9; i++ ))
  do
      if check_used $i; then #Si no está marcado
        cm=`check_move $maquina $i`;
        if [ $cm -eq 0 ]
        then #Si gana, lo marca
          mark $maquina $i;
          marcado=1;
          break;
        fi
      fi
  done

  #Si sigue sin haberse marcado un movimiento,
  #Si el jugador puede ganar con un movimiento, lo evita
  if [ $marcado -eq 0 ] 
  then
      #Compruebo si el otro jugador gana con algún movimiento
      for (( i=0; i<9; i++ ))
      do
          if check_used $i; then #Si no está marcado
            cm=`check_move $jugador $i`;
            if [ $cm -eq 0 ] #Si gana el otro, lo evita
            then
              mark $maquina $i;
              marcado=1;
              break;
            fi
          fi
      done
  fi
  
  #Si sigue sin haberse marcado
  #Genero un número aleatorio y pruebo a marcar
  while [ $marcado -eq 0 ]
    do
        rand=$(($RANDOM%9));
        if check_used $rand; then
          mark $maquina $rand;
          marcado=1;
        fi

    done

    #Si gana la máquina se acaba la partida
    if check_win $maquina; then
      exit 0;
    fi

fi

  turn=$((turn+1))

  if [ $turn -eq 9 ]
    then
      echo "ES UN EMPATE!"
      exit 0 
  fi


  #Cambio de turno
  if [ $actual == $jugador ] 
  then
    actual=$maquina;
  else
      actual=$jugador;
  fi


done 

} 


juegoPrincipal() { 
echo "Bienvenido al juego 3 en raya!" 

print_board 

  

player="X" 

move=0 

turno=0

  

while [ $turno -lt 9 ]; do 
  clear
  ./pruebatablero.sh 
  echo ""
  print_board
  echo ""

  echo "Turno de $player. ¿Dónde quieres mover? (0-8)" 

  read move
  if [ $move -ge 0 ] && [ $move -le 8 ]
  then
  if check_used $move; then
  mark $player $move 

 

  if check_win $player; then
  
    print_board; 
    exit 0; 

  fi 
  
  turno=$((turno+1))

  if [ $player == "X" ]; then 

    player="O" 

  else 

    player="X" 

  fi

  if [ $turno -ge 9 ]
  then
    echo "EMPATE!"
    exit 0 
  fi

  else
  echo "La celda esta ocupada"
  read kks
  fi

  else 
  echo "EL NUMERO DE CASILLA NO ES VÁLIDO."
  read jjj
  fi
    

done } 

# Función para imprimir la matriz 
print_board() { 
  echo " ${board[0]} | ${board[1]} | ${board[2]} " 

  echo "---+---+---" 

  echo " ${board[3]} | ${board[4]} | ${board[5]} " 

  echo "---+---+---" 

  echo " ${board[6]} | ${board[7]} | ${board[8]} " 

} 

 # Función para escribir logs
write_log() {
  echo "$1" >> 3raya.log
}

# Función para marcar una casilla  

mark() {  

  player=$1  

  move=$2  

  board[$move]=$player  
}

# Función para el modo Fiesta.
fiesta(){
echo "Bienvenido al juego 3 en raya!"  

echo "Jugador 1, con que caracter desea jugar?"
read nom1 
echo "Jugador 2, con que caracter desea jugar?"
read nom2

./pruebatablero.sh 
print_board  


player=$nom1 
 
move=0  
turno=0

while [ $turno -lt 9 ]; do  
  clear
  ./pruebatablero.sh 
  echo ""
  print_board
  echo ""
  echo "Turno de $player. ¿Dónde quieres mover? (0-8)"  
  read move 

  if [ $move -ge 0 ] && [ $move -le 8 ]
  then  

    if check_used $move; then 

    mark $player $move  


    if check_win $player; then 

    print_board;  

    exit 0;   

    fi  

    turno=$((turno+1))

    if [ $player == $nom1 ]; then   

    player=$nom2  

    else  

    player=$nom1  


    fi 

    if [ $turno -ge 9]
    then
      echo "EMPATE!"
      exit 0
   fi

    else 
    echo ""
    echo "La celda está ocupada" 
    read kk

    fi 

      print_board 

  else 
  echo "EL NUMERO DE CASILLA NO ES VÁLIDO."
  read ccc
  fi

done

}  


opcion=0 

reiniciar 

while [ $opcion -ne "4" ] 

do 

    echo "" 

    echo "=============================================" 

    echo "----------------TRES EN RAYA----------------" 

    echo "=============================================" 
       
    echo "" 

    echo "-------------MENU DE OPCIONES------------------" 

    echo "OPCIÓN 1: EMPEZAR PARTIDA (2 JUGADORES)." 

    echo "OPCIÓN 2: MODO FIESTA (2 JUGADORES)." 

    echo "OPCIÓN 3: JUGAR CONTRA LA MÁQUINA (1 JUGADOR)."

    echo "OPCIÓN 4: SALIR DEL JUEGO." 

    echo "OPCIÓN 5: VER ESTADÍSTICAS." 

    echo "----------------------------------------------" 

    echo " " 

    read -p "Selecciona una opción (1..5): " opcion 

    echo " " 




    case $opcion in  

    "1") 

    reiniciar 

    juegoPrincipal     

    ;; 

    "2") 

    echo "" 

    echo "=============================================" 

    echo "----------------MODO FIESTA----------------" 

    echo "=============================================" 

    echo ""
    reiniciar
    fiesta
    ;;

    "3") 

     reiniciar;
     unJugador;

    ;; 

    "4") 
  echo "FIN DEL JUEGO." 

    break 
   

    ;; 
    "5")
     write_log
     echo " " 
   
    ;;

    esac 

done 