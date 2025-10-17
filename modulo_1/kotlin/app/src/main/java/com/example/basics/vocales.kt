package com.example.basics

fun main() {
    print("Ingresa una palabra o texto: ")
    val texto = readLine()?.lowercase() ?: ""

    var contador = 0
    val vocales = listOf('a', 'e', 'i', 'o', 'u')

    for (letra in texto) {
        if (letra in vocales) {
            contador++
        }
    }

    println("Cantidad de vocales: $contador")
}