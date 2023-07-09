import 'package:cognitivegmae/dataview/alldata.dart';

class UserDataModel {
  UserID userID;

  UserDataModel(this.userID);

  UserDataModel.fromJson(Map<String, dynamic> json)
      : userID = UserID.fromJson(json['${allData.userID}']);

  Map<String, dynamic> toJson() => {
    '${allData.userID}': userID,
  };
}

class UserID {
  Information information;
  Tested tested;
  TestTime testTime;
  Score score;
  Times times;
  QuestionData questionData;
  Questionnaire questionnaire;

  UserID(this.information,this.tested,this.testTime,
      this.score,this.times,this.questionData,this.questionnaire);

  UserID.fromJson(Map<String, dynamic> json)
      : information = Information.fromJson(json['基本資料']),
        tested = Tested.fromJson(json['是否測驗過']),
        testTime = TestTime.fromJson(json['測驗時間']),
        score = Score.fromJson(json['測驗成績']),
        times = Times.fromJson(json['測驗次數']),
        questionData = QuestionData.fromJson(json['各題數據']),
        questionnaire = Questionnaire.fromJson(json['問卷']);

  Map<String, dynamic> toJson() => {
    '基本資料':information,
    '是否測驗過':tested,
    '測驗時間':testTime,
    '測驗成績':score,
    '測驗次數':times,
    '各題數據':questionData,
    '問卷':questionnaire,
  };
}

class Information{
  String birthplace;
  String study_score;
  String name;
  String sex;
  String id;
  String school;

  Information(this.birthplace,this.study_score,
      this.name,this.sex,this.id,this.school);

  Information.fromJson(Map<String, dynamic> json)
      : birthplace = json['出生地'],
        study_score = json['在校成績'],
        name = json['姓名'],
        sex = json['性別'],
        id = json['末五碼'],
        school = json['學校'];

  Map<String, dynamic> toJson() => {
    '出生地' : birthplace,
    '在校成績' : study_score,
    '姓名' : name,
    '性別' : sex,
    '末五碼' : id,
    '學校' : school,
  };
}

class Tested{
  String iqtest;
  String cpm;
  Coged coged;

  Tested(this.iqtest,this.cpm,this.coged);

  Tested.fromJson(Map<String, dynamic> json)
      : iqtest = json['智力測驗'],
        cpm = json['瑞文圖文推理'],
        coged = Coged.fromJson(json['認知測驗']);

  Map<String, dynamic> toJson() => {
    '智力測驗' : iqtest,
    '瑞文圖文推理' : cpm,
    '認知測驗' : coged,
  };
}

class Coged{
  String raised;
  String reasoning;
  String attention;
  String perception;
  String memory;

  Coged(this.raised,this.reasoning,this.attention,
      this.perception,this.memory);

  Coged.fromJson(Map<String, dynamic> json)
      : raised = json['反應力'],
        reasoning = json['推理'],
        attention = json['注意力'],
        perception = json['空間'],
        memory = json['記憶力'];

  Map<String, dynamic> toJson() => {
    '反應力' : raised,
    '推理' : reasoning,
    '注意力' : attention,
    '空間' : perception,
    '記憶力' : memory,
  };
}

class TestTime{
  String iqtest;
  String cpm;
  CogTime cogTime;

  TestTime(this.iqtest,this.cpm,this.cogTime);

  TestTime.fromJson(Map<String, dynamic> json)
      : iqtest = json['智力測驗'],
        cpm = json['瑞文圖文推理'],
        cogTime = CogTime.fromJson(json['認知測驗']);

  Map<String, dynamic> toJson() => {
    '智力測驗' : iqtest,
    '瑞文圖文推理' : cpm,
    '認知測驗' : cogTime,
  };
}

class CogTime{
  List<String> raised;
  List<String> reasoning;
  List<String> attention;
  List<String> perception;
  List<String> memory;

  CogTime(this.raised,this.reasoning,this.attention,
      this.perception,this.memory);

  CogTime.fromJson(Map<String, dynamic> json)
      : raised = json['反應力'].cast<String>(),
        reasoning = json['推理'].cast<String>(),
        attention = json['注意力'].cast<String>(),
        perception = json['空間'].cast<String>(),
        memory = json['記憶力'].cast<String>();

  Map<String, dynamic> toJson() => {
    '反應力' : raised,
    '推理' : reasoning,
    '注意力' : attention,
    '空間' : perception,
    '記憶力' : memory,
  };
}

class Score{
  String iqtest;
  String cpm;
  CogScore cogScore;

