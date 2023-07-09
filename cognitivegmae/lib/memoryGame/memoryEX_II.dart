import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class MemoryEXII extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EXModel();

  }
}

class EXModel extends StatelessWidget{
  EXModel({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('記憶力－題目說明',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = Container(child: EXModelpage(), color: Color.fromRGBO(247, 247, 247, 0.3),);
    final page = Scaffold(
        appBar: appBar,
        body: appBody);
    return page;}}

class EXModelpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>EXModelpageState();
}

class EXModelpageState extends State<EXModelpage>{
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {

    String essay_1 = '如上圖所示\n\n會在隨機位置出現數字，請記住這些數字，3秒後會隱藏'
        '\n請依照剛剛的數字由小到大的順序來進行點擊';

    final startBtn = ElevatedButton(
      child: Text('開始作答', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: (){
        Navigator.pushNamed(context, 'memoryPage4');//下一頁
      },
    );

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『記憶力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              allData.userData.userID.questionData.memory.p1_1.removeLast();
              allData.userData.userID.questionData.memory.p1_2.removeLast();
              allData.userData.userID.questionData.memory.p1_3.removeLast();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
            child: const Text('退出測驗!',style: TextStyle(color: Colors.red),),),
          SizedBox(width: 100),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('繼續測驗!',style: TextStyle(color: Colors.blue),),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    var statePage = Column(
      children:[
        SizedBox(height: 30,),
        Expanded(flex:5,
          child: Container(
            margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/memory/game_II.gif'),
              ),
            ),
          ),
        ),
        Expanded(flex:3, child: Container(margin: EdgeInsets.all(10), child: Text(essay_1, style: TextStyle(fontSize: 22, color: Colors.black),),),),
        Expanded(flex:1, child: Container(margin: EdgeInsets.fromLTRB(0,0,0,10), child: startBtn, ),
        ),
      ],
    );

    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}