import 'package:flutter/material.dart';
class SortingButton extends StatefulWidget {
  const SortingButton({Key? key}) : super(key: key);

  @override
  State<SortingButton> createState() => _SortingButtonState();
}

class _SortingButtonState extends State<SortingButton> {
  // define a list of options for the dropdown
  final List<String> _type = ["By Date: Earliest", "By Date: Oldest", "By Status: Pending", "By Status: Accepted",'By Status: Rejected'];

  // the selected value
  String? _selectedtype;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            value: _selectedtype,
            onChanged: (value) {
              setState(() {
                _selectedtype = value;
              });
            },
            // Hide the default underline
            underline: Container(),
            // set the color of the dropdown menu
            dropdownColor: Colors.white,
            icon: const Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
            isExpanded: true,
            // The list of options
            items: _type
                .map((e) => DropdownMenuItem(
              value: e,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  e,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ))
                .toList(),
            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _type
                .map((e) => Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text(
                  e,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
              ),
                ),
            )
                .toList(),
          ),
        );

  }
}
