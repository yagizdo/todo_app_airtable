import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_airtable/constants/app_colors.dart';
import 'package:todo_app_airtable/view/home_view.dart';

import 'bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // env
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => BlocProvider(
        create: (context) => TodoBloc(),
        child: MaterialApp(
          title: 'Todo App',
          theme: AppTheme().appTheme,
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        ),
      ),
    );
  }
}
