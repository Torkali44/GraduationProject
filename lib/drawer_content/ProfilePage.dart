import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    final usernameController = TextEditingController(text: user.username);
    final emailController = TextEditingController(text: user.email);
    final phoneController = TextEditingController(text: user.phone);
    final ageController = TextEditingController(text: user.age);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                user.username = usernameController.text;
                user.email = emailController.text;
                user.phone = phoneController.text;
                user.age = ageController.text;
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.teal),
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
