import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar produtos',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Aqui você pode implementar a lógica de busca
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Produtos encontrados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Lista de resultados (mock)
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/tenis/hocksbold.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: const Text('Hocks Bold'),
                    subtitle: const Text('R\$ 499,99'),
                  ),
                  ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/tenis/puma180.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: const Text('Puma 180'),
                    subtitle: const Text('R\$ 499,90'),
                  ),
                  ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/tenis/badbunny.webp',
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text('Adidas BadBunny'),
                    subtitle: Text('R\$ 899,99'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
