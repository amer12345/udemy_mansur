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

  validator: validate,
);

Widget buildTaskItem = Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.blue,
        child: Text(
          '02:20',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Task title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            '24 feb 1984',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    ],
  ),
);