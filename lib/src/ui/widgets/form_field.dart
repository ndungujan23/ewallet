import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? error;
  final Function(String)? onChanged;

  const CustomField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.suffixIcon,
    this.error,
    this.onChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText,
          textInputAction: textInputAction,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondaryContainer,
            errorText: error,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              )
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        )
      ],
    );
  }
}
