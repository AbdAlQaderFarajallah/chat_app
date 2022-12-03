import 'package:flutter/material.dart';

import '../Widgets/text_form-field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              type: TextInputType.text,
              hint: 'Name',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              type: TextInputType.emailAddress,
              hint: 'Email Address',
              prefixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              type: TextInputType.visiblePassword,
              hint: 'Password',
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
