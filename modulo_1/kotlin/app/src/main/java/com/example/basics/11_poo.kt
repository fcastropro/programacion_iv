package com.example.basic
data class Jedi(
    val nombre:String,
    val edad: Int,
    val nivelFuerza: Int,
    val maestro: String?=null,
) {
    val rango: String
        get() = when {
            nivelFuerza >= 90 -> "Maestro"
            nivelFuerza >= 70 -> "Caballero"
            nivelFuerza >= 50 -> "Padawan"
            else -> {
                "Iniciado"
            }
        }
    fun puedeEnseniar(): Boolean = nivelFuerza >= 70
    fun entrenar(): Boolean = edad <= 5
}
fun main() {
    val luke = Jedi(
        "Anakin Skywalker",
        25,
        75,
        "Obiwan Kenobi")
    println(luke)
    //Descentralización de un objeto
    val(nombre, edad, nivelFuerza) = luke
    println("Nombre del Jedi ${nombre}, edad: ${edad}, nivel de la fuerza: ${nivelFuerza}")
    //copiar objetos
    val ashoka = luke.copy(nombre= "ashoka", nivelFuerza=80)
    println(ashoka)
    //propiedades calculada
    println("Rango de ashoka ${ashoka.rango}")
    println("Ashoka puede Enseniar ${ashoka.puedeEnseniar()}")
}