import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapRepo {
  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<LatLng?> getCurrentLatLng() async {
    final position = await _determinePosition();
    if (position != null) {
      return LatLng(
        position.latitude,
        position.longitude,
      );
    }
    return null;
  }

  Future<void> navigateToMarker(
      LatLng currentPosition, LatLng destination) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude},${currentPosition.longitude}&destination=${destination.latitude},${destination.longitude}&travelmode=driving";

    if (await canLaunchUrl(
      Uri.parse(
        googleMapsUrl,
      ),
    )) {
      await launchUrl(
        Uri.parse(
          googleMapsUrl,
        ),
      );
    } else {
      throw 'Could not open Google Maps.';
    }
  }
}
