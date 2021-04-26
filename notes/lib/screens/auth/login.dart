import 'package:notes/controller/auth/auth.dart';
import 'package:notes/controller/auth/google_auth.dart';
import 'package:notes/screens/auth/reset_password.dart';
import 'package:notes/screens/auth/signup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  bool passwordVisible = true;

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "StackFinance",
        ),
      ),
      //
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Column(
            children: [
              //
              Image.asset(
                "assets/images/login.png",
                height: 180.0,
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              Text(
                "Login to Your Account",
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: "lato",
                  fontWeight: FontWeight.w800,
                ),
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              // input boxes
              emailForm(),
              SizedBox(
                height: 12.0,
              ),
              //
              ElevatedButton(
                onPressed: () {
                  if (emailFormKey.currentState.validate()) {
                    emailFormKey.currentState.save();

                    // call login
                    signInUserWithEmail(email, password, context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        textAlign: TextAlign.center, style: TextStyle()),
                  ],
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    //
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                  ),
                ),
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //

              //
              SizedBox(
                height: 12.0,
              ),
              //
              // google auth
              ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 28.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Continue With Google",
                    ),
                  ],
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    //
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                  ),
                ),
              ),
              //
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                    Text("\tor\t"),
                    Expanded(
                      child: Divider(
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Create new Account",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    return Visibility(
      child: Form(
        key: emailFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
              ),
              style: TextStyle(
                fontSize: 18.0,
              ),
              validator: (val) {
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val);
                if (emailValid) {
                  return null;
                } else {
                  return "Enter A Valid Email !";
                }
              },
              onChanged: (val) {
                email = val;
              },
            ),
            //
            SizedBox(
              height: 12.0,
            ),
            //
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
              ),
              obscureText: passwordVisible,
              style: TextStyle(
                fontSize: 18.0,
              ),
              validator: (val) {
                if (val.trim().length < 6) {
                  return "At least 6 characters required !";
                } else {
                  return null;
                }
              },
              onChanged: (val) {
                password = val;
              },
            ),
            //
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text("Forgot Your Password ?"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
