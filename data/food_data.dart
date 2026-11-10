import '../models/food.dart';

const List<Food> foodList = [
  Food(
    id: '1',
    name: 'Nasi Goreng Spesial',
    category: 'Makanan Berat',
    description:
        'Nasi goreng dengan bumbu rempah khas, dilengkapi telur mata sapi, ayam suwir, sosis, dan kerupuk. Cocok untuk sarapan maupun makan malam.',
    price: 25000,
    rating: 4.8,
    reviewCount: 320,
    calories: 550,
    prepTimeMinutes: 15,
    origin: 'Indonesia',
    isSpicy: true,
    isVegetarian: false,
    ingredients: ['Nasi', 'Telur', 'Ayam', 'Bawang merah', 'Kecap manis', 'Cabai'],
    imageUrl:
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800',
  ),
  Food(
    id: '2',
    name: 'Sate Ayam Madura',
    category: 'Makanan Berat',
    description:
        'Sate ayam bakar dengan bumbu kacang yang gurih dan manis, disajikan dengan lontong dan acar.',
    price: 30000,
    rating: 4.9,
    reviewCount: 410,
    calories: 480,
    prepTimeMinutes: 20,
    origin: 'Madura',
    isSpicy: false,
    isVegetarian: false,
    ingredients: ['Daging ayam', 'Kacang tanah', 'Kecap manis', 'Lontong', 'Bawang merah'],
    imageUrl:
        'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800',
  ),
  Food(
    id: '3',
    name: 'Chicken Salad Bowl',
    category: 'Makanan Sehat',
    description:
        'Sayuran rebus segar dengan tahu, tempe, telur, dan lontong yang disiram saus kacang kental.',
    price: 20000,
    rating: 4.6,
    reviewCount: 180,
    calories: 350,
    prepTimeMinutes: 10,
    origin: 'Amerika Serikat',
    isSpicy: false,
    isVegetarian: true,
    ingredients:  ['Dada ayam panggang', 'Telur rebus', 'Selada', 'Tomat', 'Jagung manis', 'Timun', 'Kol ungu'],
    imageUrl:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800',
  ),
  Food(
    id: '4',
    name: 'Grain bowl',
    category: 'Makanan Sehat',
    description:
        'Semangkuk biji-bijian (couscous, quinoa, atau nasi) dengan sayuran segar atau panggang, kacang-kacangan, dan saus ringan. Mengenyangkan, bergizi, dan rendah lemak.',
    price: 22000,
    rating: 4.7,
    reviewCount: 265,
    calories: 400,
    prepTimeMinutes: 15,
    origin: 'Amerika Serikat',
    isSpicy: false,
    isVegetarian: false,
    ingredients: ['Couscous', 'Buncis', 'Tomat panggang', 'Wortel', 'Kacang almond', 'Daun herbal', 'Minyak zaitun'],
    imageUrl:
        'https://images.unsplash.com/photo-1547592180-85f173990554?w=800',
  ),
  Food(
    id: '5',
    name: 'Chocolate Oreo parfait',
    category: 'Minuman',
    description:
        'Dessert dingin berlapis dalam gelas tinggi, berisi remahan biskuit Oreo, krim atau es krim, dan saus cokelat. Rasanya manis, legit, dan creamy.',
    price: 12000,
    rating: 4.5,
    reviewCount: 150,
    calories: 220,
    prepTimeMinutes: 5,
    origin: 'Prancis',
    isSpicy: false,
    isVegetarian: true,
    ingredients: ['Biskuit Oreo', 'Es krim cokelat', 'Whipped cream', 'Saus cokelat', 'Susu cair'],
    imageUrl:
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=800',
  ),
  Food(
    id: '6',
    name: 'Strawberry crepes',
    category: 'Camilan',
    description:
        'Pancake tipis yang dilipat dan diberi whipped cream serta stroberi segar. Teksturnya lembut, rasanya manis dan sedikit asam segar.',
    price: 15000,
    rating: 4.4,
    reviewCount: 98,
    calories: 300,
    prepTimeMinutes: 8,
    origin: 'Prancis',
    isSpicy: false,
    isVegetarian: true,
    ingredients: ['Tepung terigu', 'Telur', 'Susu cair', 'Mentega', 'Whipped cream', 'Stroberi segar'],
    imageUrl:
        'https://images.unsplash.com/photo-1587314168485-3236d6710814?w=800',
  ),
];