import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';

class   FilterListTile extends StatelessWidget {
  const FilterListTile({
    Key? key,
    required this.filter,
    required this.onTap,
  }) : super(key: key);

  final Filter filter;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      title: Text(
        filter.status,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
