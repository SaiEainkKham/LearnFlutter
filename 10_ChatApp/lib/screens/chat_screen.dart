import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (ctx, dataSnapshot) => Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chats/Uq6GShKMpW62LIIyl9QC/messages')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final docsData = streamSnapshot.data!.docs;

            return ListView.builder(
              itemCount: docsData.length,
              itemBuilder: (context, index) {
                final dataMap = docsData[index].data() as Map<String, dynamic>;
                final textValue = dataMap['text'] ?? 'a';
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textValue),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/Uq6GShKMpW62LIIyl9QC/messages')
                .add({'text': 'This is added by clicking the button!'});
          },
        ),
      ),
    );
  }
}
