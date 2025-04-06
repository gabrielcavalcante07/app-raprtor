import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> carrinho = [
      {
        'nome': 'Tênis Raptor X',
        'quantidade': 1,
        'preco': 199.99,
      },
      {
        'nome': 'Camiseta Street Style',
        'quantidade': 2,
        'preco': 89.90,
      },
    ];

    double total = carrinho.fold(0, (soma, item) =>
        soma + (item['preco'] as double) * (item['quantidade'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // volta para a tela anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: carrinho.length,
                itemBuilder: (context, index) {
                  final item = carrinho[index];
                  return ListTile(
                    title: Text(item['nome']),
                    subtitle: Text('Qtd: ${item['quantidade']}'),
                    trailing: Text(
                      'R\$ ${(item['preco'] * item['quantidade']).toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ação de finalizar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Compra finalizada!')),
                  );
                },
                child: const Text('Finalizar Compra'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
