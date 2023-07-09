import 'dart:convert';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class reasoningdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>reasoningdataState();
}

class reasoningdataState extends State<reasoningdata>{

  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;
    var readData = FirebaseDatabase.instance.ref();
    var userpassword = '';
    if(allData.userData.userID.tested.coged.reasoning=='0'){
      allData.userData.userID.tested.coged.reasoning='1';}
    allData.userData.userID.times.cogTimes.reasoning =
        (int.parse(allData.userData.userID.times.cogTimes.reasoning)+1)
            .toString();
    allData.userData.userID.score.cogScore.reasoning.add(
            (int.parse(allData.userData.userID.questionData.reason.p1_1.last)*3
            +int.parse(allData.userData.userID.questionData.reason.p1_2.last)*3
            +int.parse(allData.userData.userID.questionData.reason.p1_3.last)*3
            +int.parse(allData.userData.userID.questionData.reason.p1_4.last)*3
            +int.parse(allData.userData.userID.questionData.reason.p1_5.last)*4
            +int.parse(allData.userData.userID.questionData.reason.p1_6.last)*4
        ).toString());

    allData.lineReasoning.add(
        FlSpot(double.parse(allData.userData.userID.times.cogTimes.reasoning),
            double.parse(allData.userData.userID.score.cogScore.reasoning.last)));
    allData.userData.userID.testTime.cogTime.reasoning.add('${DateTime.now()}');

    allData.userJsonData = jsonDecode(jsonEncode(allData.userData));
    readData.child('myapp/user').update(allData.userJsonData);

    Future<String> readBase() async {
      await readData.child('myapp/user/${allData.userID}/測驗次數/認知測驗/推理').onValue.listen((event) {
        allData.userData.userID.times.cogTimes.reasoning = event.snapshot.value.toString();
      });

      return Future.delayed(Duration(seconds: 3), () => userpassword);
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('恭喜~完成測驗!'),
        content: Text('回到主畫面?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
            child: const Text('取消',style: TextStyle(color: Colors.red),),),
          SizedBox(width: 100),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('確定'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    var textUser = Text('完成測驗!',style: TextStyle(fontSize: 30));
    var textColumn = Column(
      children: [
        textUser,
        FutureBuilder(
            future: readBase(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('ERROR! 錯誤!');
              }else if(snapshot.hasData){
                return Column(children: [
                  Container(margin: EdgeInsets.fromLTRB(10,150,10, 20),
                      child: Text('上傳完成!',style: TextStyle(fontSize: 80))),
                  Container(height:80,width:150,padding: EdgeInsets.fromLTRB(0,0,0,0),
                    margin: EdgeInsets.fromLTRB(10,80,10, 0),
                    child: ElevatedButton(child: Text('Enter',style: TextStyle(color: Colors.black,fontSize: 30)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
                        onPressed: (){
                          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                        }),),
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
              }}),
      ],
    );

    var statePage = Scaffold(
      appBar: AppBar(title: Text('成績上傳',style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xFFE8E8E8)),
      body: Center(child: textColumn),
    );

    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}