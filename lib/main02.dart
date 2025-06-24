// 1. INÍCIO

/*
2. IMPORTAR BIBLIOTECAS E PÁGINAS NECESSÁRIAS:
   a. Importar o pacote 'material.dart' do Flutter.
*/
import 'package:flutter/material.dart';

/*
3. DEFINIR FUNÇÃO PRINCIPAL 'main':
   a. CHAMAR A FUNÇÃO 'runApp()'.
   b. PASSAR UMA NOVA INSTÂNCIA DE 'MyApp' (com uma chave opcional) para 'runApp()'.
*/
void main() {
  runApp(const MyApp());
}

/*
4. DEFINIR CLASSE 'MyApp':
   a. DECLARAR 'MyApp' como uma CLASSE QUE ESTENDE 'StatelessWidget'.
   b. DEFINIR O CONSTRUTOR de 'MyApp' (recebe uma chave opcional).
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
5. SOBRESCREVER O MÉTODO 'build' DENTRO DE 'MyApp':
   a. O MÉTODO 'build' RECEBE UM 'BuildContext' (informações sobre a árvore de widgets).
   b. RETORNAR UM WIDGET 'MaterialApp'.
*/
  @override
  Widget build(BuildContext context) {
    /*
6. CONFIGURAR 'MaterialApp':
   a. DEFINIR O TÍTULO da aplicação como 'Hello World'.
   b. DEFINIR O TEMA da aplicação:
       i. Usar 'ThemeData'.
       ii. Configurar a cor primária para 'Colors.blue'.
       iii. Configurar a densidade visual para se adaptar à plataforma.
   c. DEFINIR A ROTA INICIAL como '/'.
   d. DEFINIR AS ROTAS NOMEADAS (um mapa de strings para funções que criam widgets):
       i. Para a rota '/': ASSOCIAR À INSTÂNCIA DE 'HomePage'.
       ii. Para a rota '/test': ASSOCIAR À INSTÂNCIA DE 'TestPage'.
       iii. Para a rota '/contacts': ASSOCIAR À INSTÂNCIA DE 'ContactFormPage'.
*/
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
        '/pagesl': (context) => const ModelPageSl(),
        '/pagesf': (context) => const ModelPageSf(),
        // Adiciona a rota para a página de contatos
        '/contacts': (context) => const ContactsPage(),
      },
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text('Página inicial'),

            // Texto clicável
            InkWell(
              child: Text('Página Modelo Stateless'),
              onTap: () => {Navigator.pushNamed(context, '/pagesl')},
            ),

            // Texto clicável
            InkWell(
              child: Text('Página Modelo Stateful'),
              onTap: () => {Navigator.pushNamed(context, '/pagesf')},
            ),

            // Texto clicável
            InkWell(
              child: Text('Faça contato'),
              onTap: () => {Navigator.pushNamed(context, '/contacts')},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Text('Rodapé de Hello World!'),
    );
  }
}

// -------------------------------------------------------------------------- //

// Página modelo - StatelessWidget
// Use essa classe como modelo para criar novas páginas/rotas no aplicativo.
// Dica: atualize este código sempre que precisar, por exemplo, quando
// "componentizar" alguma estrutura.
class ModelPageSl extends StatelessWidget {
  const ModelPageSl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateless',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Text('Página Modelo Stateful'),
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}

// Página modelo - StatefulWidget - Parte 1
// Use essas classes como modelo para criar novas páginas/rotas no aplicativo.
// Dica: atualize este código sempre que precisar, por exemplo, quando
// "componentizar" alguma estrutura.
class ModelPageSf extends StatefulWidget {
  const ModelPageSf({super.key});

  @override
  State<ModelPageSf> createState() => _ModelPageSf();
}

// Página modelo - StatefulWidget - Parte 2
class _ModelPageSf extends State<ModelPageSf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateful',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Text('Conteúdo da página modelo!'),
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
} // Modelo Stateful termina aqui

// Página vazia (Não implementada)
// Usada apenas para "demarcar" páginas futuras
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// Página modelo - StatefulWidget - Parte 1
// Use essas classes como modelo para criar novas páginas/rotas no aplicativo.
// Dica: atualize este código sempre que precisar, por exemplo, quando
// "componentizar" alguma estrutura.
class ContactsPage extends StatefulWidget { // ← Trocar nome
  const ContactsPage({super.key}); // ← Trocar nome

  @override
  State<ContactsPage> createState() => _ContactsPage(); // ← Trocar nomes
}

// Página modelo - StatefulWidget - Parte 2
class _ContactsPage extends State<ContactsPage> { // ← Trocar nome

  // Declara os controladores para cada campo
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // IMPORTANTE! Libera os controladores quando o widget for descartado
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

      body: SingleChildScrollView( // Garante que a tela role quando o teclado aparecer
        padding: const EdgeInsets.all(22.0),
        child: Column(

          // Estica os campos horizontalmente
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

      bottomNavigationBar: const Text('Rodapé de faça cotato!'),
    );
  }

  // Método para lidar com o envio do formulário
  void _submitForm() {
    final name = _nameController.text;
    final email = _emailController.text;
    final subject = _subjectController.text;
    final message = _messageController.text;

    // Debug: imprime os valores no console
    // Remova no build final
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
  }

}





// 7. FIM DO ALGORITMO.