import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:nex_connect/helper/helper_function.dart';
import 'package:nex_connect/pages/home_page.dart';
import 'package:nex_connect/pages/login_page.dart';
import 'package:nex_connect/shared/constaints.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
if (kIsWeb) { 
//for web version  
 await Firebase.initializeApp(
    options: const  FirebaseOptions(
      apiKey: 'AIzaSyDGy7g5SCkfgtux8BPHlyZ4YSeSRhlWv_4',
    appId: '1:63200110757:web:aa06ef18ee2f02ebfe454c',
    messagingSenderId: '63200110757',
    projectId: 'chatapp1-c2535',
    authDomain: 'chatapp1-c2535.firebaseapp.com',
    storageBucket: 'chatapp1-c2535.appspot.com',

    ),
  );
} else {
  //for android and iso
  await Firebase.initializeApp(
    options:  FirebaseOptions(
      apiKey: Constaints.apiKey,
      appId: Constaints.appId,
      messagingSenderId: Constaints.messagingSenderId,
      projectId: Constaints.projectId,

    ),
  );
}

  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool _isSignedIn = false;
getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primaryColor: Constaints().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}