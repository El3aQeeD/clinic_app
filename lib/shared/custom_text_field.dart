import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';
Widget customTextFiled({required String hintText,required Widget label,required TextEditingController textcontroller ,required String? validatorFunc(dynamic)?  }){

  return TextFormField(
    style: const TextStyle(color: Colors.black),
    validator: validatorFunc ,
    controller: textcontroller ,
    decoration: InputDecoration(
      label: label,
      labelStyle: const TextStyle(fontSize: 18,color: Colors.black),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),

      border: const UnderlineInputBorder(
        borderSide: BorderSide(
            width: 3, color: MyColors.darkBlue),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
            width: 3, color: Colors.grey),
      ),
    ),
  );
}