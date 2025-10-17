package com.example.basics

fun main() {
    var opcion: Int
    var resultado = 0.0
    do {
        println("===== Calculadora Mínima =====")
        println("1) Sumar")
        println("2) Restar")
        println("3) Salir")
        print("Selecciona una opción: ")
        opcion = readLine()?.toIntOrNull() ?: 0
        print("Ingresa el primer número: ")
        val a = readLine()?.toDoubleOrNull() ?: 0.0
        print("Ingresa el segundo número: ")
        val b = readLine()?.toDoubleOrNull() ?: 0.0
        when (opcion) {
            1 -> {
                resultado = a + b
                println("Resultado: $resultado\n")
            }
            2 -> {
                resultado = a - b
                println("Resultado: $resultado\n")
            }
            3 -> println("Saliendo de la calculadora...")
            else -> println("Opción inválida. Intenta de nuevo.\n")
        }
    } while (opcion != 3)
}
