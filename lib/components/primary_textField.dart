import 'package:flutter/material.dart';
import 'package:chat_gpt_app/components/colors.dart';

class PrimaryTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  final bool? readOnly;
  final String hintText;
  final String? validate;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? fill;
  final Color? fillColor;
  final Color? cursorColor;
  final String textFieldType;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final int? extraSetup;
  final Function()? fun;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final int? maxLines;
  final String? error;
  final int? maxLength;
  final int? minLine;
  final bool? isDense;
  final bool? isCollapsed;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final InputBorder? errorBorder;
  final bool? autoFocus;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final String? Function(String?)? validator;
  final double? hintSize;
  final double? fontSize;
  final double? borderWidth;
  final double? cursorHeight;
  final Color? borderColor;
  final AutovalidateMode? autoValidateMode;

  const PrimaryTextField(
      {super.key,
      this.cursorHeight,
      this.readOnly,
      this.autoFocus,
      required this.controller,
      required this.hintText,
      this.validate,
      this.obscureText,
      required this.keyboardType,
      this.textInputAction,
      this.prefixIcon,
      this.suffixIcon,
      this.extraSetup,
      this.fill,
      this.fillColor,
      required this.textFieldType,
      this.hintTextStyle,
      this.inputTextStyle,
      this.fun,
      this.onChanged,
      this.onFieldSubmitted,
      this.maxLines,
      this.minLine,
      this.error,
      this.onTap,
      this.contentPadding,
      this.padding,
      this.maxLength,
      this.isDense,
      this.border,
      this.enableBorder,
      this.isCollapsed,
      this.focusBorder,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.validator,
      this.cursorColor,
      this.errorBorder,
      this.hintSize,
      this.fontSize,
      this.borderWidth,
      this.borderColor,
      this.autoValidateMode = AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onTap: onTap,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        autovalidateMode: autoValidateMode,
        // enableInteractiveSelection: false,
        autocorrect: false,
        // cursorColor: cursorColor ?? Clr.blueColor,
        // cursorHeight: cursorHeight ?? 20,
        // cursorWidth: 1.5,
        textInputAction: textInputAction ?? TextInputAction.next,
        // inputFormatters: ,
        textAlign: TextAlign.left,
        readOnly: readOnly ?? false,
        style: inputTextStyle ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
        maxLength: maxLength,
        validator: validator,
        minLines: minLine ?? 1,
        autofocus: autoFocus ?? false,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            hintText: hintText,
            hoverColor: Colors.transparent,
            hintStyle: hintTextStyle ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColor.textFieldHintColor),
            errorText: error,
            isCollapsed: isCollapsed ?? false,
            errorMaxLines: 3,
            // errorStyle: TextStyle(fontWeight: FontWeight.w600, color: Clr.errorTextClr, fontSize: 9.sp),
            fillColor: fillColor ?? AppColor.ligthgrey,
            filled: true,
            isDense: isDense ?? true,
            counterText: '',
            contentPadding: contentPadding,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIconConstraints: suffixIconConstraints,
            border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            enabledBorder: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            focusedBorder: focusBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            errorBorder: errorBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none)));
  }
}
