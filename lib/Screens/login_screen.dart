import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_evently/Firebase/firebase_manager.dart';
import 'package:todo_evently/Models/user_model.dart';
import 'package:todo_evently/Screens/register_screen.dart';

import 'Home Screen/home_Screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName="/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Logo
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image(
                 image: AssetImage("assets/images/evently_Logo.png"),
                 height: 136.h,
                width: 186.w,
              ),
            ),

            SizedBox(
              child: Column(
                children: [
                  // Email TextField
                  Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0XFF7B7B7B)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.mail_rounded, color: Color(0XFF7B7B7B)),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "email_text".tr(),
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Color(0XFF7B7B7B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Password TextField
                  Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0XFF7B7B7B)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: Color(0XFF7B7B7B)),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: !passwordVisible, // hide when false
                            decoration: InputDecoration(
                              hintText: "password_text".tr(),
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Color(0XFF7B7B7B),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0XFF7B7B7B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){},
                          child: Text(
                            "forget_password_text".tr(),
                            style: GoogleFonts.inter(
                              color: Color(0XFF5669FF),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0XFF5669FF),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //login button
            GestureDetector(
              onTap: (){
                 UserModel user=UserModel(id: "", name: "", email: _emailController.text, phoneNumber: "");
                 FirebaseManager.signin(
                     email: user.email,
                     password: _passwordController.text,
                     onSucess: (){
                       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                     });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0XFF5669FF),
                  borderRadius: BorderRadius.circular(16.r)
                ),
                child: Text(
                  "login_text".tr(),
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // create account
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "no_account_text".tr(),
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      //fontStyle: FontStyle.italic,
                    )
                  ),
                  TextSpan(
                    text: "create_account_text".tr(),
                    style: GoogleFonts.inter(
                      color: Color(0XFF5669FF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      height: 1.h,
                      letterSpacing: 0,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0XFF5669FF),
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, RegisterScreen.routeName); // Replace with your route
                      },
                  ),

                ],
              ),
            ),
            // --- Or separator Row ---
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0XFF5669FF),
                    thickness: 1,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "or_text".tr(),
                  style: TextStyle(
                    color: Color(0XFF5669FF),
                    fontSize: 16.sp,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0XFF5669FF),
                    thickness: 1,
                    indent: 10,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            //Google login
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0XFF5669FF), width: 1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/google_icon.png"),
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "google_login_text".tr(),
                    style: TextStyle(
                      color: Color(0XFF5669FF),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    width: 75,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0XFF5669FF),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.setLocale(Locale('en'));
                            setState(() {

                            });
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0XFF5669FF),
                                width: 3,
                                style: (context.locale.toString()=='en') ? BorderStyle.solid : BorderStyle.none,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/LR.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.setLocale(Locale('ar'));
                            setState(() {

                            });
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0XFF5669FF),
                                width: 3,
                                style: (context.locale.toString()=='ar') ? BorderStyle.solid : BorderStyle.none,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/EG.png",
                                fit: BoxFit.cover,
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
