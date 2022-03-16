import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/item.dart';
import 'package:fooddeliveryapp/screens/payment_screen.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List<Item> itemList = [
    Item(1, 'Biriyani', 300, 2),
    Item(2, 'Parota', 30, 2),
    Item(3, 'Rice', 70, 1),
    Item(4, 'Chicken 65', 80, 2),
    Item(5, 'Chicken Noodles', 120, 1),
    Item(6, 'Chicken lalipop', 200, 2),
    Item(7, 'Mutton lalipop', 150, 1),
    Item(8, 'Kuska', 70, 1),
    Item(9, 'Idly', 20, 2),
    Item(10, 'Chapathi', 60, 2),
    Item(11, 'Chicken rice', 200, 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOODS'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen(itemList[index])));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text(itemList[index].itemId.toString()),
                        SizedBox(width: 20,),
                        Text(itemList[index].itemName, style: TextStyle(
                            fontSize: 20,
                        )),
                        SizedBox(width: 30,),
                        Text(itemList[index].itemQty.toString(), style: TextStyle(
                            fontSize: 16
                        )),
                        SizedBox(width: 20,),
                        Text(itemList[index].itemPrice.toString(), style: TextStyle(
                            fontSize: 16
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
