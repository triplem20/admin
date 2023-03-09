import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.service,
    required this.index,
  }) : super(key: key);

  final Service service;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 300,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:(index==0) ?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle),
          iconSize: 50,),
          Text(
            'Add Service',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
      ]
      ):
       Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              service.imageUrl,
            ),
          ),
          Text(
            service.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            '\$${service.price}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
