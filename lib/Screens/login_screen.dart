import 'package:flutter/material.dart';
import 'package:chat_app/firebase/firebase_controller.dart';
import '../Widgets/text_form-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPasswordEditingController;
  @override
  void initState() {
    _textEmailEditingController = TextEditingController();
    _textPasswordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Welcome To Chat My',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 90),
            const Text('Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              textEditingController: _textEmailEditingController,
              type: TextInputType.emailAddress,
              hint: 'Email Address',
              prefixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              textEditingController: _textPasswordEditingController,
              type: TextInputType.visiblePassword,
              hint: 'Password',
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await login();
              },
              child: const Text('Login'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup_screen');
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    bool login = await FBController().login(
        email: _textEmailEditingController.text,
        password: _textPasswordEditingController.text);

    if (login) {
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
  }
}
