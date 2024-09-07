import 'package:books_app/controller/homecontroller.dart';
import 'package:books_app/core/class/crud.dart';
import 'package:books_app/core/class/status.dart';
import 'package:books_app/core/localisation/changeLocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends GetView<LocalController> {
  // LocalController controller = Get.put(LocalController());
  bool value1 = true;
  HomeController homecontroller = Get.put(HomeController());
  final Crud crud = Get.put(Crud());

  Future<dynamic> getdata() async {
  //print("Accessing get data");
  var response = await crud.postData(
    'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key= '
  );
  //print("response is #################################################$response");
  return response.fold((l) => l, (r) => r);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Books App".tr,style:TextStyle(color:Color.fromARGB(184, 1, 7, 20))),actions: [
        Obx(()
          => Container(width: 100,decoration: BoxDecoration(color:homecontroller.value1==1 || homecontroller.value1==2?
                Colors.blueGrey:Colors.white,
                borderRadius: BorderRadius.circular(20)), child: TextButton(child:Text("العربية") ,onPressed:(){homecontroller.changeValue(1);controller.changeLanguage("ar");},)),
        ),
      /////second buttom
      Obx(()=>
        Container(width: 100,decoration: BoxDecoration(color:homecontroller.value1==0||homecontroller.value1==2?
          Colors.blueGrey:Colors.white,
          borderRadius: BorderRadius.circular(20)), child: TextButton(child:Text("English") ,onPressed:(){homecontroller.changeValue(0);controller.changeLanguage("en");},)),
      ),
      ],),
      // floatingActionButton: FloatingActionButton(onPressed: () {print(controller.Language);},child:Text("ok")),
      body: FutureBuilder(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: Lottie.asset("assets/lottie/wait.json",height: 150));
          } else if (snapshot.hasData && snapshot.data is Map) {
            //print("data####");
            List books =  snapshot.data['results']['lists'][0]['books'];
            //print("books $books");
            int bookslength = books.length;
            //print("books length $bookslength");
            
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(bookslength, (int index) {
                //var book = books[index];
                return InkWell(onTap: (){homecontroller.Gotodetails(books[index]);},
                  
                    child: Container(
                      height:950,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.blueAccent[400],
                        shape: BeveledRectangleBorder(
                           borderRadius: BorderRadius.circular(15.0),
                           side: BorderSide(
                            color: Colors.black,
                            width: 2
                           )
                        ),
                        child: Center(
                          child: Column(
                      children: [
                        // Use a placeholder image if the URL is null or empty
                        Image.network(
                          books[index]['book_image'] ?? 'https://i.pinimg.com/564x/91/a6/49/91a64924e129124f5e1080c628613e6c.jpg', 
                          width: 100,
                          height: 100,
                          errorBuilder: (context, error, stackTrace) {
                            // Handle the error by showing a different image or widget
                            return Image.asset(
                              '91a64924e129124f5e1080c628613e6c.jpg', // Replace with a local asset placeholder
                              width: 100,
                              height: 100,
                            );
                          },
                        ),
                        //SizedBox(height: 2),
                        Text(
                          "title".tr,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "${books[index]['title']}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 5, 70, 70),
                                 fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                    
                        ),
                      ),
                    ),
                  
                );
              }),
            );
          }
          else if(snapshot.data == statusRequest.offlinefailure) {
            return  Center(child: Lottie.asset("assets/lottie/offline.json",height: 140,animate:true, ));
          }else{
            return Center(child :Lottie.asset("assets/lottie/nodata.json"));
          }
        },
      ),
    );
  }
}
