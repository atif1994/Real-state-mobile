import 'package:flutter/material.dart';

import '../utils/constants/appcolors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool hasError;
  final String errorText;
  final TextInputType? textInputType;
  final bool enabled;
  final bool obscureText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Icon? suffixIcon;
  final String? label;
  final Color? color;
  final int? maxLength;
  final int? maxLines;
  final Icon? prefixIcon;

  const MyTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.hasError = false,
    this.errorText = '',
    this.textInputType,
    this.enabled = true,
    this.obscureText = false,
    this.isPasswordField = false,
    this.validator,
    this.suffixIcon,
    this.label,
    this.color,
    this.maxLength,
    this.prefixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obsTxt = true;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SizedBox(
      width: s.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          enabled: widget.enabled,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.isPasswordField
              ? widget.enabled
                  ? obsTxt
                  : true
              : widget.obscureText,
          decoration: InputDecoration(
              fillColor: widget.color ?? Colors.transparent,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 1)),
              hintText: widget.hintText,
              labelText: widget.label,
              labelStyle: const TextStyle(color: Colors.white),
              counterText: '',
              disabledBorder: const UnderlineInputBorder(),
              hintStyle: const TextStyle(color: Colors.grey),
              errorText: widget.hasError ? widget.errorText : null,
              filled: true,
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: obsTxt
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obsTxt = !obsTxt;
                        });
                      })
                  : widget.suffixIcon,
              prefixIcon: widget.prefixIcon),
          validator: widget.validator,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
        ),
      ),
    );
  }
}

class NewTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool hasError;
  final String errorText;
  final TextInputType? textInputType;
  final bool enabled;
  final bool obscureText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Icon? suffixIcon;
  final String? label;
  final Color? color;
  final int? maxLength;
  final int? maxLines;
  final Icon? prefixIcon;

  const NewTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.hasError = false,
    this.errorText = '',
    this.textInputType,
    this.enabled = true,
    this.obscureText = false,
    this.isPasswordField = false,
    this.validator,
    this.suffixIcon,
    this.label,
    this.color,
    this.maxLength,
    this.prefixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _NewTextFieldState createState() => _NewTextFieldState();
}

class _NewTextFieldState extends State<NewTextField> {
  bool obsTxt = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      enabled: widget.enabled,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.isPasswordField
          ? widget.enabled
              ? obsTxt
              : true
          : widget.obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.colorWhite.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.colorWhite),
              borderRadius: BorderRadius.circular(20)),
          hintText: widget.hintText,
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
          errorText: widget.hasError ? widget.errorText : null,
          filled: true,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: obsTxt
                      ? const Icon(
                          Icons.visibility_off,
                        )
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obsTxt = !obsTxt;
                    });
                  })
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon),
      validator: widget.validator,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
    );
  }
}
