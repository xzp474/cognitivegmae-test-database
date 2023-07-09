import 'package:flutter/material.dart';

class ReasoningEX extends StatelessWidget {
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
      title: Text('推理－題目說明',style: TextStyle(color: Colors.black),),
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
  bool essayBool = false;
  @override
  Widget build(BuildContext context) {

    String essay_1 = '推理測驗\n主要測驗您透過任何事物的脈絡，來推理其答案\n\n接下來您將進行此測驗...';
    String essay_2 = '如上圖所示\n\n藉由左邊三張圖片所提供的訊息\n'
        '來推理左邊問號圖片，可能是右邊四張圖片中的哪一張?\n'
        '\n(無計時)';

    final entBtn = ElevatedButton(
      child: Text('確定', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: (){
        setState((){essayBool=true;});
      },
    );
    final startBtn = ElevatedButton(
      child: Text('開始作答', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: (){
        Navigator.pushNamed(context, 'reasoningPage');//下一頁
      },
    );

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『推理』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
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
        Expanded(flex:6,
          child: Container(
            margin: EdgeInsets.fromLTRB(82, 10, 82, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/reasoning/game.gif'),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Expanded(flex:3, child: Container(margin: EdgeInsets.all(10), child: Text(essayBool==false?essay_1:essay_2, style: TextStyle(fontSize: 22, color: Colors.black),),),),
        Expanded(flex:1, child: Container(margin: EdgeInsets.fromLTRB(0,0,0,10), child: essayBool==false?entBtn:startBtn, ),
        ),
      ],
    );

    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}