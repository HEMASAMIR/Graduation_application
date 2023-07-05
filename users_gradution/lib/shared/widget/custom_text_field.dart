// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CutomTextField extends StatelessWidget {
  CutomTextField({
    Key? key,
    required this.icon,
    this.hintText,
    this.obsText = false,
    this.onTap,
    required this.validate,
    required this.controller,
  }) : super(key: key);

  final IconData icon;
  final Function()? onTap;
  final String? hintText;
  TextEditingController? controller;
  final bool obsText;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obsText,
      validator: validate,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.cyan,
        ),
        filled: true,
        fillColor: Colors.white,
        border: buildOutline(),
        enabledBorder: buildOutline(),
        focusedBorder: buildOutline(),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }

  OutlineInputBorder buildOutline([color]) {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white));
  }
}
