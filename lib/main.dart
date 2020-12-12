import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopee_clone/cubits/cubits.dart';
import 'package:shopee_clone/shared/shared.dart';
import 'package:shopee_clone/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppbarCubit(),
        ),
        BlocProvider(
          create: (_) => BottomnavCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: MyTheme.whiteColor,
          dividerTheme: DividerThemeData(
            color: MyTheme.greyColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}
