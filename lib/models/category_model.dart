import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'index': index,
    };
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  @override
  List<Object> get props => [id, name, description, imageUrl, index];

  static List<Category> categories = const [
    Category(
      id: '1',
      name: 'Home',
      description: 'House cleaning services',
      imageUrl: 'images/house.png',
      index: 0,
    ),
    Category(
      id: '2',
      name: 'Office',
      description: 'Office cleaning services',
      imageUrl: 'images/office.png',
      index: 1,
    ),
    Category(
      id: '3',
      name: 'Building',
      description: 'Complete building cleaning services',
      imageUrl: 'images/building.png',
      index: 2,
    ),

  ];
}
