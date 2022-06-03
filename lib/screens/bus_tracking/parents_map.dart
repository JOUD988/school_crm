import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as loc;
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:schoolcrm/screens/bus_tracking/componants/custom_sliding_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ParentsMap extends StatefulWidget {

  @override
  State<ParentsMap> createState() => _ParentsMapState();

}

class _ParentsMapState extends State<ParentsMap> {
  final loc.Location location = loc.Location();
  GoogleMapController _controller;
  bool _added = false;
  BitmapDescriptor busIcon;
  Set<Marker> markers = Set();


  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
        'assets/images/myBus.png')
        .then((onValue) {
      busIcon = onValue;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("drivers").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              print("Empty Snapshot");
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              print("!Empty Snapshot");
              if (_added) myMap(snapshot);


              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                        markerId: MarkerId("id"),
                        position: LatLng(snapshot.data.docs.first["latitude"],snapshot.data.docs.first["longitude"]),
                        icon: busIcon,
                      )
                    },
                    initialCameraPosition: CameraPosition(
                      zoom: 15.0,
                      target: LatLng(
                        snapshot.data.docs.first["latitude"],
                        snapshot.data.docs.first["longitude"],
                      ),
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      setState(() {
                        _controller = controller;
                        _added = true;
                      });
                    },
                  ),
                  CustomSlidingUpPanel(
                    driverName: snapshot.data.docs.first["name"],
                    driverPhoneNumber: snapshot.data.docs.first['number'],
                  )

                ],
              );
            }
          }
          ),
    );
  }



  Future<void> myMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        snapshot.data.docs.first["latitude"],
        snapshot.data.docs.first["longitude"],
      ),
      zoom: 15,
    )));
  }


}