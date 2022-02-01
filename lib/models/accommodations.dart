import 'package:flutter/material.dart';

class Accommodations {
  final String name, description, imageUrl, location;
  final int rating;
  final List<String> amenities;
  final Map<String, dynamic> costing;
  Accommodations({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.amenities,
    required this.costing,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'location': location,
      'amenities': amenities,
      'costing': costing
    };
  }
}

List<Accommodations> accommodations = [
  Accommodations(
      name: 'Hostel Plaza',
      description:
          'A 2 bhk flat with a spacious balcony near the andheri station with all the amenities in close range. Fully furnished.',
      imageUrl:
          'https://images.unsplash.com/photo-1623625434462-e5e42318ae49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      rating: 3,
      location: 'Andheri',
      amenities: [
        'WIFI',
        'Hot Water',
        'A/C',
        'Canteen',
        'Hot Water',
        'A/C',
        'Canteen',
      ],
      costing: {
        'rent': 40000,
        'duration': 'yearly'
      }),
  Accommodations(
      name: 'Hostel regal',
      description:
          'A 2 bhk flat with a spacious balcony near the andheri station with all the amenities in close range. Fully furnished.',
      imageUrl:
          'https://images.unsplash.com/photo-1520277739336-7bf67edfa768?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      rating: 3,
      location: 'Andheri',
      amenities: [
        'WIFI',
        'Hot Water',
        'A/C',
        'Canteen',
      ],
      costing: {
        'rent': 40000,
        'duration': 'quarterly'
      }),
  Accommodations(
      name: 'Hostel imperial',
      description:
          'A 2 bhk flat with a spacious balcony near the andheri station with all the amenities in close range. Fully furnished.',
      imageUrl:
          'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      rating: 3,
      location: 'Andheri (w) near 4 bunglows',
      amenities: [
        'WIFI',
        'Hot Water',
        'A/C',
        'Canteen',
      ],
      costing: {
        'rent': 40000,
        'duration': 'monthly'
      }),
];

List<Accommodations> favourites = [];
