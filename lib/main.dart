import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/user.dart';
import 'package:fooddeliveryapp/screens/create_user.dart';
import 'package:fooddeliveryapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodDeliveryApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {

  TextEditingController _usernameControl = new TextEditingController();
  TextEditingController _passwordControl = new TextEditingController();
  List<User> usersList =[];
  List<String> usernameList =[];
  List<String> passwordList =[];

  @override
  void initState() {
    setToDB();
  }

  setToDB() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('FOOD DELIVERY APP'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.black12,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _usernameControl,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      focusColor: Colors.white,
                        fillColor: Colors. white, filled: true
                    ),
                  ),
                ),
                const SizedBox(
                  height:20.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _passwordControl,
                    decoration: InputDecoration(
                      hintText: 'Password',
                        focusColor: Colors.white,
                        fillColor: Colors. white, filled: true
                    ),
                  ),
                ),
                const SizedBox(
                  height:20.0,
                ),
                ElevatedButton(
                    onPressed: (){
                      print(_usernameControl.text);
                      isValidCredential(_usernameControl.text, _passwordControl.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },
                    child: Text('Login',style:TextStyle(
                      fontSize: 40,
                    ))
                ),
                FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateUser()));
                    },
                    child: Text('Create new User',
                      style: TextStyle(
                        fontSize: 18,
                          color: Colors.white
                      ),))
              ]
          ),
        ),
      ),
    );
  }

  bool isValidCredential(String _username, String _password) {
    for(int i=0; i<usersList.length; i++) {
      if(_username == usersList[i] && _password == _password[i]) {
        return true;
      }
    }
    return true;
  }

}

