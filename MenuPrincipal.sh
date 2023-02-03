#!/bin/bash 
# Inicializar la matriz del juego  

reiniciar() { 
    board=(. . . . . . . . .) 
} 
 
check_used(){
    move=$1;
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

  

while [ true ]; do 

  echo "Turno de $player. ¿Dónde quieres mover? (0-8)" 

  read move 

  if check_used $move; then
  mark $player $move 

 

  if check_win $player; then
  
    print_board; 
    exit 0; 

  fi 
  

  if [ $player == "X" ]; then 

    player="O" 

  else 

    player="X" 

  fi
  else
  echo "La celda esta ocupada"
  fi
    print_board

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

print_board  


player=$nom1 
 
move=0  

while [ true ]; do  

 
  echo "Turno de $player. ¿Dónde quieres mover? (0-8)"  

  read move   

  if check_used $move; then 

  mark $player $move  


  if check_win $player; then 

    print_board;  

    exit 0;   

  fi  


  if [ $player == $nom1 ]; then   

    player=$nom2  

  else  

    player=$nom1  


  fi 

  else 

  echo "La celda esta ocupada" 

  fi 

    print_board 

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

    ./pruebatablero.sh         ##LLAMAMOS AL SCRIPT QUE VISUALIZA EL TABLERO CON LOS NUMEROS ORIENTATIVOS 

    echo "" 

    echo "-------------MENU DE OPCIONES------------------" 

    echo "OPCIÓN 1: EMPEZAR PARTIDA." 

    echo "OPCIÓN 2: MODO FIESTA." 

    echo "OPCIÓN 3: SALIR DEL JUEGO." 

    echo "OPCIÓN 4: VER ESTADÍSTICAS." 

    echo "----------------------------------------------" 

    echo " " 

    read -p "Selecciona una opcióN (1..3): " opcion 

    echo " " 


    case $opcion in  

    "1") 

    ##EMPEZAR PARTIDA E INICIAR JUEGO PRINCIPAL 

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
¡  fiesta
    ;;
    # Por programar (HUGO) 

    "3") 

    echo "FIN DEL JUEGO." 

    break 

    ;; 

    "4") 

    ##AÑADIR ESTADÍSTICAS 

    ;; 

    esac 

done 
