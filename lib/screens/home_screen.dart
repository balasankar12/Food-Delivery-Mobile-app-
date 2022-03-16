import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/hotels.dart';
import 'package:fooddeliveryapp/screens/item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Hotel> hotelsList = [
    Hotel(1, 'THALAPPAKATI'),
    Hotel(2, 'SUKUBHAI'),
    Hotel(3, 'BARBEQUE NATION'),
    Hotel(4, 'BARBEQUE ELITE'),
    Hotel(5, 'THOPPI VAAPPA'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: Container(
        // padding: EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: hotelsList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemScreen()));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text(hotelsList[index].hotelId.toString(), style: TextStyle(
                          fontSize: 24
                        ),),
                        SizedBox(width: 30,),
                        Text(hotelsList[index].hotelName, style: TextStyle(
                            fontSize: 24
                        ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      )
    );
  }
}
