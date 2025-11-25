package com.example.basics

fun main(){
    println("Ingrese el número de la tabla de multiplicar")
    val numero: Int = readLine()?.toIntOrNull()?:0
    for(i in 0 .. 12 step 1){
        println("$i x $numero = ${i*numero}")
    }
}