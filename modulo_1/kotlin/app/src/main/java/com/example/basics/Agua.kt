package com.example.basics

fun main()
{
    println("Ingresa la temperatura del agua")
    val temperatura: Int=readLine()?.toIntOrNull()?:0
    when{
        temperatura<=0 -> println("Solido")
        temperatura<=99 && temperatura>=1->println("Liquido")
        temperatura>=100->println("Gas")
    }
}