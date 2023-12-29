import 'dart:math';
import 'package:amazon_clone/providers/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widget/custom_main_button.dart';
import 'package:amazon_clone/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationmethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    adddressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screensize.height * 0.015),
                  child: Image.network(
                    amazonLogo,
                    height: screensize.height / 10,
                    width: screensize.width / 2,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screensize.height * 0.075),
                  child: SizedBox(
                    height: screensize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screensize.height * 0.85,
                        width: screensize.width / 1.1,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 33,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldWidget(
                                title: "Name",
                                controller: nameController,
                                obscureText: false,
                                hinttext: "Enter your Name",
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldWidget(
                                title: "Address",
                                controller: adddressController,
                                obscureText: false,
                                hinttext: "Enter your Address",
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldWidget(
                                title: "Email",
                                controller: emailController,
                                obscureText: false,
                                hinttext: "Enter your email",
                              ),
                            ),
                            // const SizedBox(
                            //   height: 25,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldWidget(
                                title: "Password",
                                controller: passwordController,
                                obscureText: true,
                                hinttext: "Enter your password",
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      letterSpacing: 0.6, color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: false,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  String output =
                                      await authenticationmethods.signUpUser(
                                          name: nameController.text,
                                          address: adddressController.text,
                                          email: emailController.text,
                                          password: passwordController.text);

                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (output == "success") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
                                    print("doing next step");
                                  } else {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const SignInScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    )),
                    const Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Already have an Amazon Account ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomMainButton(
                      child: const Text(
                        "Sign-In",
                        style: TextStyle(
                          letterSpacing: (0.6),
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
