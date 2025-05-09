import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final int? minLines;
  final double height;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;final FocusNode? focusNode;

  const TextInputForm({
    super.key,
    required this.hint,
    this.maxLines = 100,
    this.minLines = 1,
    this.height = 10,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        TextFormField(
          style: TextStyle(fontSize: 14),
          controller: controller,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.top, // 왜 안돼지..??ㅠㅠㅠㅠ
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize:14,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white,//Color.fromARGB(255, 235, 235, 235),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: height),
            enabledBorder: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 220, 220, 220),
              width: 1.0,
            ),
          ),
            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
            focusedBorder: OutlineInputBorder( 
              borderSide: const BorderSide(
                color: Color(0xFF6562DF), 
                width: 1.0,
              ),
            ),
          ),
          keyboardType: keyboardType,
          //textInputAction: TextInputAction.newline,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
        ),
      ],
    );
  }
}
