import 'package:books_app/core/localisation/changeLocal.dart';
import 'package:books_app/core/localisation/localisation.dart';
import 'package:books_app/core/services/services.dart';
import 'package:books_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  LocalController controller = Get.put(LocalController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations:MyTranslation(),
      locale: controller.Language,
      title: 'Books App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        primaryColorDark: const Color.fromARGB(0, 19, 19, 19),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.grey,
          shadowColor: Color.fromARGB(0, 97, 97, 236),
          foregroundColor: Color.fromARGB(255, 14, 52, 83),
          scrolledUnderElevation: 10.0,
        ),
      ),
      // home: Booksdetails(),
      getPages: routes,
    );
  }
}

