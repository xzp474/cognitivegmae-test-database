import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class MemoryModelI extends StatelessWidget{
  final String title;
  final List<String> quList;
  final int selectDataPath;
  final List<int> userAn;
  final String nextPagePath;
  MemoryModelI({
    Key? key,
    required this.title,
    required this.quList,
    required this.selectDataPath,
    required this.userAn,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context){
    final appBar=AppBar(
      title: Text('記憶力－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _memory(
      title: title,
      quList: quList,
      selectDataPath: selectDataPath,
      userAn: userAn,
      nextPagePath: nextPagePath,
    );
    final page=Scaffold(
        appBar: appBar,
        body: appBody
    );
    return page;}
}

class _memory extends StatefulWidget {
  final String title;
  final List<String> quList;
  final int selectDataPath;
  final List<int> userAn;
  final String nextPagePath;
  _memory({
    Key? key,
    required this.title,
    required this.quList,
    required this.selectDataPath,
    required this.userAn,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_memoryState();
}

class _memoryState extends State<_memory>{
  bool shouldPop = true;
  bool _timingBool = false;
  bool btnSwitch = true;//初始化答案區的切換
  bool keybolock = false;//鎖住數字鍵
  final numList = <String>['1','2','3','4','5','6','7','8','9'];  //題目所用數字
  void randomForNum(){//產生隨機數字
    for(int i=1;i<=widget.selectDataPath;i++){
      int randomNum = Random().nextInt(numList.length);
      widget.quList[i] = numList[randomNum];
      numList.removeAt(randomNum);}
  }
  int textTiming = 0;  //計時器秒數

  timing(){
    final period = const Duration(milliseconds: 1300);//建立計時器
    _timingBool = true;
    Timer.periodic(period, (timer){
      if(textTiming<widget.selectDataPath+1){
        setState((){
          widget.quList[textTiming]=widget.quList[textTiming++];
        });
      }
      if(textTiming==widget.selectDataPath+1){
        _timingBool = false;
        keybolock=true;
        timer.cancel();
      }
    });}

  int _score = 0;//得分

  int keyboNum = 0;//數字鍵輸入的值
  int anSite = 0;//鎖定答案區位置

  var anText = <Container>[];//顯示答案區

  double anSize =0;
  bool anTextbool = true;

  var anBorderF = BoxDecoration(
    color:Colors.black,
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  var anBorderL = BoxDecoration(
    color:Colors.white,
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  AnText(){
    for(int i=0;i<=widget.selectDataPath-1;i++){//建立答案區
      anText.add(Container(
        child: Text('${widget.userAn[i]}',
            style: TextStyle(fontSize: anSize,
                color: i==0?Colors.white:Colors.black)),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:i==0?Colors.black:Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      )
      );
    }}

  anFocus(){
    widget.userAn[anSite]=keyboNum;
    anText[anSite]=Container(
        child: Text('${widget.userAn[anSite]}',
            style: TextStyle(fontSize: anSize,
                color: Colors.white)),
        margin: EdgeInsets.all(5),
        decoration: anBorderF);
  }

  anTextToR(){
    anText[anSite]=Container(
        child: Text('${widget.userAn[anSite]}',
            style: TextStyle(fontSize: anSize,
                color: Colors.black)),
        margin: EdgeInsets.all(5),
        decoration: anBorderL);
    anSite++;
    anText[anSite]=Container(
        child: Text('${widget.userAn[anSite]}',
            style: TextStyle(fontSize: anSize,
                color: Colors.white)),
        margin: EdgeInsets.all(5),
        decoration: anBorderF);
  }

  anTextToL(){
    anText[anSite]=Container(
        child: Text('${widget.userAn[anSite]}',
            style: TextStyle(fontSize: anSize,
                color: Colors.black)),
        margin: EdgeInsets.all(5),
        decoration: anBorderL);
    anSite--;
    anText[anSite]=Container(
        child: Text('${widget.userAn[anSite]}',
            style: TextStyle(fontSize: anSize,
                color: Colors.white)),
        margin: EdgeInsets.all(5),
        decoration: anBorderF);
  }

  @override
  Widget build(BuildContext context) {
    anSize = MediaQuery.of(context).size.height/
        (widget.selectDataPath==5?9:widget.selectDataPath==7?11:16);
    if(anTextbool==true){
      AnText();
      anTextbool=false;
    }
    final numBtn=<ElevatedButton>[];//數字按鍵
    final anRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: anText,
    );

    for(int i=1;i<=9;i++){//建立數字按鍵
      numBtn.add(
          ElevatedButton(style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
              child: Text('$i',
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/16,
                      color: Colors.black)),
              onPressed: (){
                setState(() {
                  if(keybolock==true){
                    keyboNum=i;//第幾個按鍵就輸入第幾個值
                    anFocus();
                    if(anSite<widget.selectDataPath-1)anTextToR();
                  }
                });}));
    }
    numBtn.insert(3,ElevatedButton(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        child: Icon(Icons.arrow_back_sharp,color: Colors.black,
            size: MediaQuery.of(context).size.height/16),
        onPressed: (){//建立向左移動鍵
          setState(() {
            if(anSite>0)anTextToL();
          });})
    );
    numBtn.insert(7,ElevatedButton(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        child: Icon(Icons.arrow_forward_sharp, color: Colors.black,
            size: MediaQuery.of(context).size.height/16),
        onPressed: (){//建立向右移動鍵
          setState(() {
            if(anSite<widget.selectDataPath-1)anTextToR();
          });})
    );
    final keyboGrid = GridView.count(//數字鍵排四行
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: numBtn,
    );

    //驗證答案
    _proper(){
      for(int i=0;i<=widget.selectDataPath-1;i++){
        widget.userAn[i]==int.parse(widget.quList[i+1])?_score++:_score+=0;}
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『記憶力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _score=0;
              if(_timingBool==true){
                textTiming=widget.selectDataPath+1;
                timing();
              }
              switch(widget.selectDataPath){
                case 7:
                  allData.userData.userID.questionData.memory.p1_1.removeLast();
                  break;
                case 9:
                  allData.userData.userID.questionData.memory.p1_1.removeLast();
                  allData.userData.userID.questionData.memory.p1_2.removeLast();
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
      widget.quList.removeAt(0);
      widget.quList.removeLast();
      var dlg = AlertDialog(
        title: Text('完成『記憶力』第${widget.title}題作答!'),
        content: RichText(text: TextSpan(children: [
          TextSpan(text: '正確答案${widget.quList}\n',style: TextStyle(color: Colors.green)),
          TextSpan(text: '您的答案${widget.userAn}\n',style: TextStyle(color: Colors.red)),
          TextSpan(text: '您答對\t"${_score}"\t個',style: TextStyle(color: Colors.black)),
        ]),),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              switch(widget.selectDataPath){
                case 5:
                  allData.userData.userID.questionData.memory.p1_1.add(_score.toString());
                  break;
                case 7:
                  allData.userData.userID.questionData.memory.p1_2.add(_score.toString());
                  break;
                case 9:
                  allData.userData.userID.questionData.memory.p1_3.add(_score.toString());
                  break;
              }
              _score = 0;
              Navigator.pushNamed(context, widget.nextPagePath);
            },
            child: Text('前往下一題', style: TextStyle(fontSize: 25, color: Colors.blue),),),
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

    final stBtn=ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        child: Text('開始',style: TextStyle(fontSize: 30,color: Colors.black)),
        onPressed: (){
          randomForNum();
          timing();
          btnSwitch=false;}
    );

    final anBtn = ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        child:Text('下一題',style: TextStyle(fontSize: 30,color: Colors.black)),
        onPressed: (){
          if(_timingBool==false){
            _proper();
            _answerMsgBox(context);
          }
        }
    );

    double numSize = (
        MediaQuery.of(context).size.width
            -((MediaQuery.of(context).size.height-100)*3/7*5/4))/2;

    var Statepage = Column(children: <Widget>[
      Expanded(flex: 3,
        child: Container(margin: EdgeInsets.all(15),
            child: Text(widget.quList[textTiming],
              style: TextStyle(fontSize: MediaQuery.of(context).size.height/7),)),
      ),
      Expanded(flex:3, child: anRow),
      Expanded(flex:6, child: Container(child: keyboGrid,
          margin: EdgeInsets.fromLTRB(numSize, 0, numSize, 0))),
      Expanded(flex: 2,
          child: Container(child: btnSwitch==true?stBtn:anBtn,
            margin: EdgeInsets.symmetric(vertical: 20),))
    ]);

    return WillPopScope(child: Statepage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}