// lib/presentation/register/register_page.dart
import 'package:flutter/material.dart';
import 'package:login/presentation/data/models/user_model.dart';
import 'package:login/presentation/data/services/auth_service.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _cadastrar() async {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text != _confirmarSenhaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("As senhas não coincidem!"), backgroundColor: Colors.red),
        );
        return;
      }

      setState(() => _isLoading = true);

      
      final novoUsuario = UserModel(
        nome: _nomeController.text,
        senha: _senhaController.text,
      );

      bool sucesso = await _authService.cadastrar(novoUsuario);

      if (mounted) setState(() => _isLoading = false);

      if (sucesso) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cadastro realizado com sucesso!"), backgroundColor: Colors.green),
        );
        Navigator.pop(context); // Volta para a tela de login
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao cadastrar. Tente novamente."), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Criar Conta")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.person_add, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              CustomTextField(
                label: "Nome Completo",
                icon: Icons.person_outline,
                controller: _nomeController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Senha",
                icon: Icons.lock_outline,
                isPassword: true,
                controller: _senhaController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Confirmar Senha",
                icon: Icons.lock_reset,
                isPassword: true,
                controller: _confirmarSenhaController,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _cadastrar,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Finalizar Cadastro"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}