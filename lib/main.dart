import 'package:duseca/Provider/earning_provider.dart';
import 'package:duseca/Provider/history_provider.dart';
import 'package:duseca/Provider/pick_up_provider.dart';
import 'package:duseca/Provider/sign_up_provider.dart';
import 'package:duseca/Screens/earning.dart';
import 'package:duseca/Screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/constants.dart';
import 'Utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => PickUpProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => EarningProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.duseca,
      theme: AppTheme.lightTheme,
      home: const SignUpScreen(),
    );
  }
}
