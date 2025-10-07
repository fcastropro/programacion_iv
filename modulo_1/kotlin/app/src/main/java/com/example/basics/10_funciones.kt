package com.example.basics

import android.R

fun saludar(){
    println("Hola desde una funcion de kotlin")
}

//funcion con parametros y retorno
fun sumar(a: Int, b: Int): Int{
    return a + b
}
//funcion con expresion single-expression function
fun cuadrado(numero: Int) = numero * numero

//funcion con retorno múltiple
fun retornoMultiple(a: Int, b: Int): Pair<Int, Int>{
    val suma = a+b
    val resta = a-b
    return Pair(suma,resta)
}
fun main(){
    saludar()
    var resultado = sumar(5,6)
    println(resultado)
    println(cuadrado(2))
    println(retornoMultiple(15,5))
    // funcion lambda
    val cuadradoLambda = {x: Int-> x*x}
    val saludoLambda = {nombre: String-> "Good Morning, $nombre"}
    println(cuadradoLambda(4))
    println(saludoLambda("Juan Luis Guerra"))
}