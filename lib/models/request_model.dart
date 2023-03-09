import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final String status;
  // final int? index;

  const Request({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.status,
    // this.index,
  });

  Request copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    String? status,
    // int? index,
  }) {
    return Request(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      status: status ?? this.status,
      // index: index ?? this.index,
    );
  }

  /* Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      // index: snap['index'],
    );
  }*/

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    description,
    price,
    imageUrl,
    status,
    // index,
  ];

  static List<Request> requests = const [
    Request(
      id: '1',
      name: 'Office Cleaning',
      category: 'Office',
      description: 'Cleaning of Office',
      status: 'Pending..',
      price: 4000.99,
      imageUrl:
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Request(
      id: '2',
      name: 'Office furniture',
      category: 'Office',
      description: 'Tomatoes, mozzarella, basil',
      status: 'Accepted',
      price: 4000.99,
      imageUrl:
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Request(
      id: '3',
      name: 'Window Cleaning',
      category: 'Building',
      description: 'Cleaning of building windows',
      status: 'Pending..',
      price: 4000.99,
      imageUrl:
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Request(
      id: '4',
      name: 'House Cleaning',
      category: 'Home',
      status: 'Pending..',
      description: 'Cleaning of house',
      price: 4000.99,
      imageUrl:
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Request(
      id: '5',
      name: 'Furniture Cleaning',
      category: 'Home',
      status: 'Rejected',
      description: 'Cleaning of house furniture',
      price: 1000.99,
      imageUrl:
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),

  ];
}
