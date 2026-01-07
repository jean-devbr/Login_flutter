import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthService {
  final String _baseUrl = "http://localhost:8085"; 
  final Dio _dio = Dio();

  // Método para Cadastrar
  Future<bool> cadastrar(UserModel usuario) async {
    try {
      final response = await _dio.post(
        "$_baseUrl/usuarios", 
        data: usuario.toJson(),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print("Erro no cadastro: $e");
      return false;
    }
  }

  // Método para Login
  Future<bool> login(String nome, String senha) async {
    try {
      final response = await _dio.post(
        "$_baseUrl/usuarios/login",
        data: {
          "nome": nome,   // Verifique se no seu DTO Java o campo é "nome"
          "senha": senha, // Verifique se no seu DTO Java o campo é "senha"
        },
      );
      return response.statusCode == 200;
    } on DioException catch (e) {
      // Se cair aqui, imprima o status para saber o que o Java respondeu
      print("Status do erro: ${e.response?.statusCode}");
      return false;
    }
  }
}