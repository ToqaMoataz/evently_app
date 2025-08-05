import 'package:easy_localization/easy_localization.dart';
import 'package:todo_evently/Screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      routes: {
        OnboardingScreen.routeName : (context) => OnboardingScreen()
      },
      initialRoute: OnboardingScreen.routeName,
    );
  }
}

