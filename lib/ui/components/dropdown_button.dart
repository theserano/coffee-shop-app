import 'package:flutter/material.dart';

class DropdownOrderMenu extends StatefulWidget {
  final List<String> dropDownItems;
  final String label;
  final ValueChanged<String>? onItemSelected;

  const DropdownOrderMenu({super.key, required this.dropDownItems, required this.label, this.onItemSelected});

  @override
  State<DropdownOrderMenu> createState() => _DropdownOrderMenuState();
}

class _DropdownOrderMenuState extends State<DropdownOrderMenu> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.dropDownItems.isNotEmpty ? widget.dropDownItems[0] : null;
    if(_selectedItem != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onItemSelected!(_selectedItem!);
      });
    }
  }

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
                  padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                  value: _selectedItem,
                  items: widget.dropDownItems.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedItem = value;
                    });
                    if(_selectedItem != null){
                      widget.onItemSelected!(value!);
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
