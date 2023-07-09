import 'dart:async';
import 'dart:math';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';

class MemoryModelII extends StatelessWidget{
  final String title;
  final List<int> btnNum;
  final int selectDataPath;
  final String nextPagePath;
  MemoryModelII({
    Key? key,
    required this.title,
    required this.btnNum,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar=AppBar(
      title: Text('記憶力－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _memory(
      title: title,
      btnNum: btnNum,
      selectDataPath: selectDataPath,
      nextPagePath: nextPagePath,
    );
    final page=Scaffold(
        appBar: appBar,
        body: appBody
    );
    return page;}
}

class _memory extends StatefulWidget{
  final String title;
  final List<int> btnNum;
  final int selectDataPath;
  final String nextPagePath;
  _memory({
    Key? key,
    required this.title,
    required this.btnNum,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_memoryState();
}

class _memoryState extends State<_memory>{
  bool shouldPop = true;
  int random = 0;
  List<bool> randomRp = List.filled(40, false, growable: false);   //40個位置的bool
  int _score = 0;//得分
  List<String> btnText = List.filled(40, '', growable: false);   //40個位置的字串
  bool btnBool = true;
  bool keybolock = false;

  List<Color> btnColor = List.filled(40, Colors.white, growable: false);  //40個位置的顏色

  final proper = <int>[];

  void btnforText (){
    int n=0; //成功把數字丟到空的位置的計數器
    for(int i=0;i<=widget.selectDataPath;i++) {         //把5個順序隨機丟到各位置
      random = Random().nextInt(40);  //產生0~39的隨機數字
      if(randomRp[random]==false) {   //如果該隨機位置沒有數字丟進去就執行以下命令
        randomRp[random]=true;      //該位置關閉，表示有數字被丟進來過
        btnText[random] = widget.btnNum[n].toString();  //數字丟進去該位置
        widget.btnNum[n]=random;            //紀錄位置，以便等等來變色隱藏
        proper.add(random);         //紀錄答案
        n++;  //換下一個順序的數字
      }
      else{       //如果位置有被丟過數字，重新產生位置，並在跑一次迴圈
        random = Random().nextInt(40);
        i--;
      }
    }
  }

  var period = Duration(milliseconds: 3000);  //3秒後變色隱藏
  bool timeN =true;
  void timing() {
    Timer.periodic(period, (timer) {
      if(timeN==true){
        for(int i=0;i<=widget.selectDataPath;i++){           //把剛剛紀錄的位置變色
          setState(() {
            btnColor[widget.btnNum[i]]=Colors.black;
            keybolock=true;
          });
        }
        timeN=false;
      }
      else{
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final btn = <ElevatedButton>[];

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『記憶力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              timeN=false;
              timing();
              _score=0;
              switch(widget.selectDataPath){
                case 4:
                  allData.userData.userID.questionData.memory.p1_1.removeLast();
                  allData.userData.userID.questionData.memory.p1_2.removeLast();
                  allData.userData.userID.questionData.memory.p1_3.removeLast();
                  break;
                case 6:
                  allData.userData.userID.questionData.memory.p1_1.removeLast();
                  allData.userData.userID.questionData.memory.p1_2.removeLast();
                  allData.userData.userID.questionData.memory.p1_3.removeLast();
                  allData.userData.userID.questionData.memory.p2_1.removeLast();
                  break;
                case 8:
                  allData.userData.userID.questionData.memory.p1_1.removeLast();
                  allData.userData.userID.questionData.memory.p1_2.removeLast();
                  allData.userData.userID.questionData.memory.p1_3.removeLast();
                  allData.userData.userID.questionData.memory.p2_1.removeLast();
                  allData.userData.userID.questionData.memory.p2_2.removeLast();
              }

              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
            child: const Text('退出測驗!',style: TextStyle(color: Colors.red),),),
          SizedBox(width: 100),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('繼續測驗!'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    _msgBoxA(BuildContext context){
      var dlg = AlertDialog(
          title: Text('完成『記憶力』第${widget.title}題作答!'),
          content: Text('您一共答對\t"$_score"\t個'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  switch(widget.selectDataPath){
                    case 4:
                      allData.userData.userID.questionData.memory.p2_1.add('$_score');
                      break;
                    case 6:
                      allData.userData.userID.questionData.memory.p2_2.add('$_score');
                      break;
                    case 8:
                      allData.userData.userID.questionData.memory.p2_3.add('$_score');
                      break;
                  }
                  _score=0;
                  Navigator.pushNamed(context, widget.nextPagePath);
                },
                child: Text(widget.selectDataPath==8?'完成測驗':'前往下一題'))]
      );
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

    _msgBoxB(BuildContext context){
      var dlg = AlertDialog(
          title: Text('答錯了'),
          content: Text('您一共答對\t"$_score"\t個'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  switch(widget.selectDataPath){
                    case 4:
                      allData.userData.userID.questionData.memory.p2_1.add('$_score');
                      break;
                    case 6:
                      allData.userData.userID.questionData.memory.p2_2.add('$_score');
                      break;
                    case 8:
                      allData.userData.userID.questionData.memory.p2_3.add('$_score');
                      break;
                  }
                  _score=0;
                  Navigator.pushNamed(context, widget.nextPagePath);
                },
                child: Text(widget.selectDataPath==8?'完成測驗':'前往下一題'))]
      );
      showDialog(
          context:context,
          barrierDismissible: false,
          builder:(context){
            return WillPopScope(child: dlg, onWillPop: ()async{
              _msgBox(context);
              return shouldPop;
            });
          }
      );
    }

    for(int i=0;i<=39;i++){     //產生40個按鈕，並把數字及顏色餵進來
      btn.add(
          ElevatedButton(
            child: Text('${btnText[i]}',style: TextStyle(color:Colors.black,fontSize: 70)),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(btnColor[i]),
            ),
            onPressed: keybolock==false?(){}:(){setState(() {
              if(randomRp[i]==true){    //只有數字的btn才會動
                if(proper[0]==i){      //驗證答案
                  proper.removeAt(0);
                  randomRp[i]=false;
                  _score = _score+1;
                  if(proper.length==0){
                    _msgBoxA(context);
                  }
                }
                else{
                  _msgBoxB(context);
                }
              }
              btnColor[i]=Colors.white;
            });},)
      );
    }

    final gridView = GridView.count(crossAxisCount: 5,
      children: btn,
    );

    var stBtn = ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
      child:Text('按我開始',style: TextStyle(fontSize: 28,color: Colors.black)),
      onPressed: btnBool==false?null:(){
        btnBool=false;
        setState((){
          btnforText();
          timing();
        });},
    );

    var Statepage = Column(
        children: [
          Expanded(child: gridView),
          Container(
              width: 160,height: 40,
              margin: EdgeInsets.all(10), child:stBtn
          )
        ]
    );

    return WillPopScope(child: Statepage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}