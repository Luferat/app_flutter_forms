import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/model_stateful_page.dart';
import 'pages/model_stateless_page.dart';
import 'pages/about_page.dart';
import 'pages/test_page.dart';
import 'pages/contacts_page.dart';
import 'pages/book_page_details.dart';
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/test': (context) => const TestPage(),
        '/page_stateless': (context) => const ModelPageStateless(),
        '/page_stateful': (context) => const ModelPageStateful(),
        '/contacts': (context) => const ContactsPage(),
        '/about': (context) => const AboutPage(),

        // Rota para exibir um livro único identificado pelo Id
        // Id é passado como argumento
        '/view': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          int? bookId;
          if (args != null) {
            try {
              // Tenta converter para String e depois para int
              bookId = int.tryParse(args.toString());
            } catch (e) {
              // Em caso de erro na conversão (se não for uma String numérica)
              if (kDebugMode) {
                print('Erro ao converter o ID do livro: $e');
              }
            }
          }
          // Verifique se a conversão foi bem-sucedida e se bookId não é nulo
          if (bookId != null) {
            return BookDetailPage(bookId: bookId);
          }
          // Caso contrário, mostra a tela de erro
          return Scaffold(
            appBar: AppBar(title: const Text('Erro')),
            body: const Center(
              child: Text('ID do livro não fornecido ou inválido.'),
            ),
          );
        },
      },
      debugShowCheckedModeBanner: true,
    );
  }
}
