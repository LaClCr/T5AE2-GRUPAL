#!/bin/bash 
# Inicializar la matriz del juego  
check_win() { 

  player=$1 

  if [ ${board[0]} == $player ] && [ ${board[1]} == $player ] && [ ${board[2]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[3]} == $player ] && [ ${board[4]} == $player ] && [ ${board[5]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[6]} == $player ] && [ ${board[7]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[0]} == $player ] && [ ${board[3]} == $player ] && [ ${board[6]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[1]} == $player ] && [ ${board[4]} == $player ] && [ ${board[7]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[2]} == $player ] && [ ${board[5]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[0]} == $player ] && [ ${board[4]} == $player ] && [ ${board[8]} == $player ]; then 

    echo "$player GANA!" 

    return 0 

  elif [ ${board[2]} == $player ] && [ ${board[4]} == $player ] && [ ${board[6]} == $player ]; then 

    echo "$player GANA!" 

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
  fi

  else echo "EL NUMERO DE CASILLA NO ES VÁLIDO."
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

    fi 

      print_board 

  else echo "EL NUMERO DE CASILLA NO ES VÁLIDO."
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

     ##AÑADIR EL RANDOM

    ;; 

    "4") 
  echo "FIN DEL JUEGO." 

    break 
   

    ;; 
    "5")
     ##AÑADIR ESTADÍSTICAS 
   
    ;;

    esac 

done 
