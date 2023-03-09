import 'package:flutter/material.dart';
import 'package:admin/widgets/custom_drawer.dart';
import 'package:admin/widgets/custom_appbar.dart';
import 'package:admin/screens/dashboard/dash_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String adminEmail = " ";
  String adminPassword = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child:
            Container(
              width: MediaQuery.of(context).size.width *.5,
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  Image.asset('assets/images/logo1.jpg'),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      adminEmail = value;
                    },
                    obscureText: false,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2,
                        )
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                            width: 2,
                          )
                        ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(
                        Icons.email,
                        color: Colors.greenAccent,
                      )
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onChanged: (value) {
                      adminPassword = value;
                    },
                    obscureText: true,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                              width: 2,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pinkAccent,
                              width: 2,
                            )
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        icon: Icon(
                          Icons.admin_panel_settings,
                          color: Colors.greenAccent,
                        )
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(onPressed: (){

                    Get.to(() => const DashScreen());
                  },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                      ),
                      child: const Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 16,
                      ),
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
