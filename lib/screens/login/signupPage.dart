import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/loginPage.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup-page';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _sapIdController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _userSAP = '';
  String _userPassword = '';
  String _userRePass = '';
  String _userEmail = '';

  final _auth = FirebaseAuth.instance;

  void _submitForm(
    String email,
    String password,
    String Sap,
  ) async {
    try {
      print("In try block");
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      _formKey.currentState!.save();
      // print(_userEmail);
      // print(_userPassword);
      // print(_userRePass);
      // print(_userSAP);
      _submitForm(_userEmail, _userPassword, _userSAP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 40),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SAP ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length <= 10 ||
                            value.length > 11) {
                          return 'Invalid SAP ID';
                        }
                      },
                      onSaved: (value) {
                        _userSAP = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _sapIdController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Sap Id',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'EMAIL ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _userEmail = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _emailIdController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Email Id',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (!text.contains('@') ||
                            !text.contains('.com') ||
                            text.length < 6) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PASSWORD',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _userPassword = value.toString();
                      },
                      obscureText: true,
                      textAlign: TextAlign.left,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CONFIRM PASSWORD',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _userRePass = value.toString();
                      },
                      obscureText: true,
                      textAlign: TextAlign.left,
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        if (text != _passwordController.text) {
                          return 'Check Entered passwords';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                color: Colors.black,
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                onPressed: _trySubmit,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onPressed: () {
                    // print(_sapIdController.text);
                    // print(_passwordController.text);
                    Navigator.of(context)
                        .pushReplacementNamed(LoginPage.routeName);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
