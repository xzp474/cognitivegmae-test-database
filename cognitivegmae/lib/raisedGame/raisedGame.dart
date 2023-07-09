import 'package:cognitivegmae/raisedGame/raisedGame_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedModel(
      title: '一',
      seconds: Duration(milliseconds: 1000),
      nextPagePath: 'RaisedPage2',
    );
  }
}

class RaisedPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedModel(
      title: '二',
      seconds: Duration(milliseconds: 750),
      nextPagePath: 'RaisedPage3',
    );
  }
}

class RaisedPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedModel(
      title: '三',
      seconds: Duration(milliseconds: 500),
      nextPagePath: 'raiseddata',
    );
  }
}