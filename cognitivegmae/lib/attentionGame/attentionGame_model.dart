import 'dart:async';
import 'dart:math';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';

class AttentionModelI extends StatelessWidget{
  final String title;
  final String qImgPath;
  final int imgListQuantity1;
  final int imgListQuantity2;
  final List<int> imageAnList;
  final int imgNullQuantity;
  final int selectDataPath;
  final String nextPagePath;
  AttentionModelI({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.imgListQuantity1,
    required this.imgListQuantity2,
    required this.imageAnList,
    required this.imgNullQuantity,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('注意力－第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _attention(
      title: title,
      qImgPath: qImgPath,
      imgListQuantity1: imgListQuantity1,
      imgListQuantity2: imgListQuantity2,
      imageAnList: imageAnList,
      imgNullQuantity: imgNullQuantity,
      selectDataPath: selectDataPath,
      nextPagePath: nextPagePath,
    );
    final page = Scaffold(appBar: appBar,body: appBody,);
    return page;}}

class _attention extends StatefulWidget{
  final String title;
  final String qImgPath;
  final int imgListQuantity1;
  final int imgListQuantity2;
  final List<int> imageAnList;
  final int imgNullQuantity;
  final int selectDataPath;
  final String nextPagePath;
  _attention({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.imgListQuantity1,
    required this.imgListQuantity2,
    required this.imageAnList,
    required this.imgNullQuantity,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_attentionState();}

class _attentionState extends State<_attention>{
  bool shouldPop = true;
  //image圖庫
  var imageList = <Image>[];
  //image紅色圖庫
  var imageList_Red = <Image>[];
  //跑迴圈來建立image圖庫
  _imagebuild(){
    for(int i=1;i<=widget.imgListQuantity1;i++){
      for(int j=1;j<=widget.imgListQuantity2;j++){
        imageList.add(Image.asset('assets/attention/${widget.qImgPath}0$i.png'));
        imageList_Red.add(Image.asset('assets/attention/${widget.qImgPath}0$i-red.png'));
      }}
  }

  //讓image可以隨機進來空的圖庫
  List<Image> imageNull = [];
  List<Image> imageNull_Red = [];
  //只要進行一次讓image隨機進到空的圖庫
  bool imagebuildBool = true;
  //讓image的顏色非黑即紅
  List<bool> imageColor = [];

  List<int> imageNullAn = [];
  double proper = 0;

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
    //開始執行image隨機位置及顏色排列
    if(imagebuildBool == true){
      _imagebuild();
      //隨機產生題目的image及顏色
      int numRandom = Random().nextInt(imageList.length);
      imageNull.add(imageList[numRandom]);
      imageNull_Red.add(imageList_Red[numRandom]);
      imageColor.add(true);
      //建立答案
      imageNullAn.add(widget.imageAnList[numRandom]);

      //把16個image隨機排列
      for(int i=1;i<=widget.imgNullQuantity;i++){
        //隨機產生一個數字
        numRandom = Random().nextInt(imageList.length);
        //隨機的image會依序進到空的image圖示庫
        imageNull.add(imageList[numRandom]);
        imageNull_Red.add(imageList_Red[numRandom]);
        //並把該隨機的image刪除
        imageList.removeAt(numRandom);
        imageList_Red.removeAt(numRandom);
        //並把每個image顏色都關閉
        imageColor.add(false);
        //建立答案種類庫
        imageNullAn.add(widget.imageAnList[numRandom]);
        widget.imageAnList.removeAt(numRandom);
      }

      //設定隨機位置的image顏色
      numRandom = Random().nextInt(imageNull.length);
      for(int i=1;i<=widget.imgListQuantity2;i++){
        if(imageColor[numRandom]==true){//如果這個位置顏色打開過，就換隨機位置
          numRandom = Random().nextInt(imageNull.length);
          i--;
        }
        else {
          imageColor[numRandom] = true;
        }  //讓隨機位置的image顏色打開
      }
      imagebuildBool = false;
    }

    var imageQu = Container(
      child: imageColor[0]==true?imageNull_Red[0]:imageNull[0],
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
    );

    var imageBtnList = <GestureDetector>[];
    for(int i=1;i<=widget.imgNullQuantity;i++){                      //利用for迴圈來建造16個imageBtn
      imageBtnList.add(
          GestureDetector(
              child: imageColor[i]==true?imageNull_Red[i]:imageNull[i],
              onTap: (){
                setState(() {
                  imageColor[i]=!imageColor[i];
                });
              }));
    }

    _proper(){       //驗證答案
      proper = 0;
      for(int i=1;i<=widget.imgNullQuantity;i++){
        if(imageNullAn[i]==imageNullAn[0] && imageColor[i]==true){
          proper++;
        }
        else if(imageNullAn[i]!=imageNullAn[0] && imageColor[i]!=true){
          proper++;
        }}
    }

    var imageGridView = GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing:40,
      children: imageBtnList,
    );

    _msgBoxAs(BuildContext context){
      var dlg = AlertDialog(
          title: Text('答錯了'),
          content: Text('請檢查後，按OK繼續作答'),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'))]
      );
      showDialog(
          context:context,
          builder:(context)=>dlg);
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『注意力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              _bdTimingbool=false;
              _score=0;
              _timeing();
              switch(widget.selectDataPath){
                case 2:
                  allData.userData.userID.questionData.attention.p1_1.removeLast();
                  break;
                case 3:
                  allData.userData.userID.questionData.attention.p1_1.removeLast();
                  allData.userData.userID.questionData.attention.p1_2.removeLast();
                  break;
                case 4:
                  allData.userData.userID.questionData.attention.p1_1.removeLast();
                  allData.userData.userID.questionData.attention.p1_2.removeLast();
                  allData.userData.userID.questionData.attention.p1_3.removeLast();
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
        title: Text('完成『注意力』第${widget.title}題作答!'),
        content: Text('您共花了\t"$_score"\t秒，完成此題'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              switch(widget.selectDataPath){
                case 1:
                  allData.userData.userID.questionData.attention.p1_1.add(_score.toString());
                  break;
                case 2:
                  allData.userData.userID.questionData.attention.p1_2.add(_score.toString());
                  break;
                case 3:
                  allData.userData.userID.questionData.attention.p1_3.add(_score.toString());
                  break;
                case 4:
                  allData.userData.userID.questionData.attention.p1_4.add(_score.toString());
                  break;
              }
              _score=0;
              Navigator.pushNamed(context, widget.nextPagePath);
            },
            child: const Text('前往下一題',style: TextStyle(fontSize: 25, color: Colors.blue),),),
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
        _proper();
        if(proper==widget.imgNullQuantity){
          _bdTimingbool=false;
          _timeing();
          _answerMsgBox(context);
        }
        else{
          _msgBoxAs(context);}
      },
    );

