import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(title: Text("Snackbar")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Show Snackbar"),
                onPressed: () {
                  Get.snackbar(
                      "Snackbar Title", "This will be Snackbar Message",
                      snackPosition: SnackPosition.BOTTOM,
                      // titleText: Text("Another Title"),
                      // messageText: Text(
                      // "Another Message",
                      // ),
                      colorText: Colors.red,
                      backgroundColor: Colors.black,
                      borderRadius: 30,
                      margin: EdgeInsets.all(10),
                      animationDuration: Duration(microseconds: 3000),
                      backgroundGradient:
                          LinearGradient(colors: [Colors.red, Colors.green]),
                      borderColor: Colors.purple,
                      borderWidth: 4,
                      boxShadows: [
                        BoxShadow(
                            color: Colors.yellow,
                            offset: Offset(30, 50),
                            spreadRadius: 20,
                            blurRadius: 8)
                      ],
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.bounceInOut,
                      duration: Duration(milliseconds: 8000),
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      shouldIconPulse: false,
                      leftBarIndicatorColor: Colors.white,
                      mainButton: TextButton(
                        onPressed: () {},
                        child: Text("Retry"),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white),
                      ),
                      onTap: (val) {
                        print("Retry clicked");
                      },
                      overlayBlur: 5,
                      overlayColor: Colors.grey,
                      padding: EdgeInsets.all(50),
                      showProgressIndicator: true,
                      progressIndicatorBackgroundColor: Colors.deepOrange,
                      progressIndicatorValueColor:
                          AlwaysStoppedAnimation(Colors.white),
                      reverseAnimationCurve: Curves.bounceInOut,
                      snackbarStatus: (val) {
                        print(val);
                      },
                      userInputForm: Form(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(),
                            )
                          ],
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
*/