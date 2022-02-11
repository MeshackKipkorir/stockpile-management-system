import 'package:flutter/material.dart';
import 'Items.dart';
import 'api/api_service.dart';
import 'column_builder.dart';
import 'models/movements.dart';

class CheckOutItems extends StatefulWidget {
  const CheckOutItems({Key? key}) : super(key: key);

  @override
  _CheckOutItemsState createState() => _CheckOutItemsState();
}

class _CheckOutItemsState extends State<CheckOutItems> {
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
          title: const Text("CHECKOUT TRANSFER LIST")),
      body: SingleChildScrollView(child: listData()),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.refresh),
          label: const Text("Sync"),
          onPressed: () {
            onPressed:
            () {
              Navigator.pushNamed(context, '/second');
            };
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
                                  MaterialPageRoute(builder: (_) => Items()));
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
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "Could not fetch data!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
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
