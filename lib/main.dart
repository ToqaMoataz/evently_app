import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_evently/Core/appTheaming.dart';
import 'package:todo_evently/Provider/themeProvider.dart';
import 'package:todo_evently/Screens/introduction_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Home Screen/home_Screen.dart';
import 'Screens/create_event.dart';
import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await FirebaseFirestore.instance.disableNetwork();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: ChangeNotifierProvider(
            create: (context)=>ThemeProvider(),
            child: MyApp()
          )
      )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheming.lightTheme,
        darkTheme: AppTheming.darkTheme,
        themeMode:provider.themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        routes: {
          IntroductionScreen.routeName : (context) => IntroductionScreen(),
          LoginScreen.routeName : (context) => LoginScreen(),
          RegisterScreen.routeName : (context) => RegisterScreen(),
          HomeScreen.routeName : (context) => HomeScreen(),
          CreateEventScreen.routeName : (context) => CreateEventScreen()
        },
        initialRoute: RegisterScreen.routeName,
      ),
    );
  }
}

