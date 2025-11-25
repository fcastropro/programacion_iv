import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String vehicleType = 'Auto';
  String serviceType = 'Solo alineación';
  int tireCount = 2;
  String resultText = '';
  double totalPrice = 0;

  void calculateService() {
    double vehiclePrice = 0;
    double tirePrice = 0;
    if (vehicleType == 'Auto') {
      vehiclePrice = 10;
    } else if (vehicleType == 'Camioneta') {
      vehiclePrice = 15;
    } else {
      vehiclePrice = 25;
    }

    if (serviceType == 'Solo alineación') {
      tirePrice = 8;
    } else if (serviceType == 'Solo balanceo') {
      tirePrice = 5;
    } else {
      tirePrice = 12;
    }

    totalPrice = vehiclePrice + (tirePrice * tireCount);
    String workClassification = '';
    if (totalPrice < 50) {
      workClassification = 'Trabajo pequeño';
    } else if (totalPrice >= 50 && totalPrice <= 100) {
      workClassification = 'Trabajo medio';
    } else {
      workClassification = 'Trabajo grande';
    }

    setState(() {
      resultText = 'Vehículo: $vehicleType\n'
          'Servicio: $serviceType\n'
          'Cantidad de llantas: $tireCount\n'
          'Precio total: \$${totalPrice.toStringAsFixed(2)}\n'
          'Clasificación: $workClassification';
    });
  }

  @override
  void initState() {
    super.initState();
    calculateService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios de llantas'),
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
              'Seleccione un tipo de vehículo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: vehicleType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Auto',
                  child: Text('Auto'),
                ),
                DropdownMenuItem(
                  value: 'Camioneta',
                  child: Text('Camioneta'),
                ),
                DropdownMenuItem(
                  value: 'Camión',
                  child: Text('Camión'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  vehicleType = value;
                  calculateService();
                });
              },
            ),

            const SizedBox(height: 16),
            const Text(
              'Seleccione el tipo de servicio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: serviceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Solo alineación',
                  child: Text('Solo alineación'),
                ),
                DropdownMenuItem(
                  value: 'Solo balanceo',
                  child: Text('Solo balanceo'),
                ),
                DropdownMenuItem(
                  value: 'Ambos',
                  child: Text('Alineación y balanceo'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  serviceType = value;
                  calculateService();
                });
              },
            ),

            const SizedBox(height: 16),
            const Text(
              'Seleccione la cantidad de llantas (2-6)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Slider(
              value: tireCount.toDouble(),
              min: 2,
              max: 8,
              divisions: 4,
              label: tireCount.toString(),
              onChanged: (value) {
                setState(() {
                  tireCount = value.toInt();
                  calculateService();
                });
              },
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
