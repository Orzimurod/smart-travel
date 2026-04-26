import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

enum PlaceCategory { bozor, kutubxona, restoran, park, tarix, museum }

extension PlaceCategoryExt on PlaceCategory {
  String get label {
    switch (this) {
      case PlaceCategory.bozor:
        return 'Bozor';
      case PlaceCategory.kutubxona:
        return 'Kutubxona';
      case PlaceCategory.restoran:
        return 'Restoran';
      case PlaceCategory.park:
        return 'Park';
      case PlaceCategory.tarix:
        return 'Tarix';
      case PlaceCategory.museum:
        return 'Muzey';
    }
  }

  Color get color {
    switch (this) {
      case PlaceCategory.bozor:
        return const Color(0xFFDCE6FA);
      case PlaceCategory.kutubxona:
        return const Color(0xFFD4EDDC);
      case PlaceCategory.restoran:
        return const Color(0xFFFCE4CB);
      case PlaceCategory.park:
        return const Color(0xFFD4EDDC);
      case PlaceCategory.tarix:
        return const Color(0xFFDCE6FA);
      case PlaceCategory.museum:
        return const Color(0xFFE8E4F8);
    }
  }
}

class Place {
  final String id;
  final String name;
  final PlaceCategory category;
  final double rating;
  final int reviews;
  final double distanceKm;
  final String address;
  final String description;
  final String workingHours;
  final String phone;
  final LatLng location;
  final IconData icon;

  const Place({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.distanceKm,
    required this.address,
    required this.description,
    required this.workingHours,
    required this.phone,
    required this.location,
    required this.icon,
  });
}

enum TransportType { piyoda, velosiped, metro, avto }

extension TransportTypeExt on TransportType {
  String get label {
    switch (this) {
      case TransportType.piyoda:
        return 'Piyoda';
      case TransportType.velosiped:
        return 'Velosiped';
      case TransportType.metro:
        return 'Metro';
      case TransportType.avto:
        return 'Avto';
    }
  }

  IconData get icon {
    switch (this) {
      case TransportType.piyoda:
        return Icons.directions_walk;
      case TransportType.velosiped:
        return Icons.directions_bike;
      case TransportType.metro:
        return Icons.subway;
      case TransportType.avto:
        return Icons.directions_car;
    }
  }
}

class Route {
  final String id;
  final String fromName;
  final String toName;
  final TransportType transport;
  final double distanceKm;
  final int durationMinutes;
  final int stops;

  const Route({
    required this.id,
    required this.fromName,
    required this.toName,
    required this.transport,
    required this.distanceKm,
    required this.durationMinutes,
    required this.stops,
  });
}

class SampleData {
  static final List<Place> places = [
    Place(
      id: '1',
      name: 'Chorsu bozori',
      category: PlaceCategory.bozor,
      rating: 4.8,
      reviews: 1234,
      distanceKm: 0.8,
      address: 'Eski shahar, Toshkent',
      description:
          'An\'anaviy o\'zbek bozori. Chorsu — Toshkentning eng qadimiy savdo markazlaridan biri bo\'lib, bu yerda mevalar, ziravorlar, hunarmandchilik buyumlari va milliy taomlarni topish mumkin.',
      workingHours: '06:00 — 20:00 · Ochiq',
      phone: '+998 71 123 45 67',
      location: LatLng(41.3261, 69.2347),
      icon: Icons.storefront,
    ),
    Place(
      id: '2',
      name: 'Amir Temur xiyoboni',
      category: PlaceCategory.park,
      rating: 4.7,
      reviews: 890,
      distanceKm: 1.5,
      address: 'Markaz, Toshkent',
      description:
          'Toshkent markazida joylashgan tarixiy xiyobon. Amir Temur haykali, fontanlar va go\'zal landshaft.',
      workingHours: '24 soat · Ochiq',
      phone: '+998 71 200 00 00',
      location: LatLng(41.3111, 69.2797),
      icon: Icons.park,
    ),
    Place(
      id: '3',
      name: 'Mustaqillik maydoni',
      category: PlaceCategory.park,
      rating: 4.9,
      reviews: 2100,
      distanceKm: 2.1,
      address: 'Markaz, Toshkent',
      description:
          'O\'zbekistonning bosh maydoni. Mustaqillik monumenti, xiyobonlar va davlat binolari bilan o\'ralgan.',
      workingHours: '24 soat · Ochiq',
      phone: '+998 71 200 00 01',
      location: LatLng(41.3111, 69.2406),
      icon: Icons.account_balance,
    ),
    Place(
      id: '4',
      name: 'Navoiy kutubxonasi',
      category: PlaceCategory.kutubxona,
      rating: 4.6,
      reviews: 456,
      distanceKm: 1.8,
      address: 'Mustaqillik shoh., Toshkent',
      description:
          'O\'zbekiston Milliy kutubxonasi. Millionlab kitoblar va qadimiy qo\'lyozmalar saqlanadi.',
      workingHours: '09:00 — 18:00',
      phone: '+998 71 232 83 92',
      location: LatLng(41.3083, 69.2500),
      icon: Icons.menu_book,
    ),
    Place(
      id: '5',
      name: 'Toshkent Touri',
      category: PlaceCategory.restoran,
      rating: 4.5,
      reviews: 678,
      distanceKm: 2.3,
      address: 'Shayxontohur, Toshkent',
      description:
          'Milliy taomlar restorani. Plov, manti, kabob va boshqa o\'zbek taomlarining eng yaxshi namunalari.',
      workingHours: '11:00 — 23:00',
      phone: '+998 71 244 55 66',
      location: LatLng(41.3242, 69.2401),
      icon: Icons.restaurant,
    ),
  ];

  static final List<Route> savedRoutes = [
    Route(
      id: 'r1',
      fromName: 'Mustaqillik',
      toName: 'Chorsu',
      transport: TransportType.piyoda,
      distanceKm: 3.2,
      durationMinutes: 42,
      stops: 5,
    ),
  ];
}
