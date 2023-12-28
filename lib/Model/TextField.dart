import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({super.key, this.onChange, required this.icon, required this.text,this.textEditingController,required this.showPass,this.number});

  final Function(String)? onChange;
  final TextEditingController? textEditingController;
  final IconData icon;
  final String text;
  final bool showPass;
  final TextInputType? number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 236, 236, 236)
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextFormField(
            controller: textEditingController,
            onChanged: onChange,
            obscureText: showPass,
            keyboardType: number,
            decoration: InputDecoration(
              icon: Icon(icon),
              hintText: text,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}