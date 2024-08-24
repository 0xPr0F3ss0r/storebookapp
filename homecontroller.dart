import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  var value1=2.obs;
  late SharedPreferences sharedpref;
  void Gotodetails(Map<String, dynamic> aboutbook) {
    Get.toNamed('/details', arguments: aboutbook);
}
  
  void changeValue(int value){
    if(value == 0){
      value1.value=1;
      print(value1);
    }else{
      value1.value =0;
      // update();
      print(value1);
    }
  }
}
