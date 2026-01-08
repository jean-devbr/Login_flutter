import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthService {
  final String _baseUrl = "http://localhost:8085"; 
  final Dio _dio = Dio();

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

  Future<bool> login(String nome, String senha) async {
    try {
      final response = await _dio.post(
        "$_baseUrl/usuarios/login",
        data: {
          "nome": nome,  
          "senha": senha, 
        },
      );
      return response.statusCode == 200;
    } on DioException catch (e) {
      
      print("Status do erro: ${e.response?.statusCode}");
      return false;
    }
  }
}