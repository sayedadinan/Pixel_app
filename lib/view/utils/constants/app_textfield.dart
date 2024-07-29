import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? submitFun;
  final String? Function(String?)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? suffix;
  final Icon? prefixIcon;
  final int? maxLengths;
  const Inputfield({
    this.textInputFormatter,
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.suffix,
    this.prefixIcon,
    this.maxLengths,
    this.submitFun,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: TextInputAction
          .done, // Changes the action button on the keyboard to "Done"
      onFieldSubmitted: submitFun,
      inputFormatters: textInputFormatter,
      maxLines: maxLengths,
      style: const TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(54, 38, 8, 37)),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(54, 62, 5, 61))),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade600),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade600),
            borderRadius: BorderRadius.circular(12)),
        hintText: hinttext,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 183, 177, 177)),
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(90)),
      ),
      keyboardType: keyboardType,
    );
  }
}
