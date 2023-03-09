import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  // final int? index;

  const Service({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    // this.index,
  });

  Service copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    // int? index,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
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
        description,
        price,
        imageUrl,
        // index,
      ];

  static List<Service> services = const [

    Service(
      id: '1',
      name: 'Office Cleaning',
      category: 'Office',
      description: 'Cleaning of Office',
      price: 4000.99,
      imageUrl:
      'https://www.google.com/search?q=office+cleaning&tbm=isch&ved=2ahUKEwiyvd6zjpr9AhVjpCcCHTF8BD0Q2-cCegQIABAA&oq=office+cle&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoECCMQJzoHCCMQ6gIQJzoECAAQQzoECAAQAzoHCAAQsQMQQzoFCAAQsQM6CAgAEIAEELEDUJ4HWKI2YK9BaAJwAHgEgAHMA4gBiCOSAQkwLjcuNS4yLjOYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=7CruY7KXIOPInsEPsfiR6AM&bih=695&biw=1349&hl=en-GB#imgrc=oRWTGy34QyZd0M'
    ),
    Service(
      id: '2',
      name: 'House Cleaning',
      category: 'Home',
      description: 'Cleaning of house',
      price: 4000.99,
      imageUrl:
    'https://unsplash.com/photos/_AK42TQRyCw'
    ),
    Service(
      id: '3',
      name: 'Bug Termination',
      category: 'Office',
      description: 'Complete termination of office bugs',
      price: 9000.99,
      imageUrl:
     'https://www.google.com/search?q=bug+termination+service+cartoon&tbm=isch&ved=2ahUKEwi-lujpj5r9AhWOpycCHfIrAfUQ2-cCegQIABAA&oq=bug+termination+service+cartoon&gs_lcp=CgNpbWcQAzoECCMQJ1DLBliqH2CqJGgAcAB4AIAB1AOIAasVkgEJMC4yLjMuMi4ymAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=aizuY765Fo7PnsEP8teEqA8&bih=695&biw=1349&hl=en-GB#imgrc=FBlBbB57bHYmeM'
    ),
    Service(
      id: '4',
      name: 'Office Cleaning',
      category: 'Office',
      description: 'Cleaning of Office',
      price: 4000.99,
      imageUrl:
      'https://www.google.com/search?q=office+cleaning&tbm=isch&ved=2ahUKEwiyvd6zjpr9AhVjpCcCHTF8BD0Q2-cCegQIABAA&oq=office+cle&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoECCMQJzoHCCMQ6gIQJzoECAAQQzoECAAQAzoHCAAQsQMQQzoFCAAQsQM6CAgAEIAEELEDUJ4HWKI2YK9BaAJwAHgEgAHMA4gBiCOSAQkwLjcuNS4yLjOYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=7CruY7KXIOPInsEPsfiR6AM&bih=695&biw=1349&hl=en-GB#imgrc=oRWTGy34QyZd0M',
    ),
    Service(
      id: '5',
      name: 'Office furniture',
      category: 'Office',
      description: 'Tomatoes, mozzarella, basil',
      price: 4000.99,
      imageUrl:
     'https://www.google.com/search?q=furniture+cleaning&tbm=isch&ved=2ahUKEwjNlYvwj5r9AhXzmycCHe8jBQ0Q2-cCegQIABAA&oq=furniture+cleaning&gs_lcp=CgNpbWcQAzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6BAgjECc6BwgjEOoCECc6BwgAELEDEEM6BAgAEAM6CAgAELEDEIMBOgQIABBDOgUIABCxAzoICAAQgAQQsQNQ0AJY5nZg-HhoBXAAeASAAYIEiAGwN5IBDTAuMTIuMTAuMi4zLjGYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=dyzuY43-H_O3nsEP78eUaA&bih=695&biw=1349&hl=en-GB#imgrc=FbBT24W9_NA-BM'
    ),
    Service(
      id: '6',
      name: 'Window Cleaning',
      category: 'Building',
      description: 'Cleaning of building windows',
      price: 4000.99,
      imageUrl:
      'https://www.google.com/search?q=window+cleaning&tbm=isch&ved=2ahUKEwi97b2wkJr9AhVxnCcCHQ2fCD0Q2-cCegQIABAA&oq=wind&gs_lcp=CgNpbWcQARgAMgQIABBDMgQIABBDMgQIABBDMgQIABBDMgQIABBDMgQIABBDMgcIABCxAxBDMgQIABBDMgQIABBDMgQIABBDOgQIIxAnOgUIABCABDoHCCMQ6gIQJzoECAAQAzoICAAQsQMQgwFQg4EDWPqdA2D5rANoAXAAeASAAdkIiAHFOZIBDTItMS4wLjEuNC4wLjSYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=_izuY732IvG4nsEPjb6i6AM&bih=695&biw=1349&hl=en-GB#imgrc=776YxUL3DdM5XM'
    ),
    Service(
      id: '7',
      name: 'House Cleaning',
      category: 'Home',
      description: 'Cleaning of house',
      price: 4000.99,
      imageUrl:
      'https://www.istockphoto.com/photo/handsome-asian-man-wearing-apron-cleaning-floor-at-home-guy-washing-floor-with-gm1363376686-434964853?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fhouse-cleaning&utm_term=house%20cleaning%3A%3A%3A'
    ),
    Service(
      id: '8',
      name: 'Furniture Cleaning',
      category: 'Home',
      description: 'Cleaning of house furniture',
      price: 1000.99,
      imageUrl:
     'https://www.google.com/search?q=furniture+cleaning&tbm=isch&ved=2ahUKEwjNlYvwj5r9AhXzmycCHe8jBQ0Q2-cCegQIABAA&oq=furniture+cleaning&gs_lcp=CgNpbWcQAzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6BAgjECc6BwgjEOoCECc6BwgAELEDEEM6BAgAEAM6CAgAELEDEIMBOgQIABBDOgUIABCxAzoICAAQgAQQsQNQ0AJY5nZg-HhoBXAAeASAAYIEiAGwN5IBDTAuMTIuMTAuMi4zLjGYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=dyzuY43-H_O3nsEP78eUaA&bih=695&biw=1349&hl=en-GB#imgrc=FbBT24W9_NA-BM'
    ),
    Service(
      id: '9',
      name: 'Bug Termination',
      category: 'Office',
      description: 'Complete termination of office bugs',
      price: 9000.99,
      imageUrl:
          'https://www.google.com/search?q=bug+termination+service+cartoon&tbm=isch&ved=2ahUKEwi-lujpj5r9AhWOpycCHfIrAfUQ2-cCegQIABAA&oq=bug+termination+service+cartoon&gs_lcp=CgNpbWcQAzoECCMQJ1DLBliqH2CqJGgAcAB4AIAB1AOIAasVkgEJMC4yLjMuMi4ymAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=aizuY765Fo7PnsEP8teEqA8&bih=695&biw=1349&hl=en-GB#imgrc=FBlBbB57bHYmeM'
    ),
    Service(
      id: '10',
      name: 'Bug Termination',
      category: 'Home',
      description: 'Complete termination of house bugs',
      price: 9000.99,
      imageUrl:
         'https://www.google.com/search?q=bug+termination+service+cartoon&tbm=isch&ved=2ahUKEwi-lujpj5r9AhWOpycCHfIrAfUQ2-cCegQIABAA&oq=bug+termination+service+cartoon&gs_lcp=CgNpbWcQAzoECCMQJ1DLBliqH2CqJGgAcAB4AIAB1AOIAasVkgEJMC4yLjMuMi4ymAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=aizuY765Fo7PnsEP8teEqA8&bih=695&biw=1349&hl=en-GB#imgrc=FBlBbB57bHYmeM'
    ),
  ];
}
