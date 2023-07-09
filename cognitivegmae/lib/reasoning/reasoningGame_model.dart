import 'dart:math';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';

class ReasoningModel extends StatelessWidget{
  final String title;
  final String qImgPath;
  final String nextPagePath;
  final int selectDataPath;
  ReasoningModel({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.nextPagePath,
    required this.selectDataPath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('推理－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _reasoning(
      title: title,
      qImgPath: qImgPath,
      nextPagePath: nextPagePath,
      selectDataPath: selectDataPath,
    );
    final page = Scaffold(
      appBar: appBar,
      body: appBody,
    );
    return page;
  }}

class _reasoning extends StatefulWidget{
  final String title;
  final String qImgPath;
  final String nextPagePath;
  final int selectDataPath;
  _reasoning({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.nextPagePath,
    required this.selectDataPath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_reasoningState();
}

class _reasoningState extends State<_reasoning>{
  bool shouldPop = true;
  final _imgList = <int>[0,1,2,3];//隨機陣列
  final _img = <int>[0,0,0,0];
  bool _imgbool = true;
  var _groupValue = 0; //選項的值
  _reState(int reState) {
    setState(() {
      _groupValue=reState;
    });}

  @override
  Widget build(BuildContext context) {
    if(_imgbool==true){//建立隨機數
      for(int i=0;i<=3;i++){
        int numRandom = Random().nextInt(_imgList.length);
        _img[i] = _imgList[numRandom];
        _imgList.removeAt(numRandom);
      }
      _groupValue = _img[0];
      _imgbool=false;
    }

    var imgQu = <Expanded>[];//題目圖片陣列
    for(int i=0;i<=3;i++){//建立題目圖片
      imgQu.add(Expanded(
        child: Container(
          child: Image.asset('assets/reasoning/${widget.qImgPath}0$i.png'),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      ));
    }

    var imgAn = <RadioListTile>[];//選項圖片陣列
    for(int i=0;i<=3;i++){//建立選項圖片陣列
      imgAn.add(RadioListTile(
          value: _img[i],//建立選項的值
          groupValue: _groupValue,//已選的值
          title: Container(child: Image.asset('assets/reasoning/${widget.qImgPath}1${_img[i]}.png'),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),),
          onChanged: (value){_reState(value);}//將值回傳函數
      ));
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『推理』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _groupValue=0;
              switch(widget.selectDataPath){
                case 2:
                  allData.userData.userID.questionData.reason.p1_1.removeLast();
                  break;
                case 3:
                  allData.userData.userID.questionData.reason.p1_1.removeLast();
                  allData.userData.userID.questionData.reason.p1_2.removeLast();
                  break;
                case 4:
                  allData.userData.userID.questionData.reason.p1_1.removeLast();
                  allData.userData.userID.questionData.reason.p1_2.removeLast();
                  allData.userData.userID.questionData.reason.p1_3.removeLast();
                  break;
                case 5:
                  allData.userData.userID.questionData.reason.p1_1.removeLast();
                  allData.userData.userID.questionData.reason.p1_2.removeLast();
                  allData.userData.userID.questionData.reason.p1_3.removeLast();
                  allData.userData.userID.questionData.reason.p1_4.removeLast();
                  break;
                case 6:
                  allData.userData.userID.questionData.reason.p1_1.removeLast();
                  allData.userData.userID.questionData.reason.p1_2.removeLast();
                  allData.userData.userID.questionData.reason.p1_3.removeLast();
                  allData.userData.userID.questionData.reason.p1_4.removeLast();
                  allData.userData.userID.questionData.reason.p1_5.removeLast();
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

    _answerMsgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('完成『推理』第${widget.title}題作答!'),
        content: Text(_groupValue==0?'您的答案是正確的':'您的答案是錯誤的'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              //驗證答案
              switch(widget.selectDataPath){
                case 1:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_1.add('1'):
                  allData.userData.userID.questionData.reason.p1_1.add('0');
                  break;
                case 2:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_2.add('1'):
                  allData.userData.userID.questionData.reason.p1_2.add('0');
                  break;
                case 3:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_3.add('1'):
                  allData.userData.userID.questionData.reason.p1_3.add('0');
                  break;
                case 4:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_4.add('1'):
                  allData.userData.userID.questionData.reason.p1_4.add('0');
                  break;
                case 5:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_5.add('1'):
                  allData.userData.userID.questionData.reason.p1_5.add('0');
                  break;
                case 6:
                  _groupValue==0?
                  allData.userData.userID.questionData.reason.p1_6.add('1'):
                  allData.userData.userID.questionData.reason.p1_6.add('0');
                  break;
              }
              Navigator.pushNamed(context, widget.nextPagePath);
            },
            child: Text(
              widget.selectDataPath==6?'完成測驗':'前往下一題',
              style: TextStyle(fontSize: 25, color: Colors.blue),),),
        ],);
      showDialog(
          context:context,
          barrierDismissible: false,
          builder:(context) {
            return WillPopScope(child: dlg, onWillPop: ()async{
              _msgBox(context);
              return shouldPop;
            });
          }
      );
    }

    var entBtn = ElevatedButton(
        child: Text('確定', style: TextStyle(fontSize: 30,color: Colors.black)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
          _answerMsgBox(context);
        },
    );

    var page =
    Column(children: [
      Expanded(flex: 6,
        child: Row(children: [
          Expanded(child: Column(children: imgQu)),
          Expanded(child: Column(children: [
            Expanded(child: imgAn[0]),Expanded(child: imgAn[1]),
            Expanded(child: imgAn[2]),Expanded(child: imgAn[3])],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,))
        ]),),
      Expanded(flex: 1,
          child: Container(child: entBtn,
            margin: EdgeInsets.symmetric(vertical: 20),))
    ]);
    return WillPopScope(child: page, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}