import 'package:flutter/material.dart';

class AttentionEXII extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {

    String essay_1 = '如上圖所示\n\n1.請根據最上層的「2」個圖案，\n\t\t\t找出與這兩種一樣的圖案\n'
        '2.並點擊它使它變成紅色，\n\t\t\t每一種有「4」，總共有「8」個\n'
        '3.即使有不一樣的圖案是紅色，\n\t\t\t也要點擊它使它變成黑色\n(有計時)';

    final startBtn = ElevatedButton(
      child: Text('開始作答', style: TextStyle(fontSize: 30,color: Colors.black)),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      onPressed: (){
        Navigator.pushNamed(context, 'attentionPage5');//下一頁
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
        Expanded(flex:4,
          child: Container(
            margin: EdgeInsets.fromLTRB(120, 20, 120, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/attention/game_II.gif'),
              ),
            ),
          ),
        ),
        Expanded(flex:4, child: Container(margin: EdgeInsets.all(10), child: Text(essay_1, style: TextStyle(fontSize: 22, color: Colors.black),),),),
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