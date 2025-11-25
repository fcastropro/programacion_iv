import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  String plato = 'Pollo';
  String bebida = 'Gaseosa';
  String acomp = 'Papas';

  
  String cantPlatoText = '';
  String cantBebText = '';
  String cantAcompText = '';

  String resultText = '';


  final Map<String, double> precioPlato = {
    'Pollo': 6,
    'Carne': 7,
    'Vegetariano': 5,
  };

  final Map<String, double> precioBebida = {
    'Gaseosa': 2,
    'Jugo': 3,
    'Agua': 1,
  };

  final Map<String, double> precioAcomp = {
    'Papas': 2,
    'Ensalada': 2.5,
    'Pan': 1.5,
  };

  void calcularTotal() {
    final cantPlato = double.tryParse(cantPlatoText) ?? 0;
    final cantBeb = double.tryParse(cantBebText) ?? 0;
    final cantAcomp = double.tryParse(cantAcompText) ?? 0;

    if (cantPlato <= 0 || cantBeb <= 0 || cantAcomp <= 0) {
      setState(() {
        resultText = 'Error: alguna cantidad es menor o igual a 0';
      });
      return;
    }

    final subtotalPlato = precioPlato[plato]! * cantPlato;
    final subtotalBebida = precioBebida[bebida]! * cantBeb;
    final subtotalAcompa = precioAcomp[acomp]! * cantAcomp;

    final total = subtotalPlato + subtotalBebida + subtotalAcompa;

    setState(() {
      resultText =
          'Subtotal Plato: \$${subtotalPlato.toStringAsFixed(2)}\n'
          'Subtotal Bebida: \$${subtotalBebida.toStringAsFixed(2)}\n'
          'Subtotal Acompañamiento: \$${subtotalAcompa.toStringAsFixed(2)}\n\n'
          'TOTAL GENERAL: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Combos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Seleccione su combo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            
            const Text('Tipo de Plato'),
            DropdownButton<String>(
              value: plato,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Pollo', child: Text('Pollo (\$6)')),
                DropdownMenuItem(value: 'Carne', child: Text('Carne (\$7)')),
                DropdownMenuItem(
                    value: 'Vegetariano', child: Text('Vegetariano (\$5)')),
              ],
              onChanged: (value) => setState(() => plato = value!),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de platos',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => cantPlatoText = value,
            ),

            const SizedBox(height: 20),

            
            const Text('Bebida'),
            DropdownButton<String>(
              value: bebida,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Gaseosa', child: Text('Gaseosa (\$2)')),
                DropdownMenuItem(value: 'Jugo', child: Text('Jugo (\$3)')),
                DropdownMenuItem(value: 'Agua', child: Text('Agua (\$1)')),
              ],
              onChanged: (value) => setState(() => bebida = value!),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de bebidas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => cantBebText = value,
            ),

            const SizedBox(height: 20),

            const Text('Acompañamiento'),
            DropdownButton<String>(
              value: acomp,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Papas', child: Text('Papas (\$2)')),
                DropdownMenuItem(
                    value: 'Ensalada', child: Text('Ensalada (\$2.5)')),
                DropdownMenuItem(value: 'Pan', child: Text('Pan (\$1.5)')),
              ],
              onChanged: (value) => setState(() => acomp = value!),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de acompañamientos',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => cantAcompText = value,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: calcularTotal,
              child: const Text('Calcular Total'),
            ),

            const SizedBox(height: 20),

            Text(
              resultText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
