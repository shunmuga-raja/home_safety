import 'package:flutter/material.dart';
import 'package:home_safety/child/child_login_screen.dart';

class ProfilePage extends StatelessWidget {
  //const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page'),backgroundColor: Color.fromARGB(255, 130, 3, 120),centerTitle: true),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Logout',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 130, 3, 120))),
        ),
      ),
    );
  }
}
