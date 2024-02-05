import 'package:ancrage/components/my_text_field.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUserReservation extends StatefulWidget {
  const FormUserReservation({
    super.key,
  });

  @override
  State<FormUserReservation> createState() => _FormUserReservationState();
}

class _FormUserReservationState extends State<FormUserReservation> {
  ReservationController reservationController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int _selectedItem = 0;
  @override
  void initState() {
    super.initState();

    nameController.text = reservationController.client["name"] ?? "";
    emailController.text = reservationController.client["email"] ?? "";
    telController.text = reservationController.client["contact"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Civilité",
                  style: AppTextStyle.label,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.PADDING / 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  value: _selectedItem,
                  underline: Container(),
                  items: const [
                    DropdownMenuItem(value: 0, child: Text("Monsieur")),
                    DropdownMenuItem(value: 1, child: Text("Madame")),
                    DropdownMenuItem(value: 2, child: Text("Mademoiselle")),
                  ],
                  onChanged: (value) {
                    reservationController.client["civility"] = value.toString();
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Helper.PADDING / 2,
          ),
          MyTextField(
            onChanged: (String value) {
              reservationController.client["name"] = value;
            },
            controller: nameController,
            label: "Nom complet",
            placeholer: "Nom & prénoms",
          ),
          const SizedBox(
            height: Helper.PADDING / 2,
          ),
          MyTextField(
              onChanged: (String value) {
                reservationController.client["email"] = value;
              },
              controller: emailController,
              label: "Email",
              placeholer: "Adresse email"),
          const SizedBox(
            height: Helper.PADDING / 2,
          ),
          MyTextField(
              onChanged: (String value) {
                reservationController.client["contact"] = value;
              },
              controller: telController,
              label: "Téléphone",
              placeholer: "N° de téléphone"),
        ],
      ),
      tablet: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Civilité",
                        style: AppTextStyle.label,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Helper.PADDING / 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        value: _selectedItem,
                        underline: Container(),
                        items: const [
                          DropdownMenuItem(value: 0, child: Text("Monsieur")),
                          DropdownMenuItem(value: 1, child: Text("Madame")),
                          DropdownMenuItem(
                              value: 2, child: Text("Mademoiselle")),
                        ],
                        onChanged: (value) {
                          reservationController.client["civility"] =
                              value.toString();
                          setState(() {
                            _selectedItem = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: Helper.PADDING / 2,
              ),
              Expanded(
                child: MyTextField(
                  onChanged: (String value) {
                    reservationController.client["name"] = value;
                  },
                  controller: nameController,
                  label: "Nom complet",
                  placeholer: "Nom & prénoms",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Helper.PADDING / 2,
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                    onChanged: (String value) {
                      reservationController.client["email"] = value;
                    },
                    controller: emailController,
                    label: "Email",
                    placeholer: "Adresse email"),
              ),
              const SizedBox(
                width: Helper.PADDING / 2,
              ),
              Expanded(
                child: MyTextField(
                    onChanged: (String value) {
                      reservationController.client["contact"] = value;
                    },
                    controller: telController,
                    label: "Téléphone",
                    placeholer: "N° de téléphone"),
              ),
            ],
          )
        ],
      ),
      desktop: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Civilité",
                      style: AppTextStyle.label,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Helper.PADDING / 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      value: _selectedItem,
                      underline: Container(),
                      items: const [
                        DropdownMenuItem(value: 0, child: Text("Monsieur")),
                        DropdownMenuItem(value: 1, child: Text("Madame")),
                        DropdownMenuItem(value: 2, child: Text("Mademoiselle")),
                      ],
                      onChanged: (value) {
                        reservationController.client["civility"] =
                            value.toString();
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: Helper.PADDING / 2,
            ),
            Expanded(
              child: MyTextField(
                onChanged: (String value) {
                  reservationController.client["name"] = value;
                },
                controller: nameController,
                label: "Nom complet",
                placeholer: "Nom & prénoms",
              ),
            ),
            const SizedBox(
              width: Helper.PADDING / 2,
            ),
            Expanded(
              child: MyTextField(
                  onChanged: (String value) {
                    reservationController.client["email"] = value;
                  },
                  controller: emailController,
                  label: "Email",
                  placeholer: "Adresse email"),
            ),
            const SizedBox(
              width: Helper.PADDING / 2,
            ),
            Expanded(
              child: MyTextField(
                  onChanged: (String value) {
                    reservationController.client["contact"] = value;
                  },
                  controller: telController,
                  label: "Téléphone",
                  placeholer: "N° de téléphone"),
            ),
          ],
        ),
      ),
    );
  }
}
