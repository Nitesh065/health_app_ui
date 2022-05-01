import 'dart:convert';

import '../model/feelings_data_model.dart';

class JsonData {
  var jsonStr = {
      "data": {
        "feeling_percentage": {
          "Happy": "3",
          "Sad": "1",
          "Energetic": "3",
          "Calm": "2",
          "Angry": "0",
          "Bored": "1"
        },
        "feeling_list": [
          {
            "user_feeling_id": "3",
            "feeling_id": "1",
            "feeling_name": "Calm",
            "submit_time": "2021-07-31 13:17:30"
          },
          {
            "user_feeling_id": "5",
            "feeling_id": "6",
            "feeling_name": "Bored",
            "submit_time": "2021-07-31 17:27:15"
          },
          {
            "user_feeling_id": "6",
            "feeling_id": "4",
            "feeling_name": "Happy",
            "submit_time": "2021-07-31 23:08:53"
          }
        ],
        "video_arr": [
          {
            "title": "Related to Health",
            "description":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            "youtube_url": "https://www.youtube.com/watch?v=ml6cT4AZdqI",
          },
          {
            "title": "Related to Health",
            "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            "youtube_url": "https://www.youtube.com/watch?v=ml6cT4AZdqI"
          }
        ]
      }
  };
}

class JsonCon {
  FeelingsData? getData() {
    var demoModel = null;
    try {
      var jsonString = json.encode(JsonData().jsonStr);
      Map<String, dynamic> jsonDecode = json.decode(jsonString);
      demoModel = FeelingsData.fromJson(jsonDecode);
      return demoModel;
    }
    catch(e){
      print(e.toString());
    }
  }
}
