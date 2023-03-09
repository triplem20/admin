import 'package:equatable/equatable.dart';

class Filter extends Equatable {

  final String id;
  final String status;

  const Filter({
    required this.id,
    required this.status,

  });

  Filter copyWith({
    String? id,
    String? status,
    // int? index,
  }) {
    return Filter(
      id: id ?? this.id,
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
    status,
    // index,
  ];

  static List<Filter> filters = const [
    Filter(
      id: '1',
      status: 'Pending..',
    ),
    Filter(
      id: '2',
      status: 'Accepted',
    ),
    Filter(
      id: '3',
      status: 'Rejected',
    ),

  ];
}
