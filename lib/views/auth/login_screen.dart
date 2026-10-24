import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/paygo_provider.dart';
import '../dashboards/cliente_dashboard.dart';
import '../dashboards/admin_dashboard.dart';
import '../dashboards/banquero_dashboard.dart';
import 'register_screen.dart';
import '../../models/usuario_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correoController = TextEditingController();
  final _passController = TextEditingController();

  void _iniciarSesion(BuildContext context) {
    final provider = Provider.of<PayGoProvider>(context, listen: false);
    bool exito = provider.login(_correoController.text, _passController.text);

    if (exito) {
      Widget destino;
      if (provider.usuarioActual?.rol == RolUsuario.ADMIN) {
        destino = const AdminDashboard();
      } else if (provider.usuarioActual?.rol == RolUsuario.BANQUERO) {
        destino = const BanqueroDashboard();
      } else {
        destino = const ClienteDashboard();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => destino));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2564),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance_wallet, size: 80, color: Colors.white),
                const SizedBox(height: 20),
                const Text('PayGo Login', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 30),
                TextField(
                  controller: _correoController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Usuario / Correo (admin, banquero o común)',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0D2564),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => _iniciarSesion(context),
                  child: const Text('CONTINUAR', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                  child: const Text('Crear Cuenta', style: TextStyle(color: Colors.white70)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}