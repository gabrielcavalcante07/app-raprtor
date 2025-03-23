import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProdutoScreen(),
    );
  }
}
  
class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({super.key});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  String? tamanhoSelecionado;

  List<String> tamanhos = [
    '35', '36', '37', '38', '39', '40', '41', '42', '43', '44'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBE2E7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/jordan4.png.',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 16,
                        child: _buildIconButton(Icons.arrow_back, () {
                          Navigator.pop(context);
                        }),
                      ),
                      Positioned(
                        top: 40,
                        right: 16,
                        child: _buildIconButton(Icons.favorite_border, () {}),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Jordan 4',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$399,99',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
                  child: Text(
                    'Retailed by Nike',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star, color: Colors.orange, size: 20);
                        }),
                      ),
                      const SizedBox(width: 12),
                      const Text('4/5 Reviews'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Text(
                    'DESCRIPTION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 4, 24, 0),
                  child: Text(
                    'O Air Jordan 4, lançado em 1989 e criado por Tinker Hatfield, é um dos modelos mais icônicos da Jordan Brand. Possui cabedal em couro ou nobuck, painéis de mesh para ventilação, suporte lateral com "wings" e amortecimento Air-Sole visível...',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Text(
                    'Escolha seu Tamanho',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Wrap(
                    spacing: 8,
                    children: tamanhos.map((tamanho) {
                      final selecionado = tamanhoSelecionado == tamanho;
                      return ChoiceChip(
                        label: Text(tamanho),
                        selected: selecionado,
                        onSelected: (_) {
                          setState(() {
                            tamanhoSelecionado = tamanho;
                          });
                        },
                        selectedColor: Colors.red,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: selecionado ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'R\$399,99',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0.3),
      shape: const CircleBorder(),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
