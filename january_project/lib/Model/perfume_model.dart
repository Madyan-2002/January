final List<String> categories = [
  'All',
  'Men',
  'Women',
  'Category',
  'Top',
  'Recommended',
  'Trend',
];

final List<Map<String, String>> perfumes = [
  {'image': 'assets/images/1.jpeg', 'name': 'L’INSTANT HOME'},
  {'image': 'assets/images/2.jpeg', 'name': 'Dior Homme'},
  {'image': 'assets/images/3.jpeg', 'name': 'GIVENCHY'},
  {'image': 'assets/images/4.jpeg', 'name': 'ARMANI BEAUTY'},
  {'image': 'assets/images/5.jpeg', 'name': 'Sauvage '},
  {'image': 'assets/images/6.jpeg', 'name': 'BLEU DE CHANEL'},
  {'image': 'assets/images/7.jpeg', 'name': 'Ombré Leather'},
  {'image': 'assets/images/8.jpeg', 'name': 'Miss Rose N Roses'},
  {'image': 'assets/images/9.jpeg', 'name': 'CHANCE'},
  {'image': 'assets/images/10.jpeg', 'name': 'J’adore l’Or'},
  {'image': 'assets/images/11.jpeg', 'name': 'Good Girl Eau de Parfum'},
  {'image': 'assets/images/12.jpeg', 'name': 'Paradoxe Eau De Parfum'},
  {'image': 'assets/images/13.jpeg', 'name': 'COCO MADEMOISELLE'},
  {'image': 'assets/images/14.jpeg', 'name': 'L Instant Magic Eau de Parfum'},
  {'image': 'assets/images/15.jpeg', 'name': 'Libre Intense Eau de Parfum'},
];

class PerfumeModel {
  final String image;
  final String name;
  final double price;
  final String describtion;
  final bool isFav;

  PerfumeModel({
    required this.image,
    required this.name,
    required this.price,
    required this.describtion,
    this.isFav = false,
  });
}

List<PerfumeModel> perfumesList = [
 // PerfumeModel(image: image, name: name, price: price, describtion: describtion),
];
