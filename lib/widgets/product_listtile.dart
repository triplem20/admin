import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';

import '../models/product_model.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),

    );
  }
}
