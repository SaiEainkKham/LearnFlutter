import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place/helpers/db_helper.dart';

import 'package:great_place/models/place.dart';

class GreatPlaces with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: PlaceLocation(latitude: 0.2, longitude: 0.2, address: 'asdf'),
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
