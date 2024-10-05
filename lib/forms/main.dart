import 'package:flutter/material.dart';
import 'package:untitled/forms/pages/register_form_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Register Form',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: RegisterForm(),
    )
  );
}