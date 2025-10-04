package com.example.basics

fun main(){
    println("!Estructuras de control!!!")
    println("!Condicionales!!!")
    val value1 = 10
    val value2 = 15
    if (value1>value2){
        println("El mayor es ${value1}")
    }else{
        println("El mayor es ${value2}")
    }
    println("Rango segun nivel de la fuerza")
    var fuerza: Int = 10
    if (fuerza > 10){
        println("El Maestro")
    }else if (fuerza > 5){
        println("Caballero Jedi")
    }else{
        println("Padawan")
    }

    var tipoDroide: String = "R2-Q6"
    when(tipoDroide){
        "R2-D2", "R2-Q5"->print("Droide astromecanico")
        "C-3PO", "C-3PA"->print("Droide de protocolo")
        "B8-8", "BB-9E"->print("Droide de nueva generacion")
        else->println("Modelo Desconocido")
    }

    var peligro: Int = 10
    var recompensa: Int = 50
    when{
        peligro>8 &&  recompensa < 1000->println("Misión Rechazada")
        peligro<=3 ->("Misión Aceptada")
        else->println("Requiere Evaluacion adicional")
    }

    var semaforo: String = "amarillo"
    var estado_calle: String ="vacia"
    when{
        semaforo=="verde" && estado_calle=="vacia"->println("Avanzar")
        semaforo=="amarillo" && estado_calle=="vacia"->println("Precaucion")
        else->println("Esperar")
    }

    print("Ingresa tu signo zodiacal: ")
    val signoZodiacal = (readLine() ?: "").lowercase()
    when(signoZodiacal){
        "aries", "leo", "Sagitario"->println("Fuego")
        "tauro", "virgo", "capricornio"->println("Tierra")
        "geminis", "libra", "acuario"->println("Aire")
        "cancer", "escorpio", "piscis"->println("Agua")
        else->println("Signo invalido")
    }



}