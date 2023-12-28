import 'package:flutter/material.dart';
import 'package:shoppingapp/Model/Button.dart';
import 'package:shoppingapp/Model/ShowDialog.dart';
import 'package:shoppingapp/Model/TextField.dart';
import 'package:shoppingapp/Pages/PaymentSuccess.dart';
import 'package:shoppingapp/Values/app_font.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedPaymentMethod = 0;
  TextEditingController fullName = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController streetCTL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  Text(
                    "Check Out",
                    style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(" * Please fill in accurate information"),
                  textField(
                    icon: Icons.person,
                    text: "Enter full name",
                    showPass: false,
                    textEditingController: fullName,
                  ),
                  textField(
                    icon: Icons.home_outlined,
                    text: "Enter Country",
                    showPass: false,
                    textEditingController: country,
                  ),
                  textField(
                    icon: Icons.phone,
                    text: "Enter phone",
                    showPass: false,
                    textEditingController: phone,
                    number: TextInputType.number,
                  ),
                  textField(
                    icon: Icons.home,
                    text: "Enter street",
                    showPass: false,
                    textEditingController: streetCTL,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Payment method",
                                style: MyFont.h5,
                              ),
                            ),
                            RadioListTile(
                              title: const Text("Direct payments"),
                              value: 0,
                              groupValue: selectedPaymentMethod,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedPaymentMethod = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text("Bank Transfer"),
                              value: 1,
                              groupValue: selectedPaymentMethod,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: button(
                        label: "ODER NOW",
                        press: () {
                          oderSuccess();
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  oderSuccess() async {
    String phones = phone.text;
    String cou = country.text;
    String full = fullName.text;
    String street = streetCTL.text;

    if (phones.isEmpty && cou.isEmpty && full.isEmpty && street.isEmpty) {
      showMessage("Please complete all information", context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OderSuccess()), // Replace OderSuccess with your actual page class
      );
    }
  }
}
