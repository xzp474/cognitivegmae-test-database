import 'package:cognitivegmae/dataview/userDataMap.dart';
import 'package:fl_chart/fl_chart.dart';

class allData {
  static Map<String, dynamic> userJsonData =
  {
    "${userID}":
    {
      "基本資料":
      {
        "出生地":"null",
        "在校成績":"null",
        "姓名":"null",
        "性別":"null",
        "末五碼":"${userID}",
        "學校":"null",
      },
      "是否測驗過":
      {
        "智力測驗":"0",
        "瑞文圖文推理":"0",
        "認知測驗":
        {
          "反應力":"0",
          "推理":"0",
          "注意力":"0",
          "空間":"0",
          "記憶力":"0",
        },
      },
      "測驗成績":
      {
        "智力測驗":"0",
        "瑞文圖文推理":"0",
        "認知測驗":
        {
          "反應力":["0"],
          "推理":["0"],
          "注意力":["0"],
          "空間":["0"],
          "記憶力":["0"],
        },
      },
      "測驗時間":
      {
        "智力測驗":"0",
        "瑞文圖文推理":"0",
        "認知測驗":
        {
          "反應力":["0"],
          "推理":["0"],
          "注意力":["0"],
          "空間":["0"],
          "記憶力":["0"],
        },
      },
      "測驗次數":
      {
        "智力測驗":"0",
        "瑞文圖文推理":"0",
        "認知測驗":
        {
          "反應力":"0",
          "推理":"0",
          "注意力":"0",
          "空間":"0",
          "記憶力":"0",
        },
      },
      "各題數據":
      {
        "反應力":
        {
          "1_1":["0"],
          "1_2":["0"],
          "1_3":["0"],
        },
        "推理":
        {
          "1_1":["0"],
          "1_2":["0"],
          "1_3":["0"],
          "1_4":["0"],
          "1_5":["0"],
          "1_6":["0"],
        },
        "注意力":
        {
          "1_1":["0"],
          "1_2":["0"],
          "1_3":["0"],
          "1_4":["0"],
          "1_5":["0"],
          "1_6":["0"],
        },
        "空間":
        {
          "1_1":["0"],
          "1_2":["0"],
          "1_3":["0"],
          "2_1":["0"],
          "2_2":["0"],
          "2_3":["0"],
        },
        "記憶力":
        {
          "1_1":["0"],
          "1_2":["0"],
          "1_3":["0"],
          "2_1":["0"],
          "2_2":["0"],
          "2_3":["0"],
        }
      },
      "問卷":
      {
        "1":"0",
        "2":"0",
        "3":"0",
        "4":"0",
        "5":"0",
        "6":"0",
        "7":"0",
        "8":"0",
        "9":"0",
        "10":"0",
        "11":"0",
        "12":"0",
        "13":"0",
        "14":"0",
        "15":"0",
        "16":"0",
        "是否填寫過":"0",
        "其它建議":"0",
      },
    },
  };

  static UserDataModel userData = UserDataModel.fromJson(userJsonData);

  static String userID = '00000';//學號末五碼

  static bool pageSwitch = false;//登入頁面切換

  static var linePerception = <FlSpot>[];//空間折線圖
  static var lineAttention = <FlSpot>[];//注意力折線圖
  static var lineMemory = <FlSpot>[];//記憶力折線圖
  static var lineRaised = <FlSpot>[];//反應力折線圖
  static var lineReasoning = <FlSpot>[];//推理折線圖

}