import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("apartments")
          .doc('Y0Dcltye3I0EAEjfHT2Q')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('nima nic'));
        } else if (snapshot.hasError) {
          return Center(child: Text('i chuj'));
        } else if (snapshot.hasData) {
          dynamic data = snapshot.data!.data();
          return data == null
              ? Center(child: Text("Brak zakupów"))
              : ListView.builder(
                  itemCount: data["shopping"].length,
                  itemBuilder: ((context, index) {
                    // return Center(
                    //   child: Card(
                    //     elevation: 0,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         color: Theme.of(context).colorScheme.outline,
                    //       ),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(12)),
                    //     ),
                    //     child: InkWell(
                    //       splashColor: Colors.blue.withAlpha(30),
                    //       onTap: () {
                    //         debugPrint('Card tapped.');
                    //       },
                    //       child: const SizedBox(
                    //         width: 300,
                    //         height: 100,
                    //         child: Center(child: Text('Outlined Card')),
                    //       ),
                    //     ),
                    //   ),
                    // );
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: 50.0,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 46, 64, 64),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data["shopping"][index]["type"]),
                          Text(data["shopping"][index]["amount"].toString()),
                        ],
                      ),
                    );
                  }),
                );
        }
        return Container();
      },
    );
  }
}