    final statePage = Column(
        children: <Widget>[
          Expanded(flex:1,child: imageQu),
          Expanded(flex:6,child: Container(child: imageGridView,
            margin: EdgeInsets.fromLTRB(
                34000/MediaQuery.of(context).size.height, 10,
                34000/MediaQuery.of(context).size.height, 0),
          )),
          Container(child: entBtn, width: 110,height: 70,
              margin: EdgeInsets.all(15))
        ]);
    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}


class AttentionModelII extends StatelessWidget{
  final String title;
  final String qImgPath;
  final int selectDataPath;
  final String nextPagePath;
  AttentionModelII({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text('注意力-第$title題',style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _attentionII(
      title: title,
      qImgPath: qImgPath,
      selectDataPath: selectDataPath,
      nextPagePath: nextPagePath,
    );
    final page = Scaffold(appBar: appBar,body: appBody,);
    return page;}}

class _attentionII extends StatefulWidget{
  final String title;
  final String qImgPath;
  final int selectDataPath;
  final String nextPagePath;
  _attentionII({
    Key? key,
    required this.title,
    required this.qImgPath,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_attentionStateII();}

class _attentionStateII extends State<_attentionII>{
  bool shouldPop = true;
  //image圖庫
  var imageList = <Image>[];
  //image紅色圖庫
  var imageList_Red = <Image>[];
  //跑迴圈來建立image圖庫
  _imagebuild(){
    for(int i=1;i<=8;i++){
      for(int j=1;j<=4;j++){
        imageList.add(Image.asset('assets/attention/${widget.qImgPath}0$i.png'));
        imageList_Red.add(Image.asset('assets/attention/${widget.qImgPath}0$i-red.png'));
      }}
  }

  //讓image可以隨機進來空的圖庫
  List<Image> imageNull = List.filled(34, Image.asset(''), growable: false);
  List<Image> imageNull_Red = List.filled(34, Image.asset(''), growable: false);
  //只要進行一次讓image隨機進到空的圖庫
  bool imagebuildBool = true;
  //讓image的顏色非黑即紅
  List<bool> imageColor = List.filled(34, false, growable: false);

  //答案庫
  var imageAnList = <int>[1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
    5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8];
  List<int> imageNullAn = List.filled(34, 0, growable: false);
  double proper = 0;

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
    //開始執行image隨機位置及顏色排列
    if(imagebuildBool == true){
      _imagebuild();

      //隨機產生題目一的image及顏色
      int numRandom = Random().nextInt(imageList.length);
      imageNull[0] = imageList[numRandom];
      imageNull_Red[0] = imageList_Red[numRandom];
      imageColor[0] = true;
      //建立答案
      imageNullAn[0] = imageAnList[numRandom];

      //隨機產生題目二的image及顏色
      do{
        numRandom = Random().nextInt(imageList.length);
        imageNull[1] = imageList[numRandom];
        imageNull_Red[1] = imageList_Red[numRandom];
        imageColor[1] = true;
        //建立答案
        imageNullAn[1] = imageAnList[numRandom];
      }while(imageNullAn[1]==imageNullAn[0]);

      //把16個image隨機排列
      for(int i=2;i<=33;i++){
        //隨機產生一個數字
        numRandom = Random().nextInt(imageList.length);
        //隨機的image會依序進到空的image圖示庫
        imageNull[i] = imageList[numRandom];
        imageNull_Red[i] = imageList_Red[numRandom];
        //並把該隨機的image刪除
        imageList.removeAt(numRandom);
        imageList_Red.removeAt(numRandom);
        //並把每個image顏色都關閉
        imageColor[i] = false;
        //建立答案種類庫
        imageNullAn[i] = imageAnList[numRandom];
        imageAnList.removeAt(numRandom);
      }

      //設定隨機位置的image顏色
      numRandom = Random().nextInt(imageNull.length);
      for(int i=1;i<=8;i++){
        if(imageColor[numRandom]==true){//如果這個位置顏色打開過，就換隨機位置
          numRandom = Random().nextInt(imageNull.length);
          i--;
        }
        else {
          imageColor[numRandom] = true;
        }  //讓隨機位置的image顏色打開
      }
      imagebuildBool = false;
    }

    var imageQu1 = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: imageColor[0]==true?imageNull_Red[0]:imageNull[0],
    );
    var imageQu2 = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: imageColor[1]==true?imageNull_Red[1]:imageNull[1],
    );

    var imageBtnList = <GestureDetector>[];
    for(int i=2;i<=33;i++){                      //利用for迴圈來建造16個imageBtn
      imageBtnList.add(
          GestureDetector(
              child: imageColor[i]==true?imageNull_Red[i]:imageNull[i],
              onTap: (){
                setState(() {
                  imageColor[i]=!imageColor[i];
                });
              })
      );
    }

    _proper(){       //驗證答案
      proper = 0;
      for(int i=2;i<=33;i++){
        if(imageNullAn[i]==imageNullAn[0] || imageNullAn[i]==imageNullAn[1]){
          if(imageColor[i]==true){
            proper++;
          }}
        else{
          if(imageColor[i]==false){
            proper++;
          }}
      }}

    var imageGridView = GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing: 40,
      children: imageBtnList,
    );

    _msgBoxAs(BuildContext context){
      var dlg = AlertDialog(
          title: Text('答錯了'),
          content: Text('請檢查後，按OK繼續作答'),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'))]
      );
      showDialog(
          context:context,
          builder:(context)=>dlg);
    }

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『注意力』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _bdTimingbool=false;
              _score=0;
              _timeing();
              switch(widget.selectDataPath){
                case 5:
                  allData.userData.userID.questionData.attention.p1_1.removeLast();
                  allData.userData.userID.questionData.attention.p1_2.removeLast();
                  allData.userData.userID.questionData.attention.p1_3.removeLast();
                  allData.userData.userID.questionData.attention.p1_4.removeLast();
                  break;
                case 6:
                  allData.userData.userID.questionData.attention.p1_1.removeLast();
                  allData.userData.userID.questionData.attention.p1_2.removeLast();
                  allData.userData.userID.questionData.attention.p1_3.removeLast();
                  allData.userData.userID.questionData.attention.p1_4.removeLast();
                  allData.userData.userID.questionData.attention.p1_5.removeLast();
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
        title: Text('完成『注意力』第${widget.title}題作答!'),
        content: Text('您共花了\t"$_score"\t秒，完成此題'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              switch(widget.selectDataPath){
                case 5:
                  allData.userData.userID.questionData.attention.p1_5.add(_score.toString());
                  break;
                case 6:
                  allData.userData.userID.questionData.attention.p1_6.add(_score.toString());
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

    var entBtn = ElevatedButton(
        child: Text('確定', style: TextStyle(fontSize: 30,color: Colors.black)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
          _proper();
          if(proper==32){
            _bdTimingbool=false;
            _timeing();
            _answerMsgBox(context);
          }
          else{
            _msgBoxAs(context);}
        });

    final statePage = Column(
        children: <Widget>[
          Expanded(flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[Container(child: imageQu1), Container(child: imageQu2,)]),
          ),
          Expanded(flex:6,child: Container(child: imageGridView,
            margin: EdgeInsets.fromLTRB(
                34000/MediaQuery.of(context).size.height, 10,
                34000/MediaQuery.of(context).size.height, 0),
          )),
          Container(child: entBtn, width: 110,height: 70,
              margin: EdgeInsets.all(15))
        ]);

    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}