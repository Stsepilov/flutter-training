import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/forms/pages/user_info_page.dart';

import '../model/user.dart';
import '../../navigation/styles.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _hidePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final List<String> _countries = [
    'Russia',
    'USA',
    'Ukraine',
    'Germany',
    'France'
  ];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Register Form'),
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    focusNode: _nameFocus,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _nameFocus, _phoneFocus);
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'First Name *',
                        hintText: 'What is your first name?',
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _nameController.clear();
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ))),
                    validator: _validateName,
                    onSaved: (value) => newUser.name = value,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    focusNode: _phoneFocus,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _phoneFocus, _passFocus);
                    },
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: 'Phone Number *',
                        hintText: 'What is your phone number?',
                        helperText: 'Phone format: (xxx) xxx-xxxx',
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _phoneController.clear();
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ))),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                          allow: true),
                    ],
                    validator: (value) => _validatePhoneNumber(value)
                        ? null
                        : 'Phone number must be entered as (xxx) xxx-xxxx',
                    onSaved: (value) => newUser.phone = value,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'What is your email address?',
                      icon: Icon(Icons.mail),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // validator: _validateEmail,
                    onSaved: (value) => newUser.email = value,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownButtonFormField(
                    items: _countries.map((country) {
                      return DropdownMenuItem(
                          value: country, child: Text(country));
                    }).toList(),
                    onChanged: (country) {
                      setState(() {
                        _selectedCountry = country!;
                      });
                    },
                    value: _selectedCountry,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.map),
                      labelText: 'Country?',
                    ),
                    onSaved: (value) => newUser.country = value,
                    // validator: (value) => value == null ? 'Please select a country' : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _storyController,
                    decoration: const InputDecoration(
                        labelText: 'Life Story',
                        hintText: 'Tell us about yourself',
                        border: OutlineInputBorder()),
                    maxLines: 3,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    onSaved: (value) => newUser.story = value,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    focusNode: _passFocus,
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Password *',
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          }),
                      icon: const Icon(Icons.security),
                    ),
                    obscureText: _hidePassword,
                    maxLength: 8,
                    validator: _validatePassword,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _confirmPassController,
                    decoration: const InputDecoration(
                      labelText: ' Confirm Password *',
                      hintText: 'Confirm your password',
                      icon: Icon(Icons.border_color),
                    ),
                    obscureText: _hidePassword,
                    maxLength: 8,
                    validator: _validatePassword,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: const Text('Submit Form'),
                    style: raisedButtonStyle,
                  )
                ])));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(_nameController.text);

      print('Form is valid');
      print(_nameController.text);
      print(_phoneController.text);
      print(_emailController.text);
      print(_selectedCountry);
      print(_storyController.text);
    } else {
      _showMessage(message: 'Form is not valid');
    }
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Name is required';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Invalid name';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String? input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return _phoneExp.hasMatch(input!);
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length != 8) {
      return 'Password must be 8 characters';
    } else if (_confirmPassController.text != _passController.text) {
      return 'Passwords does not match';
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    ));
  }

  void _showDialog(String name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registration Successful',
                style: TextStyle(color: Colors.green)),
            content: Text(
              '$name is now verified register form',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserInfoPage(userInfo: newUser,)));
                },
                child: const Text(
                  'Verified',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              )
            ],
          );
        });
  }
}
