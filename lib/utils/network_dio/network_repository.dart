// -------- holds all API functions as Network Repo --------------

import 'dart:developer';
import 'package:chat_gpt_app/constants/app_api_constant.dart';
import 'package:chat_gpt_app/utils/network_dio/network_dio.dart';
import 'package:dio/dio.dart';

class NetworkRepository {
  final NetworkDioHttp networkDioHttp = NetworkDioHttp();
  Future<String?> huggingFaceTextToText(String question) async {
    try {
      var res = await networkDioHttp.postRequest(
          url: AppApiConstant.huggingFaceBaseUrl + AppApiConstant.huggingFaceTextToTextModel,
          isHeader: true,
          isBody: true,
          bodyData: {'inputs': question},
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer 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',
          }));
      log('statuscode: ${res?.statusCode}');
      log('data: ${res?.data}');
      if ((res?.statusCode ?? 0) == 200) {
        return res?.data[0]['generated_text'];
      }
      return null;
    } catch (e) {
      log('-=-=-=->${e.toString()}');
      return null;
    }
  }
}
