import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/paygo_provider.dart';

class MetodosPagoScreen extends StatefulWidget {
  const MetodosPagoScreen({super.key});

  @override
  State<MetodosPagoScreen> createState() => _MetodosPagoScreenState();
}

class _MetodosPagoScreenState extends State<MetodosPagoScreen> {
  String _tipo = 'DEBITO';
  final _numController = TextEditingController();
  final _vencController = TextEditingController();
  final _cvvController = TextEditingController();

  void _guardarTarjeta() {
    Provider.of<PayGoProvider>(context, listen: false).agregarMetodoPago(
      _tipo,
      _numController.text,
      _vencController.text,
      int.tryParse(_cvvController.text) ?? 123,
    );
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Método de pago registrado con éxito')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Métodos de Pago')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: _tipo,
              items: const [
                DropdownMenuItem(value: 'DEBITO', child: Text('Débito')),
                DropdownMenuItem(value: 'CREDITO', child: Text('Crédito')),
              ],
              onChanged: (val) => setState(() => _tipo = val!),
              decoration: const InputDecoration(labelText: 'Tipo de Tarjeta'),
            ),
            TextField(controller: _numController, decoration: const InputDecoration(labelText: 'Número de tarjeta (16 dígitos)')),
            TextField(controller: _vencController, decoration: const InputDecoration(labelText: 'Fecha Vencimiento (MM/AA)')),
            TextField(controller: _cvvController, obscureText: true, decoration: const InputDecoration(labelText: 'CVV')),
            const SizedBox(height: 25),
            ElevatedButton(onPressed: _guardarTarjeta, child: const Text('GUARDAR TARJETA'))
          ],
        ),
      ),
    );
  }
}