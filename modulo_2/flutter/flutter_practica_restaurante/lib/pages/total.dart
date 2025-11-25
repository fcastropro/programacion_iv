import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Total extends StatefulWidget {
  const Total({super.key});

  @override
  State<Total> createState() => _Total();
}

class _Total extends State<Total> {
  String serviceLevel = 'Nuevo';
  String amountText = '';
  String cantMenuText = '';
  String resultText = '';

  void calculateTip() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;
    final cantMenu = double.tryParse(cantMenuText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    if (cantMenu <= 0) {
      setState(() {
        resultText = 'Ingrese cantidad de menus válido';
      });
      return;
    }

    double percentage = 0;

    if (serviceLevel == 'Nuevo') {
      percentage = 0;
    } else if (serviceLevel == 'Frecuente') {
      percentage = 8;
    } else if (serviceLevel == 'Corporativo') {
      percentage = 12;
    }

    final tip = amount * cantMenu;
    final descuento = (tip * percentage) /100;
    final total = tip - descuento;

    setState(() {
    resultText =
        'Subtotal: \$${tip.toStringAsFixed(2)}\n'
        'Descuento: \$${descuento.toStringAsFixed(2)}\n'
        'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total a Pagar Menú del Día'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cuenta Segun Cliente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: serviceLevel,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Nuevo',
                  child: Text('Cliente Nuevo'),
                ),
                DropdownMenuItem(
                  value: 'Frecuente',
                  child: Text('Cliente Frecuente'),
                ),
                DropdownMenuItem(
                  value: 'Corporativo',
                  child: Text('Cliente Corporativo'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  serviceLevel = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Precio Menú (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de Menus',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cantMenuText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTip,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
