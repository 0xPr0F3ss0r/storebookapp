import 'package:books_app/view/screens/booksdetails.dart';
import 'package:books_app/view/screens/splachscreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => SplachScreen()),
  GetPage(name: '/details', page: () => Booksdetails()),
  GetPage(name: '/splach', page: () => SplachScreen())
];

