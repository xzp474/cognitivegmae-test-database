import 'package:cognitivegmae/reasoning/reasoningGame_model.dart';
import 'package:flutter/material.dart';

class reasoningPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '一',
      qImgPath: 'game/',
      nextPagePath: 'reasoningPage2',
      selectDataPath: 1,
    );
  }
}

class reasoningPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '二',
      qImgPath: 'game2/',
      nextPagePath: 'reasoningPage3',
      selectDataPath: 2,
    );
  }
}

class reasoningPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '三',
      qImgPath: 'game3/',
      nextPagePath: 'reasoningPage4',
      selectDataPath: 3,
    );
  }
}

class reasoningPage4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '四',
      qImgPath: 'game4/',
      nextPagePath: 'reasoningPage5',
      selectDataPath: 4,
    );
  }
}

class reasoningPage5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '五',
      qImgPath: 'game5/',
      nextPagePath: 'reasoningPage6',
      selectDataPath: 5,
    );
  }
}

class reasoningPage6 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ReasoningModel(
      title: '六',
      qImgPath: 'game6/',
      nextPagePath: 'reasoningdata',
      selectDataPath:6,
    );
  }
}