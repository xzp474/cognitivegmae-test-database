import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dataview/alldata.dart';
import 'package:firebase_database/firebase_database.dart';

class Questionnaire extends StatelessWidget{
  static List<bool> quesbool = List.filled(16, false, growable: false);
  static List<String> quesP=<String>[];
  @override
  Widget build(BuildContext context) {
    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('尚未進行任何測驗!'),
        content: Text('請在畫面左上角處，點擊「≡」圖示來進行五個測驗!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('確定'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }

    var willques = Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
            child: Text('若您完成五項測驗，麻煩您填寫問卷。給予您的回饋表示支持，謝謝!',style: TextStyle(fontSize: 25),),
        ),
        Container(
          width: 180, height: 70,
          margin: EdgeInsets.all(10),
          child:ElevatedButton(
            child: Text('填寫問卷', style: TextStyle(fontSize: 30,color: Colors.black)),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
            onPressed: (){
              if(
                  allData.userData.userID.tested.coged.perception=='1'&&
                  allData.userData.userID.tested.coged.attention=='1'&&
                  allData.userData.userID.tested.coged.memory=='1'&&
                  allData.userData.userID.tested.coged.raised=='1'&&
                  allData.userData.userID.tested.coged.reasoning=='1'
              ){
                Navigator.pushNamed(context, 'Opinion');
              } else{
                _msgBox(context);}},
          ),
        ),
      ],
    );

    var quesed = Center(child: Text('您已填寫過問卷\n感謝您的回饋!', style: TextStyle(fontSize: 30),),);
    return allData.userData.userID.questionnaire.fillin == '1'?quesed:willques;
  }
}

class Opinion extends StatelessWidget {
  Opinion({super.key});
  var other = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _msgBox(BuildContext context){//彈跳視窗屬性
      var dlg = AlertDialog(
        title: Text('有題目沒填寫到!'),
        content: Text('第${Questionnaire.quesP}題沒寫到，煩請填寫，謝謝!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('確定'),),
        ],);
      showDialog(
          context:context,
          builder:(context)=>dlg
      );
    }
    var readData = FirebaseDatabase.instance.ref();
    final appBar = AppBar(
      title: Text('問卷', style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xFFE8E8E8),
    );
    final appBody = ListView(children: [
      CupertinoSliderExample(
        imagePath: 'perception/game_I.gif',
        theColor: Color(0x3300FCFF),
        gmaeName: '「空間知覺」第一個大題',
        gameNum_1: '1',
        gameNum_2: '2',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p1),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p2),
      ),

      CupertinoSliderExample(
        imagePath: 'perception/game_II.gif',
        theColor: Color(0x3300FCFF),
        gmaeName: '「空間知覺」第二大題',
        gameNum_1: '3',
        gameNum_2: '4',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p3),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p4),
      ),

      CupertinoSliderExample(
        imagePath: 'attention/game_I.gif',
        theColor: Color(0x334af699),
        gmaeName: '「注意力」第一大題',
        gameNum_1: '5',
        gameNum_2: '6',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p5),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p6),
      ),

      CupertinoSliderExample(
        imagePath: 'attention/game_II.gif',
        theColor: Color(0x334af699),
        gmaeName: '「注意力」第二大題',
        gameNum_1: '7',
        gameNum_2: '8',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p7),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p8),
      ),

      CupertinoSliderExample(
        imagePath: 'memory/game_I.gif',
        theColor: Color(0x33aa4cfc),
        gmaeName: '「記憶力」第一大題',
        gameNum_1: '9',
        gameNum_2: '10',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p9),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p10),
      ),

      CupertinoSliderExample(
        imagePath: 'memory/game_II.gif',
        theColor: Color(0x33aa4cfc),
        gmaeName: '「記憶力」第二大題',
        gameNum_1: '11',
        gameNum_2: '12',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p11),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p12),
      ),

      CupertinoSliderExample(
        imagePath: 'raised/game.gif',
        theColor: Color(0x3327b6fc),
        gmaeName: '「反應力」',
        gameNum_1: '13',
        gameNum_2: '14',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p13),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p14),
      ),

      CupertinoSliderExample(
        imagePath: 'reasoning/game.gif',
        theColor: Color(0x33c28959),
        gmaeName: '「推理」',
        gameNum_1: '15',
        gameNum_2: '16',
        currentSliderValue_1: double.parse(allData.userData.userID.questionnaire.p15),
        currentSliderValue_2: double.parse(allData.userData.userID.questionnaire.p16),
      ),

      Container(
        width: 150, height: 70,
        margin: EdgeInsets.all(20),
        child: ElevatedButton(
          child: Text('確定送出',style: TextStyle(fontSize: 25,color: Colors.black),),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
          onPressed: (){
            Questionnaire.quesP.clear();
            if(
                Questionnaire.quesbool[0]==false||
                Questionnaire.quesbool[1]==false||Questionnaire.quesbool[2]==false||
                Questionnaire.quesbool[3]==false||Questionnaire.quesbool[4]==false||
                Questionnaire.quesbool[5]==false||Questionnaire.quesbool[6]==false||
                Questionnaire.quesbool[7]==false||Questionnaire.quesbool[8]==false||
                Questionnaire.quesbool[9]==false||Questionnaire.quesbool[10]==false||
                Questionnaire.quesbool[11]==false||Questionnaire.quesbool[12]==false||
                Questionnaire.quesbool[13]==false||Questionnaire.quesbool[14]==false||
                Questionnaire.quesbool[15]==false
            ){
              for(int i=0;i<=15;i++){
                if(Questionnaire.quesbool[i]==false){
                  Questionnaire.quesP.add('${i+1}');
                }
              }
              _msgBox(context);
            }else{
              allData.userData.userID.questionnaire.other = other.text;
              allData.userData.userID.questionnaire.fillin = '1';
              allData.userJsonData = jsonDecode(jsonEncode(allData.userData));
              readData.child('myapp/user').update(allData.userJsonData);
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            }},),
      ),],
    );
    final page = Scaffold(
      appBar: appBar,
      body: appBody,
    );
    return page;
  }
}

