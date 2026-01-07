import 'package:flutter/material.dart';
import 'package:login/presentation/home/home_page.dart';
import 'package:login/presentation/register/register_page.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              nome: _nomeController.text,
              senha: _senhaController.text,
            ),
          ), 
        );
      
      // AQUI entrará a chamada para sua API Java futuramente
      print("Nome: ${_nomeController.text}, Senha: ${_senhaController.text}");
      
      // Simulando um delay de rede
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) setState(() => _isLoading = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Bem-vindo",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                label: "Nome",
                icon: Icons.person,
                controller: _nomeController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Senha",
                icon: Icons.lock,
                isPassword: true,
                controller: _senhaController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _isLoading 
                    ? const CircularProgressIndicator() 
                    : const Text("Entrar", style: TextStyle(fontSize: 18)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                 
                },
                child: const Text("Não tem uma conta? Cadastre-se"),
              )
            ],
          ),
        ),
      ),
    );
  }
}