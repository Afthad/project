import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shein_app/constants/assets.dart';
import 'package:shein_app/constants/colors.dart';
import 'package:shein_app/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool showEmail = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildFooter()],
      ),
    );
  }

  _buildFooter() {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 2,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              width: MediaQuery.of(context).size.width - 100,
              text: '',
              onPressed: () {},
              color: AppColors.darkGrey,
              textColor: Colors.white,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.email,
                    scale: 3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      "Sign Up with Email")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  _buildForm() {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Image.asset(
                AppAssets.lgBg,
                fit: BoxFit.fill,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text('Welcome Back!',
                          style: GoogleFonts.quicksand(
                              textStyle:const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor))),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Sign in to Continue',
                          style: GoogleFonts.quicksand(
                              textStyle:const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: !showEmail,
                        decoration: loginTextField(
                            hintText: 'Enter email',
                            prefix: GestureDetector(
                              onTap: () {
                                showEmail = !showEmail;
                                setState(() {});
                              },
                              child: showEmail
                                  ? const Icon(
                                      Icons.visibility,
                                      size: 14,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      size: 14,
                                    ),
                            )),
                        validator: (s) {
                          if (s == null || !isEmailValid(s)) {
                            return "Enter valid email";
                          }
                        },
                        onSaved: (s) {
                          s = email;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !showPassword,
                        decoration: loginTextField(
                            hintText: 'Enter password',
                            prefix: GestureDetector(
                              onTap: () {
                                showPassword = !showPassword;
                                setState(() {});
                              },
                              child: showPassword
                                  ? const Icon(
                                      Icons.visibility,
                                      size: 14,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      size: 14,
                                    ),
                            )),
                        validator: (d) {
                          if (d == null || d.length < 8) {
                            return "Enter minimum 8 char as password";
                          }
                        },
                        onSaved: (d) {},
                        onChanged: (d) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Button(
                            width: MediaQuery.of(context).size.width - 50,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                            text: "Sign in",
                            color: AppColors.primaryColor,
                            textColor: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Or Sign in with',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button(
                              width: 140,
                              onPressed: () {},
                              text: "Sign in",
                              widget: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.google,
                                    scale: 3,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      style: GoogleFonts.quicksand().copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                      "Google")
                                ],
                              ),
                              color: Colors.white,
                              textColor: Colors.white),
                          Button(
                              width: 140,
                              onPressed: () {},
                              text: "Sign in",
                              widget: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.twitter,
                                    scale: 1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      style: GoogleFonts.quicksand().copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                      "Twitter")
                                ],
                              ),
                              color: AppColors.primaryColor,
                              textColor: Colors.white)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static InputDecoration loginTextField({
    bool? showPrefix = true,
    Widget? prefix,
    String? counterText,
    String? hintText,
  }) {
    return InputDecoration(
      suffixIcon: showPrefix! ? prefix : null,
      filled: false,
      counterText: counterText,
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primaryColor,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      hintText: hintText ?? 'Enter Here',
      hintStyle: GoogleFonts.quicksand().copyWith(
        fontSize: 12,
      ),
      errorStyle: GoogleFonts.quicksand().copyWith(
        fontSize: 10,
      ),
      errorMaxLines: 5,
      helperMaxLines: 5,
    );
  }

  _buildHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Shien',
            style: GoogleFonts.quicksand(
               textStyle: TextStyle(
                               fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white)
            )
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
