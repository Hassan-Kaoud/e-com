import 'package:e_commerce/features/categorys/views/categroy_view.dart';
import 'package:e_commerce/features/proudcts/views/widgets/proudct_view.dart';
import 'package:e_commerce/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  CategroyView(),
      ),
    );
  }
}