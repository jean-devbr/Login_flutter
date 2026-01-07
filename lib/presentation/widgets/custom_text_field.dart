import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

}

  class _CustomTextFieldState extends State<CustomTextField> {
  // Variável que controla se o texto está oculto ou não
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    // Se não for senha, não precisa ocultar o texto
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha o campo ${widget.label}';
        }
        return null;
      },
    );
  }
}