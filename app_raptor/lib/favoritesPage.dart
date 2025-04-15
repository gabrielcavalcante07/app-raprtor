import 'package:flutter/material.dart';
import 'package:app_raptor/product_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteItems = [
    {
      'title': 'Jordan 4 Retro',
      'price': 'R\$ 100,00',
      'image': 'assets/tenis/jordan4.png',
      'isFavorite': true,
      'rating': 4.5,
    },
    {
      'title': 'Adidas ADI2000',
      'price': 'R\$ 150,00',
      'image': 'assets/tenis/adi2000.png',
      'isFavorite': true,
      'rating': 4.0,
    },
    {
      'title': 'Puma 180',
      'price': 'R\$ 200,00',
      'image': 'assets/tenis/puma180.png',
      'isFavorite': true,
      'rating': 4.8,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      favoriteItems[index]['isFavorite'] = !favoriteItems[index]['isFavorite'];
    });
  }

  Widget _buildProductItem(
    BuildContext context,
    String imageUrl,
    String name,
    String price,
    double rating,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdutoScreen(
              imageUrl: imageUrl,
              name: name,
              price: price,
              description: '',
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // 🔧 alinhamento à esquerda
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        toggleFavorite(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          favoriteItems[index]['isFavorite']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteItems[index]['isFavorite']
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(rating.toString()),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // ✅ título centralizado
        title: const Text(
          'Favoritos',
          style: TextStyle(
            fontWeight: FontWeight.bold, // ✅ título em negrito
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return _buildProductItem(
            context,
            item['image'],
            item['title'],
            item['price'],
            item['rating'],
            index,
          );
        },
      ),
    );
  }
}
