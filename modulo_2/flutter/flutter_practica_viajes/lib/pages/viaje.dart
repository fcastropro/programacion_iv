import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelCostPage extends StatefulWidget {
  const TravelCostPage({super.key});

  @override
  State<TravelCostPage> createState() => _TravelCostPageState();
}

class _TravelCostPageState extends State<TravelCostPage> {
  
  String daysText = '';
  String personsText = '';
  String basePriceText = '';

 
  String destination = "Playa";

  
  String lodging = "Hostal";

  
  bool includeTours = false;
  bool includeInsurance = false;

 
  String resultText = '';

  void calculate() {
    final days = int.tryParse(daysText) ?? 0;
    final persons = int.tryParse(personsText) ?? 0;
    final basePrice = double.tryParse(basePriceText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || persons <= 0 || basePrice <= 0) {
      setState(() {
        resultText = "Ingrese valores válidos.";
      });
      return;
    }

    
    double destinationFactor = 1.0;
    if (destination == "Playa") destinationFactor = 1.1;
    if (destination == "Montaña") destinationFactor = 1.2;
    if (destination == "Ciudad") destinationFactor = 1.3;

    
    double lodgingFactor = 1.0;
    if (lodging == "Hotel 3 Estrellas") lodgingFactor = 1.3;
    if (lodging == "Hotel 5 Estrellas") lodgingFactor = 1.6;

    
    final subtotal = days * persons * basePrice;

    double recargos = subtotal * (destinationFactor - 1);
    recargos += subtotal * (lodgingFactor - 1);

    if (includeTours) recargos += subtotal * 0.10;
    if (includeInsurance) recargos += subtotal * 0.05;

    final total = subtotal + recargos;
    final pricePerPerson = total / persons;

    setState(() {
      resultText =
        "Subtotal: \$${subtotal.toStringAsFixed(2)}\n"
        "Recargos: \$${recargos.toStringAsFixed(2)}\n"
        "Precio Total: \$${total.toStringAsFixed(2)}\n"
        "Precio por persona: \$${pricePerPerson.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Costo de Viaje"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Cálculo de costo de viaje",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: "Días de viaje",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => daysText = v,
            ),

            const SizedBox(height: 12),

            
            TextField(
              decoration: const InputDecoration(
                labelText: "Número de personas",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => personsText = v,
            ),

            const SizedBox(height: 12),

        
            TextField(
              decoration: const InputDecoration(
                labelText: "Precio base por día (\$)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => basePriceText = v,
            ),

            const SizedBox(height: 40),

            DropdownButtonFormField(
              value: destination,
              decoration: const InputDecoration(
                labelText: "Destino",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "Playa", child: Text("Playa")),
                DropdownMenuItem(value: "Montaña", child: Text("Montaña")),
                DropdownMenuItem(value: "Ciudad", child: Text("Ciudad")),
              ],
              onChanged: (v) => setState(() => destination = v!),
            ),

            const SizedBox(height: 20),

            const Text("Alojamiento:", style: TextStyle(fontSize: 16)),

            RadioListTile(
              title: const Text("Hostal"),
              value: "Hostal",
              groupValue: lodging,
              onChanged: (v) => setState(() => lodging = v!),
            ),
            RadioListTile(
              title: const Text("Hotel 3 Estrellas"),
              value: "Hotel 3 Estrellas",
              groupValue: lodging,
              onChanged: (v) => setState(() => lodging = v!),
            ),
            RadioListTile(
              title: const Text("Hotel 5 Estrellas"),
              value: "Hotel 5 Estrellas",
              groupValue: lodging,
              onChanged: (v) => setState(() => lodging = v!),
            ),

            const SizedBox(height: 10),

            
            CheckboxListTile(
              title: const Text("Incluir tours (+10%)"),
              value: includeTours,
              onChanged: (v) => setState(() => includeTours = v!),
            ),

        
            CheckboxListTile(
              title: const Text("Incluir seguro (+5%)"),
              value: includeInsurance,
              onChanged: (v) => setState(() => includeInsurance = v!),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: calculate,
              child: const Text("Calcular"),
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
