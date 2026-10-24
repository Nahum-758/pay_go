import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/paygo_provider.dart';
import '../auth/login_screen.dart';

class BanqueroDashboard extends StatelessWidget {
  const BanqueroDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PayGoProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D2564),
      appBar: AppBar(
        title: Text('Bienvenido: BANQUERO (${provider.usuarioActual?.nombre ?? ''})'),
        backgroundColor: const Color(0xFF0D2564),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              provider.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Color(0xFF0D2564)),
                title: Text('Citas pendientes', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Revisar citas agendadas con clientes'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.money_off, color: Color(0xFF0D2564)),
                title: Text('Adeudos de clientes', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Consultar estatus de pagos y servicios'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.people, color: Color(0xFF0D2564)),
                title: Text('Clientes a tu nombre', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Revisar cartera de clientes asignados'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}