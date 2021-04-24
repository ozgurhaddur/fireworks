import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class taxitrips {
  //kullanıcı bilgilerini oluşturduğumuz sınıf

  int passenger;
  int drop;
  String dolocation;
  double distance;

  taxitrips({this.passenger, this.drop, this.dolocation, this.distance});

  factory taxitrips.createfromdocument(DocumentSnapshot doc) {
    return taxitrips(
      passenger: doc.data["passenger_count"],
      drop: doc.data["tpep_dropoff_datetime"],
      dolocation: doc.data["DOLocationID"],
      distance: doc.data["trip_distance"],
    );
  }
}
