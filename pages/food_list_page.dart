import 'package:flutter/material.dart';
import '../data/food_data.dart';
import '../models/food.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  String _selectedCategory = 'Semua';
  String _query = '';

  List<String> get _categories =>
      ['Semua', ...{for (final f in foodList) f.category}];

  List<Food> get _filtered => foodList.where((f) {
        final matchCategory =
            _selectedCategory == 'Semua' || f.category == _selectedCategory;
        final matchQuery = f.name.toLowerCase().contains(_query.toLowerCase());
        return matchCategory && matchQuery;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final foods = _filtered;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      appBar: AppBar(
        title: const Text('Daftar Makanan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Cari makanan...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF1F1F4),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Filter kategori
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat = _categories[i];
                final selected = cat == _selectedCategory;
                return ChoiceChip(
                  label: Text(cat),
                  selected: selected,
                  selectedColor: Colors.deepOrange,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                );
              },
            ),
          ),
          // Daftar
          Expanded(
            child: foods.isEmpty
                ? const Center(child: Text('Makanan tidak ditemukan'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: foods.length,
                    itemBuilder: (context, i) => _FoodCard(food: foods[i]),
                  ),
          ),
        ],
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  final Food food;
  const _FoodCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FoodDetailPage(food: food)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: 'food-${food.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20)),
                child: Image.network(
                  food.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.fastfood, size: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.category,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.deepOrange.shade400,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(food.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('${food.rating}',
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(width: 12),
                        const Icon(Icons.timer_outlined,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text('${food.prepTimeMinutes} mnt',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(food.formattedPrice,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}