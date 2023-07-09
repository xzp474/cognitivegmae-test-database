import 'package:cognitivegmae/perceptionGame/perceptionGame_model_I.dart';
import 'package:flutter/material.dart';

class perceptionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelI(
      //答案陣列
      answerList: <bool>[true,false,false,true,false,true],
      //題目圖片
      qImgPath: 'assets/perception/game/lamp.png',
      //選項圖片
      aImgPath: 'game',
      title: '一',
      //選擇儲存Data的題目，1=第一題，2=第二題，3=第三題
      selectDataPath:1,
      //下一頁
      nextPagePath: 'perceptionPage2',
    );
  }
}

class perceptionPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelI(
      //答案陣列
      answerList: <bool>[true,true,false,false,true,false],
      //題目圖片
      qImgPath: 'assets/perception/game2/lamp2.png',
      //選項圖片
      aImgPath: 'game2',
      title: '二',
      //選擇儲存Data的題目，1=第一題，2=第二題，3=第三題
      selectDataPath:2,
      //下一頁
      nextPagePath: 'perceptionPage3',
    );
  }
}

class perceptionPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelI(
      //答案陣列
      answerList: <bool>[false,true,true,false,true,false],
      //題目圖片
      qImgPath: 'assets/perception/game3/lamp3.png',
      //選項圖片
      aImgPath: 'game3',
      title: '三',
      //選擇儲存Data的題目，1=第一題，2=第二題，3=第三題
      selectDataPath:3,
      //下一頁
      nextPagePath: 'perceptionEXII',
    );
  }
}