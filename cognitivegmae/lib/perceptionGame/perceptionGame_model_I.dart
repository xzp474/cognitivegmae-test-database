import 'dart:math';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PerceptionModelI extends StatelessWidget{
  final List<bool> answerList;
  final String qImgPath;
  final String aImgPath;
  final String title;
  final int selectDataPath;
  final String nextPagePath;
  PerceptionModelI({
    Key? key,
    required this.answerList,
    required this.qImgPath,
    required this.aImgPath,
    required this.title,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('空間知覺－第$title題', style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = _perception(
        answerList: answerList,
        qImgPath: qImgPath,
        aImgPath: aImgPath,
        title: title,
        selectDataPath: selectDataPath,
        nextPagePath: nextPagePath);
    final page = Scaffold(
      appBar: appBar,
      body: appBody,
    );
    return page;
  }
}

class _perception extends StatefulWidget{
  final List<bool> answerList;
  final String qImgPath;
  final String aImgPath;
  final String title;
  final int selectDataPath;
  final String nextPagePath;
  _perception({
    Key? key,
    required this.answerList,
    required this.qImgPath,
    required this.aImgPath,
    required this.title,
    required this.selectDataPath,
    required this.nextPagePath,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=>_perceptionState();
}

class _perceptionState extends State<_perception>{
  bool shouldPop = true;
  final _checked = <bool>[false,false,false,//打勾的布林值
    false,false,false];
  final _imgList = <int>[0,1,2,3,4,5];//隨機陣列
  final _img = <int>[0,0,0,0,0,0];
  bool _imgbool = true;
  final _answer = <bool>[false,false,false,false,false,false];
  int _score = 0;//該題得分
  @override
  Widget build(BuildContext context) {
    final imgTextlist = <Container>[];
    if(_imgbool==true){//建立圖片及答案的隨機數
      for(int i=0;i<=5;i++){
        int numRandom = Random().nextInt(_imgList.length);
        _img[i] = _imgList[numRandom];
        _answer[i] = widget.answerList[_img[i]];
        _imgList.removeAt(numRandom);
      }
      _imgbool=false;
    }
    final lampImg = Image.asset(widget.qImgPath,
        scale: 3900/(MediaQuery.of(context).size.height-100));//題目圖片

    final checkBoxList = <CheckboxListTile>[];//宣告填空陣列
    for(int i=0;i<=5;i++){//建立填空陣列
      checkBoxList.add(CheckboxListTile(
          title: Text('${i+1}',style: TextStyle(fontSize: 25),),
          value: _checked[i],//顯示打勾
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (newValue){
            setState(() {_checked[i]=newValue!;});//點擊即打勾
          }));

      imgTextlist.add(Container(
        child: Image.asset('assets/perception/${widget.aImgPath}/0${_img[i]}.png',
            scale: 5300/(MediaQuery.of(context).size.height-180)),
      ));
    }

    final imgGridView = GridView(children: imgTextlist,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.aspectRatio/0.35
        ));

    var checkBox = GridView(children: checkBoxList,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio/0.35
      ),);

    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('結束『空間知覺』測驗!'),
        content: Text('在此退出的話，目前進度不會保留!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              switch(widget.selectDataPath){
                case 2:
                  allData.userData.userID.questionData.perception.p1_1.removeLast();
                  break;
                case 3:
                  allData.userData.userID.questionData.perception.p1_1.removeLast();
                  allData.userData.userID.questionData.perception.p1_2.removeLast();
                  break;
              }
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

    _answerMsgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('完成『空間知覺』第${widget.title}題作答!'),
        content: Text('此題6個選項裡，您答對的選項共\t"$_score"\t個'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              switch(widget.selectDataPath){
                case 1:
                  allData.userData.userID.questionData.perception.p1_1.add(_score.toString());
                  break;
                case 2:
                  allData.userData.userID.questionData.perception.p1_2.add(_score.toString());
                  break;
                case 3:
                  allData.userData.userID.questionData.perception.p1_3.add(_score.toString());
                  break;
              }
              _score=0;
              Navigator.pushNamed(context, widget.nextPagePath);//下一頁
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
        for(int i=0;i<=5;i++){//驗證答案
          _checked[i]==_answer[i] ? _score+=1: _score+=0;
        }
        _answerMsgBox(context);
      },);

    var statePage = Column(
        children: <Widget>[
          Container(child: lampImg, margin: EdgeInsets.all(10)),
          Expanded(child: Stack(children:[
            imgGridView,
            checkBox
          ])),
          Container(child: entBtn, width: 110,height: 70,
              margin: EdgeInsets.all(15))
        ]);
    return WillPopScope(child: statePage, onWillPop: ()async{
      _msgBox(context);
      return shouldPop;
    });
  }
}