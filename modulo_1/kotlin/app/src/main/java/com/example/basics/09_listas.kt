package com.example.basics

fun main() {
    println("Funciones")
    val inmutableLista: List<Int> = listOf(1,2,3)
    println("Lista Inmutable ${inmutableLista}")

    val mutableLista: MutableList<Int> = mutableListOf(4,5,6)
    println("Lista Mutable ${mutableLista}")
    mutableLista.add(7)
    println("Lista Mutable ${mutableLista}")
    mutableLista.removeAt(0)
    println("Lista Mutable ${mutableLista}")

    for(mutable in mutableLista)println(mutable)
    println("Operaciones con Mutable List")

    val colores = mutableListOf("rojo", "verde")
    colores.add("azul")
    colores+="amarillo"
    colores.add(1,"blanco")
    println(colores)
    colores.remove("verde")
    println(colores)
    colores.removeAt(0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    println("Busquedas con Mutable List")
    val nombres = mutableListOf("Juan", "Luis", "pedro")
    println(nombres.find {it.startsWith("L")})
    println(nombres.firstOrNull() {it.length>4})
    println(nombres.any {it.contains('J')})
    println(nombres.none {it == "X"})

    println("Ordenamiento con Mutable List")
    val numerosDesordenados = mutableListOf(8,3,2,4,7,2,7,0,6)
    println(numerosDesordenados.sorted())
    println(numerosDesordenados.sortedDescending())
    println(numerosDesordenados.distinct())

}