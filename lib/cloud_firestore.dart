import "package:cloud_firestore/cloud_firestore.dart";

final Firestore firestore = Firestore.instance;
final CollectionReference counters = firestore.collection("ios_test");
final DocumentReference document = counters.document("counter");

Future<void> addOne() => firestore.runTransaction(
	(Transaction transaction) async {
		DocumentSnapshot snapshot = await transaction.get(document);
		if (snapshot.exists) await transaction.update(
			document, 
			<String, dynamic> {
				"count": ++snapshot.data ["count"]
			}
		);
	}
);
