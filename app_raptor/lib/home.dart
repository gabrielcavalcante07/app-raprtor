import 'package:app_raptor/produto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raptor Street',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(), // Começa com a HomePage
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _selectedIndex = 0; // Índice da página selecionada no BottomNavigationBar

  final List<String> _imageUrls = [
    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8b08f141-4901-4e04-a17b-21e868003e44/sportswear-phoenix-fleece-womens-oversized-pullover-hoodie-bs372Q.png',
    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a825afbf-a2c1-4ad8-a3a7-f3a4b29d78b8/primary-mens-dri-fit-versatile-tank-RcQ41g.png',
    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dc811684-8b82-4fbf-8db8-df854abc2131/sportswear-phoenix-fleece-womens-oversized-pullover-hoodie-bs372Q.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegação para as páginas com base no índice selecionado
    switch (index) {
      case 0: // Home
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1: // Pesquisar
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
        break;
      case 2: // Favoritos
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
        break;
      case 3: // Conta
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
        break;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Raptor Street',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 530,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page % _imageUrls.length; // Garante que _currentPage nunca ultrapasse os limites da lista
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildImage(_imageUrls[index % _imageUrls.length]); // Loop infinito
                    },
                    itemCount: _imageUrls.length * 100, // Simula um loop infinito
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(_imageUrls.length, (int index) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.black : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Promoções',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find the latest look in our recent review.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductItem(
                    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/adf87c27-e670-4e75-86fd-31c1241b9ed6/air-max-90-mens-shoes-6n3vKB.png',
                    'Nike Air Shoe',
                    '\$250.00',
                  ),
                  _buildProductItem(
                    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9e7c969b-a36f-4d25-ae53-80ca724ea237/air-max-systm-mens-shoes-TwgLWK.png',
                    'Nike Air Shoe',
                    '\$120.00',
                  ),
                  _buildProductItem(
                    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/74a133e6-c902-48f2-9e77-765a727fadf3/air-max-systm-womens-shoes-Cz5zxV.png',
                    'AirMax',
                    '\$250.00',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //barra de navegação
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  // Estilo dos Cards
  Widget _buildImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductItem(String imageUrl, String name, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdutoScreen(
              imageUrl: imageUrl,
              name: name,
              price: price,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar')),
      body: const Center(child: Text('Página de Pesquisa')),
      bottomNavigationBar: BottomNavigationBar( // Mantém o BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        currentIndex: 1, // Seleciona o item "Pesquisar"
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Lógica de navegação para as outras páginas
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
          }
        },
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: const Center(child: Text('Página de Favoritos')),
      bottomNavigationBar: BottomNavigationBar( // Mantém o BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        currentIndex: 2, // Seleciona o item "Favoritos"
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Lógica de navegação para as outras páginas
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
          }
        },
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conta')),
      body: const Center(child: Text('Página da Conta')),
      bottomNavigationBar: BottomNavigationBar( // Mantém o BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        currentIndex: 3, // Seleciona o item "Conta"
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Lógica de navegação para as outras páginas
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
          }
        },
      ),
    );
  }
}