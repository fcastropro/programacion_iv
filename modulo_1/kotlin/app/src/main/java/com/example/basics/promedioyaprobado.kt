package com.example.basics

fun main() {
    println("Cálculo de Promedio")

    print("Ingresa la primera nota (0-20): ")
    val nota1 = readLine()?.toDoubleOrNull() ?: 0.0

    print("Ingresa la segunda nota (0-20): ")
    val nota2 = readLine()?.toDoubleOrNull() ?: 0.0

    print("Ingresa la tercera nota (0-20): ")
    val nota3 = readLine()?.toDoubleOrNull() ?: 0.0

    val promedio = (nota1 + nota2 + nota3) / 3

    println("\nPromedio: %.2f".format(promedio))

    if (promedio >= 14) {
        println("Aprobado")
    } else {
        println("Reprobado")
    }
}
