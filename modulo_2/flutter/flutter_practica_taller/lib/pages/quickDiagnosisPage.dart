import 'package:flutter/material.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  String selectedSymptom = 'Vibración al frenar';
  TextEditingController kmController = TextEditingController();
  String rangeText = '';
  String diagnosisText = '';
  String recommendationText = '';


  void diagnose() {
    String problem = '';
    String recommendation = '';

    switch (selectedSymptom) {
      case 'Vibración al frenar':
        problem = 'Problema probable: Discos de freno deformados.';
        break;
      case 'Humo azul del escape':
        problem = 'Problema probable: Fugas de aceite o desgaste en el motor.';
        break;
      case 'Ralentí inestable':
        problem = 'Problema probable: Filtro de aire o inyectores sucios.';
        break;
      case 'Ruido metálico al arrancar':
        problem = 'Problema probable: Desgaste de las pastillas de freno o el motor.';
        break;
      default:
        problem = 'Síntoma desconocido.';
    }

    int km = int.tryParse(kmController.text) ?? 0;

    if (km <= 5000) {
        rangeText = 'Moderado';
        recommendation = 'Recomendación: Revisión regular en el taller.';
    } else if (km > 5000 && km <= 15000) {
        rangeText = 'Importante';
        recommendation = 'Recomendación: Reemplazo de piezas y ajuste del sistema.';
    } else {
        rangeText = 'Crítico';
        recommendation = 'Recomendación: Revisión exhaustiva del motor y sistema de frenos.';
    }

    setState(() {
      diagnosisText = problem;
      recommendationText = recommendation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico de vehículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione el síntoma:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: selectedSymptom,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Vibración al frenar',
                  child: Text('Vibración al frenar'),
                ),
                DropdownMenuItem(
                  value: 'Humo azul del escape',
                  child: Text('Humo azul del escape'),
                ),
                DropdownMenuItem(
                  value: 'Ralentí inestable',
                  child: Text('Ralentí inestable'),
                ),
                DropdownMenuItem(
                  value: 'Ruido metálico al arrancar',
                  child: Text('Ruido metálico al arrancar'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedSymptom = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text(
              'Kilómetros desde el último mantenimiento:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Kilómetros',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: diagnose,
              child: const Text('Ver diagnóstico'),
            ),

            const SizedBox(height: 16),

            if (diagnosisText.isNotEmpty) ...[
                const Text(
                'Rango de kilometraje:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
                Text(rangeText),
                const SizedBox(height: 16),
                const Text(
                'Diagnóstico:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(diagnosisText),

              const SizedBox(height: 16),
              const Text(
                'Recomendación:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(recommendationText),
            ],
          ],
        ),
      ),
    );
  }
}
