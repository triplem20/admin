import 'package:flutter/material.dart';
import '/config/responsive.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  ...widgets,
                  const SizedBox(height: 20),
                  // Placeholder for ads.
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
