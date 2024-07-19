import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ChatModel extends Equatable {
  String? question;
  String? answer;

  ChatModel({
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [question, answer];
}
