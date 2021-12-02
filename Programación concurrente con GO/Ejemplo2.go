package main

import (
	"fmt"
	"time"
)

func main() {

	// Ejecucion sincrona
	repetir(3, "Síncrono inicio")

	// Ejecucion asincrona
	go repetir(5, "Asíncrono")

	// Nueva ejecucion sincrona
	repetir(3, "Síncrono final")

	// Esperar a que el usuario pulse tecla Enter
	// fmt.Scanln()
	fmt.Println("Fin del programa")
}

func repetir(veces int, texto string) {
	for i := 1; i <= veces; i++ {
		fmt.Printf("#%v > %v\n", i, texto)
		time.Sleep(10 * time.Millisecond)
	}
}