class CupertinoSliderExample extends StatefulWidget{
  String imagePath;
  Color theColor;
  String gmaeName;
  String gameNum_1;
  String gameNum_2;
  double currentSliderValue_1;
  double currentSliderValue_2;
  CupertinoSliderExample({
    Key? key,
    required this.imagePath,
    required this.theColor,
    required this.gmaeName,
    required this.gameNum_1,
    required this.gameNum_2,
    required this.currentSliderValue_1,
    required this.currentSliderValue_2,
  }):super(key: key);
  @override
  State<StatefulWidget> createState() => _CupertinoSliderExampleState();
}
class _CupertinoSliderExampleState extends State<CupertinoSliderExample>{
  String? _sliderStatus_1;
  String? _sliderStatus_2;
  sliderText_1(){
    switch(widget.currentSliderValue_1.toInt()){
      case 0:
        _sliderStatus_1 = '看不懂';
        break;
      case 33:
        _sliderStatus_1 = '有點不懂';
        break;
      case 66:
        _sliderStatus_1 = '有點懂';
        break;
      case 100:
        _sliderStatus_1 = '看得懂';
        break;
    }
  }

  sliderText_2(){
    switch(widget.currentSliderValue_2.toInt()){
      case 0:
        _sliderStatus_2 = '太簡單';
        break;
      case 25:
        _sliderStatus_2 = '有點簡單';
        break;
      case 50:
        _sliderStatus_2 = '剛剛好';
        break;
      case 75:
        _sliderStatus_2 = '有點難';
        break;
      case 100:
        _sliderStatus_2 = '太難了';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var question_1 = Text('${widget.gameNum_1}.\n如上圖所示\n您覺得${widget.gmaeName}的說明是否看得懂?\n'
        '0=看不懂\n33=有點不懂\n66=有點懂\n99=看得懂',
      style: TextStyle(fontSize: 20),);
    var question_2 = Text('\n\n${widget.gameNum_2}.\n您認為${widget.gmaeName}的題目是否難易適中?\n'
        '0=太簡單\n20=有點簡單\n50=剛剛好\n75有點難\n100=太難了',
      style: TextStyle(fontSize: 20),);
    var slider_1 = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 顯示當前滑塊值
          Text('${widget.currentSliderValue_1.toInt()}',style: TextStyle(fontSize: 18),),
          Slider(
            key: const Key('slider'),
            value: widget.currentSliderValue_1,
            // 這允許滑塊在分區之間跳轉
            // 如果為null，則滑動移動是連續的
            divisions: 3,
            // 最大滑塊值
            max: 100,
            activeColor: CupertinoColors.systemPurple,
            thumbColor: CupertinoColors.systemPurple,
            // 這在開始滑動時調用
            onChangeStart: (double value) {setState(() {sliderText_1();});},
            // 這在滑動結束時調用
            onChangeEnd: (double value) {setState(() {sliderText_1();});},
            // 這在滑塊值更改時調用.
            onChanged: (double value) {setState(() {
              widget.currentSliderValue_1 = value;
              sliderText_1();
              switch(widget.gameNum_1){
                case '1':
                  allData.userData.userID.questionnaire.p1 = value.toInt().toString();
                  Questionnaire.quesbool[0] = true;
                  break;
                case '3':
                  allData.userData.userID.questionnaire.p3 = value.toInt().toString();
                  Questionnaire.quesbool[2] = true;
                  break;
                case '5':
                  allData.userData.userID.questionnaire.p5 = value.toInt().toString();
                  Questionnaire.quesbool[4] = true;
                  break;
                case '7':
                  allData.userData.userID.questionnaire.p7 = value.toInt().toString();
                  Questionnaire.quesbool[6] = true;
                  break;
                case '9':
                  allData.userData.userID.questionnaire.p9 = value.toInt().toString();
                  Questionnaire.quesbool[8] = true;
                  break;
                case '11':
                  allData.userData.userID.questionnaire.p11 = value.toInt().toString();
                  Questionnaire.quesbool[10] = true;
                  break;
                case '13':
                  allData.userData.userID.questionnaire.p13 = value.toInt().toString();
                  Questionnaire.quesbool[12] = true;
                  break;
                case '15':
                  allData.userData.userID.questionnaire.p15 = value.toInt().toString();
                  Questionnaire.quesbool[14] = true;
                  break;
              }
            });},
          ),
          Text(
            _sliderStatus_1 ?? '',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18,),
          ),
        ],
      ),
    );
    var slider_2 = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 顯示當前滑塊值
          Text('${widget.currentSliderValue_2.toInt()}',style: TextStyle(fontSize: 18),),
          Slider(
            key: const Key('slider'),
            value: widget.currentSliderValue_2,
            // 這允許滑塊在分區之間跳轉
            // 如果為null，則滑動移動是連續的
            divisions: 4,
            // 最大滑塊值
            max: 100,
            activeColor: CupertinoColors.systemPurple,
            thumbColor: CupertinoColors.systemPurple,
            // 這在開始滑動時調用
            onChangeStart: (double value) {setState(() {sliderText_2();});},
            // 這在滑動結束時調用
            onChangeEnd: (double value) {setState(() {sliderText_2();});},
            // 這在滑塊值更改時調用.
            onChanged: (double value) {setState(() {
              widget.currentSliderValue_2 = value;
              sliderText_2();
              switch(widget.gameNum_2){
                case '2':
                  allData.userData.userID.questionnaire.p2 = value.toInt().toString();
                  Questionnaire.quesbool[1] = true;
                  break;
                case '4':
                  allData.userData.userID.questionnaire.p4 = value.toInt().toString();
                  Questionnaire.quesbool[3] = true;
                  break;
                case '6':
                  allData.userData.userID.questionnaire.p6 = value.toInt().toString();
                  Questionnaire.quesbool[5] = true;
                  break;
                case '8':
                  allData.userData.userID.questionnaire.p8 = value.toInt().toString();
                  Questionnaire.quesbool[7] = true;
                  break;
                case '10':
                  allData.userData.userID.questionnaire.p10 = value.toInt().toString();
                  Questionnaire.quesbool[9] = true;
                  break;
                case '12':
                  allData.userData.userID.questionnaire.p12 = value.toInt().toString();
                  Questionnaire.quesbool[11] = true;
                  break;
                case '14':
                  allData.userData.userID.questionnaire.p14 = value.toInt().toString();
                  Questionnaire.quesbool[13] = true;
                  break;
                case '16':
                  allData.userData.userID.questionnaire.p16 = value.toInt().toString();
                  Questionnaire.quesbool[15] = true;
                  break;
              }
            });},
          ),
          Text(
            _sliderStatus_2 ?? '',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18,),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.theColor,
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage('assets/${widget.imagePath}'),
              ),
            ),
          ),
          question_1,
          slider_1,
          question_2,
          slider_2,
        ],
      ),
    );
  }
}
