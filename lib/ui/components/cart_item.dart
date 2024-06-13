import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/coffee_order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final CoffeeOrder coffee;
  const CartItem({super.key, required this.coffee});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  void initState() {
    super.initState();
    if(kDebugMode){
      print(widget.coffee.addIns);
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // border: Border.all(color: customColors!.brown, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.coffee.drink.name,
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: customColors?.lightBrown),
              ),
              Text(
                '\$${widget.coffee.drink.price}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(children: [
            Text('Description', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: customColors?.lightBrown),),
            const Spacer(),
            Text(widget.coffee.drink.description, style: const TextStyle(fontSize: 12)),
          ],),
          Row(children: [
            Text('Cup Size', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: customColors?.lightBrown),),
            const Spacer(),
            Text(widget.coffee.cupSize, style: const TextStyle(fontSize: 12)),
          ],),
          Row(children: [
            Text('Add Ins', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: customColors?.lightBrown),),
            const Spacer(),
            Text(widget.coffee.addIns, style: const TextStyle(fontSize: 12)),
          ],),
          Row(children: [
            Text('Sweetener', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: customColors?.lightBrown),),
            const Spacer(),
            Text(widget.coffee.sweetener, style: const TextStyle(fontSize: 12)),
          ],),
          Row(children: [
            Text('Flavour', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: customColors?.lightBrown),),
            const Spacer(),
            Text(widget.coffee.flavour, style: const TextStyle(fontSize: 12)),
          ],),
        ],
      ),
    );
  }
}
