import 'package:flutter/material.dart';

class AttentionEXI extends StatelessWidget {
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
      title: Text('注意力－題目說明',style: TextStyle(color: Colors.black),),
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

    String essay_1 = '注意力測驗\n主要測驗您在面對許多圖案時的注意力\n\n接下來您將進行此測驗...';
    String essay_2 = '如上圖所示\n\n1.請根據最上層圖案，在下層圖案中，\n\t\t\t找出與最上層圖案一模一樣的圖案\n'
        '2.並點擊它使它變成紅色，\n\t\t\t總共有「4」個\n'
        '3.即使有不一樣的圖案是紅色，\n\t\t\t也要點擊它使它變成黑色\n(有計時)';

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
        Navigator.pushNamed(context, 'attentionPage');//下一頁
      },
    );

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『注意力』測驗!'),
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
        Expanded(flex:7,
          child: Container(
            margin: EdgeInsets.fromLTRB(80, 20, 80, 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/attention/game_I.gif'),
              ),
            ),
          ),
        ),
        Expanded(flex:8, child: Container(margin: EdgeInsets.all(10), child: Text(essayBool==false?essay_1:essay_2, style: TextStyle(fontSize: 22, color: Colors.black),),),),
        Expanded(flex:2, child: Container(margin: EdgeInsets.fromLTRB(0,0,0,10), child: essayBool==false?entBtn:startBtn, ),
        ),
      ],
    );

    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}