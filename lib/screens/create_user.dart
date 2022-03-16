import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUser extends StatefulWidget {

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController _usernameControl = new TextEditingController();

  TextEditingController _passwordControl = new TextEditingController();

  TextEditingController _confrimPasswordControl = new TextEditingController();

  List<String> usernameList = [];

  List<String> passwordList = [];

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGNIN'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: TextField(
                controller: _usernameControl,
                decoration: InputDecoration(
                  hintText: 'Enter new Username',
                  focusColor: Colors.blue,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: TextField(
                controller: _passwordControl,
                decoration: InputDecoration(
                  hintText: 'Enter new Password',
                  focusColor: Colors.blue,
                ),
              ),
            ),
        SizedBox(height: 10),
        Text("Visiting Members",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
        showSelectDropDown(),
            Expanded(
              child: DatePickerDialog(
                fieldLabelText: 'DATE OF VISIT: ',
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030)),),
            ElevatedButton(
                onPressed: (){
                  // print(_usernameControl.text);
                  // isValidCredential(_usernameControl.text, _passwordControl.text);
                  if(_passwordControl == _confrimPasswordControl) {
                   usernameList.add(_usernameControl.text);
                   passwordList.add(_confrimPasswordControl.text);
                   saveUser();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                },
                child: Text('Submit')
            ),
          ],
        ),
      ),
    );
  }

  showSelectDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void saveUser() {
    final SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;
    pref.setStringList('usernameList', usernameList);
    pref.setStringList('passwordList', passwordList);
  }
}
