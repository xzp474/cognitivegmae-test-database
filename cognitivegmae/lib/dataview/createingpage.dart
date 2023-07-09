import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class createingpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>createingpageState();
}

class createingpageState extends State<createingpage>{
  var readData = FirebaseDatabase.instance.ref('');
  var userpassword = '';
  var runColor;
  Future<String> readBase() async {
    await readData.child('myapp/user/${allData.userID}/基本資料/姓名').onValue.listen((event) {
      userpassword = event.snapshot.value.toString();
    });

    return Future.delayed(Duration(seconds: 3), () => userpassword);
  }

  @override
  Widget build(BuildContext context) {

    var textColumn = Column(
      children: [
        FutureBuilder(
          future: readBase(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text('ERROR! 錯誤!');
            }else if(snapshot.hasData){
              return Column(children: [
                Container(margin: EdgeInsets.fromLTRB(10,150,10, 20),
                    child: Text('歡迎使用',style: TextStyle(fontSize: 25))),
                Text('${userpassword}',
                      style: TextStyle(fontSize: 80)),
                Container(height:80,width:150,padding: EdgeInsets.fromLTRB(0,0,0,0),
                  margin: EdgeInsets.fromLTRB(10,80,10, 0),
                  child: ElevatedButton(child: Text('Enter',style: TextStyle(color: Colors.black,fontSize: 30)),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
                      onPressed: (){
                        allData.pageSwitch=true;
                        Navigator.pushNamed(context, '/');}),)
              ]);
            }else{
              return Column(children: [
                Container(margin: EdgeInsets.fromLTRB(50, 100, 50, 50),
                    height:MediaQuery.of(context).size.height*0.3,
                    width:MediaQuery.of(context).size.height*0.3,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(
                          100,Random().nextInt(255),
                          Random().nextInt(255),Random().nextInt(255)),strokeWidth: 30,
                      backgroundColor: Color.fromARGB(
                          100,Random().nextInt(255),
                          Random().nextInt(255),Random().nextInt(255))),),
                Container(child:Text('資料建立中...',style: TextStyle(fontSize: 30)),
                  margin: EdgeInsets.fromLTRB(50, 80, 50, 0),),
              ]);
            }})]
    );
    return Scaffold(
      appBar: AppBar(title: Text('歡迎使用',style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFE8E8E8)),
      body: Center(child: textColumn),
    );
  }
}