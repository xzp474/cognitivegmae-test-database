import 'package:cognitivegmae/memoryGame/memoryGame_model_II.dart';
import 'package:flutter/material.dart';

class memoryPage4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MemoryModelII(
      title: '四',
      //點擊順序
      btnNum: <int>[1,2,3,4,5],
      //數字數量(迴圈用)
      selectDataPath: 4,
      nextPagePath: 'memoryPage5',
    );
  }
}
class memoryPage5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MemoryModelII(
      title: '五',
      //點擊順序
      btnNum: <int>[1,2,3,4,5,6,7],
      //數字數量(迴圈用)
      selectDataPath: 6,
      nextPagePath: 'memoryPage6',
    );
  }
}
class memoryPage6 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MemoryModelII(
      title: '六',
      //點擊順序
      btnNum: <int>[1,2,3,4,5,6,7,8,9],
      //數字數量(迴圈用)
      selectDataPath: 8,
      nextPagePath: 'memorydata',
    );
  }
}