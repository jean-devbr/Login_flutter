// lib/presentation/register/register_page.dart
import 'package:flutter/material.dart';
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
  bool _isLoading = false;

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      // Validação extra: as senhas são iguais?
      if (_senhaController.text != _confirmarSenhaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("As senhas não coincidem!"), backgroundColor: Colors.red),
        );
        return;
      }

      setState(() => _isLoading = true);
      
      // Aqui chamaremos a API Java futuramente (POST /usuarios)
      print("Cadastrando: ${_nomeController.text}");

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
          // Mostrar mensagem de sucesso e voltar para o login
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Cadastro realizado com sucesso!")),
          );
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Criar Conta")),
      body: SingleChildScrollView( // Garante que a tela não quebre se o teclado subir
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