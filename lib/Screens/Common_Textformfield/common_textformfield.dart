import 'package:flutter/material.dart';
import 'package:new_nask_app/Constants/color.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.keyboardType,
    required this.label,
    required this.controller,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  final keyboardType;
  final label;
  final controller;
  final suffixIcon;
  final prefixIcon;
  final bool obscureText;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: 10),
        Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              spreadRadius: 3,
              offset: Offset(0, 3),
            )
          ]),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            cursorColor: AppColor.primary,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.black),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.black),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red)),
              constraints: BoxConstraints(maxHeight: 62),
            ),
          ),
        ),
      ],
    );
  }
}