  Score(this.iqtest,this.cpm,this.cogScore);

  Score.fromJson(Map<String, dynamic> json)
      : iqtest = json['智力測驗'],
        cpm = json['瑞文圖文推理'],
        cogScore = CogScore.fromJson(json['認知測驗']);

  Map<String, dynamic> toJson() => {
    '智力測驗' : iqtest,
    '瑞文圖文推理' : cpm,
    '認知測驗' : cogScore,
  };
}

class CogScore{
  List<String> raised;
  List<String> reasoning;
  List<String> attention;
  List<String> perception;
  List<String> memory;

  CogScore(this.raised,this.reasoning,this.attention,
      this.perception,this.memory);

  CogScore.fromJson(Map<String, dynamic> json)
      : raised = json['反應力'].cast<String>(),
        reasoning = json['推理'].cast<String>(),
        attention = json['注意力'].cast<String>(),
        perception = json['空間'].cast<String>(),
        memory = json['記憶力'].cast<String>();

  Map<String, dynamic> toJson() => {
    '反應力' : raised,
    '推理' : reasoning,
    '注意力' : attention,
    '空間' : perception,
    '記憶力' : memory,
  };
}

class Times{
  String iqtest;
  String cpm;
  CogTimes cogTimes;

  Times(this.iqtest,this.cpm,this.cogTimes);

  Times.fromJson(Map<String, dynamic> json)
      : iqtest = json['智力測驗'],
        cpm = json['瑞文圖文推理'],
        cogTimes = CogTimes.fromJson(json['認知測驗']);

  Map<String, dynamic> toJson() => {
    '智力測驗' : iqtest,
    '瑞文圖文推理' : cpm,
    '認知測驗' : cogTimes,
  };
}

class CogTimes{
  String raised;
  String reasoning;
  String attention;
  String perception;
  String memory;

  CogTimes(this.raised,this.reasoning,this.attention,
      this.perception,this.memory);

  CogTimes.fromJson(Map<String, dynamic> json)
      : raised = json['反應力'],
        reasoning = json['推理'],
        attention = json['注意力'],
        perception = json['空間'],
        memory = json['記憶力'];

  Map<String, dynamic> toJson() => {
    '反應力' : raised,
    '推理' : reasoning,
    '注意力' : attention,
    '空間' : perception,
    '記憶力' : memory,
  };
}

class QuestionData{
  Perception perception;
  Attention attention;
  Memory memory;
  Raised raised;
  Reason reason;

  QuestionData(this.perception,this.attention,
      this.memory,this.raised,this.reason);

  QuestionData.fromJson(Map<String, dynamic> json)
      : perception = Perception.fromJson(json['空間']),
        attention = Attention.fromJson(json['注意力']),
        memory = Memory.fromJson(json['記憶力']),
        raised = Raised.fromJson(json['反應力']),
        reason = Reason.fromJson(json['推理']);

  Map<String, dynamic> toJson() => {
    '空間' : perception,
    '注意力' : attention,
    '記憶力' : memory,
    '反應力' : raised,
    '推理' : reason,
  };
}

class Perception{
  List<String> p1_1;
  List<String> p1_2;
  List<String> p1_3;
  List<String> p2_1;
  List<String> p2_2;
  List<String> p2_3;

  Perception(this.p1_1,this.p1_2,this.p1_3,
      this.p2_1,this.p2_2,this.p2_3);

  Perception.fromJson(Map<String, dynamic> json)
      : p1_1 = json['1_1'].cast<String>(),
        p1_2 = json['1_2'].cast<String>(),
        p1_3 = json['1_3'].cast<String>(),
        p2_1 = json['2_1'].cast<String>(),
        p2_2 = json['2_2'].cast<String>(),
        p2_3 = json['2_3'].cast<String>();

  Map<String, dynamic> toJson() => {
    '1_1':p1_1,
    '1_2':p1_2,
    '1_3':p1_3,
    '2_1':p2_1,
    '2_2':p2_2,
    '2_3':p2_3,
  };
}

class Attention{
  List<String> p1_1;
  List<String> p1_2;
  List<String> p1_3;
  List<String> p1_4;
  List<String> p1_5;
  List<String> p1_6;

  Attention(this.p1_1,this.p1_2,this.p1_3,
      this.p1_4,this.p1_5,this.p1_6);

