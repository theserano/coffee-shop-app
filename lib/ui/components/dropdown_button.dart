import 'package:flutter/material.dart';

class DropdownOrderMenu extends StatefulWidget {
  final List<String> dropDownItems;
  final String label;

  const DropdownOrderMenu({super.key, required this.dropDownItems, required this.label});

  @override
  State<DropdownOrderMenu> createState() => _DropdownOrderMenuState();
}

class _DropdownOrderMenuState extends State<DropdownOrderMenu> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
            child: Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(8),
              child: DropdownButton<String>(
                  underline: Container(),
                  borderRadius: BorderRadius.circular(8),
                  icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                  isExpanded: true,
                  padding: const EdgeInsets.only(right: 20.0),
                  value: _selectedItem,
                  items: widget.dropDownItems.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
