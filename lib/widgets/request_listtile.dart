import 'package:admin/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart'as intl;
import 'package:get/get.dart';
import 'package:admin/screens/requests/request_details.dart';

class RequestListTile extends StatelessWidget {
  const RequestListTile({
    Key? key,
    required this.request,
    required this.onTap,
  }) : super(key: key);

  final Request request;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Get.to(() => const RequestDetails());
      },
      tileColor: Colors.grey,
      title: Text(request.name,
          style: Theme.of(context).textTheme.titleLarge,
      ),
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
              Icon(Icons.history_edu_outlined),
              10.widthBox,
              Text(request.status,style: TextStyle(color: request.status == 'Pending..'?Colors.orange
              :request.status == 'Accepted'?Colors.green:Colors.red,),),
            ],
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Text('\$${request.price}',style: TextStyle(color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      )),
    ).box.margin(const EdgeInsets.only(bottom: 5)).make();

  }
}
