import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'dart:convert';

class createuser extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>createuserState();
}

class createuserState extends State<createuser>{
  var nameController = TextEditingController();
  var idController = TextEditingController();
  String sexController = '按此選擇';
  String birtController = '按此選擇';
  var scoreController = '按此選擇';
  String schoolController = '按此選擇';
  var readData = FirebaseDatabase.instance.ref('');

  @override
  Widget build(BuildContext context) {

    var sexDrop = Row(children: [
      Container(child:Text('生理性別:',style: TextStyle(fontSize: 23)),
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),),
      DropdownButton(
          items: [
            DropdownMenuItem(child: Text('按此選擇'), value: '按此選擇'),
            DropdownMenuItem(child: Text('男',style:TextStyle(fontSize: 23,
                color: Colors.blue)),value: '男'),
            DropdownMenuItem(child: Text('女',style:TextStyle(fontSize: 23,
                color: Colors.pink)),value: '女'),],
          onChanged: (String? Value){setState(() {sexController = Value!;});},
          value: sexController,),]);

    var birthDrop = Row(children: [
      Container(child:Text('出生地類別:',style: TextStyle(fontSize: 23)),
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),),
      DropdownButton(
        items: [
          DropdownMenuItem(child: Text('按此選擇'), value: '按此選擇'),
          DropdownMenuItem(child: Text('鄉間',style:TextStyle(fontSize: 23,
              color: Colors.green)),value: '鄉間'),
          DropdownMenuItem(child: Text('近郊',style:TextStyle(fontSize: 23,
              color: Colors.deepOrangeAccent)),value: '近郊'),
          DropdownMenuItem(child: Text('都市',style:TextStyle(fontSize: 23,
              color: Colors.purple)),value: '都市'),],
        onChanged: (String? Value){setState(() {birtController = Value!;});},
        value: birtController,),]);

    var scoreDrop = Row(children: [
      Container(child:Text('您最近在校成績:',style: TextStyle(fontSize: 23)),
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),),
      DropdownButton(
        items: [
          DropdownMenuItem(child: Text('按此選擇'), value: '按此選擇'),
          DropdownMenuItem(child: Text('0~20',style:TextStyle(fontSize: 23)),value: '0~20'),
          DropdownMenuItem(child: Text('20~40',style:TextStyle(fontSize: 23)),value: '20~40'),
          DropdownMenuItem(child: Text('40~60',style:TextStyle(fontSize: 23)),value: '40~60'),
          DropdownMenuItem(child: Text('60~80',style:TextStyle(fontSize: 23)),value: '60~80'),
          DropdownMenuItem(child: Text('80~100',style:TextStyle(fontSize: 23)),value: '80~100'),],
        onChanged: (String? Value){setState(() {scoreController = Value!;});},
        value: scoreController,),]);

    var schoolDrop = Row(children: [
      Container(child:Text('學校:',style: TextStyle(fontSize: 23)),
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),),
      DropdownButton(
        items: [
          DropdownMenuItem(child: Text('按此選擇'), value: '按此選擇'),
          DropdownMenuItem(child: Text('文化大學',style:TextStyle(fontSize: 23)), value: '文化大學'),
          DropdownMenuItem(child: Text('龍華科大',style:TextStyle(fontSize: 23)), value: '龍華科大'),],
        onChanged: (String? Value){setState(() {schoolController = Value!;});},
        value: schoolController,),],);

    var nameField = TextField(
      controller: nameController,decoration: InputDecoration(labelText: '請輸入姓名'),
      style: TextStyle(fontSize: 23),);
    var idField = TextField(
      controller: idController,decoration: InputDecoration(labelText: '請輸入身分證末五碼'),
      style: TextStyle(fontSize: 23),);

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('資料未完整!'),
        content: Text('請再次確認，謝謝'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('確定!'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    final btn = ElevatedButton(child: Text('創建帳號',style: TextStyle(color: Colors.black,fontSize: 30)),
        style: ButtonStyle(backgroundColor:
            MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
      setState(() {});
      if(idController.text==''||nameController.text==''||sexController=='按此選擇'||birtController=='按此選擇'||scoreController=='按此選擇'){
        _msgBox(context);
      }else{
        setState(() {
          allData.userID=idController.text;
          allData.linePerception.add(FlSpot(0,0));
          allData.lineAttention.add(FlSpot(0,0));
          allData.lineMemory.add(FlSpot(0,0));
          allData.lineRaised.add(FlSpot(0,0));
          allData.lineReasoning.add(FlSpot(0,0));

          allData.userData.userID.information.id=idController.text;
          allData.userData.userID.information.name=nameController.text;
          allData.userData.userID.information.sex = sexController;
          allData.userData.userID.information.birthplace=birtController;
          allData.userData.userID.information.study_score=scoreController;
          allData.userData.userID.information.school=schoolController;
        });

        allData.userJsonData = jsonDecode(jsonEncode(allData.userData));
        readData.child('myapp/user').update(allData.userJsonData);
        Navigator.pushNamed(context, 'createingpage');
      }
    });

    var textColum = ListView(children: [
      Container(child: nameField,margin: EdgeInsets.fromLTRB(50,30,50,10),),
      Container(child: idField,margin: EdgeInsets.fromLTRB(50,10,50,10),),
      Container(child: sexDrop,margin: EdgeInsets.fromLTRB(50, 20, 50, 10),),
      Container(child: birthDrop,margin: EdgeInsets.fromLTRB(50,10,50,10),),
      Container(child: scoreDrop,margin: EdgeInsets.fromLTRB(50,10,50,10),),
      Container(child: schoolDrop,margin: EdgeInsets.fromLTRB(50,10,50,20),),
      Container(child: btn,height: 80,padding: EdgeInsets.fromLTRB(50,0,50,0),
        margin: EdgeInsets.fromLTRB(50, 20, 50, 50),),
    ]);

    return Scaffold(
      appBar: AppBar(title: Text('創建帳號', style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xFFE8E8E8)),
      body: Container(child: textColum),
    );
  }
}