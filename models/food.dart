class Food {
  final String id;
  final String name;
  final String category;
  final String description;
  final int price;
  final double rating;
  final int reviewCount;
  final int calories;
  final int prepTimeMinutes;
  final String origin;
  final bool isSpicy;
  final bool isVegetarian;
  final List<String> ingredients;
  final String imageUrl;

  const Food({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.calories,
    required this.prepTimeMinutes,
    required this.origin,
    required this.isSpicy,
    required this.isVegetarian,
    required this.ingredients,
    required this.imageUrl,
  });

  String get formattedPrice {
    final s = price.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
      buffer.write(s[i]);
    }
    return 'Rp $buffer';
  }
}