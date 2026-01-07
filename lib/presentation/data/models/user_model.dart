class UserModel {
  final int? id;
  final String nome;
  final String senha;

  UserModel({
    this.id,
    required this.nome,
    required this.senha,
  });

  // Este método pega o JSON que vem do Java e transforma em Objeto Dart
  // Usado no Login ou ao buscar perfil
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nome: json['nome'],
      senha: json['senha'],
    );
  }

  // Este método transforma o Objeto Dart em JSON para enviar para o Java
  // Usado no Cadastro
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'senha': senha,
    };
  }
}