package com.example.basics

fun main() {
    print("Ingresa un número para ver su tabla de multiplicar: ")
    val numero = readLine()?.toIntOrNull() ?: 0

    println("=== Tabla del $numero ===")
    for (i in 1..10) {
        println("$numero x $i = ${numero * i}")
    }
}