import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_cubit.dart';
import 'package:wedding_shopping_check/product/constans/routes/routes_enum.dart';
import 'package:wedding_shopping_check/product/init/application_init/application_init.dart';
import 'package:wedding_shopping_check/product/navigation/navigation.dart';

Future<void> main() async {
  ApplicationInit().start();
  await dotenv.load(fileName: ".env");
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TotalExpensesCubit>(create: (context) => TotalExpensesCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesEnum.mainViewRoute.name,
      routes: Navigation.routes,
      debugShowCheckedModeBanner: false,
      title: 'Wedding Shopping Check',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        fontFamily: 'Quicksand',
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
          textStyle:
              WidgetStateProperty.all<TextStyle>(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          backgroundColor: WidgetStateProperty.all<Color>(ColorName.secondary),
        )),
        scaffoldBackgroundColor: ColorName.primary,
        iconTheme: const IconThemeData(color: ColorName.secondary),
        cardTheme: const CardTheme(
          // surfaceTintColor: kButtonColor,
          color: ColorName.accent,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
    );
  }
}
