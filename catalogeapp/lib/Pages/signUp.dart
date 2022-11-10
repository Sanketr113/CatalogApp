import 'package:catalogeapp/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formkey = GlobalKey<FormState>();
  bool changebutton = false;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  Future<FirebaseApp>? _firebaseapp;

  TextEditingController email = TextEditingController();
  TextEditingController passwords = TextEditingController();
  bool IsLoading = false;

  void intState() {
    super.initState();
    _firebaseapp = Firebase.initializeApp();
  }

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/logo04.png',
                  height: 180,
                  width: 180,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                  future: _firebaseapp,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return SingleChildScrollView(
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.perm_identity),
                              hintText: "Enter First Name",
                              labelText: "First Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "First Name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.perm_identity),
                              hintText: "Enter Last Name",
                              labelText: "Last Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Last Name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: "Enter Email",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Email cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            controller: passwords,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.key),
                                hintText: "Enter Password",
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value!.length < 6) {
                                return "Password need to be more than 6 digits";
                              }
                              password = value;
                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.key),
                                hintText: "Enter Confirm Password",
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Confirm Password cannot be empty";
                              } else if (value != password) {
                                return "Confirm Password does not match password";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              IsLoading = true;
                            });
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email.text,
                                    password: passwords.text);
                            moveToHome(context);
                            setState(() {
                              IsLoading = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changebutton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "SignUp",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius:
                                  BorderRadius.circular(changebutton ? 50 : 12),
                            ),
                          ),
                        ),
                      ]),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  keytool -genkey -v -keystore D:\Android\catlog app\catalogeapp\android\app\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
