import 'package:cloud_firestore/cloud_firestore.dart';

class Controller {
  Future<void> calculateTime() async {
    print("calculateTime");
    String busID = "";
    String email = "john@gmail.com";
    double speed = 0;
    double etr = 0.0;
    CollectionReference routes =
        FirebaseFirestore.instance.collection('routes');
    final doc = await routes.where("routeId", isEqualTo: "R1").limit(1).get();
    if (doc.docs.isNotEmpty) {
      busID = doc.docs.first['currentBus'];
      print("Bus ID:- " + busID);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final userDoc =
          await users.where("email", isEqualTo: email).limit(1).get();
      if (userDoc.docs.isNotEmpty) {
        final totalDistance = userDoc.docs.first['totalDistance'];
        print("totalDistance: " + totalDistance.toString());
        final liveDistance = userDoc.docs.first['liveDistance'];
        final currentLocation = userDoc.docs.first['currentLocation'];
        print("liveDistance: " + liveDistance.toString());
        print("Current User Location: " + currentLocation.toString());

        CollectionReference buses =
            FirebaseFirestore.instance.collection('bues');
        final busDoc =
            await buses.where("busId", isEqualTo: busID).limit(1).get();
        if (busDoc.docs.isNotEmpty) {
          final currentBusLocation = busDoc.docs.first['currentLocation'];
          final List speedPoints = List<dynamic>.from(
              busDoc.docs.first["speedPoints"].map((x) => x));

          print("Current Bus Location: " + currentBusLocation.toString());
          print("Current Bus speedPoints: " + speedPoints.toString());

          for (final d in speedPoints) {
            speed += (d["distance"] / (d["time"] / 60)) / speedPoints.length;
          }
          print("Speed:- " + speed.toStringAsFixed(2) + "km/hr");
        }
        etr = (liveDistance/speed)*60;
        print("Estimated time in mins:- "+ etr.toStringAsFixed(0));
      }
    }
  }
}
