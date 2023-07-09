import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cognitivegmae/dataview/alldata.dart';

class _LineChart extends StatelessWidget {
  _LineChart({required this.isShowingMainData});
  final bool isShowingMainData;
  var x = <int>[
    int.parse(allData.userData.userID.times.cogTimes.perception),
    int.parse(allData.userData.userID.times.cogTimes.attention),
    int.parse(allData.userData.userID.times.cogTimes.memory),
    int.parse(allData.userData.userID.times.cogTimes.raised),
    int.parse(allData.userData.userID.times.cogTimes.reasoning)];
  var flSpotSum = <FlSpot>[];
  @override
  Widget build(BuildContext context) {
    for(int i=1;i<x.length;){
      if(x[0]>=x[1]){
        x.removeAt(1);}
      else{
        x.removeAt(0);}
    }

    for(int i=0;i<=x[0];i++)flSpotSum.add(FlSpot(0,0));

    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.perception);i++){
      flSpotSum[i]=FlSpot(i.toDouble(), flSpotSum[i].y+allData.linePerception[i].y);}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.attention);i++){
      flSpotSum[i]=FlSpot(i.toDouble(), flSpotSum[i].y+allData.lineAttention[i].y);}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.memory);i++){
      flSpotSum[i]=FlSpot(i.toDouble(), flSpotSum[i].y+allData.lineMemory[i].y);}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.raised);i++){
      flSpotSum[i]=FlSpot(i.toDouble(), flSpotSum[i].y+allData.lineRaised[i].y);}
    for(int i=0;i<=int.parse(allData.userData.userID.times.cogTimes.reasoning);i++){
      flSpotSum[i]=FlSpot(i.toDouble(), flSpotSum[i].y+allData.lineReasoning[i].y);}
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(//XY參數設定
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: x[0].toDouble(),
    maxY: 20,
    minY: 0,
  );

  LineChartData get sampleData2 => LineChartData(//XY參數設定
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: x[0].toDouble(),
    maxY: 100,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
    lineChartBarData1_4,
    lineChartBarData1_5,
  ];

  LineTouchData get lineTouchData2 => LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles2(),
    ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_0,
    lineChartBarData2_1,
    lineChartBarData2_2,
    lineChartBarData2_3,
    lineChartBarData2_4,
    lineChartBarData2_5,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {//Y軸設定
    const style = TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 5:
        text = '5';
        break;
      case 10:
        text = '10';
        break;
      case 15:
        text = '15';
        break;
      case 20:
        text = '分數\n20';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget leftTitleWidgets2(double value, TitleMeta meta) {//Y軸設定
    const style = TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 25:
        text = '25';
        break;
      case 50:
        text = '50';
        break;
      case 75:
        text = '75';
        break;
      case 100:
        text = '分數\n100';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles2() => SideTitles(
    getTitlesWidget: leftTitleWidgets2,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {//X軸設定
    const style = TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    if(value==0)text = const Text('次數',style: TextStyle(fontSize: 18),);
    else
      text = Text('${value.toInt()}', style: style);

    return Padding(child: text, padding: const EdgeInsets.only(top: 10.0));
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color(0xff4e4965), width: 4),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff00fcff),
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: allData.linePerception
  );


  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff4af699),
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: allData.lineAttention
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: true,
    color: const Color(0xffaa4cfc),
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: allData.lineMemory
  );
  LineChartBarData get lineChartBarData1_4 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff27b6fc),
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: allData.lineRaised
  );
  LineChartBarData get lineChartBarData1_5 => LineChartBarData(
    isCurved: true,
    color: const Color(0xffc28959),
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: allData.lineReasoning
  );

  LineChartBarData get lineChartBarData2_0 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xff868686),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
          show: true,
          color: const Color(0x33868686)
      ),
      spots: flSpotSum
  );
  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xff4af699),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true,color: const Color(0x334af699)),
      spots: allData.linePerception
  );
  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xffaa4cfc),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true,color: const Color(0x33aa4cfc)),
      spots: allData.lineAttention
  );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xff27b6fc),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true,color: const Color(0x3327b6fc)),
      spots: allData.lineMemory
  );
  LineChartBarData get lineChartBarData2_4 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xffc28959),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true,color: const Color(0x33c28959)),
      spots: allData.lineRaised
  );
  LineChartBarData get lineChartBarData2_5 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xff00FCFF),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true,color: const Color(0x3300FCFF)),
      spots: allData.lineReasoning
  );
}



class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: AspectRatio(
            aspectRatio: 1.23,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: [Color(0xffffffff), Color(0xffffffff),],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 37,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '認知測驗趨勢圖',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                          child: _LineChart(isShowingMainData: isShowingMainData),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,size: 50,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {isShowingMainData = !isShowingMainData;});
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex:1,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              children: [
                SizedBox(child:Container(width:22,height: 22,color:Color(0xff00fcff),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                Text('空間',style: TextStyle(fontSize: 20),),
                SizedBox(child:Container(width:22,height: 22,color:Color(0xff4af699),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                Text('注意',style: TextStyle(fontSize: 20),),
                SizedBox(child:Container(width:22,height: 22,color:Color(0xffaa4cfc),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                Text('記憶',style: TextStyle(fontSize: 20),),
                SizedBox(child:Container(width:22,height: 22,color:Color(0xff27b6fc),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                Text('反應',style: TextStyle(fontSize: 20),),
                SizedBox(child:Container(width:22,height: 22,color:Color(0xffc28959),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                Text('推理',style: TextStyle(fontSize: 20),),
                isShowingMainData==true?SizedBox() :
                SizedBox(child:Container(width:22,height: 22,color:Color(0xff868686),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),)),
                isShowingMainData==true?SizedBox() :
                Text('總和',style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}