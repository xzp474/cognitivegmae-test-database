import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:cognitivegmae/dataview/flutter_radar_chart.dart';
import 'package:flutter/widgets.dart';

class dataview extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>dataviewState();
}
class dataviewState extends State<dataview>{


  final firetestList =<String>['空間知覺:','注意力:','記憶力:','反應力:','推理:'];//測驗項目

  var testController = [//最新測驗成績
    int.parse(allData.userData.userID.score.cogScore.perception.last),
    int.parse(allData.userData.userID.score.cogScore.attention.last),
    int.parse(allData.userData.userID.score.cogScore.memory.last),
    int.parse(allData.userData.userID.score.cogScore.raised.last),
    int.parse(allData.userData.userID.score.cogScore.reasoning.last)];
  var testFirstController = [//第一次測驗成績
    int.parse(allData.userData.userID.score.cogScore.perception[
      int.parse(allData.userData.userID.tested.coged.perception)]),
    int.parse(allData.userData.userID.score.cogScore.attention[
      int.parse(allData.userData.userID.tested.coged.attention)]),
    int.parse(allData.userData.userID.score.cogScore.memory[
      int.parse(allData.userData.userID.tested.coged.memory)]),
    int.parse(allData.userData.userID.score.cogScore.raised[
      int.parse(allData.userData.userID.tested.coged.raised)]),
    int.parse(allData.userData.userID.score.cogScore.reasoning[
      int.parse(allData.userData.userID.tested.coged.reasoning)])];
  var readTestDataint = [0,0,0,0,0];
  var readFirstTestDataint = [0,0,0,0,0];
  var readTestDataList = [[10,10,10,10,10],[10,10,10,10,10]];
  final listColors = <Color>[const Color(0x3300FCFF),const Color(0x334af699),
    const Color(0x33aa4cfc),const Color(0x3327b6fc),const Color(0x33c28959)];

  @override
  Widget build(BuildContext context) {
    var textTest = <Container>[];//成績的Text
    final textList = <Container>[];
    for(int i=0;i<=4;i++){//顯示當下測驗成績
      readFirstTestDataint[i]=testFirstController[i];
      readTestDataint[i]=testController[i];
      textTest.add(Container(color: listColors[i],alignment: Alignment.topRight,
        width: 130+testController[i].toDouble()/20*(MediaQuery.of(context).size.width-120),
        child: Text('${testController[i]}',
          style: TextStyle(fontSize: 37),),)
        );
     textList.add(Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 1),
         child: Text('${firetestList[i]}',style: TextStyle(fontSize: 25))));
    }
    readTestDataList[0]=readTestDataint;
    readTestDataList[1]=readFirstTestDataint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.all(20),
          child: Text('您好~${allData.userData.userID.information.name}',
              style: TextStyle(fontSize: 25)),
        ),
        Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: textList),
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: textTest,)]),
        Expanded(
            child: radarChartWidget(readTestDataList: readTestDataList,),),
      ],
    );
  }
}

class radarChartWidget extends StatefulWidget{
  final List<List<int>>readTestDataList;
  radarChartWidget({Key? key, required this.readTestDataList}):super(key: key);
  @override
  State<StatefulWidget> createState()=>radarChartWidgetState();
}

class radarChartWidgetState extends State<radarChartWidget>{
  @override
  Widget build(BuildContext context) {
    double numberOfFeatures = 5;
    var features = ['空間', '注意力', '記憶力', '反應力', '推理 ','','',''];
    features = features.sublist(0, numberOfFeatures.floor());
    /*widget.readTestDataList = widget.readTestDataList
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();*/
    return RadarChart.dark(
        ticks: [5,10,15,20],
        features: features,
        data: widget.readTestDataList,
        reverseAxis: false,
        useSides: true);
  }
}