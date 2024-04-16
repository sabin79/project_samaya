import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeDetailPage extends StatelessWidget {
  const EmployeeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Detail'),
        centerTitle: true,
      ),
      body: Column(children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Employee Details')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data?.docs[index]);

                    return ListTile(
                      leading:
                          Text(snapshot.data?.docs[index]['name']?[0] ?? ''),
                      title: Text(snapshot.data?.docs[index]['name']),
                      subtitle: Text(snapshot.data?.docs[index]['department']),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasData.toString()),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ]),
    );
  }
}
