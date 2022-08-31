class Shift {
  int? id;
  String? status;
  String? startAt;
  String? endAt;
  String? postName;
  int? postId;
  bool? startSoon;
  Recurring? recurring;
  String? company;
  String? buyPrice;
  int? bonus;
  double? latitude;
  double? longitude;

  Shift(
      {this.id,
        this.status,
        this.startAt,
        this.endAt,
        this.postName,
        this.postId,
        this.startSoon,
        this.recurring,
        this.company,
        this.buyPrice,
        this.bonus,
        this.latitude,
        this.longitude});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    postName = json['post_name'];
    postId = json['post_id'];
    startSoon = json['start_soon'];
    recurring = json['recurring'] != null
        ? new Recurring.fromJson(json['recurring'])
        : null;
    company = json['company'];
    buyPrice = json['buy_price'];
    bonus = json['bonus'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['post_name'] = this.postName;
    data['post_id'] = this.postId;
    data['start_soon'] = this.startSoon;
    if (this.recurring != null) {
      data['recurring'] = this.recurring!.toJson();
    }
    data['company'] = this.company;
    data['buy_price'] = this.buyPrice;
    data['bonus'] = this.bonus;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Recurring {
  int? id;
  String? startAt;
  String? endAt;
  bool? isAvailable;

  Recurring({this.id, this.startAt, this.endAt, this.isAvailable});

  Recurring.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['is_available'] = this.isAvailable;
    return data;
  }
}