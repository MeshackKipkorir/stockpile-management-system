import 'package:http/http.dart' as http;
import 'package:smsapp/models/checkoutitems.dart';
import 'dart:convert';

import '../models/checkinitems.dart';
import '../models/movements.dart';

class APIService {
  Future login(String username, String password) async {
    var map = <String, dynamic>{};

    map["username"] = username;
    map["password"] = password;
    map["type"] = "login";

    var url =
        Uri.parse("http://5.189.149.105:8095/epi/modules/api/external.php");

    final response = await http.post(url, body: map);

    // if(response.statusCode == 200){
    //     // return LoginResponseModel.fromJson(json.decode(response.body));
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => HomePage()));
    // } else {
    //   // scaffoldKey.currentState!.showSnackBar(SnackBar(
    //   //   content: Text(value.message),
    //   //   duration: Duration(seconds: 2),
    //   // ));
    // }
    var body = jsonDecode(response.body);
    return body;
  }

  Future<List<Movements>> getMovements() async {
    var url =
        Uri.parse("http://5.189.149.105:8095/epi/modules/api/external.php");

    var map = <String, dynamic>{};

    map["type"] = "getmovements";

    final response = await http.post(url, body: map);

    List data = jsonDecode(response.body);

    List<Movements> movements = data
        .map(
          (item) => Movements.fromJson(item),
        )
        .toList();
    return movements;
  }

  Future postMovements(
      String source,
      String target,
      String rofficer,
      String aofficer,
      String iofficer,
      String reofficer,
      String description,
      String pres,
      String ref) async {
    var map = <String, dynamic>{};

    map["authorizing_officer"] = aofficer;
    map["issuing_officer"] = iofficer;
    map["receiving_officer_id"] = rofficer;
    map["requisitioning_officer_id"] = reofficer;
    // map["movement_date"] = pass;
    map["description"] = description;
    map["document_reference"] = ref;
    map["source_location_id"] = source;
    map["target_location_id"] = target;
    map["responsible_person"] = pres;
    map["user_id"] = "admin";
    map["type"] = "movements";

    var url =
        Uri.parse("http://5.189.149.105:8095/epi/modules/api/external.php");

    final response = await http.post(url, body: map);

    return response;
  }

  Future<List<CheckoutItems>> getCheckoutitems() async {
    var url =
        Uri.parse("http://5.189.149.105:8095/epi/modules/api/external.php");

    var map = <String, dynamic>{};

    map["type"] = "getitems";

    final response = await http.post(url, body: map);

    List data = jsonDecode(response.body);

    List<CheckoutItems> items = data
        .map(
          (item) => CheckoutItems.fromJson(item),
        )
        .toList();

    return items;
  }


  Future<List<CheckinItems>> getCheckinitems() async {
    var url =
        Uri.parse("http://5.189.149.105:8095/epi/modules/api/external.php");

    var map = <String, dynamic>{};

    map["type"] = "getmovementitems";

    final response = await http.post(url, body: map);

    List data = jsonDecode(response.body);

    List<CheckinItems> items = data
        .map(
          (item) => CheckinItems.fromJson(item),
        )
        .toList();

    return items;
  }
}
