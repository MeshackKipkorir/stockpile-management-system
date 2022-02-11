import 'package:flutter/material.dart';
import 'CheckoutItems.dart';
import 'api/api_service.dart';
import 'column_builder.dart';
import 'models/checkoutitems.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  static const String _title = 'CheckOut Items';

  late Future<List<CheckoutItems>> movements;
  APIService service = APIService();

  Future<List<CheckoutItems>> getData() async {
    List<CheckoutItems> items = await service.getCheckoutitems();

    return items;
  }

  @override
  void initState() {
    super.initState();
    movements = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(_title)),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<CheckoutItems>>(
            future: movements,
            builder: (BuildContext context,
                AsyncSnapshot<List<CheckoutItems>> snapshot) {
              if (snapshot.hasData) {
                List<CheckoutItems>? mvnt = snapshot.data;
                return ColumnBuilder(
                  itemCount: mvnt!.length,
                  itemBuilder: (context, index) {
                    return myData(
                        mvnt[index].iD,
                        mvnt[index].itemtype,
                        mvnt[index].weight,
                        mvnt[index].type,
                        mvnt[index].iL,
                        mvnt[index].cIR,
                        mvnt[index].filename,
                        mvnt[index].location);
                  },
                  textDirection: TextDirection.ltr,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    // "Could not fetch data!",
                    snapshot.error.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return const SizedBox(
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }

  myData(String? id, String? type, String? weight, String? tType, String? iL,
      String? cR, String? filename, String? location) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(.2),
              width: 1,
            ),
          ),
          child: Container(
            width: 400,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('assets/asset/images/logo.jpeg'),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              id!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'Type $tType|Weight : $weight',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'OT 111|L $iL C|R$cR',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 50, top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(20, 40)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Row(children: [
                                        Image.asset(
                                          'assets/asset/images/horn.jpeg',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 50,
                                          fit: BoxFit.contain,
                                        ),
                                      ]),
                                      content: Text(
                                        "$id \n Type T|Weight : $weight \n $location",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: const Text("CHECK OUT"),
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const CheckOutItems()));
                                            }),
                                        FlatButton(
                                            child: const Text("CANCEL"),
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ]);
                                });
                          },
                          child: const Text('CHECK OUT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
