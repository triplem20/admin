import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart'as intl;
import 'package:admin/widgets/custom_appbar.dart';
import 'package:admin/widgets/custom_drawer.dart';
import 'package:admin/widgets/custom_layout.dart';

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body:
          Padding(padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:
                List.generate(7,
                        (index) =>ListTile(
                      onTap: (){},
                      tileColor: Colors.grey,
                      title: Text('Service title'),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              10.widthBox,
                              Text(intl.DateFormat().add_yMd().format(DateTime.now())),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.payment_outlined),
                              10.widthBox,
                              Text('Pending',style: TextStyle(color: Colors.orangeAccent),),
                            ],
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      trailing: Text('\$5000.0',style: TextStyle(color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                    ).box.margin(const EdgeInsets.only(bottom: 4)).make() ),
              ),
            ),
          ),
    );
  }
}
