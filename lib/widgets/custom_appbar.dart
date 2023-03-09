import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/blocs.dart';
import 'package:admin/blocs/settings/settings_bloc.dart';
import 'package:get/get.dart';
import 'package:admin/screens/login_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
           return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is SettingsLoading) {
                return AppBar(
                  backgroundColor: Colors.greenAccent,
                  title: Text(
                    'Your Company Name',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _showDialog(context);
                          },
                        );

                      },
                    ),
                    const SizedBox(width: 15),
                  ],
                  centerTitle: true,
                );
              }
              if (state is SettingsLoaded) {
                return AppBar(
                  backgroundColor: Colors.greenAccent,
                  title: Text(
                    (state.restaurant.name == null)
                        ? 'Set a Name for Your Company'
                        : state.restaurant.name!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _showDialog(context);
                          },
                        );

                      },
                    ),
                    const SizedBox(width: 15),
                  ],
                  centerTitle: false,
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          );

  }
  Dialog _showDialog(BuildContext context) {
    // set up the buttons

    // set up the AlertDialog
    return  Dialog(
        child: Container(
        height: 200,
        width: 200,
        padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 7),
       Text(" Do you want to logout?",
       style: TextStyle(fontSize: 15,
       fontWeight: FontWeight.bold,
       ),),
             const SizedBox(height: 50),
             Center(
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
    ElevatedButton(
      child: Text(" Ok "),
      onPressed: () {
        Get.to(() => const LoginScreen());

      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
      ),
    ),
                   const SizedBox(width: 20),
                   ElevatedButton(
                     child: Text("Cancel"),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     style: ButtonStyle(
                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                     ),
                   ),
                 ],
               ),
             ),
    ]),
        ));
  }
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
