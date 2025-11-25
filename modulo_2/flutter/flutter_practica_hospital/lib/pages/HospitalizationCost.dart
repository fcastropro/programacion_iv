import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalizationCostPage extends StatefulWidget {
  const HospitalizationCostPage({super.key});

  @override
  State<HospitalizationCostPage> createState() => _HospitalizationCostPageState();
}

class _HospitalizationCostPageState extends State<HospitalizationCostPage> {
  String roomType = 'General';
  String insuranceType = 'Público';
  String daysText = '';
  String baseCostText = '';
  String resultText = '';

  void calculateCost() {
    final days = int.tryParse(daysText) ?? 0;
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || baseCost <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    double roomFactor = 1.0;
    if (roomType == 'Semi-Privada') roomFactor = 1.4;
    if (roomType == 'Privada') roomFactor = 2.0;

    double insuranceDiscount = 0.0;
    if (insuranceType == 'Público') insuranceDiscount = 0.30;
    if (insuranceType == 'Privado') insuranceDiscount = 0.50;
    if (insuranceType == 'Sin seguro') insuranceDiscount = 0.0;

    final costBeforeDiscount = days * baseCost * roomFactor;
    final finalCost = costBeforeDiscount * (1 - insuranceDiscount);

    setState(() {
      resultText =
          'Habitación: $roomType\n'
          'Seguro: $insuranceType\n'
          'Días: $days\n'
          'Costo base diario: \$${baseCost.toStringAsFixed(2)}\n'
          'Costo sin descuento: \$${costBeforeDiscount.toStringAsFixed(2)}\n'
          'Costo final: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de Hospitalización'),
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
              'Cálculo de costo de hospitalización',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: roomType,
              decoration: const InputDecoration(
                labelText: 'Tipo de habitación',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'General', child: Text('General')),
                DropdownMenuItem(value: 'Semi-Privada', child: Text('Semi-Privada')),
                DropdownMenuItem(value: 'Privada', child: Text('Privada')),
              ],
              onChanged: (value) => setState(() => roomType = value!),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField(
              value: insuranceType,
              decoration: const InputDecoration(
                labelText: 'Tipo de seguro',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Público', child: Text('Público')),
                DropdownMenuItem(value: 'Privado', child: Text('Privado')),
                DropdownMenuItem(value: 'Sin seguro', child: Text('Sin seguro')),
              ],
              onChanged: (value) => setState(() => insuranceType = value!),
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Días de hospitalización',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => daysText = value,
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo diario base (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => baseCostText = value,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateCost,
              child: const Text('Calcular costo'),
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
