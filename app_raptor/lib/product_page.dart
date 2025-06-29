import 'package:app_raptor/cart_page.dart';
import 'package:flutter/material.dart';

class ProdutoScreen extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String description;

  const ProdutoScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  String? tamanhoSelecionado;
  bool isFavorito = false;

  final TextEditingController _cepController = TextEditingController();
  double? valorFrete;
  String? mensagemErroFrete;

  List<String> tamanhos = [
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44'
  ];

  void calcularFrete() {
    final cep = _cepController.text.trim();

    if (cep.isEmpty || cep.length != 8 || int.tryParse(cep) == null) {
      setState(() {
        valorFrete = null;
        mensagemErroFrete = 'CEP inválido. Digite 8 números.';
      });
    } else {
      setState(() {
        valorFrete = 20.00; // Aqui você pode implementar a regra real.
        mensagemErroFrete = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // === IMAGEM DO PRODUTO ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBE2E7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.contain,
                            ),
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
                          child: _buildIconButton(
                            isFavorito ? Icons.favorite : Icons.favorite_border,
                            () {
                              setState(() {
                                isFavorito = !isFavorito;
                              });
                            },
                            color: isFavorito ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // === DADOS DO PRODUTO ===
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),

                // === AVALIAÇÕES ===
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 2),
                  child: Text(
                    'Avaliações',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star,
                              color: Colors.amber, size: 20);
                        }),
                      ),
                      const SizedBox(width: 12),
                      const Text('4/5 Reviews'),
                    ],
                  ),
                ),

                // === DESCRIÇÃO ===
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 5),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),

                // === ESCOLHA DE TAMANHO ===
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
                    spacing: 4,
                    runSpacing: 4,
                    children: tamanhos.map((tamanho) {
                      final selecionado = tamanhoSelecionado == tamanho;
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width -
                                24 * 2 -
                                4 * 4) /
                            5,
                        child: ChoiceChip(
                          label: Text(tamanho, textAlign: TextAlign.center),
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
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 24),

                // === CALCULAR FRETE ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Calcular Frete',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _cepController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Digite seu CEP',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: calcularFrete,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Calcular'),
                          ),
                        ],
                      ),
                      if (valorFrete != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Frete: R\$ ${valorFrete!.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (mensagemErroFrete != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            mensagemErroFrete!,
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),

          // === BOTÃO DE ADICIONAR AO CARRINHO ===
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
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cartpage()));
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Adicionar ao carrinho'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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

  Widget _buildIconButton(IconData icon, VoidCallback onPressed,
      {Color color = Colors.white}) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0.3),
      shape: const CircleBorder(),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
