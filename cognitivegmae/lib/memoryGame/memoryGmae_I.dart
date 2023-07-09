import 'package:cognitivegmae/memoryGame/memoryGame_model_I.dart';
import 'package:flutter/material.dart';

class memoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MemoryModelI(
      title: '一',
      //題目庫
      quList: <String>['GO','?','?','?','?','?','END'],
      //數字數量(迴圈用)
      selectDataPath: 5,
      //使用者答案
      userAn: <int>[0,0,0,0,0],
      nextPagePath: 'memoryPage2',
    );
  }
}

class memoryPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MemoryModelI(
      title: '二',
      //題目庫
      quList: <String>['GO','?','?','?','?','?','?','?','END'],
      //數字數量(迴圈用)
      selectDataPath: 7,
      //使用者答案
      userAn: <int>[0,0,0,0,0,0,0],
      nextPagePath: 'memoryPage3',
    );
  }
}

class memoryPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MemoryModelI(
      title: '三',
      //題目庫
      quList: <String>['GO','?','?','?','?','?','?','?','?','?','END'],
      //數字數量(迴圈用)
      selectDataPath: 9,
      //使用者答案
      userAn: <int>[0,0,0,0,0,0,0,0,0],
      nextPagePath: 'memoryEXII',
    );
  }
}