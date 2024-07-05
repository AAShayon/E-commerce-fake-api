
import 'package:flutter/material.dart';
void customSnackBar({required BuildContext context ,required String message,Color backgroundColor=Colors.green,Duration duration=const Duration(milliseconds: 3)}){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: backgroundColor,duration: duration,content: Center(child: Text(message))));
}