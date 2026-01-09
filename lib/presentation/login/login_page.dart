import 'package:flutter/material.dart';
import 'package:login/data/services/auth_service.dart';
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

  final AuthService _authService = AuthService();

 void _login() async {
  if (_formKey.currentState!.validate()) {
    setState(() => _isLoading = true);

    // CHAMADA REAL PARA O JAVA
    bool sucesso = await _authService.login(
      _nomeController.text, 
      _senhaController.text
    );

    setState(() => _isLoading = false);

    if (sucesso) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            nome: _nomeController.text,
            senha: _senhaController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário ou senha inválidos!")),
      );
    }
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