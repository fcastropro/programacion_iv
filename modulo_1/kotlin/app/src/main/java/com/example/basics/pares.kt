package com.example.basics

fun main()
{
    println("Ingresa el numero total para calcular los pares")
    val total: Int = readLine()?.toIntOrNull()?:0
    var pares=0
    for(i in 1 .. total step 1)
    {
        if(i % 2 ==0)
        {
            pares=pares+1
        }
    }
    println("total pares ${pares}")
}