import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourism/firebase_options.dart';
import 'package:tourism/screens/Tnavigation_bar.dart';
import 'package:tourism/screens/messeges.dart';
import 'package:tourism/screens/new_Proposal.dart';
import 'screens/Home_screen.dart';
import 'screens/Login.dart';
import 'screens/Register.dart';
import 'screens/forget_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/Gnavigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Regester.id:(context)=>Regester(),
        Login.id:(context)=>Login(),
        GNavigationPage.id: (context)=>GNavigationPage(),
        TNavigationPage.id: (context)=>TNavigationPage(),
        Home.id:(context)=>Home(),
        Profile.id:(context)=>Profile(),
        ForgetPassword.id:(context)=>ForgetPassword(),
        Verif.id: (context)=>Verif(),
        NewProposal.id: (context)=>NewProposal(),
      },
      debugShowCheckedModeBanner: false,
        home: Login(),
    );
  }
}