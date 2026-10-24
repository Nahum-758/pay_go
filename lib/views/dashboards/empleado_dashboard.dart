// lib/views/dashboards/empleado_dashboard.dart
import 'package:flutter/material.dart';

class EmpleadoDashboard extends StatelessWidget {
  const EmpleadoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2564),
      appBar: AppBar(title: const Text('Bienvenido: EMPLEADO')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(title: Text('Citas Pendientes con Clientes'), leading: Icon(Icons.calendar_today))),
          Card(child: ListTile(title: Text('Adeudos de Clientes Registrados'), leading: Icon(Icons.money_off))),
          Card(child: ListTile(title: Text('Reporte de Clientes a tu Cargo'), leading: Icon(Icons.people))),
        ],
      ),
    );
  }
}