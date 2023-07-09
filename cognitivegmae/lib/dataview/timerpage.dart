import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class timerpage extends StatelessWidget{
  timerpage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> textlist = <String>['空間知覺','注意力','記憶力','反應力','推理'];
    List<Color> textcolor = <Color>[
      Color(0x3300FCFF),Color(0x334af699),Color(0x33aa4cfc),
      Color(0x3327b6fc),Color(0x33c28959)];
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListView(
        children: [
          timerwidget(textlist: textlist[0], textcolor: textcolor[0]),
          timerwidget(textlist: textlist[1], textcolor: textcolor[1]),
          timerwidget(textlist: textlist[2], textcolor: textcolor[2]),
          timerwidget(textlist: textlist[3], textcolor: textcolor[3]),
          timerwidget(textlist: textlist[4], textcolor: textcolor[4]),
        ],
      ),
    );
  }
}

class timerwidget extends StatefulWidget{
  String textlist;
  Color textcolor;
  timerwidget({
    Key? key,
    required this.textlist,
    required this.textcolor,
  }):super(key: key);
  @override
  State<StatefulWidget> createState()=> timerwidgetState();}

class timerwidgetState extends State<timerwidget>{
  @override
  Widget build(BuildContext context) {
    List<Text> textTimer = <Text>[];
    switch(widget.textlist){
      case '空間知覺':
        for(int i=1;i<=int.parse(allData.userData.userID.times.cogTimes.perception);i++){
          textTimer.add(Text('${i}.${allData.userData.userID.testTime.cogTime.perception[i]}', style: TextStyle(fontSize: 20),));
        }
        break;
      case '注意力':
        for(int i=1;i<=int.parse(allData.userData.userID.times.cogTimes.attention);i++){
          textTimer.add(Text('${i}.${allData.userData.userID.testTime.cogTime.attention[i]}', style: TextStyle(fontSize: 20),));
        }
        break;
      case '記憶力':
        for(int i=1;i<=int.parse(allData.userData.userID.times.cogTimes.memory);i++){
          textTimer.add(Text('${i}.${allData.userData.userID.testTime.cogTime.memory[i]}', style: TextStyle(fontSize: 20),));
        }
        break;
      case '反應力':
        for(int i=1;i<=int.parse(allData.userData.userID.times.cogTimes.raised);i++){
          textTimer.add(Text('${i}.${allData.userData.userID.testTime.cogTime.raised[i]}', style: TextStyle(fontSize: 20),));
        }
        break;
      case '推理':
        for(int i=1;i<=int.parse(allData.userData.userID.times.cogTimes.reasoning);i++){
          textTimer.add(Text('${i}.${allData.userData.userID.testTime.cogTime.reasoning[i]}', style: TextStyle(fontSize: 20),));
        }
        break;
    }
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ExpansionTile(
        title: Text(widget.textlist, style: TextStyle(fontSize: 30),),
        children: textTimer,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.textcolor,
      ),
    );
  }
}