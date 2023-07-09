import 'package:flutter/material.dart';

class menuBtn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final perceptionBtn = ElevatedButton.icon(
        label: Text('空間知覺',style: TextStyle(fontSize: 25,color: Colors.black)),
        icon: Icon(Icons.remove_red_eye_rounded,color: Color(0xFFFF0300),),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(10,50)),
            shadowColor: MaterialStateProperty.all(Color(0x3300FCFF)),
            backgroundColor: MaterialStateProperty.all(Color(0x3300FCFF)),
            shape: MaterialStateProperty.all(
                StadiumBorder(
                    side: BorderSide(width: 0,color: Color(0x3300FCFF))))),
        onPressed: ()=> Navigator.pushNamed(context, 'perceptionEXI')
    );

    final attentionBtn = ElevatedButton.icon(
      label: Text('注意力',style: TextStyle(fontSize: 25,color: Colors.black)),
      icon: Icon(Icons.view_in_ar,color: Color(0xffb50966),),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(10,50)),
          shadowColor: MaterialStateProperty.all(Color(0x334af699)),
          backgroundColor: MaterialStateProperty.all(Color(0x334af699)),
          shape: MaterialStateProperty.all(
              StadiumBorder(
                  side: BorderSide(width: 0,color: Color(0x334af699))))),
      onPressed: ()=> Navigator.pushNamed(context, 'attentionEXI'),
    );

    final memoryBtn = ElevatedButton.icon(
      label: Text('記憶力',style: TextStyle(fontSize: 25,color: Colors.black)),
      icon: Icon(Icons.people_alt_outlined,color: Color(0xff55b303),),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(10,50)),
          shadowColor: MaterialStateProperty.all(Color(0x33aa4cfc)),
          backgroundColor: MaterialStateProperty.all(Color(0x33aa4cfc)),
          shape: MaterialStateProperty.all(
              StadiumBorder(
                  side: BorderSide(width: 0,color: Color(0x33aa4cfc))))),
      onPressed: ()=>Navigator.pushNamed(context, 'memoryEXI'),
    );

    final raisedBtn = ElevatedButton.icon(
      label: Text('反應力',style: TextStyle(fontSize: 25,color: Colors.black)),
      icon: Icon(Icons.speed,color: Color(0xffd84903),),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(10,50)),
          shadowColor: MaterialStateProperty.all(Color(0x3327b6fc)),
          backgroundColor: MaterialStateProperty.all(Color(0x3327b6fc)),
          shape: MaterialStateProperty.all(
              StadiumBorder(
                  side: BorderSide(width: 0,color: Color(0x3327b6fc))))),
      onPressed: ()=>Navigator.pushNamed(context, 'RaisedEX'),
    );


    final reasoningBtn = ElevatedButton.icon(
      label: Text('推理',style: TextStyle(fontSize: 25,color: Colors.black)),
      icon: Icon(Icons.extension_sharp,color: Color(0xff3d76a6)),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(10,50)),
          shadowColor: MaterialStateProperty.all(Color(0x33c28959)),
          backgroundColor: MaterialStateProperty.all(Color(0x33c28959)),
          shape: MaterialStateProperty.all(
              StadiumBorder(
                  side: BorderSide(width: 0,color: Color(0x33c28959))))),
      onPressed: ()=>Navigator.pushNamed(context, 'reasoningEX'),
    );

    return Scaffold(appBar: AppBar(title: Text('測驗項目',
        style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFE8E8E8)),
        body:Container(width: 250, margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: ListView(children: <Widget>[
            //urlBtn,
            SizedBox(height: 30),
            perceptionBtn, SizedBox(height: 30),
            attentionBtn, SizedBox(height: 30),
            memoryBtn, SizedBox(height: 30),
            raisedBtn, SizedBox(height: 30),
            reasoningBtn]),
        ));
  }
}