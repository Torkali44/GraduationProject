import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text("About Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