  Attention.fromJson(Map<String, dynamic> json)
      : p1_1 = json['1_1'].cast<String>(),
        p1_2 = json['1_2'].cast<String>(),
        p1_3 = json['1_3'].cast<String>(),
        p1_4 = json['1_4'].cast<String>(),
        p1_5 = json['1_5'].cast<String>(),
        p1_6 = json['1_6'].cast<String>();

  Map<String, dynamic> toJson() => {
    '1_1':p1_1,
    '1_2':p1_2,
    '1_3':p1_3,
    '1_4':p1_4,
    '1_5':p1_5,
    '1_6':p1_6,
  };
}

class Memory{
  List<String> p1_1;
  List<String> p1_2;
  List<String> p1_3;
  List<String> p2_1;
  List<String> p2_2;
  List<String> p2_3;

  Memory(this.p1_1,this.p1_2,this.p1_3,
      this.p2_1,this.p2_2,this.p2_3);

  Memory.fromJson(Map<String, dynamic> json)
      : p1_1 = json['1_1'].cast<String>(),
        p1_2 = json['1_2'].cast<String>(),
        p1_3 = json['1_3'].cast<String>(),
        p2_1 = json['2_1'].cast<String>(),
        p2_2 = json['2_2'].cast<String>(),
        p2_3 = json['2_3'].cast<String>();

  Map<String, dynamic> toJson() => {
    '1_1':p1_1,
    '1_2':p1_2,
    '1_3':p1_3,
    '2_1':p2_1,
    '2_2':p2_2,
    '2_3':p2_3,
  };
}

class Raised{
  List<String> p1_1;
  List<String> p1_2;
  List<String> p1_3;


  Raised(this.p1_1,this.p1_2,this.p1_3,);

  Raised.fromJson(Map<String, dynamic> json)
      : p1_1 = json['1_1'].cast<String>(),
        p1_2 = json['1_2'].cast<String>(),
        p1_3 = json['1_3'].cast<String>();

  Map<String, dynamic> toJson() => {
    '1_1':p1_1,
    '1_2':p1_2,
    '1_3':p1_3,
  };
}

class Reason{
  List<String> p1_1;
  List<String> p1_2;
  List<String> p1_3;
  List<String> p1_4;
  List<String> p1_5;
  List<String> p1_6;

  Reason(this.p1_1,this.p1_2,this.p1_3,
      this.p1_4,this.p1_5,this.p1_6);

  Reason.fromJson(Map<String, dynamic> json)
      : p1_1 = json['1_1'].cast<String>(),
        p1_2 = json['1_2'].cast<String>(),
        p1_3 = json['1_3'].cast<String>(),
        p1_4 = json['1_4'].cast<String>(),
        p1_5 = json['1_5'].cast<String>(),
        p1_6 = json['1_6'].cast<String>();

  Map<String, dynamic> toJson() => {
    '1_1':p1_1,
    '1_2':p1_2,
    '1_3':p1_3,
    '1_4':p1_4,
    '1_5':p1_5,
    '1_6':p1_6,
  };
}

class Questionnaire{
  String p1;
  String p2;
  String p3;
  String p4;
  String p5;
  String p6;
  String p7;
  String p8;
  String p9;
  String p10;
  String p11;
  String p12;
  String p13;
  String p14;
  String p15;
  String p16;
  String fillin;
  String other;

  Questionnaire(
      this.p1,this.p2,this.p3,this.p4,this.p5,
      this.p6,this.p7,this.p8,this.p9,this.p10,
      this.p11,this.p12,this.p13,this.p14,this.p15,
      this.p16,this.fillin,this.other,
      );

  Questionnaire.fromJson(Map<String, dynamic> json)
      : p1 = json['1'],
        p2 = json['2'],
        p3 = json['3'],
        p4 = json['4'],
        p5 = json['5'],
        p6 = json['6'],
        p7 = json['7'],
        p8 = json['8'],
        p9 = json['9'],
        p10 = json['10'],
        p11 = json['11'],
        p12 = json['12'],
        p13 = json['13'],
        p14 = json['14'],
        p15 = json['15'],
        p16 = json['16'],
        fillin = json['是否填寫過'],
        other = json['其它建議'];

  Map<String, dynamic> toJson() => {
    '1' : p1,
    '2' : p2,
    '3' : p3,
    '4' : p4,
    '5' : p5,
    '6' : p6,
    '7' : p7,
    '8' : p8,
    '9' : p9,
    '10' : p10,
    '11' : p11,
    '12' : p12,
    '13' : p13,
    '14' : p14,
    '15' : p15,
    '16' : p16,
    '是否填寫過' : fillin,
    '其它建議' : other,
  };
}