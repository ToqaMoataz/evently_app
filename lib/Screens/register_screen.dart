

import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_evently/Screens/login_screen.dart';

import '../Firebase/firebase_manager.dart';
import '../Models/user_model.dart';
import 'Home Screen/home_Screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName="/register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool rePasswordVisible = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Color(0XFF101127),),
        title: Text(
          "register_heading".tr(),
          style: GoogleFonts.inter(
            color: Color(0XFF101127),
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16.h,
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
              //name textfield
              Container(
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Color(0XFF7B7B7B)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: Color(0XFF7B7B7B)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "name_text".tr(),
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
              //phone textfield
              Container(
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Color(0XFF7B7B7B)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone_android_rounded, color: Color(0XFF7B7B7B)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          final RegExp phoneRegex = RegExp(r'^[0-9]{10,15}$');
                          if (value == null || value.trim().isEmpty) {
                            return "Phone number is required";
                          } else if (!phoneRegex.hasMatch(value.trim())) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r)
                          ),

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
                      child: TextFormField(
                        validator: (value){
                          final RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.(com)$');
                          if(value==null||value.isEmpty){
                            return "Email is required";
                          }
                          else if(!emailRegex.hasMatch(value)){
                            return "Email is not valid";
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
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
              // Re Password TextField
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
                      child: TextFormField(
                        controller: _rePasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your password";
                          } else if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          hintText: "re_password_text".tr(),
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
                          rePasswordVisible = !rePasswordVisible;
                        });
                      },
                      icon: Icon(
                        rePasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0XFF7B7B7B),
                      ),
                    ),
                  ],
                ),
              ),
              //create account button
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    UserModel user=UserModel(name: _nameController.text, email: _emailController.text, phoneNumber: _phoneController.text);
                    FirebaseManager.signup(
                        email: user.email,
                        password: _passwordController.text,
                      onSucess: (){
                          FirebaseManager.addUser(user).then((value){
                            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          });
                      },
                      onFail: (String errorMessage) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Signup Failed"),
                            content: Text(errorMessage),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      },
                    );


                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: Color(0XFF5669FF),
                      borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: Text(
                    "create_account_text".tr(),
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
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "already_have_account_text".tr(),
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.h,
                            letterSpacing: 0,
                          )
                      ),
                      TextSpan(
                          text: "login_text".tr(),
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
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                      ),

                    ],
                  ),
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
      ),
    );
  }
}
