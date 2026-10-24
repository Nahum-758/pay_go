// lib/views/forms/formulario_registro_screen.dart
import 'package:flutter/material.dart';

class FormularioRegistroScreen extends StatefulWidget {
  const FormularioRegistroScreen({super.key});

  @override
  State<FormularioRegistroScreen> createState() => _FormularioRegistroScreenState();
}

class _FormularioRegistroScreenState extends State<FormularioRegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _conceptoController = TextEditingController();
  final _montoController = TextEditingController();

  void _guardarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transacción guardada exitosamente')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Transacción')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _conceptoController,
                decoration: const InputDecoration(labelText: 'Concepto de Pago', border: OutlineInputBorder()),
                validator: (v) => v == null || v.isEmpty ? 'Ingresa un concepto' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _montoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Monto (\$ MXN)', border: OutlineInputBorder()),
                validator: (v) => v == null || double.tryParse(v) == null ? 'Ingresa un monto válido' : null,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _guardarFormulario,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text('Guardar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}