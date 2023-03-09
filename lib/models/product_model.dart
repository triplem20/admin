import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  // final int? index;

  const Product({
    this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    // this.index,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? imageUrl,
    double? price,
    // int? index,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
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
    price,
    imageUrl,
    // index,
  ];

  static List<Product> products = const [

    Product(
        id: '1',
        name: 'Glass cleaner',
        category: 'Home',
        price: 4000.99,
        imageUrl:
        'https://www.google.com/search?q=office+cleaning&tbm=isch&ved=2ahUKEwiyvd6zjpr9AhVjpCcCHTF8BD0Q2-cCegQIABAA&oq=office+cle&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoECCMQJzoHCCMQ6gIQJzoECAAQQzoECAAQAzoHCAAQsQMQQzoFCAAQsQM6CAgAEIAEELEDUJ4HWKI2YK9BaAJwAHgEgAHMA4gBiCOSAQkwLjcuNS4yLjOYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=7CruY7KXIOPInsEPsfiR6AM&bih=695&biw=1349&hl=en-GB#imgrc=oRWTGy34QyZd0M'
    ),
    Product(
      id: '2',
      name: 'Floor cleaner',
      category: 'Home',
      price: 4000.99,
      imageUrl:
      'https://www.google.com/search?q=house+cleaning&tbm=isch&ved=2ahUKEwjnl4HUkJr9AhWFW6QEHQc4AggQ2-cCegQIABAA&oq=house+clea&gs_lcp=CgNpbWcQARgAMgcIABCxAxBDMgQIABBDMgcIABCxAxBDMgQIABBDMgQIABBDMgQIABBDMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoECCMQJzoHCCMQ6gIQJzoICAAQgAQQsQNQkwJYzCNg-ytoAXAAeASAAYIEiAGYIJIBCzAuNy4zLjEuMy4xmAEAoAEBqgELZ3dzLXdpei1pbWewAQrAAQE&sclient=img&ei=SS3uY6fPBIW3kdUPh_CIQA&bih=695&biw=1349&hl=en-GB#imgrc=2PRNBUqDd7apxM',
    ),

    Product(
      id: '3',
      name: 'Bug terminator',
      category: 'Home',
      price: 4000.99,
      imageUrl:
      'https://www.google.com/search?q=office+cleaning&tbm=isch&ved=2ahUKEwiyvd6zjpr9AhVjpCcCHTF8BD0Q2-cCegQIABAA&oq=office+cle&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoECCMQJzoHCCMQ6gIQJzoECAAQQzoECAAQAzoHCAAQsQMQQzoFCAAQsQM6CAgAEIAEELEDUJ4HWKI2YK9BaAJwAHgEgAHMA4gBiCOSAQkwLjcuNS4yLjOYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=7CruY7KXIOPInsEPsfiR6AM&bih=695&biw=1349&hl=en-GB#imgrc=oRWTGy34QyZd0M',
    ),
    Product(
        id: '4',
        name: 'Furniture cleaner',
        category: 'Home',
        price: 4000.99,
        imageUrl:
        'https://www.google.com/search?q=furniture+cleaning&tbm=isch&ved=2ahUKEwjNlYvwj5r9AhXzmycCHe8jBQ0Q2-cCegQIABAA&oq=furniture+cleaning&gs_lcp=CgNpbWcQAzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6BAgjECc6BwgjEOoCECc6BwgAELEDEEM6BAgAEAM6CAgAELEDEIMBOgQIABBDOgUIABCxAzoICAAQgAQQsQNQ0AJY5nZg-HhoBXAAeASAAYIEiAGwN5IBDTAuMTIuMTAuMi4zLjGYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=dyzuY43-H_O3nsEP78eUaA&bih=695&biw=1349&hl=en-GB#imgrc=FbBT24W9_NA-BM'
    ),

  ];
}
