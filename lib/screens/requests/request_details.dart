import 'package:admin/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Request Details',
            style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white),
      ),
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  
                ],
              )
            ],
          ),
        ) ,

      ),
      bottomNavigationBar:  SizedBox(
        height: 60,
        width: context.screenWidth,
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Accept",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              child: Text("Reject",
              style: TextStyle(
                color:Colors.white,
                fontSize: 15,
              ),
              ),
              onPressed: () {
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
