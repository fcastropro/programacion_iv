package com.example.basics
fun suma(a: Int, b: Int): Int{
    return a + b
}
fun resta(a: Int, b: Int): Int{
    return a - b
}
fun multiplicacion(a: Int, b: Int): Int{
    return a * b
}
fun division(a: Int, b: Int): Int{
    return a / b
}
fun main(){
    println("!Calculadora Funciones!!!")
    println("Incluir primer valor")
    val value1: Int = readLine()?.toIntOrNull()?:0
    println("Incluir segundo valor")
    val value2: Int = readLine()?.toIntOrNull()?:0
    println("Ingresar Operacion +, -, *, /")
    val signo = (readLine() ?: "").lowercase()
    println("Su operacion de ${signo}")
    when(signo){
        "+" -> println("Resultado: ${suma(value1,value2)}")
        "-" -> println("Resultado: ${resta(value1,value2)}")
        "*" -> println("Resultado: ${multiplicacion(value1,value2)}")
        "/" -> println("Resultado: ${division(value1,value2)}")
        else->println("operacion no valida")
    }
    val sumaLambda = {x:Int, y:Int -> x+y}
    val restaLambda = {x:Int, y:Int -> x-y}
    val multiplicacionLambda = {x:Int, y:Int -> x*y}
    val divisionLambda = {x:Int, y:Int -> x/y}
    when(signo){
        "+" -> println("Resultado Lambda: ${sumaLambda(value1,value2)}")
        "-" -> println("Resultado Lambda: ${restaLambda(value1,value2)}")
        "*" -> println("Resultado Lambda: ${multiplicacionLambda(value1,value2)}")
        "/" -> println("Resultado Lambda: ${divisionLambda(value1,value2)}")
        else->println("operacion no valida")
    }
}