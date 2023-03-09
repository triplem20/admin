import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';

class ServiceListTile extends StatelessWidget {
  const ServiceListTile({
    Key? key,
    required this.service,
    required this.onTap,
  }) : super(key: key);

  final Service service;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          service.imageUrl,
        ),
      ),
      title: Text(
        service.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        service.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
