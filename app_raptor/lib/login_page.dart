import 'package:flutter/material.dart';
import 'package:app_raptor/account_page.dart';
import 'package:app_raptor/main_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: EntrarScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class EntrarScreen extends StatefulWidget {
  const EntrarScreen({super.key});

  @override
  State<EntrarScreen> createState() => _EntrarScreenState();
}

class _EntrarScreenState extends State<EntrarScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                Container(
                  width: largura,
                  height: altura * 0.106,
                  alignment: Alignment.center,
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFCB2828),
                      fontFamily: 'poppinsns',
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Campos de entrada
                Container(
                  width: largura * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'E-mail',
                      hintText: 'Insira seu e-mail',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                Container(
                  width: largura * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: !_senhaVisivel,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Senha',
                      hintText: 'Insira sua senha',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaVisivel = !_senhaVisivel;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Botão Entrar
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCB2828),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      final email = _emailController.text.trim();
                      final senha = _senhaController.text;

                      if (email.isEmpty || senha.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Preencha todos os campos'),
                          ),
                        );
                      } else {
                        // print('Login com: $email');
                        print('navegando');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountPage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Link para cadastro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não tem uma conta?',
                      style: TextStyle(fontFamily: 'poppins'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroScreen(),
                          ),
                        );
                        // Navegar para tela de cadastro
                      },
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(
                          color: Color(0xFFCB2828),
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _senhaVisivel = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                Container(
                  width: largura,
                  height: altura * 0.106,
                  alignment: Alignment.center,
                  child: const Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFCB2828),
                      fontFamily: 'poppinsns',
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Nome
                Container(
                  width: largura * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nome',
                      hintText: 'Insira seu nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                // Email
                Container(
                  width: largura * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'E-mail',
                      hintText: 'Insira seu e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                // Senha
                Container(
                  width: largura * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: !_senhaVisivel,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Senha',
                      hintText: 'Insira sua senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaVisivel = !_senhaVisivel;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Botão Criar Conta
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCB2828),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      final nome = _nomeController.text.trim();
                      final email = _emailController.text.trim();
                      final senha = _senhaController.text;

                      if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Preencha todos os campos'),
                          ),
                        );
                      } else {
                        print('Conta criada com: $nome, $email');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountPage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Link para login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta?',
                      style: TextStyle(fontFamily: 'poppins'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EntrarScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          color: Color(0xFFCB2828),
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
