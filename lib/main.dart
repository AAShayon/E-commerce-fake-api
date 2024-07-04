import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/shop/products/view/all_products.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  ScreenUtilInit(
      designSize: const Size(380, 750),
      minTextAdapt: true,
      splitScreenMode:  true,
      child: MaterialApp(
        title:'Dami Ecommerce Application',
        theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
          primarySwatch: Colors.lightGreen
        ),
        home: AllProducts(),
      ),

    );
  }
}
