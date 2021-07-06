import 'package:flutter/material.dart';

Widget defaultButton({
  double? width = double.infinity,
  Color? background = Colors.blue,
  bool isUpperCase = true,
  @required Function()? function,
  @required String? text ,
}) => Container(
  color: background,
  width: width,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text!.toUpperCase() : text!,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultTextFromField({
  @required TextEditingController?  controller ,
  @required TextInputType? type,
  Function? onChanged,
  Function? onSubmit,
  Function? onTap,
  @required String? label,
  @required IconData? prefix,
   IconData? suffix,
  @required String? Function(String?)? validate,
  bool isPassword = false,
  var suffixPressed,
}) => TextFormField(
  controller: controller,
  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
        icon: Icon(suffix)) : null,
  ),
  obscureText: isPassword,
  keyboardType: type,
  onChanged: onChanged!(),
  onFieldSubmitted: onSubmit!(),
  onTap: onTap!(),
  validator: validate,
);