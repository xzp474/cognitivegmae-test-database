import 'dart:convert';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class readuserpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>readuserpageState();
}

class readuserpageState extends State<readuserpage>{
  var readData = FirebaseDatabase.instance.ref('');
  var userpassword = '';
  Future<String> readBase() async {
    await readData.child('myapp/user/${allData.userID}/').onValue.listen((event) {
      allData.userJsonData = <String, dynamic>{'${allData.userID}':jsonDecode(jsonEncode(event.snapshot.value))};
    });
    readData.child('myapp/user/${allData.userID}/基本資料/姓名').onValue.listen((event) {
      userpassword = event.snapshot.value.toString();
    });

    return Future.delayed(Duration(seconds: 3), () => userpassword);
  }

  flspot(){
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.perception);i++) {
      allData.linePerception.add(
          FlSpot(i.toDouble(), double.parse(allData.userData.userID.score.cogScore.perception[i])));}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.attention);i++) {
      allData.lineAttention.add(
          FlSpot(i.toDouble(), double.parse(allData.userData.userID.score.cogScore.attention[i])));}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.memory);i++) {
      allData.lineMemory.add(
          FlSpot(i.toDouble(), double.parse(allData.userData.userID.score.cogScore.memory[i])));}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.raised);i++) {
      allData.lineRaised.add(
          FlSpot(i.toDouble(), double.parse(allData.userData.userID.score.cogScore.raised[i])));}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.reasoning);i++) {
      allData.lineReasoning.add(
          FlSpot(i.toDouble(), double.parse(allData.userData.userID.score.cogScore.reasoning[i])));}
  }

  @override
  Widget build(BuildContext context) {
    var textColumn = ListView(
      children: [
        FutureBuilder(
            future: readBase(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('ERROR! 錯誤!');
              }else if(snapshot.hasData){
                if(userpassword=='null'){
                  return Column(
                    children: [
                      Container(child: Icon(Icons.highlight_off_sharp,color: Colors.red,size: MediaQuery.of(context).size.width/1.2,),),
                      Container(child: Text('斷線、姓名或身分證末五碼輸入錯誤!\n請重新輸入，謝謝!', style: TextStyle(fontSize: 22),),),
                      Container(
                        height:80,
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/5, 50, MediaQuery.of(context).size.width/5, 10),
                        child: ElevatedButton(
                            child: Text('確定',style: TextStyle(color: Colors.black,fontSize: 30)),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))), onPressed: (){
                          Navigator.pop(context);
                        }),),
                  ],);
                }else{
                  return Column(children: [
                    Container(margin: EdgeInsets.fromLTRB(10,150,10, 20),
                        child: Text('歡迎使用',style: TextStyle(fontSize: 25))),
                    Text('${userpassword}',style: TextStyle(fontSize: 80)),
                    Container(height:80,width:150,padding: EdgeInsets.fromLTRB(0,0,0,0),
                      margin: EdgeInsets.fromLTRB(10,80,10, 0),
                      child: ElevatedButton(child: Text('Enter',style: TextStyle(color: Colors.black,fontSize: 30)),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
                          onPressed: (){
                            flspot();allData.pageSwitch = true;
                            Navigator.pushNamed(context, '/');
                          }),),
                  ]);
                }
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