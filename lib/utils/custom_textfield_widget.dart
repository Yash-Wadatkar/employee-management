import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String textfieldName;
  final Widget? suffixIcon;
  final String textfieldData;

  const CustomTextFieldWidget({
    super.key,
    required this.textfieldName,
    this.suffixIcon,
    required this.textfieldData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textfieldName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: true,
          decoration: InputDecoration(
            hintText: textfieldData,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(width: 1.2, color: Color(0xffddecf5))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(width: 1.2, color: Color(0xffddecf5))),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
          ),
        )
      ],
    );
  }
}
