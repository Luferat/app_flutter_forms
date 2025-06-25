import 'package:flutter/material.dart';

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
        '/page_stateless': (context) => const ModelPageSl(),
        '/page_stateful': (context) => const ModelPageSf(),
        '/contacts': (context) => const ContactsPage(),
        '/about': (context) => const AboutPage(),
      },
      debugShowCheckedModeBanner: true,
    );
  }
}

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

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Sobre'),
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

// -------------------------------------------------------------------------- //

class ModelPageSl extends StatelessWidget {
  const ModelPageSl({super.key});

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

class ModelPageSf extends StatefulWidget {
  const ModelPageSf({super.key});

  @override
  State<ModelPageSf> createState() => _ModelPageSf();
}

class _ModelPageSf extends State<ModelPageSf> {
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

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key}); // ← Trocar nome

  @override
  State<ContactsPage> createState() => _ContactsPage(); // ← Trocar nomes
}

class _ContactsPage extends State<ContactsPage> {

  final GlobalKey<FormState> _contactsFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Faça Contato',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _contactsFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text(
                'Preencha todos os campos abaixo para entrar em contato conosco.',
              ),
              const SizedBox(height: 22.0),

              // Campo "Nome"
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),

                // Valida o preenchimento do nome
                validator: (value) {
                  // Validação do nome
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome.';
                  }
                  // Retorne null se a validação passar
                  return null;
                },
              ),
              // Espaçamento entre os campos
              const SizedBox(height: 22.0),

              // Campo "E-mail"
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),

                // Teclado otimizado para email
                keyboardType: TextInputType.emailAddress,

                // Valida o preenchimento do e-mail
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email.';
                  }
                  // Validação de e-mail com Regex
                  if (!_emailRegex.hasMatch(value)) {
                    return 'Por favor, insira um email válido.';
                  }
                  return null;
                },
              ),
              // Espaçamento entre os campos
              const SizedBox(height: 22.0),

              // Campo "Assunto"
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: 'Assunto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.subject),
                ),

                // Valida o campo 'assunto'
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o assunto.';
                  }
                  return null;
                },
              ),
              // Espaçamento entre os campos
              const SizedBox(height: 22.0),

              // Campo "Mensagem"
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Mensagem',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                  // Alinha o label com o hint em múltiplas linhas
                  alignLabelWithHint: true,
                ),
                // Permite múltiplas linhas para a mensagem
                maxLines: 5,
                // Teclado otimizado para múltiplas linhas
                keyboardType: TextInputType.multiline,

                // Valida o preenchimento da mensagem
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua mensagem.';
                  }
                  return null;
                },
              ),
              // Espaçamento entre os campos
              const SizedBox(height: 26.0),

              // Botão de Enviar
              ElevatedButton.icon(
                onPressed: () {
                  // Ação ao pressionar o botão
                  _submitForm();
                },
                icon: const Icon(Icons.send),
                label: const Text('Enviar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 22.0),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const Text('Rodapé de faça cotato!'),
    );
  }

  // Método para lidar com o envio do formulário
  void _submitForm() {
    // Valida todos os campos do formulário
    if (_contactsFormKey.currentState!.validate()) {
      // Se todos os campos forem válidos, prossiga com o envio
      final name = _nameController.text;
      final email = _emailController.text;
      final subject = _subjectController.text;
      final message = _messageController.text;

      // Debug: imprime os valores no console (remova depois dos testes)
      print('Nome: $name');
      print('Email: $email');
      print('Assunto: $subject');
      print('Mensagem: $message');

      // Adicione a lógica de envio aqui (ex: enviar para uma API, exibir uma mensagem, etc.)
      // Por exemplo, mostrar um SnackBar:
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Mensagem enviada por $name!')));

      // Limpa os campos após o envio
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } else {
      // Se houver erros de validação, avise o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos corretamente.'),
        ),
      );
    }
  }
}

// 7. FIM DO ALGORITMO.
