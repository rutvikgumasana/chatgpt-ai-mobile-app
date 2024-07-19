import 'package:chat_gpt_app/components/app_text_style.dart';
import 'package:chat_gpt_app/components/colors.dart';
import 'package:chat_gpt_app/utils/extensions.dart';
import 'package:flutter/material.dart';

// ------------ Primaty App Text Button ---------------

class PrimaryTextButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final void Function() onTap;
  final bool isDisable;

  const PrimaryTextButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    required this.onTap,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 45,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isDisable ? blackTextColor.withOpacity(0.38) : null,
          gradient: isDisable
              ? null
              : const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF3F51B5), Color(0xFFA58D84), Color(0xFFD5CAC6)],
                ),
        ),
        child: Text(
          title,
          style: AppTextStyle.whiteTextFontSize.copyWith(fontSize: 12.sp),
        ),
      ),
    );
  }
}

class SecondaryTextButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final void Function() onTap;

  const SecondaryTextButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.color,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 45,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? Colors.transparent,
          border: Border.all(color: Colors.black, width: 1),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF3F51B5), Color(0xFFA58D84), Color(0xFFD5CAC6)],
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.appTextFontSize.copyWith(color: textColor ?? AppColor.appColor),
        ),
      ),
    );
  }
}
