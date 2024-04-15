import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jala/core/initial_binding.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/features/home/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  initializeDateFormatting('id_ID');
  Intl.defaultLocale = 'id_ID';
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'JALA',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          fontFamily: 'Lato',
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        initialBinding: InitialBinding(),
      ),
    );
  }
}
