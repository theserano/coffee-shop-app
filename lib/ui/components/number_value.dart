import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class NumberValue extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String>? onAmountChange;

  const NumberValue({
    super.key,
    required this.label,
    required this.text,
    this.onAmountChange,
  });

  @override
  State<NumberValue> createState() => _NumberValueState();
}

class _NumberValueState extends State<NumberValue> {
  TextEditingController amountController = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: "0");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAmountChange!('0');
    });
  }

  void increment() {
    int currentValue = int.parse(amountController.text);
    setState(() {
      currentValue++;
      amountController.text = currentValue.toString();
      if (widget.onAmountChange != null) {
        widget.onAmountChange!(currentValue.toString());
      }
    });
  }

  void decrement() {
    int currentValue = int.parse(amountController.text);
    setState(() {
      if (currentValue > 0) {
        currentValue--;
        amountController.text = currentValue.toString();
        if (widget.onAmountChange != null) {
          widget.onAmountChange!(currentValue.toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: customColors?.textColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: increment,
                            icon: const Icon(Icons.add),
                            color: Colors.red[900],
                          ),
                          SizedBox(
                            width: 40,
                            height: 30,
                            child: TextFormField(
                              controller: amountController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 6.0),
                              ),
                              textAlign: TextAlign.center,
                              onChanged: widget.onAmountChange,
                            ),
                          ),
                          IconButton(
                            onPressed: decrement,
                            icon: const Icon(Icons.remove),
                            color: Colors.red[900],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
