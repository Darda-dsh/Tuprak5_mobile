import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _qty = 1;
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(
                    _favorite ? Icons.favorite : Icons.favorite_border,
                    color: _favorite ? Colors.red : Colors.white),
                onPressed: () => setState(() => _favorite = !_favorite),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'food-${food.id}',
                child: Image.network(
                  food.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.fastfood, size: 80),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama + harga
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(food.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Text(food.formattedPrice,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text('${food.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('  (${food.reviewCount} ulasan)',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Tag
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _Tag(food.category, Icons.category, Colors.blue),
                      if (food.isSpicy)
                        const _Tag('Pedas', Icons.local_fire_department, Colors.red),
                      if (food.isVegetarian)
                        const _Tag('Vegetarian', Icons.eco, Colors.green),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Info ringkas
                  Row(
                    children: [
                      _InfoBox(Icons.local_fire_department_outlined,
                          '${food.calories}', 'Kalori'),
                      _InfoBox(Icons.timer_outlined,
                          '${food.prepTimeMinutes} mnt', 'Waktu'),
                      _InfoBox(Icons.place_outlined, food.origin, 'Asal'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Deskripsi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(food.description,
                      style: TextStyle(
                          fontSize: 15, height: 1.5, color: Colors.grey.shade700)),
                  const SizedBox(height: 24),
                  const Text('Bahan-bahan',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: food.ingredients
                        .map((e) => Chip(
                              label: Text(e),
                              backgroundColor: Colors.orange.shade50,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bar bawah: jumlah + tombol pesan
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, -4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (_qty > 1) setState(() => _qty--);
                    },
                  ),
                  Text('$_qty',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() => _qty++),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            '$_qty x ${food.name} ditambahkan ke keranjang')),
                  );
                },
                child: Text('Pesan  •  ${_formatTotal(food.price * _qty)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTotal(int value) {
    final s = value.toString();
    final b = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
      b.write(s[i]);
    }
    return 'Rp $b';
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _Tag(this.label, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _InfoBox(this.icon, this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.deepOrange),
            const SizedBox(height: 6),
            Text(value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(label,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}