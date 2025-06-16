import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final List<Map<String, dynamic>> carrinho = [
    {
      'nome': 'Air Force 1',
      'quantidade': 1,
      'preco': 350.00,
      'imagem': 'airforce1.WEBP',
    },
    {
      'nome': 'Vans Know',
      'quantidade': 2,
      'preco': 350.00,
      'imagem': 'VansKnow.png',
    },
  ];

  void aumentarQuantidade(int index) {
    setState(() {
      carrinho[index]['quantidade']++;
    });
  }

  void diminuirQuantidade(int index) {
    setState(() {
      if (carrinho[index]['quantidade'] > 1) {
        carrinho[index]['quantidade']--;
      } else {
        carrinho.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = carrinho.fold(
        0,
        (soma, item) =>
            soma + (item['preco'] as double) * (item['quantidade'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: carrinho.isEmpty
            ? const Center(
                child: Text(
                  'Carrinho vazio',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: carrinho.length,
                      itemBuilder: (context, index) {
                        final item = carrinho[index];
                        return Card(
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/tenis/${item['imagem']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              item['nome'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => diminuirQuantidade(index),
                                ),
                                Text(
                                  '${item['quantidade']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => aumentarQuantidade(index),
                                ),
                              ],
                            ),
                            trailing: Text(
                              'R\$ ${(item['preco'] * item['quantidade']).toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'R\$ ${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Compra finalizada!')),
                        );
                        setState(() {
                          carrinho.clear();
                        });
                      },
                      child: const Text(
                        'Finalizar Compra',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
