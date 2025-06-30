import 'package:flutter/material.dart';

class ModelPageStateless extends StatelessWidget {
  const ModelPageStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateless',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Text('Página Modelo Stateful'),
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}