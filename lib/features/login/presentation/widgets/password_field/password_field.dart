import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool passwordVisible;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    required this.passwordVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: !passwordVisible,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: false,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Password (Digits Only)',
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}