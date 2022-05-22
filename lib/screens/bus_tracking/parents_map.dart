import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as loc;
import 'package:schoolcrm/constans/colors.dart';
import 'package:custom_map_markers/custom_map_markers.dart';

class ParentsMap extends StatefulWidget {
  @override
  State<ParentsMap> createState() => _ParentsMapState();
}

class _ParentsMapState extends State<ParentsMap> {
  final loc.Location location = loc.Location();
  GoogleMapController _controller;
  bool _added = false;
  BitmapDescriptor busIcon;

  List<MarkerData> customMarkers;



  @override
  void initState() {
    super.initState();
    _requestPermission();

      customMarkers = [
       MarkerData(
       marker: Marker(markerId: MarkerId("mID"),position: LatLng(33.513894,36.276532)),
       child: _customMarker3("Driver name \n0937731544", Colors.black),

    )
     ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("location").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              print("Empty Snapshot");
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {

              print("!Empty Snapshot");

              return CustomGoogleMapMarkerBuilder(
                customMarkers: customMarkers,
                builder: (BuildContext context, Set<Marker> markers){

                  return GoogleMap(
                    mapType: MapType.normal,

                    markers:
                      /*Marker(
                          position: LatLng(snapshot.data.docs.first["latitude"],
                            snapshot.data.docs.first["longitude"],
                          ),
                          markerId: MarkerId('id'),
                          icon: BitmapDescriptor.defaultMarker,


                      )*/
                      markers,

                    initialCameraPosition: CameraPosition(
                      zoom: 17.0,
                      target: LatLng(snapshot.data.docs.first["latitude"],
                        snapshot.data.docs.first["longitude"],
                      ),
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      setState(() {
                        _controller = controller;
                        _added = true;
                      });
                    },
                  );



                }





              );







            }
          }),
    );
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted)
      print("Done");
    else if (status.isDenied) {
      print("isDenied");
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      print("isPermanentlyDenied");
      location.requestPermission();
      //openAppSettings();

    }
  }

  Future<void> myMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(33.513894, 36.276532
          /*snapshot.data.docs.first["latitude"],
        snapshot.data.docs.first["longitude"],*/
          ),
      zoom: 18,
    )));
  }


  _customMarker3(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: color, blurRadius: 6)]),
      child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }

/*Align(
                    //alignment: Alignment.lerp(a, b, t),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      ),
                      width: MediaQuery.of(context).size.width - 30,
                      height: 50,
                    ),
                  )*/

}
