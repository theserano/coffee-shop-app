import 'dart:math';
import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/providers/coffee_order.dart';
import 'package:coffee_shop_app/ui/components/cart_item.dart';
import 'package:coffee_shop_app/ui/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool isPayed = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('Card Number: $cardNumber'),
                      Text('Expiry Date: $expiryDate'),
                      Text('Card Holder Name: $cardHolderName'),
                      Text('CVV:  $cvvCode')
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => {
                        setState(() {
                          isPayed = false;
                        }),
                        Navigator.pop(context)
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () => {
                            Navigator.pop(context),
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>))
                            setState(() {
                              isPayed = true;
                            })
                          },
                      child: const Text('Yes'))
                ],
              ));
    }
  }

  String getRandomString() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(
        8, (index) => chars[Random().nextInt(chars.length)]).join();
  }

  String getDate(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;
  }

  String getTime(){
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('kk:mm').format(now);
    return formattedTime;
  }

  Widget showCoffeeOrders(BuildContext context) {
    final coffeeOrders = Provider.of<Coffee>(context).orders;

    if (coffeeOrders.isEmpty) {
      return Container();
    }

    return Column(
      children: coffeeOrders.map((item) {
        return CartItem(coffee: item);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      backgroundColor: customColors?.background,
      appBar: AppBar(
        backgroundColor: customColors?.background,
        foregroundColor: customColors?.textColor,
        title: const Text('Pay Checkout'),
      ),
      body: isPayed ?  
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: customColors?.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10,),
            Text('Thank You!', style: TextStyle(
              color: customColors?.green,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: customColors!.black),
                borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Transaction ID', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                      const Spacer(),
                      Text(getRandomString(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text('Date', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                      const Spacer(),
                      Text(getDate(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text('Transaction ID', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                      const Spacer(),
                      Text(getTime(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('----------------------------------------', style: TextStyle(color: Colors.black45),),

                  const SizedBox(height: 10,),

                  const Text('Item(s)'),

                  const SizedBox(height: 10,),

                  showCoffeeOrders(context),

                  const SizedBox(height: 10,),

                  const Text('Payment Summary', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const Text('Total Price', style: TextStyle(fontSize: 14),),
                      const Spacer(),
                      Text('\$${Provider.of<Coffee>(context, listen: false).getTotalPrice()}', style: const TextStyle(fontSize: 13),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text('Payment method', style: TextStyle(fontSize: 14),),
                      Spacer(),
                      Text('Card', style: TextStyle(fontSize: 13),),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ) : Column(
              children: [
                // credit card
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (p0) {},
                  cardBgColor: customColors!.brown,
                ),

                // credit card form
                CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: (data) {
                      setState(() {
                        cardNumber = data.cardNumber;
                        expiryDate = data.expiryDate;
                        cardHolderName = data.cardHolderName;
                        cvvCode = data.cvvCode;
                      });
                    },
                    formKey: formKey),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MyButton(
                    onTap: userTappedPay,
                    text: 'Pay now',
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
    );
  }
}