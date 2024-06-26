// ignore_for_file: use_build_context_synchronously

import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:coffee_shop_app/ui/components/header_text.dart';
import 'package:coffee_shop_app/ui/components/my_button.dart';
import 'package:coffee_shop_app/ui/components/text_field.dart';
import 'package:coffee_shop_app/ui/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = false;
  String email = '', password = '';

  void login() async{
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'No user found',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Wrong password provided by user',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  void moveToRegisterPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Register()));
  }
  

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      backgroundColor: customColors?.cream,
      body: Stack(
        children: [
          // coffee image
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
            child: SvgPicture.asset(
              'lib/assets/container.svg',
              semanticsLabel: 'logo',
            ),
          ),

          // sign up form
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.2,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
            decoration: BoxDecoration(
                color: customColors?.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 2, blurRadius: 5)
                ]),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sign up text
                    const HeaderText(text: 'Login in',),

                    const SizedBox(
                      height: 10,
                    ),

                    // text description
                    const Text(
                      'It’s coffee time! Login and lets get all the coffee in the world! Or at least iced coffee. ',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    // form container
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // username
                        Text(
                          'Email Address',
                          style: TextStyle(color: customColors?.green),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextfield(
                            controller: emailController,
                            hintText: 'Enter email',
                            obscureText: false),

                        const SizedBox(
                          height: 20,
                        ),
                        // password
                        Text(
                          'Password',
                          style: TextStyle(color: customColors?.green),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextfield(
                          controller: passwordController,
                          hintText: '***********',
                          obscureText: !isObscure,
                          suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                        ),

                        const SizedBox(
                          height: 50,
                        ),

                        // register button
                        MyButton(
                            onTap: () {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              login();
                            },
                            text: 'Login',),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 8,
                        ),

                        Center(
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(color: customColors?.brown),
                          ),
                        ),

                        const SizedBox(height: 20,),

                        // sign in button
                        MyButton(
                            onTap: () {
                              moveToRegisterPage();
                            },
                            text: 'Create an account'),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}