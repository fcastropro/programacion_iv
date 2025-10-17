package com.example.basics

fun main()
{
    println("Ingresa el color del semaforo rojo, amarillo o verde")
    val semaforo = (readLine() ?: "").lowercase()
    println("Botón si/no")
    var peaton = (readLine() ?: "").lowercase()
    when{
        semaforo=="verde" && peaton=="si"->println("Espera a rojo")
        semaforo=="rojo" && peaton=="si"->println("Cruza")
        semaforo=="amarillo" && peaton=="si"->println("Prepárate")
        else->println("Espera")
    }
}