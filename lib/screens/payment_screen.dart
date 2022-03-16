import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/item.dart';

class PaymentScreen extends StatefulWidget {
  Item curItem;
  PaymentScreen(this.curItem);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double amount = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Card Number',
                  focusColor: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Card Name',
                  focusColor: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                    title: Text('Payment Details'),
                    content: Column(
                      children: [
                        Row(
                          children: [
                            Text('Rs. '),
                            Text(widget.curItem.itemPrice.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Text('ITEMID '),
                            Text(widget.curItem.itemId.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Text('ITEM NAME'),
                            Text(widget.curItem.itemName.toString()),
                          ],
                        ),
                      ],
                    ),
                    scrollable: true,
                  )
                  );
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Pay Rs. $amount')
            ),
          ],
        ),
      )
    );
  }


}
