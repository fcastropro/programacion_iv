package com.example.basics

fun main()
{
    println("Ingresa la Edad")
    val edad: Int = readLine()?.toIntOrNull()?:0
    when{
        edad<12->println("La entrada cuesta $3")
        edad>=65->println("La entrada cuesta $4")
        else->println("La entrada cuesta $5")
    }

}