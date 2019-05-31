// import "package:cloud_firestore/cloud_firestore.dart";

// final Firestore firestore = Firestore.instance;
// final CollectionReference counters = firestore.collection("ios_test");
// final DocumentReference document = counters.document("counter");

// // This function is not gonna be used, cuz Isaac is a monster who
// // will definitely pass 20K presses in a day.
// // But it still teaches how to do transactions, so...

// // Future<void> addOne() async => await firestore.runTransaction(
// // 	(Transaction transaction) async {
// // 		DocumentSnapshot snapshot = await transaction.get(document);
// // 		if (snapshot.exists) await transaction.update(
// // 			document, 
// // 			<String, dynamic> {
// // 				"count": snapshot.data ["count"] + 1
// // 			}
// // 		);
// // 	}
// // );

// Future<int> getCount() async => (await document.get()).data ["count"];

// Future<void> setCount(int value) => document.updateData(
// 	<String, dynamic>{
// 		"count": value
// 	}
// );