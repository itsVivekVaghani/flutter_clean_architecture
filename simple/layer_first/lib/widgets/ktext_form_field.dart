import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextFormField extends StatelessWidget {
  final String? hintText, labelText;
  final bool readOnly;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? minLines;
  final int maxLines;
  final bool filled;
  final Color? fillColor;
  final double borderRadius;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextAlign textAlign;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Color? borderRadiusColor;
  final BoxConstraints? suffixIconConstraints;
  const KTextFormField(
      {this.keyboardType,
      this.hintText,
      this.labelText,
      this.autofocus = false,
      this.onSaved,
      this.onTap,
      this.onChanged,
      this.validator,
      this.controller,
      this.focusNode,
      this.minLines,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.maxLines = 1,
      this.readOnly = false,
      this.borderRadius = 12,
      this.textCapitalization = TextCapitalization.none,
      this.filled = true,
      this.inputFormatters,
      this.textAlign = TextAlign.start,
      this.fillColor,
      this.focusedErrorBorder,
      this.errorBorder,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.contentPadding,
      this.hintStyle,
      this.textStyle, this.borderRadiusColor, this.suffixIconConstraints});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return TextFormField(
      style: textStyle ??
          TextStyle(
            fontSize: 16,
          ),
      textAlign: textAlign,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      focusNode: focusNode,
      cursorColor: Color(0xFF13B9FF),
      controller: controller,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      obscureText: obscureText,
      onSaved: onSaved,
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        contentPadding: contentPadding,
        filled: filled,
        fillColor: fillColor ?? Color(0xFFF2F2F2),
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 16,
              color:  Color(0x0f000000).withOpacity(0.60),
            ),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 6),
          child: suffixIcon,
        ),
        suffixIconConstraints:suffixIconConstraints ??
            const BoxConstraints(maxWidth: 26, maxHeight: 48, minHeight: 47),
        errorMaxLines: 3,
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: borderRadiusColor ?? Color(0xFF67DF65).withOpacity(0.24), width: 1),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: borderRadiusColor ?? Color(0xFF67DF65).withOpacity(0.24), width: 1),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: const BorderSide(color: Color(0xff009323), width: 1),
            ),
      ),
    );
  }
}
