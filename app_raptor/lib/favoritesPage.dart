import 'package:flutter/material.dart';
import 'package:app_raptor/product_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Lista simulada de itens favoritos
  List<Map<String, dynamic>> favoriteItems = [
    {
      'title': 'Produto 1',
      'price': 'R\$ 100,00',
      'image': 'assets/tenis/jordan4.png',
      'isFavorite': true,
    },
    {
      'title': 'Produto 2',
      'price': 'R\$ 150,00',
      'image': 'assets/tenis/adi2000.png',
      'isFavorite': true,
    },
    {
      'title': 'Produto 3',
      'price': 'R\$ 200,00',
      'image': 'assets/tenis/puma180.png',
      'isFavorite': true,
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
    String description,
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
              description: description,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          toggleFavorite(index);
                        },
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
        title: const Text('Favoritos'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return _buildProductItem(
            context,
            item['image'],
            item['title'],
            item['price'],
            '',
            index,
          );
        },
      ),
    );
  }
}