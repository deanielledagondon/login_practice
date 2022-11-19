import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recover Account'),
      ),
      body: const Center(
        child: Text('Kapoy na tuon rar'),
      ),
    );
  }
}
