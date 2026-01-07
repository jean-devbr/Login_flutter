// lib/presentation/home/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String nome;
  final String senha;

  // O construtor recebe os dados da tela de login
  const HomePage({
    super.key, 
    required this.nome, 
    required this.senha,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Área Logada"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pop(context), // Volta para o login
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // O card se ajusta ao conteúdo
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Bem-vindo, $nome!",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 30),
                  const Text("Seus dados de acesso:", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.badge),
                    title: const Text("Nome de usuário"),
                    subtitle: Text(nome),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text("Sua senha digitada"),
                    subtitle: Text(senha),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}