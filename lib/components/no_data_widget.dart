import 'package:chat_gpt_app/components/app_text_style.dart';
import 'package:chat_gpt_app/components/colors.dart';
import 'package:chat_gpt_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoDataFound extends StatelessWidget {
  final String? noDataText;

  const NoDataFound({super.key, this.noDataText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(noDataText ?? "Whoops!", textAlign: TextAlign.center, style: AppTextStyle.blackTextFontSize.copyWith(fontSize: 18.sp)),
          SizedBox(height: 1.h),
          Text("Result not found", style: AppTextStyle.blackTextFontSize)
        ],
      ),
    );
  }
}

class NoDataWidget extends StatefulWidget {
  final String? titleText;
  final String? subText;

  const NoDataWidget({super.key, this.titleText, this.subText});

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 35.h, width: 70.w, color: tabBGColor),
          SizedBox(height: Get.height * 0.02),
          Text(
            widget.titleText ?? "Whoops!",
            style: AppTextStyle.blackTextFontSize.copyWith(fontSize: 32),
          ),
          SizedBox(height: Get.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.titleText ?? "Result not found",
              textAlign: TextAlign.center,
              style: AppTextStyle.hintTextFontSize.copyWith(fontSize: 14, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
