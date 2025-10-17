package com.example.basics

fun main()
{
    println("Ingresa el número")
    val numero: Int=readLine()?.toIntOrNull()?:0
    var sum=0
    for(i in 1..numero step 1){
        if(i % 3 == 0){
            sum=sum+i
        }
    }
    println("La suma es: ${sum}")
}