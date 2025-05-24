import 'package:ads_app/core/utils/utils.dart';
import 'package:ads_app/repositories/map_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum CurrentPositionEnum {
  initial,
  loaded,
  loading,
  error,
}

class MapViewModel extends ChangeNotifier {
  final MapRepo _mapRepo = MapRepo();
  LatLng? _currentPosition;
  LatLng? get currentPosition => _currentPosition;
  CurrentPositionEnum _currentPositionEnum = CurrentPositionEnum.initial;
  CurrentPositionEnum get currentPositionEnum => _currentPositionEnum;

  Future<LatLng?> getCurrentLatLng() async {
    _currentPositionEnum = CurrentPositionEnum.loading;
    notifyListeners();
    _currentPosition = await _mapRepo.getCurrentLatLng();
    if (_currentPosition == null) {
      _currentPositionEnum = CurrentPositionEnum.error;
    } else {
      _currentPositionEnum = CurrentPositionEnum.loaded;
    }
    notifyListeners();
    return _currentPosition;
  }

  Future<void> navigateToMarker(
      LatLng currentPosition, LatLng destination) async {
    try {
      await _mapRepo.navigateToMarker(currentPosition, destination);
    } catch (e) {
      snackBar(title: e.toString());
    }
  }
}
