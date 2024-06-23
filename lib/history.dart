import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteHistoryItem(String documentId) {
    FirebaseFirestore.instance.collection('predictions').doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: const Center(
          child: Text('No user signed in'),
        ),
      );
    }

    print('Current user UID: ${user.uid}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('predictions')
            .where('userId', isEqualTo: user.uid)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print('No history data found');
            return const Center(child: Text('No history found'));
          }

          print('Data found: ${snapshot.data!.docs.length} items');

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              // Ensure all necessary fields are present in the document
              if (data.containsKey('imageUrl') &&
                  data.containsKey('label') &&
                  data.containsKey('confidence')) {
                return Card(
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, data['imageUrl']);
                      },
                      child: Image.network(data['imageUrl']),
                    ),
                    title: Text(data['label']),
                    subtitle: Text('Confidence: ${data['confidence'].toStringAsFixed(2)}%'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteHistoryItem(document.id);
                      },
                    ),
                  ),
                );
              } else {
                // Handle the case where necessary fields are missing
                return const ListTile(
                  title: Text('Invalid data'),
                  subtitle: Text('Some data fields are missing'),
                );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
