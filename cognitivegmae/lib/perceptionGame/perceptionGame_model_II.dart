import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'dart:math';

class PerceptionModelII extends StatelessWidget{
  final String title;
  final String qImgPath;
  final List<int> answerList;
  final String nextPagePath;
  final int selectDataPath;
  PerceptionModelII({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.answerList,
    required this.nextPagePath,
    required this.selectDataPath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('空間知覺－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _perception(
      title: title,
      qImgPath: qImgPath,
      answerList: answerList,
      nextPagePath: nextPagePath,
      selectDataPath: selectDataPath,
    );
    final page = Scaffold(
        appBar: appBar,
        body: appBody);
    return page;}}

class _perception extends StatefulWidget{
  final String title;
  final String qImgPath;
  final List<int> answerList;
  final String nextPagePath;
  final int selectDataPath;
  _perception({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.answerList,
    required this.nextPagePath,
    required this.selectDataPath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _perceptionState();}}

class _perceptionState extends State<_perception>{
  bool shouldPop = true;
  bool _answer = false;//答案驗證布林值
  var acceptedData = <int>[0,0,0,0,0,0,0,0,0];
  var N = <int>[1,2,3,4,5,6];
  var listNum = <int>[0,0,0,0,0,0];
  bool imgBool = true;
  bool _bdTimingbool = true;
  int _score = 0;

  @override
  void initState(){
    super.initState();
    _timeing();}

  _timeing(){
    final period = Duration(milliseconds: 1000);
    Timer.periodic(period, (timer){
      if(_bdTimingbool==true)_score++;
      else timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(imgBool==true){
      for(int i=0; i < listNum.length; i++){
        int numRadnom = Random(). nextInt ( N.length );
        listNum[i] = N [numRadnom];
        N.removeAt(numRadnom);
        imgBool = false;}
    }
    //要被拚的圖片
    var dragTarget = <DragTarget>[];
    for(int i=0;i<=8;i++){
      dragTarget.add(
          DragTarget<int>(builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected,) {
            return acceptedData[i]==0?Image.asset('assets/perception/game${widget.qImgPath}/bd-q.png'):
            acceptedData[i]==1?Image.asset('assets/perception/game${widget.qImgPath}/1.png'):
            acceptedData[i]==2?Image.asset('assets/perception/game${widget.qImgPath}/2.png'):
            acceptedData[i]==3?Image.asset('assets/perception/game${widget.qImgPath}/3.png'):
            acceptedData[i]==4?Image.asset('assets/perception/game${widget.qImgPath}/4.png'):
            acceptedData[i]==5?Image.asset('assets/perception/game${widget.qImgPath}/5.png'):
            Image.asset('assets/perception/game${widget.qImgPath}/6.png');},
              onAccept: (int data) {
                setState(() {
                  acceptedData[i] = data;
                });}));
    }
    //要拚的圖片
    var draggable = <Draggable>[];
    for(int i=0;i<=5;i++){
      draggable.add(
        Draggable<int>(
          data: listNum[i],
          child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Image.asset('assets/perception/game${widget.qImgPath}/${listNum[i]}.png')),
          feedback: Container(
            color: Colors.white,
            child: Image.asset('assets/perception/game${widget.qImgPath}/${listNum[i]}.png',scale: 3.5,),),
          childWhenDragging: Container(
              color: Colors.white,
              child: Image.asset('assets/perception/game${widget.qImgPath}/${listNum[i]}.png')),
        ),
      );}
    //要被拚的圖片
    final imageList = GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children:dragTarget,
    );
    //要拚的圖片
    final puzzleImg =GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: draggable,
    );

    if( acceptedData[0]==widget.answerList[0]&&acceptedData[1]==widget.answerList[1]&&//驗證答案
        acceptedData[2]==widget.answerList[2]&&acceptedData[3]==widget.answerList[3]&&
        acceptedData[4]==widget.answerList[4]&&acceptedData[5]==widget.answerList[5]&&
        acceptedData[6]==widget.answerList[6]&&acceptedData[7]==widget.answerList[7]&&
        acceptedData[8]==widget.answerList[8]){
      _answer=true;
    }
    else{
      _answer=false;
    }

    _msgBoxAs(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('答錯了'),
        content: Text('答錯了喔，按OK繼續作答'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),)
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『空間知覺』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _bdTimingbool=false;
              _score=0;
              _timeing();
              switch(widget.selectDataPath){
                case 4:
                  allData.userData.userID.questionData.perception.p1_1.removeLast();
                  allData.userData.userID.questionData.perception.p1_2.removeLast();
                  allData.userData.userID.questionData.perception.p1_3.removeLast();
                  break;
                case 5:
                  allData.userData.userID.questionData.perception.p1_1.removeLast();
                  allData.userData.userID.questionData.perception.p1_2.removeLast();
                  allData.userData.userID.questionData.perception.p1_3.removeLast();
                  allData.userData.userID.questionData.perception.p2_1.removeLast();
                  break;
                case 6:
                  allData.userData.userID.questionData.perception.p1_1.removeLast();
                  allData.userData.userID.questionData.perception.p1_2.removeLast();
                  allData.userData.userID.questionData.perception.p1_3.removeLast();
                  allData.userData.userID.questionData.perception.p2_1.removeLast();
                  allData.userData.userID.questionData.perception.p2_2.removeLast();
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
        title: Text('完成『空間知覺』第${widget.title}題作答!'),
        content: Text('您共花了\t"$_score"\t秒，完成此題'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              switch(widget.selectDataPath){
                case 4:
                  allData.userData.userID.questionData.perception.p2_1.add(_score.toString());
                  break;
                case 5:
                  allData.userData.userID.questionData.perception.p2_2.add(_score.toString());
                  break;
                case 6:
                  allData.userData.userID.questionData.perception.p2_3.add(_score.toString());
                  break;
              }
              _score=0;
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

    final msgBtn = ElevatedButton(
        child: Text('確定',style: TextStyle(fontSize: 30,color: Colors.black)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
          if(_answer==true){
            _bdTimingbool=false;
            _timeing();
            _answerMsgBox(context);
          }
          else{
            _msgBoxAs(context);
          }
        }
    );

    double imgSize = (
        MediaQuery.of(context).size.width
            -(MediaQuery.of(context).size.height-100)*3/7)/2;
    double puzzSize = (
        MediaQuery.of(context).size.width
            -(MediaQuery.of(context).size.height-100)*5/14)/2;

    final puzzwidget = Column(children: <Widget>[
      Expanded(flex: 4,
          child: Container(margin:EdgeInsets.fromLTRB(0,10,0,10),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Image.asset('assets/perception/game${widget.qImgPath}/lemp${widget.qImgPath}.png'),)),
      Expanded(flex: 9,
          child: Container(child: imageList,
              margin:EdgeInsets.fromLTRB(imgSize,0,imgSize,0))),
      Expanded(flex: 5,
          child: Container(child: puzzleImg,
              margin: EdgeInsets.fromLTRB(puzzSize, 0, puzzSize, 0,))),
      Expanded(flex: 3,
          child: Container(child: msgBtn,margin: EdgeInsets.fromLTRB(0, 10, 0, 20)))]);
    return WillPopScope(child: puzzwidget, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}