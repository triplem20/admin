
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/request_listtile.dart';
import '../../widgets/widgets.dart';
import 'package:admin/widgets/card.dart';
import 'package:admin/screens/users/users_screen.dart';
import 'package:admin/screens/requests/requests.dart';


class DashScreen extends StatelessWidget {
  const DashScreen({Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
    drawer: const CustomDrawer(),
    body: CustomLayout(title: 'Dashboard',
        widgets: [
          Row(
            children: [
              Cards(title: ' Users  ', icon: Icons.person, onPress: (){
                Get.to(() => const UsersScreen());
              },),
              const SizedBox(width: 100),
              Cards(title: 'Requests', icon: Icons.history_edu_outlined, onPress: (){
                Get.to(() => const RequestsScreen());
              },),
              const SizedBox(height: 300),
            ],
          ),
      ],
    ),
    );
  }
}
