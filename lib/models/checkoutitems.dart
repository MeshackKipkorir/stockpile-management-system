class CheckoutItems {
  String? itemtype;
  String? iD;
  String? type;
  String? location;
  String? weight;
  String? filename;
  String? no;
  String? oT;
  String? iL;
  String? cIR;
  var typeOfUnworkedPiece;

  CheckoutItems(
      {this.itemtype,
      this.iD,
      this.type,
      this.location,
      this.weight,
      this.filename,
      this.no,
      this.oT,
      this.iL,
      this.cIR,
      this.typeOfUnworkedPiece});

  CheckoutItems.fromJson(Map<String, dynamic> json) {
    itemtype = json['itemtype'];
    iD = json['ID'];
    type = json['Type'];
    location = json['location'];
    weight = json['weight'];
    filename = json['filename'];
    no = json['No'];
    oT = json['OT'];
    iL = json['IL'];
    cIR = json['CIR'];
    typeOfUnworkedPiece = json['Type_of_unworked_piece'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemtype'] = itemtype;
    data['ID'] = iD;
    data['Type'] = type;
    data['location'] = location;
    data['weight'] = weight;
    data['filename'] = filename;
    data['No'] = no;
    data['OT'] = oT;
    data['IL'] = iL;
    data['CIR'] = cIR;
    data['Type_of_unworked_piece'] = typeOfUnworkedPiece;
    return data;
  }
}
