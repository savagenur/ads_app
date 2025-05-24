import 'package:ads_app/core/constants/design_dimension.dart';
import 'package:ads_app/core/extensions/to_build_context_extension.dart';
import 'package:ads_app/view_models/map/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late LatLng _center;
  LatLng _initialPosition =
      LatLng(37.7749, -122.4194); // Default to San Francisco
  Set<Marker> _markers = {};
  void getMarkers(MapViewModel mapViewModel) {
    Set<Marker> markers = {};
    for (var i = 0; i < 5; i++) {
      LatLng position = LatLng(37.219983 + double.parse("0.${i + 1}"),
          -121.899 + double.parse("0.${i + 1}"));
      final marker = Marker(
        markerId: MarkerId("$i"),
        position: position,
        visible: true,
        icon: AssetMapBitmap(
          "assets/kfc.png",
          width: 30,
        ),
        // infoWindow: InfoWindow(
        //   title: "KFC"
        // ),
        onTap: () async {
          await showBarModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: DDimens.bigPadding.all,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "KFC",
                      style: context.textTheme.titleLarge,
                    ),
                    DDimens.bigPadding.verticalBox,
                    Image.asset("assets/kfc.png"),
                    DDimens.bigPadding.verticalBox,
                    Text(
                        "Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions Descriptions "),
                    DDimens.bigPadding.verticalBox,
                    ElevatedButton.icon(
                      onPressed: () async {
                        await mapViewModel.navigateToMarker(_center, position);
                      },
                      label: Text("Построить маршрут"),
                      icon: Icon(
                        Icons.navigation_rounded,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      );
      markers.add(marker);
    }
    setState(() {
      _markers = markers;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MapViewModel>().getCurrentLatLng();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapViewModel>(
        builder: (context, mapViewModel, child) {
          switch (mapViewModel.currentPositionEnum) {
            case CurrentPositionEnum.loaded:
              _center = mapViewModel.currentPosition!;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getMarkers(mapViewModel);
              });
              return GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                markers: _markers,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11,
                ),
              );
            case CurrentPositionEnum.error:
              return Center(
                child: Text("Error"),
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
