class CheckinItems {
  String? movementId;
  String? type;
  String? status;
  String? checkInTime;
  String? checkOutTime;
  String? itemtype;
  String? movementItemId;
  String? iD;
  String? Type;
  String? location;
  String? weight;
  String? filename;
  String? no;
  String? oT;
  String? iL;
  String? cIR;
  String? checkOutUserId;
  String? checkInUserId;

  CheckinItems(
      {this.movementId,
      this.type,
      this.status,
      this.checkInTime,
      this.checkOutTime,
      this.itemtype,
      this.movementItemId,
      this.iD,
      this.Type,
      this.location,
      this.weight,
      this.filename,
      this.no,
      this.oT,
      this.iL,
      this.cIR,
      this.checkOutUserId,
      this.checkInUserId});

  CheckinItems.fromJson(Map<String, dynamic> json) {
    movementId = json['movement_id'];
    type = json['type'];
    status = json['status'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
    itemtype = json['itemtype'];
    movementItemId = json['movement_item_id'];
    iD = json['ID'];
    Type = json['Type'];
    location = json['location'];
    weight = json['weight'];
    filename = json['filename'];
    no = json['No'];
    oT = json['OT'];
    iL = json['IL'];
    cIR = json['CIR'];
    checkOutUserId = json['check_out_user_id'];
    checkInUserId = json['check_in_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movement_id'] = movementId;
    data['type'] = type;
    data['status'] = status;
    data['check_in_time'] = checkInTime;
    data['check_out_time'] = checkOutTime;
    data['itemtype'] = itemtype;
    data['movement_item_id'] = movementItemId;
    data['ID'] = iD;
    data['Type'] = Type;
    data['location'] = location;
    data['weight'] = weight;
    data['filename'] = filename;
    data['No'] = no;
    data['OT'] = oT;
    data['IL'] = iL;
    data['CIR'] = cIR;
    data['check_out_user_id'] = checkOutUserId;
    data['check_in_user_id'] = checkInUserId;
    return data;
  }
}
