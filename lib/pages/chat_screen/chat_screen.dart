import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt_app/components/app_text_style.dart';
import 'package:chat_gpt_app/components/colors.dart';
import 'package:chat_gpt_app/components/primary_textField.dart';
import 'package:chat_gpt_app/constants/app_asset.dart';
import 'package:chat_gpt_app/controller/chat_gpt_controller.dart';
import 'package:chat_gpt_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.put(ChatGptController());
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: AppColor.greyColor.withOpacity(0.5), centerTitle: true, title: const Text('Chat GPT', style: TextStyle(color: AppColor.blackColor))),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.whiteColor,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Obx(() => Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: chatController.chatModel.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        var chat = chatController.chatModel[index];
                        return Container(
                            color: AppColor.whiteColor,
                            padding: const EdgeInsets.all(10),
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                          decoration: BoxDecoration(color: AppColor.blueColor.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), child: Text(chat.question ?? '', style: AppTextStyle.blackTextFontSize))))),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 20),
                                  child: (chat.answer ?? '').isEmpty && chatController.isLoading.value
                                      ? const SizedBox(height: 30, child: CircularProgressIndicator())
                                      : Container(
                                          decoration: BoxDecoration(color: AppColor.blueColor.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          child: index != 0
                                              ? Text(chat.answer ?? '', style: AppTextStyle.whiteTextFontSize)
                                              : Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: AnimatedTextKit(isRepeatingAnimation: false, displayFullTextOnTap: true, animatedTexts: [
                                                    TyperAnimatedText(chat.answer ?? '',
                                                        curve: Curves.easeInOutCirc, speed: const Duration(milliseconds: 50), textStyle: AppTextStyle.whiteTextFontSize)
                                                  ]))))
                            ]));
                      }))),
              Container(
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                        child: PrimaryTextField(
                            hintText: 'Type Here....',
                            keyboardType: TextInputType.name,
                            textFieldType: '',
                            inputTextStyle: AppTextStyle.blackTextFontSize,
                            controller: chatController.questionController)),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (chatController.questionController.text.isNotEmpty && !chatController.isLoading.value) {
                                scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                                chatController.chatModel.insert(0, ChatModel(question: chatController.questionController.text, answer: null));
                                chatController.chatModel.refresh();
                                await chatController.getAnswer();
                                chatController.questionController.clear();
                              }
                            },
                            child: SvgPicture.asset(AppAsset.sendIc)))
                  ]))
            ])));
  }
}
