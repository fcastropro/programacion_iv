package com.example.basics

fun main() {
    print("Ingresa una contraseña: ")
    val password = readLine() ?: ""
    val esValida = password.length >= 8 && password.any { it.isDigit() }
    if (esValida) {
        println("✅ Contraseña válida.")
    } else {
        println("❌ Contraseña inválida. Debe tener al menos 8 caracteres y contener al menos un número.")
    }
}
