// ignore_for_file: use_build_context_synchronously

import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/components/header_text.dart';
import 'package:coffee_shop_app/ui/components/my_button.dart';
import 'package:coffee_shop_app/ui/components/text_field.dart';
import 'package:coffee_shop_app/ui/screens/loading_splash.dart';
import 'package:coffee_shop_app/ui/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = false;
  String email = '', password = '', name = '';

  void register() async{
      try {
          await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoadingSplashPage()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Password provided is too weak',
                style: TextStyle(fontSize: 18.0),
              ))));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exists',
                style: TextStyle(fontSize: 18.0),
              ))));
        }
      }
  }

  void moveToLoginPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginPage()));
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
                    const HeaderText(text: 'Sign up'),

                    const SizedBox(
                      height: 10,
                    ),

                    // text description
                    const Text(
                      'We are so excited you’re ready to become apart of our coffee network! don’t forget  check out your perks!',
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
                          'Username',
                          style: TextStyle(color: customColors?.green),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextfield(
                            controller: usernameController,
                            hintText: 'Enter username',
                            obscureText: false),

                        const SizedBox(
                          height: 20,
                        ),

                        // email
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
                          height: 25,
                        ),

                        // register button
                        MyButton(
                            onTap: () {
                              setState(() {
                                name = usernameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              register();
                            },
                            text: 'Click to Register'),

                        const SizedBox(
                          height: 20,
                        ),

                        Center(
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(color: customColors?.brown),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // sign in button
                        MyButton(
                            onTap: () {
                              moveToLoginPage();
                            },
                            text: 'Sign in'),

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
