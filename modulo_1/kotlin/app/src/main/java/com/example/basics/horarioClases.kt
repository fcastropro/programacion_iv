package com.example.basics

fun main(){
    println("Horario de Clases")
    println("Ingrese hora en formato de 0 a 23")
    val promedio: Int = readLine()?.toIntOrNull()?:0
    when{
        promedio>=7 && promedio<=13->println("Clases en la mañana")
        promedio>=14 && promedio<=19->println("Clases en la tarde")
        else->println("Horario Lectivo")
    }
}