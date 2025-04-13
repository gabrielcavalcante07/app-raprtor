import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
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
                children: const [
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Produto 1'),
                    subtitle: Text('R\$ 99,99'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Produto 2'),
                    subtitle: Text('R\$ 129,90'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Produto 3'),
                    subtitle: Text('R\$ 59,99'),
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
