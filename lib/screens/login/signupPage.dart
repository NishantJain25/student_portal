import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/screens/login/loginPage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  bool showSpinner = false;
  String _userSAP = '';
  String _userPassword = '';
  String _userRePass = '';
  String _userEmail = '';

  final _auth = FirebaseAuth.instance;

  void _submitForm(String email, String password, String sap) async {
    setState(() {
      showSpinner = true;
    });
    try {
      print("In try block");
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.collection('/Userdetails/').add({
        'sapid': _userSAP,
        'email': email,
      });
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      setState(() {
        showSpinner = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showSpinner = false;
      });
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 75,
              ),
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      fontSize: 48),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 10,
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 10,
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
                              borderRadius: BorderRadius.circular(15),
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 10,
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
                              borderRadius: BorderRadius.circular(15),
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 10,
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
                              borderRadius: BorderRadius.circular(15),
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
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text(
                        'CREATE ACCOUNT',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                      ),
                      onPressed: _trySubmit,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: new BorderRadius.circular(15.0),
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
