import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.borderRadius,
    this.focusColor,
    this.obscureText,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.validator,
    this.maxLength,
    this.onChanged,
    this.readOnly = false,
  });
  final String label;
  final double? borderRadius;
  final Color? focusColor;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLength;
  final bool readOnly;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      validator: widget.validator,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: hidePassword,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: () {
                  hidePassword = !hidePassword;
                  setState(() {});
                },
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          borderSide: BorderSide(
            color: widget.focusColor ?? Colors.black,
          ),
        ),
        labelText: widget.label,
        counterStyle: GoogleFonts.poppins(color: Colors.black),
        helperStyle: GoogleFonts.poppins(color: Colors.black),
        floatingLabelStyle: GoogleFonts.poppins(color: Colors.black),
        hintStyle: GoogleFonts.poppins(color: Colors.black),
        errorStyle: GoogleFonts.poppins(),
        labelStyle: GoogleFonts.poppins(color: Colors.black),
      ),
    );
  }
}
