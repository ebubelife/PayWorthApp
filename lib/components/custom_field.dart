import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? type;
  final bool? obscureText;
  final Color? focus;
  final FocusNode? node;
  final IconButton? suffixIcon;
  final int? maxL;
  final bool? readOnly;
  final Function()? onTapped;

  const CustomField(
      {Key? key,
      this.hint,
      this.label,
      this.controller,
      this.type,
      this.node,
      this.suffixIcon,
      this.obscureText,
      this.maxL,
      this.readOnly,
      this.onTapped,
      this.focus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13),
          // child: Text(label ?? "", style: const TextStyle(color: Colors.black)),
        ),
        TextField(
          onTap: onTapped,
          readOnly: readOnly!,
          controller: controller,
          cursorColor: const Color.fromARGB(255, 12, 108, 234),
          obscureText: obscureText ?? false,
          keyboardType: type ?? TextInputType.text,
          maxLength: maxL,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 93, 93, 93),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 20),
            labelText: label ?? "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            hintStyle:
                const TextStyle(fontSize: 10, height: 1.5, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(255, 210, 210, 210)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(255, 210, 210, 210)),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
