package com.ute.hellojetpackcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.ute.hellojetpackcompose.model.Usuario

class MainLista : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { ListaUsuariosApp() }
    }
}

@Composable
fun ListaUsuariosApp() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) {
            ListaUsuariosScreen()
        }
    }
}

@Composable
fun ListaUsuariosScreen() {
    val usuarios = remember {
        listOf(
            Usuario(1, "Ana Torres", "Diseñadora"),
            Usuario(2, "Luis Pérez", "Desarrollador"),
            Usuario(3, "María López", "Tester QA"),
            Usuario(4, "Carlos Ruiz", "Project Manager")
        )
    }

    var usuarioSeleccionado by remember { mutableStateOf<Usuario?>(null) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text("Lista de usuarios", style = MaterialTheme.typography.titleLarge)

        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(usuarios) { user ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { usuarioSeleccionado = user }
                ) {
                    Column(Modifier.padding(12.dp)) {
                        Text(user.nombre, style = MaterialTheme.typography.titleMedium)
                        Text(user.rol, style = MaterialTheme.typography.bodyMedium)
                    }
                }
            }
        }

        Divider()

        if (usuarioSeleccionado != null) {
            Card(Modifier.fillMaxWidth()) {
                Column(Modifier.padding(12.dp)) {
                    Text("Seleccionado:", style = MaterialTheme.typography.titleMedium)
                    Text("Nombre: ${usuarioSeleccionado!!.nombre}")
                    Text("Rol: ${usuarioSeleccionado!!.rol}")
                }
            }
        } else {
            Text("Selecciona un usuario para ver detalles.")
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun PreviewLista() {
    ListaUsuariosApp()
}
