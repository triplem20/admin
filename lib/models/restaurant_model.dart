import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/models/models.dart';

class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final List<String>? tags;
  final List<Category>? categories;
  final List<Service>? services;
  final List<OpeningHours>? openingHours;

  const Restaurant({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.tags,
    this.categories,
    this.services,
    this.openingHours,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imageUrl,
      description,
      tags,
      categories,
      services,
      openingHours
    ];
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,
    List<String>? tags,
    List<Category>? categories,
    List<Service>? services,
    List<OpeningHours>? openingHours,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      categories: categories ?? this.categories,
      services: services ?? this.services,
      openingHours: openingHours ?? this.openingHours,
    );
  }
/*
  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      'imageUrl': imageUrl ?? '',
      'description': description ?? '',
      'tags': tags ?? [],
      'categories': categories!.map(
        (category) {
          return category.toDocument();
        },
      ).toList(),
      'products': products!.map(
        (product) {
          return product.toDocument();
        },
      ).toList(),
      'openingHours': openingHours!.map(
        (openingHour) {
          return openingHour.toDocument();
        },
      ).toList(),
    };
  }

  String toJson() => json.encode(toDocument());

  // factory RestaurantOne.fromJson(String source) => RestaurantOne.fromMap(json.decode(source));

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List).map(
        (tag) {
          return tag as String;
        },
      ).toList(),
      categories: (snap['categories'] as List).map(
        (category) {
          return Category.fromSnapshot(category);
        },
      ).toList(),
      products: (snap['products'] as List).map(
        (product) {
          return Product.fromSnapshot(product);
        },
      ).toList(),
      openingHours: (snap['openingHours'] as List).map(
        (openingHour) {
          return OpeningHours.fromSnapshot(openingHour);
        },
      ).toList(),
    );
  }*/

  static List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://www.google.com/search?q=top+care+cleaning+brand&tbm=isch&ved=2ahUKEwjOrYq1xJ39AhVokCcCHbIYC6cQ2-cCegQIABAA&oq=top+care+cleaning+brand&gs_lcp=CgNpbWcQAzoECCMQJzoGCAAQCBAeUI4dWJo3YPs_aABwAHgAgAGaAogBghCSAQUwLjYuNJgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=NvbvY866BOignsEPsrGsuAo&bih=695&biw=1366#imgrc=jOCewBuCGXMR0M',
      description: 'This is the description.',
      tags: const ['Domestic', 'Organization'],
      categories: Category.categories,
      services: Service.services,
      openingHours: OpeningHours.openingHoursList,
    ),
  ];
}
