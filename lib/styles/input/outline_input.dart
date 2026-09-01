import 'package:flutter/material.dart';

class OutlineInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? lines;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final bool hidden;
  const OutlineInput({
    super.key,
    this.hint ="",
    this.label ="",
    this.lines = 1,
    this.controller,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.type,
    this.padding,
    this.hidden = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: lines,
      maxLines: lines,
      maxLength: maxLength,
      controller: controller,
      obscureText: hidden,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: padding,
        suffixIcon: suffix,
        prefixIcon: prefix,
        prefixIconColor: Colors.grey[400],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        floatingLabelBehavior: label == null 
        ? FloatingLabelBehavior.never 
        : FloatingLabelBehavior.always,
        labelText: label ?? hint,
        alignLabelWithHint: true,
      ),
    );
  }
}