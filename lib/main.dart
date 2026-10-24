import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/paygo_provider.dart';
import 'views/auth/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PayGoProvider()),
      ],
      child: const PayGoApp(),
    ),
  );
}

class PayGoApp extends StatelessWidget {
  const PayGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayGo Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}