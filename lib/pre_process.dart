import 'package:flutter/material.dart';

class PreProcessScreen extends StatelessWidget {
  const PreProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Process Screen'),
      ),
      body: const Center(
        child: Text('This is the pre-process screen.'),
      ),
    );
  }
}
