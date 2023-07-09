import 'package:cognitivegmae/perceptionGame/perceptionGame_model_II.dart';
import 'package:flutter/material.dart';

class perceptionPage4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelII(
      title: '四',
      //題目圖片
      qImgPath: '4',
      //答案陣列
      answerList: <int>[2,1,5,1,1,1,3,1,6],
      //下一頁
      nextPagePath: 'perceptionPage5',
      //選擇儲存Data的題目，4=第四題，5=第五題，6=第六題
      selectDataPath: 4,
    );
  }
}

class perceptionPage5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelII(
      title: '五',
      //題目圖片
      qImgPath: '5',
      //答案陣列
      answerList: <int>[2,5,4,3,1,5,4,3,6],
      //下一頁
      nextPagePath: 'perceptionPage6',
      //選擇儲存Data的題目，4=第四題，5=第五題，6=第六題
      selectDataPath: 5,
    );
  }
}

class perceptionPage6 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PerceptionModelII(
      title: '六',
      //題目圖片
      qImgPath: '6',
      //答案陣列
      answerList: <int>[2,6,4,1,5,2,1,1,6],
      //下一頁
      nextPagePath: 'perceptiondata',
      //選擇儲存Data的題目，4=第四題，5=第五題，6=第六題
      selectDataPath: 6,
    );
  }
}