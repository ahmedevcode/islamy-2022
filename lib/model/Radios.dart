/// name : "---إذاعة صور من حياة الصحابة رضوان الله عليهم---"
/// radio_url : "https://qurango.net/radio/sahabah"

class Radios {
  Radios({
    this.name,
    this.radioUrl,
  });

  Radios.fromJson(dynamic json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }

  String? name;
  String? radioUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['radio_url'] = radioUrl;
    return map;
  }
}
