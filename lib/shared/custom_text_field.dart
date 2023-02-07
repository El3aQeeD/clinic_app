import 'package:flutter/material.dart';
Widget customTextFiled({required String hintText,required Widget label,required TextEditingController textcontroller}){

  return TextFormField(
    style: TextStyle(color: Colors.black),
    validator: (val){
      if(val!.length<4 && val!.isNotEmpty)
      {
        return "Input less than 4 character";
      }
      if(val!.isEmpty){
        return "Input can not be empty";
      }
    } ,
    controller: textcontroller ,
    decoration: InputDecoration(
      label: label,
      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.lightBlue, width: 3.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,width: 10)
      ),
    ),
  );
}