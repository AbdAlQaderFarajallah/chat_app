import 'package:chat_app/Screens/launch_screen.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:chat_app/Screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
      },
      initialRoute: '/launch_screen',
    );
  }
}
