import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final Dio _dio = Dio();

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPage();
}

class _ContactsPage extends State<ContactsPage> {
  final GlobalKey<FormState> _contactsFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)*$',
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
              const SizedBox(height: 5.0),
              Center(
                child: Text('Todos os campos são obrigatórios',
                  style: TextStyle(fontSize: 10.0, color: Colors.red,),
                ),
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
                  _submitContactForm();
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

  // Método para lidar com o envio do formulário
  void _submitContactForm() async {

    if (_contactsFormKey.currentState!.validate()) {

      final name = _nameController.text;
      final email = _emailController.text;
      final subject = _subjectController.text;
      final message = _messageController.text;

      // Formata o JSON
      final Map<String, String> formData = {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      };

      // Define a URL do endpoint
      // Use 10.0.2.2 para Android Emulator
      final String apiUrl = 'http://localhost:8080/contact';

      // Debug: imprime os valores no console (remova depois dos testes)
      if (kDebugMode) {
        print('\n\n--------------------');
        print('Nome: $name');
        print('Email: $email');
        print('Assunto: $subject');
        print('Mensagem: $message');
        print('--------------------\n\n');
      }

      try {
        // Envia a requisição POST com Dio de forma assíncrona
        final Response response = await _dio.post(
          apiUrl,
          data: formData, // O Dio converte automaticamente o Map para JSON
          options: Options(
            // Define o Content-Type como JSON
            contentType: Headers.jsonContentType,
          ),
        );

        // Testa se a sessão ainda está montada
        if (!mounted) return;

        // Dio encapsula a resposta em um objeto Response
        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mensagem enviada com sucesso!')),
          );

          // Limpa os campos para o reuso do formulário
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        } else {
          // Dio retorna data no formato correto (Map/List)
          if (kDebugMode) {
            // Isso só funciona em "DegubMode"
            print('Erro ao enviar mensagem: ${response.statusCode}');
            print('Corpo da resposta: ${response.data}');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Falha ao enviar mensagem. Status: ${response.statusCode}',
              ),
            ),
          );
        }
      } on DioException catch (e) {
        // Use DioException para capturar erros específicos do Dio
        if (e.response != null) {
          // Erro de resposta do servidor (ex: 4xx, 5xx)
          if (kDebugMode) {
            print('Erro de resposta do Dio: ${e.response!.statusCode}');
            print('Dados do erro: ${e.response!.data}');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Falha ao enviar. Erro do servidor: ${e.response!.statusCode}',
              ),
            ),
          );
        } else {
          // Erro de conexão ou configuração
          if (kDebugMode) {
            print('Erro de conexão ou configuração do Dio: $e');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Erro de conexão. Verifique sua rede e o servidor.',
              ),
            ),
          );
        }
      } catch (e) {
        // Outros erros inesperados
        if (kDebugMode) {
          print('Erro inesperado: $e');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ocorreu um erro inesperado.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos corretamente.'),
        ),
      );
    }
  }
}