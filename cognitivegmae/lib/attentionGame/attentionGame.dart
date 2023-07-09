import 'package:cognitivegmae/attentionGame/attentionGame_model.dart';
import 'package:flutter/material.dart';

class attentionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelI(
      title: '一',
      //圖片路徑
      qImgPath: 'arrow/',
      //產生圖片的迴圈值
      imgListQuantity1: 4,
      imgListQuantity2: 4,
      //答案庫
      imageAnList: <int>[1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4],
      //產生圖片數量
      imgNullQuantity: 16,
      selectDataPath: 1,
      nextPagePath: 'attentionPage2',
    );
  }
}

class attentionPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelI(
      title: '二',
      //圖片路徑
      qImgPath: 'arrow/',
      //產生圖片的迴圈值
      imgListQuantity1: 8,
      imgListQuantity2: 4,
      //答案庫
      imageAnList: <int>[1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
        5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8],
      //產生圖片數量
      imgNullQuantity: 32,
      selectDataPath: 2,
      nextPagePath: 'attentionPage3',
    );
  }
}

class attentionPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelI(
      title: '三',
      qImgPath: 'shape/',
      imgListQuantity1: 4,
      imgListQuantity2: 4,
      //答案庫
      imageAnList: <int>[1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4],
      imgNullQuantity: 16,
      selectDataPath: 3,
      nextPagePath: 'attentionPage4',
    );
  }
}

class attentionPage4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelI(
      title: '四',
      qImgPath: 'shape/',
      imgListQuantity1: 8,
      imgListQuantity2: 4,
      //答案庫
      imageAnList: <int>[1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
        5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8],
      imgNullQuantity: 32,
      selectDataPath: 4,
      nextPagePath: 'attentionEXII',
    );
  }
}

class attentionPage5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelII(
      title: '五',
      qImgPath: 'arrow/',
      selectDataPath: 5,
      nextPagePath: 'attentionPage6',
    );
  }
}

class attentionPage6 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AttentionModelII(
      title: '六',
      qImgPath: 'shape/',
      selectDataPath: 6,
      nextPagePath: 'attentiondata',
    );
  }
}