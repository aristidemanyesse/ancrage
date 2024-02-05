// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/MessageSchema.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'Message.freezed.dart';
part 'Message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  const factory Message({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String fullname,
    @Default("") String contact,
    @Default("") String sujet,
    @Default("") String message,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);

  static const String MessageFragment = """
  fragment MessageFragment on MessageGenericType {
    id
    createdAt
    updateAt
    deleted
    fullname
    message
    sujet
    contact
  }
  """;

  Future<bool> save() async {
    if (fullname == "" || contact == "" || sujet == "" || message == "") {
      Get.snackbar("Erreur",
          "Veuillez à bien renseigner tous les champs du formulaire !",
          colorText: AppColor.background,
          backgroundColor: AppColor.orange,
          icon: const Icon(
            Icons.add_alert,
            color: AppColor.background,
          ),
          barBlur: 5,
          snackPosition: SnackPosition.BOTTOM);
    }
    dynamic datas =
        await ApiService.request(MessageSchema.CREATE, toJson());
    return datas["createMessage"]["ok"];
  }
}
