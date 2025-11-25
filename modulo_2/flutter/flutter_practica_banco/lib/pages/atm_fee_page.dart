import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AtmFeePage extends StatefulWidget {
  const AtmFeePage({super.key});

  @override
  State<AtmFeePage> createState() => _AtmFeePageState();
}

class _AtmFeePageState extends State<AtmFeePage> {
  String cardType = 'Licencia Activa';
  String amountText = '';
  String resultText = '';

  void calculateAtmFee() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 17) {
      setState(() {
        resultText = 'Menor de Edad no puede Conducir';
      });
      return;
    }

    double fee = 0.0;

    if (cardType == 'Licencia Activa') {
      setState(() {
        resultText = 'Puede Conducir';
      });
    } else if (cardType == 'No tiene Licencia') {
      setState(() {
        resultText = 'Tiene que sacar Licencia';
      });
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comisión de cajero'),
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
              'Cálculo de comisión en cajero',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: cardType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Licencia Activa',
                  child: Text('Tiene Licencia'),
                ),
                DropdownMenuItem(
                  value: 'No tiene Licencia',
                  child: Text('No Tiene Licencia'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  cardType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateAtmFee,
              child: const Text('Analizar'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
