import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class taximap {
  //kullanıcı bilgilerini oluşturduğumuz sınıf
  int amount;
  int drop;
  String zone;
  int locid;

  taximap({
    this.amount,
    this.drop,
    this.zone,
    this.locid,
  });

  factory taximap.createfromdocument(DocumentSnapshot doc) {
    return taximap(
      amount: doc.data["total_amount"],
      drop: doc.data["tpep_dropoff_datetime"],
      zone: doc.data["zone"],
      locid: doc.data["LocationID"],
    );
  }
}
