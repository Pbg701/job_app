import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/user/user_dashboard.dart';
import 'screens/login/admin_login_screen.dart';
import 'screens/login/user_login_screen.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().currentUser == null
          ? const LoginScreen()
          : const UserDashboard(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 104, 240, 167),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 249, 147, 250),
          title: const Text('Login pages')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: Image.asset("assets/images/login.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminLoginScreen()));
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 128, 223, 230))),
                child: const Text('Admin Login'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserLoginScreen()));
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 128, 223, 230))),
                child: const Text('User Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
