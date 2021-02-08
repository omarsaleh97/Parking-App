import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:parking/models/place.dart';

class PlacesService {
  final key = "AIzaSyBgEZusLW3J-9mFzpfDRn0nTvqOrvcFRXY";

  Future<List<Place>> getPlaces(
      double lat, double lng, BitmapDescriptor icon) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place, icon)).toList();
  }
}
