import 'package:cognitivegmae/dataview/alldata.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => loginpageState();
}

class loginpageState extends State<loginpage>{

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var nameField = TextField(
      controller: nameController,decoration: InputDecoration(labelText: '請輸入姓名'),
      style: TextStyle(fontSize: 23),
    );
    var idController = TextEditingController();
    var idField = TextField(
      controller: idController,decoration: InputDecoration(labelText: '請輸入身分證末五碼'),
      style: TextStyle(fontSize: 23),
    );

    final entBtn = ElevatedButton(
        child: Text('登入', style: TextStyle(color: Colors.black,fontSize: 30)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
        allData.userID = idController.text;
        Navigator.pushNamed(context, 'readuserpage');
      });
    final createBtn = ElevatedButton(
        child: Text('創建帳號', style: TextStyle(color: Colors.black,fontSize: 30)),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE8E8E8))),
        onPressed: (){
          Navigator.pushNamed(context, 'createuser');
        }
    );

    return Scaffold(
        appBar: AppBar(title: Text('登入畫面',
            style: TextStyle(color: Colors.black)),
            backgroundColor: Color(0xFFE8E8E8)),
        body: Container(
            alignment:Alignment.topCenter,
            child:ListView(children: [
              Container(child: nameField,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, 50, MediaQuery.of(context).size.width/10, 10),),
              Container(child: idField,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, 10, MediaQuery.of(context).size.width/10, 30),),
              Container(child: entBtn,height:80,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/5, 30, MediaQuery.of(context).size.width/5, 20),),
              Container(child: createBtn,height:80,
                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/5, 30, MediaQuery.of(context).size.width/5, 20),),
        ])
    ));
  }
}