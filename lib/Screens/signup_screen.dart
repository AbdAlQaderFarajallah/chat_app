import 'package:chat_app/firebase/firebase_controller.dart';
import 'package:flutter/material.dart';

import '../Widgets/text_form-field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            const SizedBox(height: 80),
            const Text('Signup',
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
                await signup();
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signup() async {
    bool sign = await FBController().createAccount(
        email: _textEmailEditingController.text,
        password: _textPasswordEditingController.text);

    if (sign) {
      Navigator.pop(context);
    }
  }
}
