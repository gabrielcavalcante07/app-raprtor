import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha Conta"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/perfil.png'), // Coloque a imagem na pasta assets
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      // lógica para editar imagem
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.edit, size: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildUserInfo("Nome", "Gabriel Cavalcante"),
          buildUserInfo("Email", "contato.gcsantos@gmail.com"),
          buildUserInfo("Telefone", "(11) 94174-1429"),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // lógica para editar perfil
            },
            icon: const Icon(Icons.edit, color: Colors.black),
            label: Text("Editar Perfil", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              // lógica para ver pedidos
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PedidosPage()));
            },
            icon: const Icon(Icons.shopping_bag, color: Colors.black),
            label: const Text(
              "Meus Pedidos",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              // lógica para excluir conta
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text(
                    "Excluir Conta",
                    style: TextStyle(color: Colors.black),
                  ),
                  content: const Text(
                      "Tem certeza que deseja excluir sua conta? Essa ação não poderá ser desfeita."),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          // confirmar exclusão
                          Navigator.pop(context);
                        },
                        child: const Text("Excluir",
                            style: TextStyle(color: Colors.red))),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              "Excluir Conta",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value),
          const Divider(),
        ],
      ),
    );
  }
}

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Substitua por uma lista real de pedidos
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Pedidos")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text("Pedido #12345"),
            subtitle: Text("Status: Entregue\nData: 05/04/2025"),
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text("Pedido #12346"),
            subtitle: Text("Status: Em andamento\nData: 07/04/2025"),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
