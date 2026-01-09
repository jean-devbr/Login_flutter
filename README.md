# Aplicativo de Login Flutter

## Descrição

Um aplicativo Flutter que fornece recursos de autenticação de usuário, incluindo login e registro, integrado a uma API de backend para gerenciar usuários. Desenvolvido para rodar na web.

## Funcionalidades

- Login de Usuário
- Registro de Usuário
- Página Inicial após autenticação bem-sucedida
- Campos de Texto Personalizados para validação de entrada
- Integração com API REST para autenticação

## Estrutura do Projeto

```
lib/
├── main.dart
├── MyApp.dart
├── presentation/
│   ├── data/
│   │   ├── models/
│   │   │   └── user_model.dart
│   │   └── services/
│   │       └── auth_service.dart
│   ├── home/
│   │   └── home_page.dart
│   ├── login/
│   │   └── login_page.dart
│   ├── register/
│   │   └── register_page.dart
│   └── widgets/
│       └── custom_text_field.dart
test/
├── widget_test.dart
```

## Repositório da API

A API de backend para este aplicativo está disponível em: [https://github.com/jean-devbr/usuarios-api](https://github.com/jean-devbr/usuarios-api)

## Começando

### Pré-requisitos

- Flutter SDK (^3.10.4)
- Dart SDK (^3.10.4)

### Instalação

1. Clone o repositório:

   ```bash
   git clone <your-repo-url>
   cd Login_flutter
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter run
   ```

   Para rodar na web:

   ```bash
   flutter run -d chrome
   ```

   Ou pressione F5 no VS Code para executar em modo debug, utilizando a configuração no arquivo .vscode/launch.json.

## Dependências

- **Dio**: ^5.9.0 - Para fazer requisições HTTP para a API
- **Cupertino Icons**: ^1.0.8 - Para ícones no estilo iOS

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar um Pull Request.

## Licença

Este projeto está licenciado sob a Licença MIT.
