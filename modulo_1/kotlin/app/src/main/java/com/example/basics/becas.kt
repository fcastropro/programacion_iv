package com.example.basics

fun main() {
    println("Sistema de becas")
    println("Ingrese el Promedio")
    val promedio: Int = readLine()?.toIntOrNull()?:0
    println("Ingrese si / no si trabaja")
    val trabajo = (readLine() ?: "").lowercase()
    when {
        promedio>=90 && trabajo=="no"->println("Beca Completa")
        promedio>=90 && trabajo=="si"->println("Beca parcial")
        promedio<=90->println("Sin beca")
    }

}