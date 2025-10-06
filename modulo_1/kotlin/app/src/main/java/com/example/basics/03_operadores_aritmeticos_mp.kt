package com.example.basics


fun main() {
    println("¡Bienvenido al sistema de Ventas de Motos!")

    val precioMoto: Double = 3200.0
    val descuento: Double = 0.10   // 10% de descuento
    val iva: Double = 0.15         // 15% de IVA

    println("--- Calculos de Venta ---")
    println("Precio base de la moto: $${precioMoto}")

    val valorDescuento = precioMoto * descuento
    println("Descuento aplicado (10%): $${valorDescuento}")

    val precioConDescuento = precioMoto - valorDescuento
    println("Precio con descuento: $${precioConDescuento}")

    val valorIVA = precioConDescuento * iva
    println("IVA (15%): $${valorIVA}")

    val precioFinal = precioConDescuento + valorIVA
    println("Precio final a pagar: $${precioFinal}")

    println("¡Gracias por su compra en MotoShop!")
}
