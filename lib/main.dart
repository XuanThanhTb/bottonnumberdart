import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SharePrefences());

class SharePrefences extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Send Data App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send Data', style: TextStyle(color: Colors.black, fontSize: 24),),
          backgroundColor: Colors.yellow,
        ),
        body: BottonSharePrefences(),
      ),
    );
  }
}
class BottonSharePrefences extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottonSharePrefencesState();
  }
}

class BottonSharePrefencesState extends State<BottonSharePrefences>{

SharedPreferences sharedPreferences;
  var votes = 0;
  var add = 0;
  @override
  void initState() {
    super.initState();
    votes = (sharedPreferences.getInt('votes') ?? 0);
    add = (sharedPreferences.getInt('votes') ?? 0);
  }
  void votesUp() async {
     sharedPreferences = await SharedPreferences.getInstance();
     votes++;
     sharedPreferences.setInt('votes', votes);
    setState(() {
     votes++;
     add++;
    });
  }

  void votesDown(){
    setState(() {
      votes--;
      add--;
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    add = votes;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.green,
            child: Text('-1', style: TextStyle(color: Colors.redAccent, fontSize: 20),),
            onPressed: votesDown,
          ),
          Text('Up Votes: $add', textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent, fontSize: 24),),
          RaisedButton(
            color: Colors.green,
            child: Text('+1', style: TextStyle(color: Colors.redAccent, fontSize: 20),),
            onPressed: votesUp,
          ),
        ],
      ),
    );
  }
}