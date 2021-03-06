// To parse this JSON data, do
//
//     final feelingsData = feelingsDataFromJson(jsonString);

import 'dart:convert';

FeelingsData feelingsDataFromJson(String str) => FeelingsData.fromJson(json.decode(str));

String feelingsDataToJson(FeelingsData data) => json.encode(data.toJson());

class FeelingsData {
  FeelingsData({
    this.data,
  });

  Data? data;

  factory FeelingsData.fromJson(Map<String, dynamic> json) => FeelingsData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.feelingPercentage,
    this.feelingList,
    this.videoArr,
  });

  FeelingPercentage? feelingPercentage;
  List<FeelingList>? feelingList;
  List<VideoArr>? videoArr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    feelingPercentage: FeelingPercentage.fromJson(json["feeling_percentage"]),
    feelingList: List<FeelingList>.from(json["feeling_list"].map((x) => FeelingList.fromJson(x))),
    videoArr: List<VideoArr>.from(json["video_arr"].map((x) => VideoArr.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "feeling_percentage": feelingPercentage?.toJson(),
    "feeling_list": List<dynamic>.from(feelingList!.map((x) => x.toJson())),
    "video_arr": List<dynamic>.from(videoArr!.map((x) => x.toJson())),
  };
}

class FeelingList {
  FeelingList({
    this.userFeelingId,
    this.feelingId,
    this.feelingName,
    this.submitTime,
  });

  String? userFeelingId;
  String? feelingId;
  String? feelingName;
  DateTime? submitTime;

  factory FeelingList.fromJson(Map<String, dynamic> json) => FeelingList(
    userFeelingId: json["user_feeling_id"],
    feelingId: json["feeling_id"],
    feelingName: json["feeling_name"],
    submitTime: DateTime.parse(json["submit_time"]),
  );

  Map<String, dynamic> toJson() => {
    "user_feeling_id": userFeelingId,
    "feeling_id": feelingId,
    "feeling_name": feelingName,
    "submit_time": submitTime
  };
}

class FeelingPercentage {
  FeelingPercentage({
    this.happy,
    this.sad,
    this.energetic,
    this.calm,
    this.angry,
    this.bored,
    this.love,
  });

  String? happy;
  String? sad;
  String? energetic;
  String? calm;
  String? angry;
  String?bored;
  String? love;

  factory FeelingPercentage.fromJson(Map<String, dynamic> json) => FeelingPercentage(
    happy: json["Happy"],
    sad: json["Sad"],
    energetic: json["Energetic"],
    calm: json["Calm"],
    angry: json["Angry"],
    bored: json["Bored"],
    love: json["Love"]
  );

  Map<String, dynamic> toJson() => {
    "Happy": happy,
    "Sad": sad,
    "Energetic": energetic,
    "Calm": calm,
    "Angry": angry,
    "Bored": bored,
    "Love": love,
  };
}

class VideoArr {
  VideoArr({
    this.title,
    this.description,
    this.youtubeUrl,
  });

  String? title;
  String? description;
  String? youtubeUrl;

  factory VideoArr.fromJson(Map<String, dynamic> json) => VideoArr(
    title: json["title"],
    description: json["description"],
    youtubeUrl: json["youtube_url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "youtube_url": youtubeUrl,
  };
}
