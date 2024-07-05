// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:provider/provider.dart';
//
// import 'modules/shop/products/view/products.dart';
// void main(){
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.greenAccent,
//     ));
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return  ScreenUtilInit(
//       designSize: const Size(380, 750),
//       minTextAdapt: true,
//       splitScreenMode:  true,
//       child: StreamProvider<InternetConnectionStatus>(
//         initialData: InternetConnectionStatus.connected,
//         create: (_){
//           return InternetConnectionChecker().onStatusChange;
//         },
//         child: MaterialApp(
//           title:'Dami Ecommerce Application',
//           theme: ThemeData(
//           textTheme: GoogleFonts.interTextTheme(),
//             primarySwatch: Colors.lightGreen
//           ),
//           home: const AllProducts(),
//         ),
//       ),
//
//     );
//   }
// }
import 'package:e_commerce_complete_fake_api/modules/shop/products/view/products.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/viewModel/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.greenAccent)
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(380,800),
      minTextAdapt: true,
      builder: (context,child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (context)=>ProductsViewModel())
        ],
          child: StreamProvider<InternetConnectionStatus>(
            initialData:InternetConnectionStatus.connected,
            create: (_){
              return InternetConnectionChecker().onStatusChange;
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white.withOpacity(.7),
                textTheme: GoogleFonts.interTextTheme(),
                primarySwatch: Colors.green,
                appBarTheme: AppBarTheme(
                  color: Colors.lightGreenAccent,
                  actionsIconTheme: IconThemeData(
                    color: Colors.white.withOpacity(.5),
                  ),
                  centerTitle: true,
                )
              ),
              home:const AllProducts(),
            ),
          ),
        );
      }
    );
  }
}
