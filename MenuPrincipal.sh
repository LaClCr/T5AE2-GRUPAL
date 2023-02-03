#!/bin/bash 
# Inicializar la matriz del juego  

reiniciar() { 
    board=(. . . . . . . . .) 
} 
 

juegoPrincipal() { 
    echo "EMPEZANDO PARTIDA..."  

print_board   

player="X"   

move=0  

while [ $move -lt 9 ]; do  

  echo "Turno de $player. ¿Dónde quieres mover? (0-8)"  

  read move  

  mark $player $move  
  print_board  

  if check_win $player; then  
    exit 0  
  fi  

  if [ $player == "X" ]; then  

    player="O"  
  else  
    player="X"  
  fi  

done  
} 

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

    echo "OPCIÓN 2: SALIR DEL JUEGO." 

    echo "OPCIÓN 3: VER ESTADÍSTICAS." 

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