import 'package:flutter/material.dart';
import 'veterinary_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please choose an option:',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Human'),
              onPressed: () {
                // Navigate to the symptom screen for humans
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Veterinary'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VeterinaryScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
