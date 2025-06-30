import 'package:flutter/material.dart';


class ModelPageStateful extends StatefulWidget {
  const ModelPageStateful({super.key});

  @override
  State<ModelPageStateful> createState() => _ModelPageStateful();
}

class _ModelPageStateful extends State<ModelPageStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateful',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Text('Conteúdo da página modelo!'),
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}