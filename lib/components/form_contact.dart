import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/my_text_field.dart';
import 'package:ancrage/modals/alert.dart';
import 'package:ancrage/models/HotelApp/Message.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormContact extends StatefulWidget {
  const FormContact({
    super.key,
  });

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sujetController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GET IN TOUCH".toUpperCase(),
          style: AppTextStyle.titleLarge.copyWith(
              fontSize: Responsive.isMonitor(context) ? 50 : 40,
              letterSpacing: 5,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: Helper.PADDING),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  MyTextField(
                    onChanged: () {},
                    controller: nameController,
                    label: "Nom complet",
                    placeholer: "Votre nom complet",
                  ),
                  const SizedBox(height: Helper.PADDING / 3),
                  MyTextField(
                    onChanged: () {},
                    controller: sujetController,
                    label: "Sujet",
                    placeholer: "Objet du message",
                  ),
                  const SizedBox(height: Helper.PADDING / 3),
                  MyTextField(
                    onChanged: () {},
                    controller: emailController,
                    label: "Email ou contacts",
                    placeholer: "vos coordonnées pour vous joindre",
                  )
                ],
              ),
            ),
            const SizedBox(width: Helper.PADDING / 2),
            Expanded(
                child: MyTextField(
              onChanged: () {},
              controller: messageController,
              label: "Message",
              placeholer: "Saisissez votre message ici...",
              maxlines: 9,
            ))
          ],
        ),
        const SizedBox(height: Helper.PADDING),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FormMainButton(
                onTap: () async {
                  Message message = Message(
                      contact: emailController.text,
                      message: messageController.text,
                      sujet: sujetController.text,
                      fullname: nameController.text);
                  bool ok = await message.save();
                  if (ok) {
                    Get.dialog(AlertModal(
                        title: "Message envoyé",
                        message:
                            "Votre message a bien été envoyé, nous vous reviendrons sous peu ...",
                        onClick: () {
                          setState(() {
                            nameController.text = "";
                            emailController.text = "";
                            sujetController.text = "";
                            messageController.text = "";
                          });
                        }));
                  } else {
                    Get.snackbar("Erreur",
                        "Une erreur s'est produite lors de l'envoi de votre message. Veuillez reessayer SVP !",
                        colorText: AppColor.background,
                        backgroundColor: AppColor.orange,
                        icon: const Icon(
                          Icons.add_alert,
                          color: AppColor.background,
                        ),
                        barBlur: 5,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                title: Text("Valider",
                    style: AppTextStyle.menuButtonText
                        .copyWith(color: AppColor.white)))
          ],
        ),
      ],
    );
  }
}
