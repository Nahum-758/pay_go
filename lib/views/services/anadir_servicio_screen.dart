import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/paygo_provider.dart';

class AnadirServicioScreen extends StatefulWidget {
  const AnadirServicioScreen({super.key});

  @override
  State<AnadirServicioScreen> createState() => _AnadirServicioScreenState();
}

class _AnadirServicioScreenState extends State<AnadirServicioScreen> {
  final _nombreController = TextEditingController();
  final _contratoController = TextEditingController();
  final _montoController = TextEditingController();

  void _guardar() {
    Provider.of<PayGoProvider>(context, listen: false).agregarServicio(
      _nombreController.text,
      _contratoController.text,
      double.tryParse(_montoController.text) ?? 100.0,
    );
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Servicio añadido con éxito')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Nuevo Servicio')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre del servicio (Ej. Luz, Agua)')),
            TextField(controller: _contratoController, decoration: const InputDecoration(labelText: 'Número de Contrato / Referencia')),
            TextField(controller: _montoController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Monto inicial a pagar')),
            const SizedBox(height: 25),
            ElevatedButton(onPressed: _guardar, child: const Text('GUARDAR Y CONTINUAR'))
          ],
        ),
      ),
    );
  }
}