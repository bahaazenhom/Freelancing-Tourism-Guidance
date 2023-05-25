import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/Constants/constants.dart';

import '../models/message_model.dart';


Widget TextForm({
  String? Function(String?)? validator,
  Function()? ontap,
  TextEditingController? controller,
  void Function(String)? onchange,
  TextInputType Type = TextInputType.text,
  bool hide = false,
  Icon? prefxicon,
  IconButton? sufficon,
  String? hinttext,
  String? initial,
}) =>
    TextFormField(
      onTap: ontap,
      onChanged: onchange,
      controller: controller,
      keyboardType: Type,
      obscureText: hide,
      cursorColor:MainColor,
      style: TextStyle(color: MainColor),
      initialValue: initial,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: MainColor,
        ),
        filled: true,
        fillColor: SecondaryColor,
        suffixIcon: sufficon,
        prefixIcon: prefxicon,
        prefixIconColor: MainColor,
        labelStyle: TextStyle(
          color: MainColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SecondaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SecondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      validator: validator,
    );

Future navigate({
  required BuildContext context,
  required String PageName,
}) {
  return Navigator.pushNamed(context,PageName );
}


void showSnackBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(20),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        messege,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget ChatBuble(Message message) => Align(
  alignment: Alignment.centerLeft,
  child: Container(
    margin: const EdgeInsets.only(left: 18, right: 18, top: 15),
    padding:
    const EdgeInsets.only(right: 15, left: 18, top: 15, bottom: 15),
    decoration: const BoxDecoration(
        color: Color(0xff2B475E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
    child: Text(
      message.message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  ),
);

Widget ChatBubleforfriend(Message message) => Align(
  alignment: Alignment.centerRight,
  child: Container(
    margin: const EdgeInsets.only(left: 18, right: 18, top: 15),
    padding:
    const EdgeInsets.only(right: 15, left: 18, top: 15, bottom: 15),
    decoration: const BoxDecoration(
        color: Color(0xff2B2270),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
    child: Text(
      message.message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  ),
);
