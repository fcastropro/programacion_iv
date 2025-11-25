package com.example.basics

fun main(){
    println("!Calculadora!!!")
    println("Incluir primer valor")
    val value1: Int = readLine()?.toIntOrNull()?:0
    println("Incluir segundo valor")
    val value2: Int = readLine()?.toIntOrNull()?:0
    println("Ingresar Operacion +, -, *, /")
    val signo = (readLine() ?: "").lowercase()
    println("Su operacion de ${signo}")
    when (signo) {
        "+" -> println("Resultado: ${value1 + value2}")
        "-" -> println("Resultado: ${value1 - value2}")
        "*" -> println("Resultado: ${value1 * value2}")
        "/" -> {
            if (value2 != 0)
                println("Resultado: ${value1 / value2}")
            else
                println("Ingresaste 0 no se puede dividir.")
        }
        else -> println("Operador no válido.")
    }
}