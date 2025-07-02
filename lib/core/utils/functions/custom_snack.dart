import 'package:flutter/material.dart';

void customSnack(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
