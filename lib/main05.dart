import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/model_stateful_page.dart';
import 'pages/model_stateless_page.dart';
import 'pages/about_page.dart';
import 'pages/test_page.dart';
import 'pages/contacts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
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
      },
      debugShowCheckedModeBanner: true,
    );
  }
}
