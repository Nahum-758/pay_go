import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2564),
      appBar: AppBar(title: const Text('Bienvenido: ADMINISTRADOR')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(title: Text('Editar Páginas de la App'), leading: Icon(Icons.edit))),
          Card(child: ListTile(title: Text('Administrar Bases de Datos SQL'), leading: Icon(Icons.storage))),
          Card(child: ListTile(title: Text('Reportes Anuales / Mensuales'), leading: Icon(Icons.assessment))),
        ],
      ),
    );
  }
}