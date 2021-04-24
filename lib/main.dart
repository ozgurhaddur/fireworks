import 'package:fireworks/models/taximap.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireworks/models/taxitrips.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: giris(),
    );
  }
}

// ignore: camel_case_types
class giris extends StatefulWidget {
  @override
  _girisState createState() => _girisState();
}

// ignore: camel_case_types
class _girisState extends State<giris> {
  final db = Firestore.instance;

  Future<List<taxitrips>> get getinformationsmap async {
    QuerySnapshot snapshot = await db.collection("taxitrips").getDocuments();
    List<taxitrips> trips = snapshot.documents
        .map((doc) => taxitrips.createfromdocument(doc))
        .toList();
    return trips;
  }

  @override
  void initState() {
    //initState fonksiyonu çalıştırmak için gereklidir.
    super.initState();
    //bastırılması istenen fonksiyon girilir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context)
            .primaryColor, //arka planda kullanılacak rengin birden çok kullanımında kolaylık sağlar.
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/edsel-ranger-392745__340.jpg"))),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("TaxiMap",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                //boşluk sağlar
                height: 35.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(20.0),
                elevation: 7.0, //Container gölge sağlar.
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: InkWell(
                          //buton tıklama metodu
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Sorgu1();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Sorgu 1",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Sorgu2();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Sorgu 2",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Sorgu3();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Sorgu 3",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      //Container içinde dekor yapmamızı sağlıyor
                      gradient: LinearGradient(
                          //Container dekoru içinde renk,yerleşim düzenlemeleri için kullanıldı
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.yellow[300],
                            Colors.yellow[200],
                          ]),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                          20.0)), //Container köşelerini düzenliyor

                  //alignment: Alignment(1,0),//Container içindeki yazıyı hizalar.(koordinat düzleminde)
                  alignment: Alignment
                      .center, //Container içindeki yazıyı hizalar.(top,bottom,left,right,center şeklinde)
                  width: MediaQuery.of(context).size.width -
                      100.0, //cihazla ilgili sorgulama yapar
                  height: 288.0,
                ),
              )
            ],
          ),
        ));
  }
}

class Sorgu1 extends StatefulWidget {
  @override
  _Sorgu1State createState() => _Sorgu1State();
}

class _Sorgu1State extends State<Sorgu1> {
  // En uzun mesafeli 5 yolculuktaki gun ve mesafeleri listelenmesi

  String sendDate(var time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    var formatted = DateFormat.yMMMMEEEEd().format(date).toString();

    return formatted;
  }

  final db = Firestore.instance;

  Future<List<taxitrips>> get usersquery async {
    //En uzun mesafeli 5 yolculuktaki gun ve mesafelerin listelenmesi
    QuerySnapshot snapshot = await db
        .collection("taxitrips")
        .orderBy("trip_distance", descending: true)
        .limit(5)
        .getDocuments();
    List<taxitrips> trips = snapshot.documents
        .map((doc) => taxitrips.createfromdocument(doc))
        .toList();
    return trips; //where metodu veriye sorgu yapmamıza yardımcı oluyor.
  }

  @override
  Widget build(BuildContext context) {
    //Veritabanından çekilen veriyi mobilde gösteren fonksiyon
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: Text(
            "Sorgu 1",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        //arka planda kullanılacak rengin birden çok kullanımında kolaylık sağlar.
        body: FutureBuilder<List<taxitrips>>(
            future: usersquery,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(
                          (sendDate(snapshot.data[position].drop).toString()),
                        ),
                        subtitle: Text(
                          ((snapshot.data[position].distance).toString() +
                              " km"),
                        ));
                  });
            }));
  }
}

class Sorgu2 extends StatefulWidget {
  @override
  _Sorgu2State createState() => _Sorgu2State();
}

class _Sorgu2State extends State<Sorgu2> {
  final db = Firestore.instance;
  static int value = 0;
  //Location location = Location();
  String dropdownValue = "Newark Airport";

  DateTime _date1 = DateTime.fromMillisecondsSinceEpoch(1607850495000);
  DateTime _date2 = DateTime.fromMillisecondsSinceEpoch(1608921383000);

  Future<List<taximap>> distanceInfo() async {
    var snapshot = await db
        .collection("taximap")
        .where("zone", isEqualTo: dropdownValue)
        .limit(1)
        .getDocuments();
    List<taximap> alanlar = snapshot.documents
        .map((doc) => taximap.createfromdocument(doc))
        .toList();
    value = alanlar[0].locid;
    return alanlar; //where metodu veriye sorgu yapmamıza yardımcı oluyor.
  }

  Future<List<taxitrips>> getData() async {
    distanceInfo();
    QuerySnapshot snapshot = await db
        .collection("taxitrips")
        .where("tpep_dropoff_datetime",
            isGreaterThanOrEqualTo: convertDate(_date1))
        .where("tpep_dropoff_datetime",
            isLessThanOrEqualTo: convertDate(_date2))
        .where("DOLocationID", isEqualTo: value.toString())
        .getDocuments();

    List<taxitrips> trips = snapshot.documents
        .map((doc) => taxitrips.createfromdocument(doc))
        .toList();

    return trips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: Text(
            "Sorgu 2",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column());
  }

  void onDayChange(DateTime day) {
    setState(() {
      _date1 = day;
    });
  }

  void onDayChange2(DateTime day) {
    setState(() {
      _date2 = day;
    });
  }
}

String sendDate(var timeInMillis) {
  var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis * 1000);
  var formattedDate = DateFormat.yMMMMd('tr').format(date).toString();
  return formattedDate;
}

int convertDate(DateTime x) {
  int date = x.millisecondsSinceEpoch;
  // ignore: division_optimization
  return ((date / 1000)).toInt();
}

class Sorgu3 extends StatefulWidget {
  @override
  _Sorgu3State createState() => _Sorgu3State();
}

class _Sorgu3State extends State<Sorgu3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "Sorgu 3",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      //body: Center(child: Text("Sorgu 3")),
    );
  }
}
