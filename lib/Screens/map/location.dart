import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Location extends StatefulWidget {
//   const Location({Key? key}) : super(key: key);

//   @override
//   State<Location> createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   // late GoogleMapController mapController;
//   Completer<GoogleMapController> mapController = Completer();
//   final LatLng _center = const LatLng(17.415271, 78.426272);
//   @override
//   // void dispose() {
//   //   // TODO: implement dispose
//   //   mapController.dispose();
//   //   super.dispose();
//   // }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController.complete(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Stack(children: [
//             GoogleMap(
              
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition:
//                     CameraPosition(target: _center, zoom: 14)),
//           ]),
//           floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.center_focus_strong),
//             onPressed: () async {
//               // mapController.animateCamera(CameraUpdate.newCameraPosition(
//               //     CameraPosition(target: _center)));
//               final GoogleMapController controller = await mapController.future;
//               controller.animateCamera(CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                       target: LatLng(37.43296265331129, -122.08832357078792))));
//             },
//           )),
//     );
//   }
// }
