import 'dart:async';
import 'dart:math';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';

class RaisedModel extends StatelessWidget{
  final String title;
  final Duration seconds;
  final String nextPagePath;
  RaisedModel({
    Key? key,
    required this.title,
    required this.seconds,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('反應力－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _Raised(
      title: title,
      seconds: seconds,
      nextPagePath: nextPagePath,
    );
    final page = Scaffold(
      appBar: appBar,
      body: appBody,
    );
    return page;
  }
}

class _Raised extends StatefulWidget{
  final String title;
  final Duration seconds;
  final String nextPagePath;
  _Raised({
    Key? key,
    required this.title,
    required this.seconds,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState ()=>_RaisedState();
}

class _RaisedState extends State<_Raised>{
  bool lempBtn = false;
  bool yesAndNo = false;
  bool yesAndNoBool = false;
  bool shouldPop = true;
  bool btnSwitch = true;
  bool btnLock = true;
  //顏色的布林值
  List<bool> colorBool = List.filled(16, false, growable: false);
  //驗證答案
  int _score = 0;
  //1~16隨機數
  int randomColor = Random().nextInt(16);
  //防止連續產生一樣的隨機數
  int randomLast = 0;
  //跑10遍計時
  int tenTime = 1;
  //計時器
  void timing(){
    Timer.periodic(widget.seconds, (timer) {
      lempBtn = true;
      if(tenTime<=5){
        setState(() {
          colorBool[randomColor] = false;
          randomColor = Random().nextInt(16);
          if(randomColor==randomLast){         //如果又產生一樣的隨機數就再產生一次隨機數
            randomColor = Random().nextInt(16);
            colorBool[randomColor] = true;}
          else{
            colorBool[randomColor] = true;
            randomLast = randomColor;
          }});
        tenTime++;
      }
      else if(tenTime==6){
        setState(() {
          colorBool[randomColor] = false;
          btnLock = false;
        });
        timer.cancel();
      }
      else{
        timer.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    //建立ICON
    var iconBtn = <IconButton>[];
    for(int i=0;i<=15;i++){
      iconBtn.add(
          IconButton(
              icon: Icon(Icons.wb_incandescent_outlined), iconSize: 70,
              color: colorBool[i]==true?Colors.black:Colors.orange,
              onPressed: (){
                yesAndNoBool = true;
                if(lempBtn==true){
                  if(colorBool[i]==true){
                    setState((){
                      _score++;
                      yesAndNo = true;
                    });
                  }else if(colorBool[i]==false){
                    setState((){
                      yesAndNo = false;
                    });
                  }
                  lempBtn = false;
                }
              },
          ),
      );
    }

    final stbtn = ElevatedButton(
      child: Text('按我開始', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: (){
        timing();
        setState((){
          btnSwitch = false;
        });
      },
    );

    final  nextbtn = ElevatedButton(
      child: Text('下一題', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: btnLock==true?null:(){
        Navigator.pushNamed(context, widget.nextPagePath);
        switch(widget.title){
          case '一':
            allData.userData.userID.questionData.raised.p1_1.add('${_score}');
            break;
          case '二':
            allData.userData.userID.questionData.raised.p1_2.add('${_score}');
            break;
          case '三':
            allData.userData.userID.questionData.raised.p1_3.add('${_score}');
            break;
        }
      },
    );

    final btnGrid = GridView.count(
            crossAxisCount: 4,
            padding: EdgeInsets.fromLTRB(5, 25, 5, 25),
            children: iconBtn,
          );

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『反應力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              _score=0;
              tenTime=7;
              timing();
              switch(widget.title){
                case '二':
                  allData.userData.userID.questionData.raised.p1_1.removeLast();
                  break;
                case '三':
                  allData.userData.userID.questionData.raised.p1_1.removeLast();
                  allData.userData.userID.questionData.raised.p1_2.removeLast();
                  break;
              }
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
            child: const Text('退出測驗!',style: TextStyle(color: Colors.red),),),
          SizedBox(width: 100),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('繼續測驗!'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    final page = Column(
      children: [
        Expanded(flex:1,child: Row(children:[
          Expanded(
            flex:3,
            child: Icon(
              yesAndNo==true?Icons.panorama_fisheye:Icons.close,
              size: 100,
              color: yesAndNoBool==false?Colors.white:yesAndNo==true?Colors.green:Colors.red,
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              margin: EdgeInsets.fromLTRB(0,20,5,0),
              child: Column(
                children: [
                  Text('累積命中數', style: TextStyle(fontSize: 30),),
                  Text('$_score', style: TextStyle(fontSize: 50),),
                ],
              ),
            ),
          ),
        ],),),
        Expanded(flex:3,child: btnGrid),
        Container(child: btnSwitch==true?stbtn:nextbtn,
            width: 160,height: 70,
            margin: EdgeInsets.all(15)),
      ],
    );

    return WillPopScope(child: page, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}