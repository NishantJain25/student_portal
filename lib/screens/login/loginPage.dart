import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/accomodationScreen.dart';
import 'package:student_portal/signupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController sapIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userSAP = '';
  String _userPassword = '';
  String _userEmail = "";

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      _formKey.currentState!.save();
      // print(_userSAP);
      // print(_userPassword);
      _submitForm(_userEmail, _userPassword, _userSAP);
      // print("Hello");
    }
  }

  final _auth = FirebaseAuth.instance;

  void _submitForm(
    String email,
    String password,
    String Sap,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _userSAP, password: password);
      print(userCredential.additionalUserInfo!.isNewUser);
      Navigator.of(context).pushReplacementNamed(AccomodationScreen.routeName);
    } on FirebaseAuthException catch (e) {
      //print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
            SizedBox(
              height: 100,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _userSAP = value.toString();
                      },
                      textAlign: TextAlign.left,
                      // validator: (value) {
                      //   if (value!.isEmpty ||
                      //       value.length <= 10 ||
                      //       value.length > 11) {
                      //     return 'Invalid SAP ID';
                      //   }
                      // },
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
                      controller: sapIdController,
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
                      controller: passwordController,
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
                        if (text.length < 7) {
                          return 'Password must be at least 7 characters long.';
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
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                onPressed: _trySubmit,
                // FirebaseFirestore.instance
                //     .collection(
                //         '/accommodations/tYxqoiDHdYByTo3bw4nx/locations')
                //     .snapshots()
                //     .listen((data) {
                //   data.docs.forEach((document) {
                //     print(document['text']);
                //   });
                // });

                // FirebaseFirestore.instance
                //     .collection(
                //         '/accommodations/tYxqoiDHdYByTo3bw4nx/locations')
                //     .add({'text': 'Borivali'});

                // print(sapIdController.text);
                // print(passwordController.text);
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have account?',
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
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.black,
                color: Colors.white,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignupPage.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
