import 'dart:async';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:cognitivegmae/opinion.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/gamemenu.dart';

import 'dataview/createuser.dart';
import 'dataview/loginpage.dart';
import 'dataview/dataview.dart';
import 'dataview/readuserpage.dart';
import 'dataview/createingpage.dart';
import 'dataview/linechart.dart';
import 'dataview/timerpage.dart';

import 'perceptionGame/perceprionEX_I.dart';
import 'perceptionGame/perceprionEX_II.dart';
import 'perceptionGame/perceptionGame_I.dart';
import 'perceptionGame/perceptionGame_II.dart';
import 'perceptionGame/perceptiondata.dart';

import 'attentionGame/attentionEX_II.dart';
import 'attentionGame/attentionEX_I.dart';
import 'attentionGame/attentionGame.dart';
import 'attentionGame/attentiondata.dart';

import 'memoryGame/memoryEX_I.dart';
import 'memoryGame/memoryEX_II.dart';
import 'memoryGame/memoryGmae_I.dart';
import 'memoryGame/memoryGame_II.dart';
import 'memoryGame/memorydata.dart';

import 'raisedGame/raisedEX.dart';
import 'raisedGame/raisedGame.dart';
import 'raisedGame/raiseddata.dart';

import 'reasoning/reasoningEX.dart';
import 'reasoning/reasoningGame.dart';
import 'reasoning/reasoningdata.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: MyHomePage(),);},
        'createuser': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: createuser(),);},
        'loginpage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: loginpage(),);},
        'dataview': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: dataview(),);},
        'timerpage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: timerpage(),);},
        'createingpage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: createingpage(),);},
        'readuserpage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: readuserpage(),);},
        'perceptionEXI': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: PerceptionEXI(),);},
        'perceptionEXII': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: PerceptionEXII(),);},
        'perceptionPage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage(),);},
        'perceptionPage2': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage2(),);},
        'perceptionPage3': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage3(),);},
        'perceptionPage4': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage4(),);},
        'perceptionPage5': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage5(),);},
        'perceptionPage6': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptionPage6(),);},
        'perceptiondata': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: perceptiondata(),);},
        'attentionEXI' : (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: AttentionEXI(),);},
        'attentionEXII' : (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: AttentionEXII(),);},
        'attentionPage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage(),);},
        'attentionPage2': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage2(),);},
        'attentionPage3': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage3(),);},
        'attentionPage4': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage4(),);},
        'attentionPage5': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage5(),);},
        'attentionPage6': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentionPage6(),);},
        'attentiondata': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: attentiondata(),);},
        'memoryEXI': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: MemoryEXI(),);},
        'memoryEXII': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: MemoryEXII(),);},
        'memoryPage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage(),);},
        'memoryPage2': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage2(),);},
        'memoryPage3': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage3(),);},
        'memoryPage4': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage4(),);},
        'memoryPage5': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage5(),);},
        'memoryPage6': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memoryPage6(),);},
        'memorydata': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: memorydata(),);},
        'RaisedEX': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: RaisedEX(),);},
        'RaisedPage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: RaisedPage(),);},
        'RaisedPage2': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: RaisedPage2(),);},
        'RaisedPage3': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: RaisedPage3(),);},
        'raiseddata': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: raiseddata(),);},
        'reasoningEX': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: ReasoningEX(),);},
        'reasoningPage': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage(),);},
        'reasoningPage2': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage2(),);},
        'reasoningPage3': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage3(),);},
        'reasoningPage4': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage4(),);},
        'reasoningPage5': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage5(),);},
        'reasoningPage6': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningPage6(),);},
        'reasoningdata': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: reasoningdata(),);},
        'Opinion': (context){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Opinion(),);},
      }
    );
  }
}


class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>
      allData.pageSwitch==false?MyHomePageState1():MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  var readData = FirebaseDatabase.instance.ref('');
  @override
  Widget build(BuildContext context)  {

    final appBar = AppBar(leading: Builder(builder: (BuildContext context) {
        return Container(color: Color(0xFFB0B0B0),alignment: Alignment.topLeft,
          child: IconButton(icon: const Icon(Icons.menu),iconSize: 45,
            color: Colors.black,
            onPressed: () { Scaffold.of(context).openDrawer(); },),
        );}),
        backgroundColor: Color(0xFFE8E8E8),
        title: Center(child: Text('大腦認知遊戲',style: TextStyle(color: Colors.black))),
        bottom: TabBar(tabs: [
          Tab(child: Text('能力雷達圖',style: TextStyle(color: Colors.black))),
          Tab(child: Text('能力走勢圖',style: TextStyle(color: Colors.black))),
          Tab(child: Text('挑戰紀錄',style: TextStyle(color: Colors.black))),
          Tab(child: Text('意見與回饋',style: TextStyle(color: Colors.black))),
        ])
    );

    final tabBarView = TabBarView(
        children: <Widget>[
          Container(child: dataview(),),
          Container(child: LineChartSample1()),
          Container(child: timerpage()),
          Container(child: Questionnaire()),
        ]
    );

    final homePage = DefaultTabController(
        length: tabBarView.children.length,
        child: Scaffold(
          appBar: appBar,
          body: tabBarView,
          backgroundColor: Colors.white,
          drawer: Drawer(child: menuBtn()),
        )
    );
    return homePage;
  }
}

class MyHomePageState1 extends State<MyHomePage>{
  @override
  Widget build(BuildContext context)  {

    final appBar = AppBar(
      title: Text('大腦認知遊戲',style: TextStyle(color: Colors.black)),
      backgroundColor: Color(0xFFE8E8E8),
    );

    final appBody = Column(
            children: [
              Expanded(flex: 2,
                child: Container(
                    padding:EdgeInsets.all(20),child: Text(
                  '感謝您參與本研究\n\n'
                      '\t\t\t\t\t\t\t\t本研究旨在探討將智力測驗「行動數位化」'
                      '煩請您進行本研究設計之認知測驗'
                      '點擊下方圖示進入本測驗。\n',
                  style: TextStyle(fontSize: 25))),
              ),
              Expanded(flex: 3,
                child: Container(
                  child: GestureDetector(child: Image.asset('assets/homeimage_1.png'),
                    onTap: (){Navigator.pushNamed(context, 'loginpage');},),
                ),
              )
            ]
    );

    final homePage = Scaffold(
          appBar: appBar,
          body: appBody,
          backgroundColor: Colors.white
    );
    return homePage;
  }
}
