import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/screens/homepage/home.dart';
import 'package:student_portal/screens/login/signupPage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController sapIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userPassword = '';
  String _userEmail = "";
  bool showSpinner = false;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(_userEmail);
      // print(_userPassword);
      _submitForm(_userEmail, _userPassword);
      // print("Hello");
    }
  }

  void _submitForm(
    String email,
    String password,
  ) async {
    setState(() {
      showSpinner = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _userEmail, password: password);
      print(userCredential.user);
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      setState(() {
        showSpinner = false;
      });
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        fontSize: 48),
                  )),
              SizedBox(
                height: 50,
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
                      controller: sapIdController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Email ID',
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
                      controller: passwordController,
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
                        if (text.length < 7) {
                          return 'Password must be at least 7 characters long.';
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
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  elevation: 0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
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
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
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
      ),
    );
  }
}
