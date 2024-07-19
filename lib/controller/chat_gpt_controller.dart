import 'dart:developer';
import 'package:chat_gpt_app/model/chat_model.dart';
import 'package:chat_gpt_app/utils/network_dio/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatGptController extends GetxController {
  NetworkRepository repository = NetworkRepository();
  TextEditingController questionController = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<ChatModel> chatModel = <ChatModel>[].obs;

  // ------- get answer question --------
  Future<void> getAnswer() async {
    isLoading.value = true;
    await repository.huggingFaceTextToText(questionController.value.text).then(
      (value) {
        log('-=-=-=->$value');
        isLoading.value = false;
        if (value != null) {
          chatModel[0].answer = value;
        } else {
          chatModel.removeLast();
        }
        chatModel.refresh();
      },
    );
  }
}
