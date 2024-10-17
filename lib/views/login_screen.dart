import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/app_styles.dart';
import 'package:unimar_app_pos/constants/assets.dart';
import 'package:unimar_app_pos/views/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? email, password;

    return Scaffold(
      backgroundColor: Colors.grey[900], // Cor de fundo cinza escuro
      appBar: AppBar(
        backgroundColor: Colors.grey[800], // Cor do AppBar
        title: Text(
          key: const ValueKey('loginTitle'),
          "Login",
          style:
              AppStyles.bigTitle.copyWith(color: Colors.white), // Texto branco
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Espaço acima da imagem
              Image.asset(
                AppAssets.store,
                width: 200, // Aumenta a largura da imagem
                height: 200, // Aumenta a altura da imagem
              ),
              const SizedBox(
                  height:
                      30), // Aumenta a distância entre a imagem e o campo de login
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Colors.white), // Cor do texto digitado
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Informe o seu email",
                        labelStyle: TextStyle(
                            color: Colors.white), // Texto do label em branco
                        hintStyle: TextStyle(
                            color: Colors.white70), // Texto do hint em branco
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70), // Borda em cinza claro
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), // Borda em branco ao focar
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Você precisa digitar o email';
                        }
                        return null;
                      },
                      onSaved: (String? newValue) {
                        email = newValue;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.white), // Cor do texto digitado
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha",
                        hintText: "Digite a sua senha",
                        labelStyle: TextStyle(
                            color: Colors.white), // Texto do label em branco
                        hintStyle: TextStyle(
                            color: Colors.white70), // Texto do hint em branco
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white70), // Borda em cinza claro
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), // Borda em branco ao focar
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Você precisa digitar a senha';
                        }
                        if (value.length < 6) {
                          return 'A senha precisa de 6 caracteres';
                        }
                        return null;
                      },
                      onSaved: (String? newValue) {
                        password = newValue;
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    key: const ValueKey('loginButton'),
                    onPressed: () {
                      final form = formKey.currentState;
                      if (form == null || !form.validate()) {
                        return;
                      }
                      form.save();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(
                              255, 54, 53, 53)), // Texto do botão em branco
                    ),
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.grey[700], // Cor de fundo do botão
                        ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não tem conta?",
                          style: TextStyle(
                              color: Colors.white)), // Texto em branco
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          print("cliquei no texto azul....");
                        },
                        child: const Text(
                          "Crie a sua conta.",
                          style: TextStyle(
                            color: Colors.blue, // Cor do texto do link
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
