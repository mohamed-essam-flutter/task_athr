import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_athr/presentation/chat/view/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => Builder(
            builder: (context) {
              return MaterialApp(
                home: ChatScreen(),
                debugShowCheckedModeBanner: false,
                // onGenerateRoute: AppRouter.onGenerateRoute,
                // initialRoute: RoutesManager.splash,
              );
            },
          ),
    );
  }
}

