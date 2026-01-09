class UserModel {
  final int? id;
  final String nome;
  final String senha;

  UserModel({
    this.id,
    required this.nome,
    required this.senha,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nome: json['nome'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'senha': senha,
    };
  }
}