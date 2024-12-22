import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyBoardtype;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final VoidCallback? onTap;
  final String? Function (String?)? validator;
  final String? errorMsg;
  final String? Function (String?)? onChanged;
  final FocusNode? focusNode;


  const MyTextField({super.key, 
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyBoardtype,
    this.suffixIcon,
    this.preffixIcon,
    this.onTap,
    this.validator,
    this.errorMsg,
    this.onChanged,
    this.focusNode
  });
@override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorMsg,
        suffix: suffixIcon,
        prefix: preffixIcon,
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        )
      ),
    );
 
  } 
}