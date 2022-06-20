import 'package:flutter/material.dart';

import '../core/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final onSaved;
  //  final void Function()? onSaved;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textController;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final Widget? icon;
  const CustomTextFormField({
    Key? key,
    this.onSaved,
    this.obscureText,
    this.validator,
    this.textCapitalization,
    this.hintText,
    this.icon,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      obscureText: obscureText ?? false,
      onChanged: onSaved,
      autocorrect: false,
      textCapitalization: textCapitalization!,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: icon,
        prefixIconColor: Colors.white,
        hintText: hintText ?? '',
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: Constants.mainColor,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
