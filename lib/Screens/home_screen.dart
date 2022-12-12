import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../shared_pref/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images/messages.webp'),
        title: Text('Chat'),
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                await SharedPref().clear();
                Navigator.popAndPushNamed(context, '/Login_screen');
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: ListView()),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Write'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Send'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
