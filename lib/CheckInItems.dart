import 'package:flutter/material.dart';
import 'package:smsapp/CreateTransfer.dart';
// import 'models/movements.dart';
import 'package:smsapp/models/movements.dart';
import 'package:smsapp/api/api_service.dart';
import 'ItemsCheckingIn.dart';
import 'column_builder.dart';

class CheckInItems extends StatefulWidget {
  const CheckInItems({Key? key}) : super(key: key);

  @override
  _CheckInItemsState createState() => _CheckInItemsState();
}

class _CheckInItemsState extends State<CheckInItems> {
  late Future<List<Movements>> movements;
  APIService service = APIService();

  Future<List<Movements>> getData() async {
    List<Movements> movements = await service.getMovements();

    return movements;
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
          title: const Text("CHECK IN ITEMS")),
      body: SingleChildScrollView(child: listData()),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.refresh),
        label: const Text("Sync"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomeMaterial())
          );
      }),
    );
  }

  Container listData() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Movements>>(
        future: movements,
        builder:
            (BuildContext context, AsyncSnapshot<List<Movements>> snapshot) {
          if (snapshot.hasData) {
            List<Movements>? mvnt = snapshot.data;
            return ColumnBuilder(
              itemCount: mvnt!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text('${mvnt[index].description}'),
                        subtitle: Text(
                            '${mvnt[index].movementDate} | ${mvnt[index].sourceLocationId} | ${mvnt[index].targetLocationId}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text("Status: Ongoing"),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('Pieces : 0'),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => const ItemsCheckingIn()));
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
              textDirection: TextDirection.ltr,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Could not fetch data!",
                style: TextStyle(
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
    );
  }
}
