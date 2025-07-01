import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello World',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        // Esquerda da appBar
        leading: Icon(Icons.home),
        // Flutua na appBar
        flexibleSpace: Icon(Icons.settings),
        // Direita da appBar
        actions: [Text('Coisa')],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              'Página inicial',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page_stateless');
              },
              child: const Text('Ir para Página Stateless'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page_stateful');
              },
              child: const Text('Ir para Página Stateful'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contacts');
              },
              child: const Text('Faça Contato'),
            ),

            /*
            InkWell(
              child: Text('Página Modelo Stateless'),
              onTap: () => {Navigator.pushNamed(context, '/pagesl')},
            ),

            InkWell(
              child: Text('Página Modelo Stateful'),
              onTap: () => {Navigator.pushNamed(context, '/pagesf')},
            ),

            InkWell(
              child: Text('Faça contato'),
              onTap: () => {Navigator.pushNamed(context, '/contacts')},
            ),
            */
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue,
        height: 40.0,
        child: SizedBox(
          child: Center(
            child: Text(
              'Rodapé do Aplicativo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
