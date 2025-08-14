import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_evently/Screens/create_event.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 16,
        toolbarHeight: 150.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r)
          )
        ),
        backgroundColor: Color(0XFF5669FF),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Welcome Back ✨",
              style: GoogleFonts.inter(
                color: Color(0XFFF2FEFF),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: 0,
              ),
            ),
            Text(
              "Username",
              style: GoogleFonts.inter(
                color: Color(0XFFF2FEFF),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                height: 1,
                letterSpacing: 0,
              ),
            ),
            SizedBox(height: 8.h,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,color: Color(0XFFF2FEFF),),
                SizedBox(width: 3.w,),
                Text(
                  "Location",
                  style: GoogleFonts.inter(
                    color: Color(0XFFF2FEFF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: 0,
                  ),
                )
              ],
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.pushNamed(context, CreateEventScreen.routeName);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.r),
          side: BorderSide(
            color:Color(0XFFF2FEFF),
            width: 5,
          )
        ),
        backgroundColor:Color(0XFF5669FF),
        child: Icon(Icons.add,color:Color(0XFFF2FEFF),size: 30,),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor:Color(0XFF5669FF),

          selectedLabelStyle: GoogleFonts.inter(
            color: Color(0XFFF2FEFF),
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            height: 1,
            letterSpacing: 0,
          ),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor:Color(0XFF5669FF) ,
          selectedItemColor:Color(0XFFF2FEFF),
          iconSize: 24,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Color(0XFFF2FEFF)),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined,color: Color(0XFFF2FEFF)),label: "Map"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border,color: Color(0XFFF2FEFF)),label: "Love"),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Color(0XFFF2FEFF)),label: "Profile"),
      ]),
      body: Column(
        children: [
          Container(

          )
        ],
      ),
    );
  }
}
